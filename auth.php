<?php
session_start();

// Function to check if user is logged in
function is_logged_in() {
    return isset($_SESSION['user_id']);
}

// Function to get current user ID
function get_current_user_id() {
    if (is_logged_in()) {
        return $_SESSION['user_id'];
    }
    return null;
}

// Example login function (replace with your actual login logic)
function login_user($username, $password) {
    global $conn;

    $username = sanitize_input($username);
    // In a real application, you would hash the password
    // and compare it to the hashed password in the database
    $sql = "SELECT id, password FROM users WHERE username = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $username);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        if (password_verify($password, $row['password'])) { // Use password_verify
            $_SESSION['user_id'] = $row['id'];
            return true;
        }
    }
    return false;
}

// Example register function (replace with your actual registration logic)
function register_user($username, $password, $email) {
    global $conn;

    $username = sanitize_input($username);
    $email = sanitize_input($email);
    // Hash the password before storing it
    $hashed_password = password_hash($password, PASSWORD_DEFAULT); // Use password_hash

    $sql = "INSERT INTO users (username, password, email) VALUES (?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("sss", $username, $hashed_password, $email);
    if ($stmt->execute()) {
        return true;
    }
    return false;
}

// Logout function
function logout_user() {
    session_destroy();
}
?>