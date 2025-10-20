<?php
session_start();
// include 'db_connect.php';
include('connect.php');

$get_email=$_SESSION['email'];

function emptyCart() {
    global $conn;
    $get_user=$_SESSION['userid'];
    $delete_query = "DELETE FROM `cart` WHERE user_id = $get_user";
    $result = mysqli_query($conn, $delete_query);
}

function getCartCount() {
    global $conn;
    $get_ip=getIpAddress();
    $get_user=$_SESSION['userid'];
    $select_query="Select * from `cart` where  user_id=$get_user";
    $result_query=mysqli_query($conn,$select_query);
    $num_of_rows=mysqli_num_rows($result_query);
    echo "<div class='custom-cart'><span >$num_of_rows</span></div>";
}


function isCartEmpty() {
    global $conn;
    $total_price = 0;
    $get_user=$_SESSION['userid'];
    $select_query="Select * from `cart` where  user_id=$get_user";
    $result_query=mysqli_query($conn,$select_query);
    while($row_data=mysqli_fetch_assoc($result_query)) {
        $product_price=$row_data['price'];
        $total_price += $product_price; 
    }
    $num_of_rows=mysqli_num_rows($result_query);

    if($num_of_rows > 0) {
        echo "<div class='cart-bottom'>
            <div>
                <p>Gross Total</p>
                <p>$total_price</p>
            </div>
            <a href='checkout.php?total=$total_price'><div><button>Checkout</button></div></a>
        </div> ";

    } else {
        echo "<div class='empty-cart'>
        <div> <img src='https://cdn.iconscout.com/icon/premium/png-256-thumb/empty-cart-2685174-2232751.png' /> </div>
        <h1> No Product In Your Cart </h1>
        <a href='homecare.php'> View Product </a>
        </div>";
    }
}

function getSubTotal() {
global $subtotal;
$subtotal=0;
 if(isset($_GET['total'])) {
    $subtotal=$_GET['total'];
 }
 echo "$subtotal";
}

function getFinalTotal() {
    global $subtotal;
    $shipping_charges=50;
    $GST=250;
    $fianl_total=0;

    $fianl_total= $subtotal + $shipping_charges + $GST; 
    // if(isset($_GET['total'])) {
    //    $subtotal=$_GET['total'];
    // }
    echo "$fianl_total";
   }

function cart() {
    if(isset($_GET['add_to_cart'])) {
        global $conn;
        $get_product_id=$_GET['add_to_cart'];
        $get_product_name=$_GET['name'];
        $get_product_image=$_GET['image'];
        $get_product_price=$_GET['price'];
        $get_user=$_SESSION['userid'];
        $get_ip=getIpAddress();
        $select_query="Select * from `cart` where product_id='$get_product_id' and user_id=$get_user";
        $result_query=mysqli_query($conn,$select_query);
        $num_of_rows=mysqli_num_rows($result_query);

        if($num_of_rows > 0) {
            echo "<script>alert('This item is already present in cart')</script>";
            echo "<script>window.open('homecare.php','_self')</script>";

        } else {
            $insert_query="insert into `cart` (user_id,product_id,quantity,ip_address,product_image,price,name) values ($get_user,$get_product_id,1,'$get_ip','$get_product_image',$get_product_price,'$get_product_name')";
            $result_query=mysqli_query($conn,$insert_query);
            echo "<script>alert('item added into cart successfully')</script>";
            echo "<script>window.open('homecare.php','_self')</script>";
            echo "<div>cart function</div>";
        }
    }
}

