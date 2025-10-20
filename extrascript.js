document.getElementById("login-form").addEventListener("submit", function(event) {
    event.preventDefault();

    // Clear previous error messages
    document.getElementById("username-error").textContent = "";
    document.getElementById("password-error").textContent = "";
    document.getElementById("error-message").textContent = "";

    // Get values from the form
    const username = document.getElementById("username").value;
    const password = document.getElementById("password").value;

    let isValid = true;

    // Validate username
    if (username === "") {
        document.getElementById("username-error").textContent = "Username is required.";
        isValid = false;
    }

    // Validate password
    if (password === "") {
        document.getElementById("password-error").textContent = "Password is required.";
        isValid = false;
    }

    // If the form is valid, simulate successful login
    if (isValid) {
        alert("Login successful!");
        // Here you can add the code to send the login data to the server or process further.
    } else {
        document.getElementById("error-message").textContent = "Please fill in all fields.";
    }
});
