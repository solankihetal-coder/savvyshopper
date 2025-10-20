<?php
session_start();
require_once 'vendor/autoload.php'; // Stripe PHP library

// Database Configuration
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "savvy_shopper";

// Stripe Configuration
\Stripe\Stripe::setApiKey('your_stripe_secret_key');
$domain = 'http://localhost'; // Or your domain

// Simulate User Login (Replace with your authentication logic)
if (!isset($_SESSION['user_id'])) {
    $_SESSION['user_id'] = 1; // Simulate user ID 1
}

$user_id = $_SESSION['user_id'];

// Database Connection
$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Cart API Endpoint (/api/cart)
if ($_SERVER['REQUEST_URI'] === '/api/cart') {
    $sql = "SELECT c.product_id, c.quantity, p.name, p.description, p.price, p.image_path FROM cart c JOIN products p ON c.product_id = p.product_id WHERE c.user_id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $user_id);
    $stmt->execute();
    $result = $stmt->get_result();

    $cartItems = [];
    while ($row = $result->fetch_assoc()) {
        $cartItems[] = $row;
    }

    header('Content-Type: application/json');
    echo json_encode($cartItems);
    exit;
}

// Stripe Checkout Endpoint (/stripe-checkout)
if ($_SERVER['REQUEST_URI'] === '/stripe-checkout' && $_SERVER['REQUEST_METHOD'] === 'POST') {
    $sql = "SELECT c.product_id, c.quantity, p.name, p.description, p.price, p.image_path FROM cart c JOIN products p ON c.product_id = p.product_id WHERE c.user_id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $user_id);
    $stmt->execute();
    $result = $stmt->get_result();

    $lineItems = [];
    while ($item = $result->fetch_assoc()) {
        $lineItems[] = [
            'price_data' => [
                'currency' => 'usd',
                'product_data' => [
                    'name' => $item['name'],
                    'description' => $item['description'],
                    'images' => [$item['image_path']],
                ],
                'unit_amount' => $item['price'] * 100,
            ],
            'quantity' => $item['quantity'],
        ];
    }

    try {
        $session = \Stripe\Checkout\Session::create([
            'payment_method_types' => ['card'],
            'mode' => 'payment',
            'success_url' => $domain . '/success?session_id={CHECKOUT_SESSION_ID}',
            'cancel_url' => $domain . '/checkout?payment_fail=true',
            'line_items' => $lineItems,
        ]);

        header('Content-Type: application/json');
        echo json_encode(['url' => $session->url]);
    } catch (\Stripe\Exception\ApiErrorException $e) {
        header('Content-Type: application/json');
        echo json_encode(['error' => $e->getMessage()]);
    }

    exit;
}

// Success Endpoint (/success)
if ($_SERVER['REQUEST_URI'] === '/success' && isset($_GET['session_id'])) {
    $session_id = $_GET['session_id'];

    try {
        $session = \Stripe\Checkout\Session::retrieve($session_id);
        $customer_email = $session->customer_details->email;

        $sql = "SELECT c.product_id, c.quantity, p.price FROM cart c JOIN products p ON c.product_id = p.product_id WHERE c.user_id = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("i", $user_id);
        $stmt->execute();
        $result = $stmt->get_result();

        $total_amount = 0;
        while ($item = $result->fetch_assoc()) {
            $total_amount += $item['price'] * $item['quantity'];
        }

        $sql = "INSERT INTO orders (user_id, total_amount, status) VALUES (?, ?, ?)";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("ids", $user_id, $total_amount, 'Processing');
        $stmt->execute();
        $order_id = $conn->insert_id;

        $result->data_seek(0); // Reset result pointer

        while ($item = $result->fetch_assoc()) {
            $sql = "INSERT INTO order_items (order_id, product_id, quantity, price) VALUES (?, ?, ?, ?)";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("iiid", $order_id, $item['product_id'], $item['quantity'], $item['price']);
            $stmt->execute();
        }

        $sql = "DELETE FROM cart WHERE user_id = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("i", $user_id);
        $stmt->execute();

        header("Location: /checkout?payment=done");
        exit;
    } 
    catch (\Stripe\Exception\ApiErrorException $e) {
        header("Location: /checkout?payment_fail=true");
        exit;
    }
}
$conn->close();
?>