function getHomeCareProducts() {
    global $conn;
    $select_products="SELECT * FROM `products`WHERE category = 'Home cleaning'";
    $result_products=mysqli_query($conn,$select_products);
    while($row_data=mysqli_fetch_assoc($result_products)) {
        $product_id=$row_data['id'];
        $product_name=$row_data['name'];
        $product_price=$row_data['price'];
        $product_description=$row_data['description'];
        $product_image_path=$row_data['image_path'];
        echo "
         <div class='product-card'>
                <img src='$product_image_path' alt='Avatar' style='width:100%'>
                <h4>$product_name</h4>
                <p class='price'>Rs.$product_price</p>
                <p>$product_description.</p>
              <p><a href='homecare.php?add_to_cart=$product_id&image=$product_image_path&price=$product_price&name=$product_name'><button>Add to Cart</button></a></p>
              <p><a href='buy_now.php'><button>Buy Now</button></a></p>
          </div>
        ";
        }
}
function getBabyCareProducts() {
    global $conn;
    $select_products="SELECT * FROM `products`WHERE category = 'Baby Care'";
    $result_products=mysqli_query($conn,$select_products);
    while($row_data=mysqli_fetch_assoc($result_products)) {
        $product_id=$row_data['id'];
        $product_name=$row_data['name'];
        $product_price=$row_data['price'];
        $product_description=$row_data['description'];
        $product_image_path=$row_data['image_path'];
        echo "
         <div class='product-card'>
                <img src='$product_image_path' alt='Avatar' style='width:100%'>
                <h4>$product_name</h4>
                <p class='price'>Rs.$product_price</p>
                <p>$product_description.</p>
              <p><a href='homecare.php?add_to_cart=$product_id&image=$product_image_path&price=$product_price&name=$product_name'><button>Add to Cart</button></a></p>
              <p><a href='buy_now.php'><button>Buy Now</button></a></p>
          </div>
        ";
        }
}

function getHealthNutritionProducts() {
    global $conn;
    $select_products="SELECT * FROM `products`WHERE category = 'Herbal'";
    $result_products=mysqli_query($conn,$select_products);
    while($row_data=mysqli_fetch_assoc($result_products)) {
        $product_id=$row_data['id'];
        $product_name=$row_data['name'];
        $product_price=$row_data['price'];
        $product_description=$row_data['description'];
        $product_image_path=$row_data['image_path'];
        echo "
         <div class='product-card'>
                <img src='$product_image_path' alt='Avatar' style='width:100%'>
                <h4>$product_name</h4>
                <p class='price'>Rs.$product_price</p>
                <p>$product_description.</p>
              <p><a href='homecare.php?add_to_cart=$product_id&image=$product_image_path&price=$product_price&name=$product_name'><button>Add to Cart</button></a></p>
              <p><a href='buy_now.php'><button>Buy Now</button></a></p>
          </div>
        ";
        }
}

function getAgricultureCareProducts() {
    global $conn;
    $select_products="SELECT * FROM `products`WHERE category = 'Agriculture'";
    $result_products=mysqli_query($conn,$select_products);
    while($row_data=mysqli_fetch_assoc($result_products)) {
        $product_id=$row_data['id'];
        $product_name=$row_data['name'];
        $product_price=$row_data['price'];
        $product_description=$row_data['description'];
        $product_image_path=$row_data['image_path'];
        echo "
         <div class='product-card'>
                <img src='$product_image_path' alt='Avatar' style='width:100%'>
                <h4>$product_name</h4>
                <p class='price'>Rs.$product_price</p>
                <p>$product_description.</p>
              <p><a href='homecare.php?add_to_cart=$product_id&image=$product_image_path&price=$product_price&name=$product_name'><button>Add to Cart</button></a></p>
              <p><a href='buy_now.php'><button>Buy Now</button></a></p>
          </div>
        ";
        }
}

function getSkinCareProducts() {
    global $conn;
    $select_products="SELECT * FROM `products`WHERE category = 'Herbal'";
    $result_products=mysqli_query($conn,$select_products);
    while($row_data=mysqli_fetch_assoc($result_products)) {
        $product_id=$row_data['id'];
        $product_name=$row_data['name'];
        $product_price=$row_data['price'];
        $product_description=$row_data['description'];
        $product_image_path=$row_data['image_path'];
        echo "
         <div class='product-card'>
                <img src='$product_image_path' alt='Avatar' style='width:100%'>
                <h4>$product_name</h4>
                <p class='price'>Rs.$product_price</p>
                <p>$product_description.</p>
              <p><a href='homecare.php?add_to_cart=$product_id&image=$product_image_path&price=$product_price&name=$product_name'><button>Add to Cart</button></a></p>
              <p><a href='buy_now.php'><button>Buy Now</button></a></p>
          </div>
        ";
        }
}

