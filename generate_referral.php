<?php
// PHP (generate_referral.php)

// Database connection details
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "savvy_shopper";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die(json_encode(["error" => "Connection failed: " . $conn->connect_error]));
}

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["action"])) {
    $action = $_POST["action"];

    if ($action == "generate") {
        // Generate a unique referral code
        $referralCode = generateUniqueReferralCode($conn);

        if ($referralCode) {
            $userId = isset($_POST["userId"]) ? intval($_POST["userId"]) : 0; //Get user ID
            $sql = "INSERT INTO referrals (user_id, referral_code) VALUES (?, ?)";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("is", $userId, $referralCode);

            if ($stmt->execute()) {
                echo json_encode(["referralCode" => $referralCode]);
            } else {
                echo json_encode(["error" => "Error inserting referral code: " . $stmt->error]);
            }
            $stmt->close();
        } else {
            echo json_encode(["error" => "Failed to generate a unique referral code."]);
        }
    }
    else if($action == "get"){
         $userId = isset($_POST["userId"]) ? intval($_POST["userId"]) : 0; //Get user ID
         $sql = "SELECT referral_code FROM referrals WHERE user_id = ?";
         $stmt = $conn->prepare($sql);
         $stmt->bind_param("i", $userId);
         $stmt->execute();
         $result = $stmt->get_result();

         if($result->num_rows > 0){
             $row = $result->fetch_assoc();
             echo json_encode(["referralCode"=>$row["referral_code"]]);
         } else {
             echo json_encode(["referralCode"=>null]);
         }
         $stmt->close();

    }
}

$conn->close();

function generateUniqueReferralCode($conn, $length = 8) {
    $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    $code = '';
    $max = strlen($characters) - 1;
    for ($i = 0; $i < $length; $i++) {
        $code .= $characters[random_int(0, $max)];
    }

    // Check if the code already exists
    $sql = "SELECT referral_code FROM referrals WHERE referral_code = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $code);
    $stmt->execute();
    $stmt->store_result();

    if ($stmt->num_rows > 0) {
        // Code already exists, generate a new one recursively
        $stmt->close();
        return generateUniqueReferralCode($conn, $length);
    }

    $stmt->close();
    return $code;
}

?>