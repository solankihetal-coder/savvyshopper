<?php
session_start();
include 'db_connect.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (!isset($_SESSION['user_id'])) {
        echo json_encode(['success' => false, 'message' => 'Please log in to place an order.']);
        exit;
    }

    $user_id = $_SESSION['user_id'];

    // 1. Get cart items for the user
    $stmt = $conn->prepare("SELECT c.product_id, c.quantity, p.price FROM cart c JOIN products p ON c.product_id = p.product_id WHERE c.user_id = ?");
    $stmt->bind_param("i", $user_id);
    $stmt->execute();
    $cart_items = $stmt->get_result();

    if ($cart_items->num_rows == 0) {
        echo json_encode(['success' => false, 'message' => 'Your cart is empty.']);
        exit;
    }

    // 2. Calculate total amount and create the order
    $total_amount = 0;
    while ($item = $cart_items->fetch_assoc()) {
        $total_amount += $item['price'] * $item['quantity'];
    }

    $stmt = $conn->prepare("INSERT INTO orders (user_id, total_amount) VALUES (?, ?)");
    $stmt->bind_param("id", $user_id, $total_amount);

    if (!$stmt->execute()) {
        echo json_encode(['success' => false, 'message' => 'Error creating order: ' . $stmt->error]);
        exit;
    }
    $order_id = $conn->insert_id;

    // 3. Add order items
    $cart_items->data_seek(0); // Reset result pointer
    while ($item = $cart_items->fetch_assoc()) {
        $stmt = $conn->prepare("INSERT INTO order_items (order_id, product_id, quantity, price) VALUES (?, ?, ?, ?)");
        $stmt->bind_param("iiid", $order_id, $item['product_id'], $item['quantity'], $item['price']);
        if (!$stmt->execute()) {
            echo json_encode(['success' => false, 'message' => 'Error adding order items: ' . $stmt->error]);
            exit;
        }
    }

    // 4. Clear the cart
    $stmt = $conn->prepare("DELETE FROM cart WHERE user_id = ?");
    $stmt->bind_param("i", $user_id);
    if (!$stmt->execute()) {
        echo json_encode(['success' => false, 'message' => 'Error clearing cart: ' . $stmt->error]);
        exit;
    }

    echo json_encode(['success' => true, 'message' => 'Order placed successfully!']);

    $stmt->close();
    $conn->close();
} else {
    echo json_encode(['success' => false, 'message' => 'Invalid request method.']);
}
?>