document.getElementById('payment-form').addEventListener('submit', function(event) {
    event.preventDefault();

    const formData = new FormData(this);

    fetch('process_payment.php', {
        method: 'POST',
        body: formData
    })
    .then(response => response.json())
    .then(data => {
        const paymentStatusDiv = document.getElementById('payment-status');
        if (data.success) {
            paymentStatusDiv.innerHTML = '<p style="color: green;">' + data.message + '</p>';
        } else {
            paymentStatusDiv.innerHTML = '<p style="color: red;">' + data.message + '</p>';
        }
    })
    .catch(error => {
        console.error('Error:', error);
        document.getElementById('payment-status').innerHTML = '<p style="color: red;">An error occurred.</p>';
    });
});

// document.addEventListener('DOMContentLoaded', function () {
//     // Initialize datepicker
//     $('#expiry-date').datepicker({
//         format: 'mm/yy',
//         startView: 'years',
//         minViewMode: 'months',
//         autoclose: true
//     });

    document.getElementById('payment-form').addEventListener('submit', function (event) {
        event.preventDefault();

        // Form Validation
        const cardNumber = document.getElementById('card-number').value.trim();
        const expiryDate = document.getElementById('expiry-date').value.trim();
        const cvv = document.getElementById('cvv').value.trim();
        const cardName = document.getElementById('card-name').value.trim();

        // Bank account number validation (9 to 18 digits)
        const bankAccountRegex = /^\d{9,18}$/;
        if (!bankAccountRegex.test(cardNumber)) {
            document.getElementById('payment-status').innerHTML = '<p style="color: red;">Invalid Bank Account Number.</p>';
            return;
        }

        // Expiry date validation (basic)
        if (!expiryDate) {
            document.getElementById('payment-status').innerHTML = '<p style="color: red;">Expiry Date is required.</p>';
            return;
        }

        // CVV validation (3 or 4 digits)
        const cvvRegex = /^\d{3,4}$/;
        if (!cvvRegex.test(cvv)) {
            document.getElementById('payment-status').innerHTML = '<p style="color: red;">Invalid CVV.</p>';
            return;
        }

        // Card name validation (basic)
        if (!cardName) {
            document.getElementById('payment-status').innerHTML = '<p style="color: red;">Card Name is required.</p>';
            return;
        }

        const formData = new FormData(this);

        fetch('process_payment.php', {
            method: 'POST',
            body: formData
        })
            .then(response => response.json())
            .then(data => {
                const paymentStatusDiv = document.getElementById('payment-status');
                const submitButton = document.querySelector('button[type="submit"]'); // Get the submit button

                if (data.success) {
                    paymentStatusDiv.innerHTML = '<p style="color: green;">' + data.message + '</p>';
                    submitButton.textContent = 'Order Placed'; // Change button text

                    // You might want to disable the form or redirect the user here
                    // to prevent multiple submissions.
                    // For example:
                    document.getElementById('payment-form').reset(); // Clear the form
                    document.getElementById('payment-form').classList.add('disabled'); // Disable the form
                } else {
                    paymentStatusDiv.innerHTML = '<p style="color: red;">' + data.message + '</p>';
                }
            })
            .catch(error => {
                console.error('Error:', error);
                document.getElementById('payment-status').innerHTML = '<p style="color: red;">An error occurred.</p>';
            });
    });


// document.addEventListener('DOMContentLoaded', function() {
//     // Initialize datepicker
//     $('#expiry-date').datepicker({
//         format: 'mm/yy',
//         startView: 'years',
//         minViewMode: 'months',
//         autoclose: true
//     });

//     document.getElementById('payment-form').addEventListener('submit', function(event) {
//         event.preventDefault();

//         // Form Validation
//         const cardNumber = document.getElementById('card-number').value.trim();
//         const expiryDate = document.getElementById('expiry-date').value.trim();
//         const cvv = document.getElementById('cvv').value.trim();
//         const cardName = document.getElementById('card-name').value.trim();

//         // Bank account number validation (9 to 18 digits)
//         const bankAccountRegex = /^\d{9,18}$/;
//         if (!bankAccountRegex.test(cardNumber)) {
//             document.getElementById('payment-status').innerHTML = '<p style="color: red;">Invalid Bank Account Number.</p>';
//             return;
//         }

//         // Expiry date validation (basic)
//         if (!expiryDate) {
//             document.getElementById('payment-status').innerHTML = '<p style="color: red;">Expiry Date is required.</p>';
//             return;
//         }

//         // CVV validation (3 or 4 digits)
//         const cvvRegex = /^\d{3,4}$/;
//         if (!cvvRegex.test(cvv)) {
//             document.getElementById('payment-status').innerHTML = '<p style="color: red;">Invalid CVV.</p>';
//             return;
//         }

//         // Card name validation (basic)
//         if (!cardName) {
//             document.getElementById('payment-status').innerHTML = '<p style="color: red;">Card Name is required.</p>';
//             return;
//         }

//         const formData = new FormData(this);

//         fetch('process_payment.php', {
//             method: 'POST',
//             body: formData
//         })
//         .then(response => response.json())
//         .then(data => {
//             const paymentStatusDiv = document.getElementById('payment-status');
//             if (data.success) {
//                 paymentStatusDiv.innerHTML = '<p style="color: green;">' + data.message + '</p>';
//             } else {
//                 paymentStatusDiv.innerHTML = '<p style="color: red;">' + data.message + '</p>';
//             }
//         })
//         .catch(error => {
//             console.error('Error:', error);
//             document.getElementById('payment-status').innerHTML = '<p style="color: red;">An error occurred.</p>';
//         });
//     });
// });