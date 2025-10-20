require('dotenv').config();
const mysql = require('mysql2/promise'); // Import mysql2

// Database connection details (use environment variables in a real app)
/*const dbConfig = {
  host: 'localhost',
  user: 'your_db_user',
  password: 'your_db_password',
  database: 'savvy_shopper_db',
};*/
const dbConfig = {
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'login',
};


async function connectToDatabase() {
  try {
    const connection = await mysql.createConnection(dbConfig);
    console.log('Connected to MySQL database');
    return connection;
  } catch (error) {
    console.error('Error connecting:', error);
    throw error; // Re-throw the error to handle it elsewhere
  }
}

async function getProducts() {
  const connection = await connectToDatabase();
  try {
    const [rows] = await connection.execute('SELECT * FROM products');

    return rows;
  } catch (error) {
    console.error('Error fetching products:', error);
    throw error; // Re-throw the error to handle it elsewhere
  } finally {
    if (connection) {
      connection.end(); // Close the connection when done
    }
  }
}

// Example: Get and display products (you'll need to modify your HTML)
async function displayProducts() {
  try {
    const products = await getProducts();
    console.log(products,"productsproducts")
    // Code to dynamically add products to your HTML (using DOM manipulation)
    // ...
  } catch (error) {
    // Handle errors (e.g., display an error message)
  }
}

// Call the function to display products when the page loads
displayProducts();