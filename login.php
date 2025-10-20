<?php // login.php (Simplified example)
session_start();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = $_POST['username'];
    $password = $_POST['password'];

    // In a real application, you would validate the username and password against a database.
    if ($username === 'username' && $password === 'password') {
        $_SESSION['username'] = $username;
        $_SESSION['password'] = $password;
        header('Location: homepage.html'); // Redirect to the main page
        exit;
    } else {
        echo "Login failed.";
    }
}
?>

<form method="post">
    <input type="text" name="username" placeholder="Username">
    <input type="password" name="password" placeholder="Password">
    <button type="submit">Login</button>
</form>