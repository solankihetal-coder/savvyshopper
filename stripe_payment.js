const stripeGateway = stripe(process.env.stripe_key);
const DOMAIN = process.env.DOMAIN;
const mysql = require('mysql');
require('dotenv').config();

// Database Connection (Replace with your credentials)
const db = mysql.createConnection({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME
});

db.connect((err) => {
    if (err) {
        console.error('Database connection failed: ' + err.stack);
        return;
    }
    console.log('Connected to database');
});

app.post('/stripe-checkout', async (req, res) => {
    const user_id = req.session.user_id; // Assuming you have user sessions

    if (!user_id) {
        return res.status(401).json({ error: 'User not authenticated' });
    }

    // Fetch cart items from the database
    db.query('SELECT c.product_id, c.quantity, p.name, p.description, p.price, p.image_path FROM cart c JOIN products p ON c.product_id = p.product_id WHERE c.user_id = ?', [user_id], async (err, results) => {
        if (err) {
            console.error('Error fetching cart items:', err);
            return res.status(500).json({ error: 'Database error' });
        }

        if (results.length === 0) {
            return res.status(400).json({ error: 'Cart is empty' });
        }

        const lineItems = results.map(item => ({
            price_data: {
                currency: 'usd', // Change to your currency
                product_data: {
                    name: item.name,
                    description: item.description,
                    images: [item.image_path] // Assuming image_path is a URL
                },
                unit_amount: item.price * 100 // Stripe uses cents
            },
            quantity: item.quantity
        }));

        try {
            const session = await stripeGateway.checkout.sessions.create({
                payment_method_types: ['card'],
                mode: 'payment',
                success_url: `${DOMAIN}/success?session_id={CHECKOUT_SESSION_ID}`,
                cancel_url: `${DOMAIN}/checkout?payment_fail=true`,
                line_items: lineItems
            });

            res.json({ url: session.url });
        } catch (stripeErr) {
            console.error('Stripe error:', stripeErr);
            res.status(500).json({ error: 'Stripe error' });
        }
    });
});

app.get('/success', async (req, res) => {
    const { session_id } = req.query;
    const user_id = req.session.user_id;

    if (!user_id) {
        return res.redirect('/checkout?payment_fail=true');
    }

    try {
        const session = await stripeGateway.checkout.sessions.retrieve(session_id);
        const customer_email = session.customer_details.email;

        // Fetch cart items from the database again (to ensure data consistency)
        db.query('SELECT c.product_id, c.quantity, p.price FROM cart c JOIN products p ON c.product_id = p.product_id WHERE c.user_id = ?', [user_id], (err, results) => {
            if (err) {
                console.error('Error fetching cart items:', err);
                return res.redirect('/checkout?payment_fail=true');
            }

            if (results.length === 0) {
                return res.redirect('/checkout?payment_fail=true');
            }

            let total_amount = 0;
            results.forEach(item => {
                total_amount += item.price * item.quantity;
            });

            // Insert order into the database
            db.query('INSERT INTO orders (user_id, total_amount, status) VALUES (?, ?, ?)', [user_id, total_amount, 'Processing'], (orderErr, orderResult) => {
                if (orderErr) {
                    console.error('Error inserting order:', orderErr);
                    return res.redirect('/checkout?payment_fail=true');
                }

                const order_id = orderResult.insertId;

                // Insert order items
                results.forEach(item => {
                    db.query('INSERT INTO order_items (order_id, product_id, quantity, price) VALUES (?, ?, ?, ?)', [order_id, item.product_id, item.quantity, item.price]);
                });

                // Clear the cart
                db.query('DELETE FROM cart WHERE user_id = ?', [user_id], () => {
                    res.redirect('/checkout?payment=done');
                });
            });
        });
    } catch (stripeErr) {
        console.error('Stripe error:', stripeErr);
        res.redirect('/checkout?payment_fail=true');
    }
});