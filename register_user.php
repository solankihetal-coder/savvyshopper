<?php
include 'connect.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve form data and sanitize it
    $first_name = mysqli_real_escape_string($conn, $_POST['first_name']);
    $middle_name = mysqli_real_escape_string($conn, $_POST['middle_name']);
    $last_name = mysqli_real_escape_string($conn, $_POST['last_name']);
    $dob = $_POST['dob'];
   // $username = mysqli_real_escape_string($conn, $_POST['username']);
    $username = $_POST["username"];
    $email = mysqli_real_escape_string($conn, $_POST['email']);
    $age = intval($_POST['age']);
    $phone_number = mysqli_real_escape_string($conn, $_POST['phone_number']);
    $nominee_name = mysqli_real_escape_string($conn, $_POST['nominee_name']);
    $nominee_relation = mysqli_real_escape_string($conn, $_POST['nominee_relation']);
    $pan_number = mysqli_real_escape_string($conn, $_POST['pan_number']);
    $address = mysqli_real_escape_string($conn, $_POST['address']);
    $password = $_POST['password'];
    $gender = mysqli_real_escape_string($conn, $_POST['gender']);

    // Hash the password
    //$hashed_password = password_hash($password, PASSWORD_DEFAULT);

    // Check if username or email already exists (Important!)
    $check_query = "SELECT * FROM users WHERE username = '$username' OR email = '$email'";
   // $check_query = "SELECT * FROM users WHERE username = '$username'";
    $check_result = mysqli_query($conn, $check_query);
    if (mysqli_num_rows($check_result) > 0) {
        echo "Username or email already exists.";
        exit(); // Stop execution
    }

    // Insert data into the database
    $query = "INSERT INTO users (first_name, middle_name, last_name, dob, username, email, age, phone_number, nominee_name, nominee_relation, pan_number, address, password, gender)
              VALUES ('$first_name', '$middle_name', '$last_name', '$dob', '$username', '$email', $age, '$phone_number', '$nominee_name', '$nominee_relation', '$pan_number', '$address', '$password', '$gender')";

    if (mysqli_query($conn, $query)) {
        echo "Registration successful!";
        // Redirect to a success page or login page
        header("Location: homepage.html");//Create homepage.html. Copy index.php and change login to logout
         exit();
    } else {
        echo "Error: " . $query . "<br>" . mysqli_error($conn);
    }

    mysqli_close($conn);
}
?>