// feedback.js
document.getElementById('feedbackForm').addEventListener('submit', function(event) {
    event.preventDefault(); // Prevent default form submission

    const formData = new FormData(this); // Get form data

    fetch('submit_feedback.php', {
        method: 'POST',
        body: formData
    })
    .then(response => response.text())
    .then(data => {
        document.getElementById('feedbackMessage').textContent = data;
        if(data === "Feedback submitted successfully!"){
          document.getElementById('feedbackForm').reset();
        }
    })
    .catch(error => {
        console.error('Error:', error);
        document.getElementById('feedbackMessage').textContent = 'An error occurred. Please try again.';
    });
});