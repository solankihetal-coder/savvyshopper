<?php
// process_order.php (PHP)

// Database connection details
$servername = "localhost"; // Or your database host
$username = "root"; // Your database username
$password = ""; // Your database password
$dbname = "savvy_shopper";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die(json_encode(["success" => false, "message" => "Connection failed: " . $conn->connect_error]));
}

// Get data from POST request
$address = $_POST['address'];
$street = $_POST['street'];
$city = $_POST['city'];
$state = $_POST['state'];
$pincode = $_POST['pincode'];
$landmark = $_POST['landmark'];
$products = json_decode($_POST['products'], true); // Decode the JSON product data

// Insert address data into the database
$sql_address = "INSERT INTO addresses (address, street, city, state, pincode, landmark) VALUES (?, ?, ?, ?, ?, ?)";
$stmt_address = $conn->prepare($sql_address);
$stmt_address->bind_param("ssssis", $address, $street, $city, $state, $pincode, $landmark);

if ($stmt_address->execute()) {
    $address_id = $conn->insert_id; // Get the ID of the inserted address

    // Insert product data into the database
    foreach ($products as $product) {
        $sql_product = "INSERT INTO orders (address_id, product_name, price, quantity) VALUES (?, ?, ?, ?)";
        $stmt_product = $conn->prepare($sql_product);
        $stmt_product->bind_param("isdi", $address_id, $product['name'], $product['price'], $product['quantity']);

        if (!$stmt_product->execute()) {
            echo json_encode(["success" => false, "message" => "Error inserting product: " . $stmt_product->error]);
            $conn->close();
            exit;
        }
        $stmt_product->close();
    }
    $stmt_address->close();
    $conn->close();

    echo json_encode(["success" => true, "message" => "Order placed successfully!"]);

} else {
    echo json_encode(["success" => false, "message" => "Error inserting address: " . $stmt_address->error]);
}

$conn->close();
?>