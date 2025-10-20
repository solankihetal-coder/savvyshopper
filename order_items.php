<?php
include 'db_connect.php';
include 'auth.php';

header('Content-Type: application/json');

if (!is_logged_in()) {
    echo json_encode(['success' => false, 'message' => 'User not logged in']);
    exit;
}

$user_id = get_current_user_id();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $action = $_POST['action'];

    switch ($action) {
        case 'create':
            // Get cart items
            $sql = "SELECT c.product_id, c.quantity, p.price FROM cart c INNER JOIN products p ON c.product_id = p.id WHERE c.user_id = ?";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("i", $user_id);
            $stmt->execute();
            $result = $stmt->get_result();
            $cart_items ;
            $total_amount = 0;
            if ($result->num_rows > 0) {
                while ($row = $result->fetch_assoc()) {
                    $item_total = $row['price'] * $row['quantity'];
                    $total_amount += $item_total;
                    $cart_items= [
                        'product_id' => $row['product_id'],
                        'quantity' => $row['quantity'],
                        'price' => $row['price']
                    ];
                }
            } else {
                echo json_encode(['success' => false, 'message' => 'Cart is empty']);
                exit;
            }

            // Create order
            $shipping_address = sanitize_input($_POST['shipping_address']); // Get shipping address from user
            $sql = "INSERT INTO orders (user_id, total_amount, shipping_address) VALUES (?, ?, ?)";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("ids", $user_id, $total_amount, $shipping_address);
            if ($stmt->execute()) {
                $order_id = $conn->insert_id;

                // Add order items
                foreach ($cart_items as $item) {
                    $sql = "INSERT INTO order_items (order_id, product_id, quantity, price) VALUES (?, ?, ?, ?)";
                    $stmt = $conn->prepare($sql);
                    $stmt->bind_param("iiid", $order_id, $item['product_id'], $item['quantity'], $item['price']);
                    $stmt->execute();

                    // Update product stock (assuming you want to reduce stock)
                    $sql = "UPDATE products SET stock_quantity = stock_quantity - ? WHERE id = ?";
                    $stmt = $conn->prepare($sql);
                    $stmt->bind_param("ii", $item['quantity'], $item['product_id']);
                    $stmt->execute();
                }

                // Clear the cart
                $sql = "DELETE FROM cart WHERE user_id = ?";
                $stmt = $conn->prepare($sql);
                $stmt->bind_param("i", $user_id);
                $stmt->execute();

                echo json_encode(['success' => true, 'message' => 'Order placed successfully', 'order_id' => $order_id]);
            } else {
                echo json_encode(['success' => false, 'message' => 'Error creating order: ' . $conn->error]);
            }
            break;

        case 'get_order_details':
            $order_id = sanitize_input($_POST['order_id']);
            $sql = "SELECT o.*, u.username FROM orders o INNER JOIN users u ON o.user_id = u.id WHERE o.id = ? AND o.user_id = ?";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("ii", $order_id, $user_id);
            $stmt->execute();
            $result = $stmt->get_result();
            if ($result->num_rows > 0) {
                $order = $result->fetch_assoc();
                $sql = "SELECT oi.*, p.name, p.image_path FROM order_items oi INNER JOIN products p ON oi.product_id = p.id WHERE oi.order_id = ?";
                $stmt = $conn->prepare($sql);
                $stmt->bind_param("i", $order_id);
                $stmt->execute();
        $order_items_result = $stmt->get_result();
        $order_items = [];
        while ($item = $order_items_result->fetch_assoc()) {
            $order_items[] = $item;
        }
        echo json_encode(['success' => true, 'order' => $order, 'order_items' => $order_items]);
    } else {
        echo json_encode(['success' => false, 'message' => 'Order not found']);
    }
    break;
}
}

        
    
