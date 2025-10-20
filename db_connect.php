<?php
$servername = "localhost"; // Or your database host
$username = "root"; // Your database username
$password = ""; // Your database password
$dbname = "savvy_shopper";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
// function sanitize_input($data) {
//     return mysqli_real_escape_string($conn, trim($data));
// }     global $conn;
//
?>