function getPersonalCareProducts() {
    global $conn;
    $select_products="SELECT * FROM `products`WHERE category = 'Personal Care'";
    $result_products=mysqli_query($conn,$select_products);
    while($row_data=mysqli_fetch_assoc($result_products)) {
        $product_id=$row_data['id'];
        $product_name=$row_data['name'];
        $product_price=$row_data['price'];
        $product_description=$row_data['description'];
        $product_image_path=$row_data['image_path'];
        echo "
         <div class='product-card'>
                <img src='$product_image_path' alt='Avatar' style='width:100%'>
                <h4>$product_name</h4>
                <p class='price'>Rs.$product_price</p>
                <p>$product_description.</p>
              <p><a href='homecare.php?add_to_cart=$product_id&image=$product_image_path&price=$product_price&name=$product_name'><button>Add to Cart</button></a></p>
              <p><a href='buy_now.php'><button>Buy Now</button></a></p>
          </div>
        ";
        }
}

function getBookCareProducts() {
    global $conn;
    $select_products="SELECT * FROM `products`WHERE category = 'Books & Guides'";
    $result_products=mysqli_query($conn,$select_products);
    

    while($row_data=mysqli_fetch_assoc($result_products)) {
        $product_id=$row_data['id'];
        $product_name=$row_data['name'];
        $product_price=$row_data['price'];
        $product_description=$row_data['description'];
        $product_image_path=$row_data['image_path'];
        echo "
         <div class='product-card'>
                <img src='$product_image_path' alt='Avatar' style='width:100%'>
                <h4>$product_name</h4>
                <p class='price'>Rs.$product_price</p>
                <p>$product_description.</p>
              <p><a href='homecare.php?add_to_cart=$product_id&image=$product_image_path&price=$product_price&name=$product_name'><button>Add to Cart</button></a></p>
              <p><a href='buy_now.php'><button>Buy Now</button></a></p>
          </div>
        ";
        }
}

function getFoodCareProducts() {
    global $conn;
    $select_products="SELECT * FROM `products`WHERE category = 'FoodCare'";
    $result_products=mysqli_query($conn,$select_products);
    

    while($row_data=mysqli_fetch_assoc($result_products)) {
        $product_id=$row_data['id'];
        $product_name=$row_data['name'];
        $product_price=$row_data['price'];
        $product_description=$row_data['description'];
        $product_image_path=$row_data['image_path'];
        echo "
         <div class='product-card'>
                <img src='$product_image_path' alt='Avatar' style='width:100%'>
                <h4>$product_name</h4>
                <p class='price'>Rs.$product_price</p>
                <p>$product_description.</p>
              <p><a href='homecare.php?add_to_cart=$product_id&image=$product_image_path&price=$product_price&name=$product_name'><button>Add to Cart</button></a></p>
              <p><a href='buy_now.php'><button>Buy Now</button></a></p>
          </div>
        ";
        }
}

function getIpAddress() {
    if (!empty($_SERVER['HTTP_CLIENT_IP'])) {
        $ip = $_SERVER['HTTP_CLIENT_IP'];
    } elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) {
        $ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
    } else {
        $ip = $_SERVER['REMOTE_ADDR'];
    }
    // echo "<div> This is user ip: $ip   </div>";
    return $ip;
}

function getCartDetails() {
    global $conn;
    $get_user=$_SESSION['userid'];
    $select_query="Select * from `cart` where user_id=$get_user";
    $result_query=mysqli_query($conn,$select_query);
    $total_price = 0;
    while($row_data=mysqli_fetch_assoc($result_query)) {
        $product_name=$row_data['name'];
        $product_price=$row_data['price'];
        $product_image_path=$row_data['product_image'];  
        $product_quantity=$row_data['quantity']; 
        $total_price += $product_price; 
       echo "
        <div class='cart-top'>
            <div class='cart-body'>
                <div class='cart-lbody'>
                    <div class='cart-img'><img src='$product_image_path' alt=''></div>
                    <div>
                        <p>$product_name</p>
                        <p>Price: $product_price</p>
                    </div>
                </div>
                <div class='cart-rbody'>
                    <p>$product_quantity</p>
                    <p>$product_price</p>
                </div>
            </div>
        </div>
   
         
       ";    
    }
}
?>


