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

function updateHeader() {
    const xhr = new XMLHttpRequest();
    xhr.open('GET', 'check_login.php', true);
    xhr.onload = function() {
        if (this.status >= 200 && this.status < 400) {
            const data = JSON.parse(this.responseText);
            const headerDiv = document.querySelector('#dynamicHeader .auth-links');
            localStorage.setItem('user',data);
            if (data.loggedIn) {
                headerDiv.innerHTML = `
                    <span>Welcome, ${data.username}!</span>
                    <a href="logout.php">Logout</a>
                `;
            } else {
                headerDiv.innerHTML = `
                    <a href="login.php">Login</a>
                    <a href="register.php">Register</a>
                `;
            }
        } else {
            console.error('Request failed with status:', this.status);
            document.querySelector('#dynamicHeader .auth-links').innerHTML = `<a href="login.php">Login</a> <a href="register.php">Register</a>`;
        }
    };
    xhr.onerror = function() {
        console.error('Request failed');
        document.querySelector('#dynamicHeader .auth-links').innerHTML = `<a href="login.php">Login</a> <a href="register.php">Register</a>`;
    };
    xhr.send();
}

updateHeader();