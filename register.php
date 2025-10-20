<?php 

include 'connect.php';

if(isset($_POST['signUp'])){
    $firstName=$_POST['first_name'];
    $lastName=$_POST['last_name'];
    $email=$_POST['email'];
    $password=$_POST['password'];

     $checkEmail="SELECT * From userlogin where email='$email'";
     $result=$conn->query($checkEmail);
     if($result->num_rows>0){
        echo "Email Address Already Exists !";
     }
     else{
        $insertQuery="INSERT INTO userlogin (first_name,last_name,email,password)
                       VALUES ('$firstName','$lastName','$email','$password')";
            if($conn->query($insertQuery)==TRUE){
                header("location: homepage.html");
            }
            else{
                echo "Error:".$conn->error;
            }
     }
}

if(isset($_POST['signIn'])){
   $email=$_POST['email'];
   $password=$_POST['password'];
   
   $sql="SELECT * FROM userlogin WHERE email='$email' and password='$password'";
   $result=$conn->query($sql);
   if($result->num_rows>0){
    session_start();
    $row=$result->fetch_assoc();
    $_SESSION['email']=$row['email'];
    $_SESSION['userid']=$row['id'];
    header("Location: homepage.html");
    exit();
   }
   else{
    echo "Not Found, Incorrect Email or Password";
   }

}
?>