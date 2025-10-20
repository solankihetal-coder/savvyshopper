<!-- database connection -->
<?php
// session_start();
  include('connect.php');
  include('add_to_cart.php');
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <link rel="shortcut icon" type="x-icon" href="herbal/logo1.png">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SavvyShopper</title>
    <link rel="stylesheet" href="stylesheet.css">

</head>

<body>
 
<nav class="navbar">
        <div class="logo">
            <img src="herbal/logo.png" alt="logo" width="190px">
        </div>
        <ul class="menu">
            <li><a href="homepage.html">Home</a></li>
            <div class="dropdown">
                <button class="dropbtn">Shop</button>
                <div class="dropdown-content">
                    <a href="homecare.php">Home Care</a>
                    <a href="babycare.php">Baby Care</a>
                    <a href="health.php">Health & Nutrition</a>
                    <a href="agriculture.php">Agriculture & Veterinary</a>
                    <a href="skincare.php">Skin Care</a>
                    <a href="personal.php">Personal Care</a>
                    <a href="books.php">Books & Literature</a>
                    <a href="food.php">Food Care</a>
                </div>
            </div>
            <li><a href="#about">About</a></li>
            <li><a href="register.html">Join Membership</a></li>
            <li><a href="logout.php" class="button1">Logout</a></li>
            <li><a href="#search"><img src="herbal/search.png" alt="" width="20px"></a></li>
            <li><a href="cart.php"><img src="herbal/cart.png" alt="" width="25px"></a><?php echo getCartCount();   ?></li>
        </ul>
    </nav>
 <!-- Product content -->
 <div id="product">
  <div class="background-baby">
    <h2>Welcome to Books & Literature!</h2><hr style="margin-left:1%;margin-right:1%;">
   </div>
  <div class="product-container">
    <!-- <div class="product-card" data-product-id="${product.id}" data-category="homecare"> -->
    <?php
getBookCareProducts();
?>
<?php
cart();
// getIpAddress()
?>

</div>
</div>

    <footer>
        <div class="footerContainer">
            <div class="row">
                <div class="columnfo1">
                    <div class="logo">
                        <img src="herbal/logo.png" alt="logo" style="width: 210px;">
                        <h5>SavvyShopper is a community of herbal enthusiasts, wellness advocates, and nature lovers.
                            Follow us on social media for tips, recipes, and stories that inspire.
                        </h5>
                    </div>
                </div>
                <div class="columnfo1">
                    <ul>
                        <li>
                            <h4>Get in touch</h4>
                        </li>
                        <li><img src="herbal/email.jpg" alt="" style="width: 15px;">&nbsp;SavvyShopper11@gmail.com</li>
                        <li><img src="herbal/call-removebg-preview.png" alt="" style="width: 15px;">&nbsp;0123456789</li>
                        <li><img src="herbal/instagram-removebg-preview.png" alt="" style="width: 20px;">SavvyShopper_11</li>
                    </ul>
                </div>
                <div class="columnfo1">
                    <h4><a href="feedback.html" style="color:black;text-decoration: none;">Click here to send a feedback</a></h4>
                </div>
            </div>
        </div>
    </footer>
<script src="cart.js"></script>
<script src="server.js"></script>
<script src="stripe_payment.js"></script>
</body>

</html>
