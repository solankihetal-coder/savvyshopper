<?php
include 'db_connect.php';
include 'auth.php';

header('Content-Type: application/json'); // Set JSON header

if (!is_logged_in()) {
    echo json_encode(['success' => false, 'message' => 'User not logged in']);
    exit;
}

$user_id = get_current_user_id();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $action = $_POST['action'];

    switch ($action) {
        case 'add':
            $product_id = sanitize_input($_POST['product_id']);
            $quantity = 1; // Default quantity

            // Check if product exists and has stock
            $sql = "SELECT id, stock_quantity FROM products WHERE id = ?";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("i", $product_id);
            $stmt->execute();
            $result = $stmt->get_result();
            if ($result->num_rows > 0) {
                $product = $result->fetch_assoc();
                if ($product['stock_quantity'] > 0) {
                    // Check if product is already in cart
                    $sql = "SELECT quantity FROM cart WHERE user_id = ? AND product_id = ?";
                    $stmt = $conn->prepare($sql);
                    $stmt->bind_param("ii", $user_id, $product_id);
                    $stmt->execute();
                    $result = $stmt->get_result();
                    if ($result->num_rows > 0) {
                        // Update quantity
                        $row = $result->fetch_assoc();
                        $new_quantity = $row['quantity'] + $quantity;
                        $sql = "UPDATE cart SET quantity = ? WHERE user_id = ? AND product_id = ?";
                        $stmt = $conn->prepare($sql);
                        $stmt->bind_param("iii", $new_quantity, $user_id, $product_id);
                    } else {
                        // Add to cart
                        $sql = "INSERT INTO cart (user_id, product_id, quantity) VALUES (?, ?, ?)";
                        $stmt = $conn->prepare($sql);
                        $stmt->bind_param("iii", $user_id, $product_id, $quantity);
                    }
                    if ($stmt->execute()) {
                        echo json_encode(['success' => true, 'message' => 'Product added to cart']);
                    } else {
                        echo json_encode(['success' => false, 'message' => 'Error adding to cart: ' . $conn->error]);
                    }
                } else {
                    echo json_encode(['success' => false, 'message' => 'Product out of stock']);
                }
            } else {
                echo json_encode(['success' => false, 'message' => 'Product not found']);
            }
            break;

        case 'update':
            $product_id = sanitize_input($_POST['product_id']);
            $quantity = sanitize_input($_POST['quantity']);
            if ($quantity > 0) {
                $sql = "UPDATE cart SET quantity = ? WHERE user_id = ? AND product_id = ?";
                $stmt = $conn->prepare($sql);
                $stmt->bind_param("iii", $quantity, $user_id, $product_id);
                if ($stmt->execute()) {
                    echo json_encode(['success' => true, 'message' => 'Cart updated']);
                } else {
                    echo json_encode(['success' => false, 'message' => 'Error updating cart: ' . $conn->error]);
                }
            } else {
                echo json_encode(['success' => false, 'message' => 'Quantity must be greater than 0']);
            }
            break;

        case 'remove':
            $product_id = sanitize_input($_POST['product_id']);
            $sql = "DELETE FROM cart WHERE user_id = ? AND product_id = ?";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("ii", $user_id, $product_id);
            if ($stmt->execute()) {
                echo json_encode(['success' => true, 'message' => 'Product removed from cart']);
            } else {
                echo json_encode(['success' => false, 'message' => 'Error removing from cart: ' . $conn->error]);
            }
            break;

        case 'get':
            $sql = "SELECT c.product_id, c.quantity, p.name, p.price, p.image_path FROM cart c INNER JOIN products p ON c.product_id = p.id WHERE c.user_id = ?";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("i", $user_id);
            $stmt->execute();
            $result = $stmt->get_result();
            $cart_items;
            $total = 0;
            if ($result->num_rows > 0) {
                while ($row = $result->fetch_assoc()) {
                    $item_total = $row['price'] * $row['quantity'];
                    $total += $item_total;
                    $cart_items= [
                        'product_id' => $row['product_id'],
                        'quantity' => $row['quantity'],
                        'name' => $row['name'],
                        'price' => $row['price'],
                        'image_path' => $row['image_path'],
                        'item_total' => $item_total
                    ];
                }
            }
            echo json_encode(['success' => true, 'items' => $cart_items, 'total' => $total]);
            break;

        default:
            echo json_encode(['success' => false, 'message' => 'Invalid cart action']);
    }
} else {
    echo json_encode(['success' => false, 'message' => 'Invalid request method']);
}
$conn->close();
?>