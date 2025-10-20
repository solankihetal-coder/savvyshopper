require('dotenv').config();
const signUpButton=document.getElementById('signUpButton');
const signInButton=document.getElementById('signInButton');
const signInForm=document.getElementById('signIn');
const signUpForm=document.getElementById('signup');

signUpButton.addEventListener('click',function(){
    signInForm.style.display="none";
    signUpForm.style.display="block";
})
signInButton.addEventListener('click', function(){
    signInForm.style.display="block";
    signUpForm.style.display="none";
})

// const form = document.querySelector('form');
// const passwordInput = document.querySelector('input[name="password"]');
// const confirmPasswordInput = document.querySelector('input[name="confirm_password"]');

// form.addEventListener('submit', function(event) {
//     if (passwordInput.value !== confirmPasswordInput.value) {
//         alert("Passwords do not match.");
//         event.preventDefault(); // Prevent form submission
//     }
// });

//   const form = document.querySelector('form');
//     //... other javascript variables
//   form.addEventListener('submit', function(event) {
//     event.preventDefault(); // Prevent default form submission

//     // ... (Your existing client-side validation code) ...

//     if (isValid) {
//       // If client-side validation passes, submit the form via AJAX
//       const formData = new FormData(form);

//       fetch('register_user.php', {
//         method: 'POST',
//         body: formData,
//       })
//       .then(response => response.json())
//       .then(data => {
//         if (data.success) {
//           alert(data.message); // Display success message
//           // Optionally, redirect to a login page or clear the form
//           form.reset();
//         } else {
//           alert(data.message); // Display error message
//         }
//       })
//       .catch(error => {
//         console.error('Error:', error);
//         alert('An error occurred. Please try again.');
//       });
//     }
//   });