<?php // check_login.php
session_start();

$response = ['loggedIn' => false, 'username' => null];

if (isset($_SESSION['username'])) {
    $response['loggedIn'] = true;
    $response['username'] = $_SESSION['username'];
}

header('Content-Type: application/json');
echo json_encode($response);
?>