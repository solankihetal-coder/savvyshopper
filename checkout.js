// checkout.js (JavaScript)

document.addEventListener('DOMContentLoaded', function() {
    // Sample product data (replace with your actual data)
    // const products = [
    //     { name: "Product 1", price: 29.99, quantity: 1 },
    //     { name: "Product 2", price: 49.95, quantity: 2 },
    //     { name: "Product 3", price: 19.50, quantity: 1 }
    // ];

    // function displayOrderSummary() {
    //     const productList = document.getElementById("product-list");
    //     const totalAmountSpan = document.getElementById("total-amount");
    //     let total = 0;

    //     productList.innerHTML = ""; // Clear previous product list

    //     products.forEach(product => {
    //         const listItem = document.createElement("li");
    //         listItem.textContent = `${product.name} (Qty: ${product.quantity}) - $${(product.price * product.quantity).toFixed(2)}`;
    //         productList.appendChild(listItem);
    //         total += product.price * product.quantity;
    //     });

    //     totalAmountSpan.textContent = `$${total.toFixed(2)}`;
    // }

    // displayOrderSummary(); // Display the order summary when the page loads

    document.getElementById('address-form').addEventListener('submit', function(event) {
        event.preventDefault();

        const formData = new FormData(this);
        formData.append('products', JSON.stringify(products)); // Add product data as JSON

        fetch('process_order.php', {
            method: 'POST',
            body: formData
        })
        .then(response => response.json())
        .then(data => {
            const statusDiv = document.getElementById('order-status');
            if (data.success) {
                statusDiv.innerHTML = '<p style="color: green;">' + data.message + '</p>';
                document.getElementById('address-form').reset();
            } else {
                statusDiv.innerHTML = '<p style="color: red;">' + data.message + '</p>';
            }
        })
        .catch(error => {
            console.error('Error:', error);
            document.getElementById('order-status').innerHTML = '<p style="color: red;">An error occurred.</p>';
        });
    });
});