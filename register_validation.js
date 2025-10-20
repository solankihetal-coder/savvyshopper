document.addEventListener("DOMContentLoaded", function() {
    const form = document.getElementById('registrationForm');

    form.addEventListener('submit', function(event) {
        let isValid = true;

        resetErrorMessages();

        isValid = validateFirstName() && isValid;
        isValid = validateMiddleName() && isValid;
        isValid = validateLastName() && isValid;
        isValid = validateDOB() && isValid;
        isValid = validateUsername() && isValid;
        isValid = validateEmail() && isValid;
        isValid = validateAge() && isValid;
        isValid = validatePhoneNumber() && isValid;
        isValid = validateNomineeName() && isValid;
        isValid = validateNomineeRelation() && isValid;
        isValid = validatePanNumber() && isValid;
        isValid = validateAddress() && isValid;
        isValid = validatePassword() && isValid;
        isValid = validateConfirmPassword() && isValid;

        if (!isValid) {
            event.preventDefault();
        }
         // If validation passes, send data to PHP
         const formData = new FormData(form);

         fetch('register_user.php', {
             method: 'POST',
             body: formData
         })
         .then(response => response.json())
         .then(data => {
             if (data.status === 'success') {
                 // Show the dialog box
                 alert(data.message); // You can replace this with a more styled modal
 
                 // Redirect to homepage.html
                 window.location.href = 'homepage.html'; // Or 'index.php' if that's your homepage
             } else {
                 // Display error message
                 alert(data.message); // Display the error message from PHP
             }
         })
        //  .catch(error => {
        //     console.error('Error:', error);
        //     alert('An error occurred during registration.'); // Generic error message
        // });
    });

    function resetErrorMessages() {
        const errorMessages = document.querySelectorAll('.error-message');
        errorMessages.forEach(message => {
            message.textContent = '';
        });
    }

    function validateFirstName() {
        const firstName = document.querySelector('input[name="first_name"]').value.trim();
        if (firstName === '') {
            displayError('first_name-error', 'First name is required.');
            return false;
        }
        return true;
    }

    function validateMiddleName() {
        const middleName = document.querySelector('input[name="middle_name"]').value.trim();
        if (middleName === '') {
            displayError('middle_name-error', 'Middle name is required.');
            return false;
        }
        return true;
    }

    function validateLastName() {
        const lastName = document.querySelector('input[name="last_name"]').value.trim();
        if (lastName === '') {
            displayError('last_name-error', 'Last name is required.');
            return false;
        }
        return true;
    }

    function validateDOB() {
        const dobInput = document.getElementById('dob');
        const dob = new Date(dobInput.value);
        const today = new Date();
        const ageInput = parseInt(document.getElementById('age').value);

        if (!dobInput.value) {
            displayError('dob-error', 'Date of birth is required.');
            return false;
        }

        if (dob > today) {
            displayError('dob-error', 'Date of birth cannot be in the future.');
            return false;
        }

        let calculatedAge = today.getFullYear() - dob.getFullYear();
        const monthDiff = today.getMonth() - dob.getMonth();
        if (monthDiff < 0 || (monthDiff === 0 && today.getDate() < dob.getDate())) {
            calculatedAge--;
        }

        if (calculatedAge !== ageInput) {
            displayError('dob-error', 'Age from Date of Birth does not match.');
            return false;
        }

        return true;
    }

    function validateUsername() {
        const username = document.querySelector('input[name="username"]').value.trim();
        if (username === '') {
            displayError('username-error', 'Username is required.');
            return false;
        }
        return true;
    }

    function validateEmail() {
        const email = document.getElementById('email').value.trim();
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailRegex.test(email)) {
            displayError('email-error', 'Invalid email format.');
            return false;
        }
        return true;
    }

    function validateAge() {
        const age = parseInt(document.getElementById('age').value);
        if (isNaN(age) || age < 18) {
            displayError('age-error', 'Age must be 18 or older.');
            return false;
        }
        return true;
    }

    function validatePhoneNumber() {
        const phoneNumber = document.getElementById('phone_number').value;
        if (phoneNumber.length > 10 || isNaN(phoneNumber)) {
            displayError('phone_number-error', 'Phone number must be 10 digits.');
            return false;
        }
        return true;
    }

    function validateNomineeName() {
        const nomineeName = document.querySelector('input[name="nominee_name"]').value.trim();
        if (nomineeName === '') {
            displayError('nominee_name-error', 'Nominee name is required.');
            return false;
        }
        return true;
    }

    function validateNomineeRelation() {
        const nomineeRelation = document.querySelector('input[name="nominee_relation"]').value.trim();
        if (nomineeRelation === '') {
            displayError('nominee_relation-error', 'Nominee relation is required.');
            return false;
        }
        return true;
    }

    function validatePanNumber() {
        const panNumber = document.getElementById('pan_number').value.toUpperCase();
        const panRegex = /^[A-Z]{5}[0-9]{4}[A-Z]{1}$/; // Corrected regex
        if (!panRegex.test(panNumber)) {
            displayError('pan_number-error', 'Invalid PAN number format.');
            return false;
        }
        return true;
    }

    function validateAddress() {
        const address = document.querySelector('textarea[name="address"]').value.trim();
        if (address === '') {
            displayError('address-error', 'Address is required.');
            return false;
        }
        return true;
    }

    function validatePassword() {
        const password = document.getElementById('password').value;
        if (password.length < 8) {
            displayError('password-error', 'Password must be at least 8 characters long.');
            return false;
        }
        return true;
    }

    function validateConfirmPassword() {
        const password = document.getElementById('password').value;
        const confirmPassword = document.getElementById('confirm_password').value;
        if (password !== confirmPassword) {
            displayError('confirm_password-error', 'Passwords do not match.');
            return false;
        }
        return true;
    }

    function displayError(elementId, message) {
        const errorElement = document.getElementById(elementId);
        if (errorElement) {
            errorElement.textContent = message;
        }
    }
});