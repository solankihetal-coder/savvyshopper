<?php
  include('connect.php');
  include('add_to_cart.php');
  include('stripe_config.php');
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
            <li><a href="index.php">Home</a></li>
            <div class="dropdown">
                <button class="dropbtn">Shop</button>
                <div class="dropdown-content">
                    <a href="homecare.php">Home Care</a>
                    <a href="babycare.html">Baby Care</a>
                    <a href="health.html">Health & Nutrition</a>
                    <a href="agriculture.html">Agriculture & Veterinary</a>
                    <a href="skincare.html">Skin Care</a>
                    <a href="personal.html">Personal Care</a>
                    <a href="books.html">Books & Literature</a>
                    <a href="food.html">Food Care</a>
                </div>
            </div>
            <li><a href="#about">About</a></li>
            <li><a href="register.html">Join Membership</a></li>
            <li><a href="logout.php" class="button1">Logout</a></li>
            <li><a href="#search"><img src="herbal/search.png" alt="" width="20px"></a></li>
            <li><a href="cart.php"><img src="herbal/cart.png" alt="" width="25px"></a><?php echo getCartCount();   ?></li>
        </ul>
    </nav>
    
    <div class="checkout-section">
        <div class="order-summary">
            <div class="order-summary-head">
                <h4>Order Summary</h4>
            </div>
            <div class="order-summary-details">
                <div  class="order-summary-detail">
                <h4>Subtotal:</h4>
                <span><?php  getSubTotal();   ?></span>
                </div>

                <div  class="order-summary-detail">
                <h4>Shipping Charges:</h4>
                <span>50</span>
                </div>

                <div  class="order-summary-detail">
                <h4>GST:</h4>
                <span>250</span>
                </div>
            </div>
            <div class="order-summary-footer">
                <div class="order-summary-footer_detail">
                <h4>Total:</h4>
                <span><?php  getFinalTotal();   ?></span> 
                </div>

                <div>
                    <button>Proceedding For Payment.... </button>
                </div>
            </div>
        </div>
        <div class="card-info">
            <div><h4>Payment</h4></div>
            <!-- <div><input type="text" placeholder="1234 1234 1234 1234" /></div>
            <div><input type="text" placeholder="MM / YY"/></div>
            <div><input type="text" placeholder="CVV"/></div> -->
            <div class="card-image-wrapper">
                <img src="https://www.pngall.com/wp-content/uploads/5/Online-Payment-PNG-Photo.png" alt="">
            </div>
            <!-- <div><button>Pay With Card - 
            </button></div> -->
        <form action="submit.php" method='post'>

            <script
            src="https://checkout.stripe.com/checkout.js" class="stripe-button"
            data-key="<?php echo $Publishablekey ?>"
            data-amount="400"
            data-name="Shop with Savvy Shopper"
            data-description="This is the Savvy Shopper"
            data-image="https://tse4.mm.bing.net/th?id=OIP._90s7Dl0mQyALLK3ZB8_ywHaHa&pid=Api&P=0&h=220"
            data-currency="inr"
            data-email="<?php echo $get_email ?>"
            >
            
            </script>
        </form>
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
                        <li><img src="/herbal/email.jpg" alt="" style="width: 15px;">&nbsp;SavvyShopper11@gmail.com</li>
                        <li><img src="/herbal/call-removebg-preview.png" alt="" style="width: 15px;">&nbsp;0123456789</li>
                        <li><img src="herbal/instagram-removebg-preview.png" alt="" style="width: 20px;">SavvyShopper_11</li>
                    </ul>
                </div>
                <div class="columnfo1">
                    <h4><a href="feedback.html" style="color:black;text-decoration: none;">Click here to send a feedback</a></h4>
                </div>
            </div>
        </div>
    </footer>
</body>
</html>