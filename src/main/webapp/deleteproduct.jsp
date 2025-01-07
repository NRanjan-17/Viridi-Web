<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Under Maintenance</title>

        <!-- Bootstrap 4 CSS for styling -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

        <style>
            .container {
                margin-top: 100px;
                text-align: center;
            }
            .alert {
                font-size: 1.5rem;
                font-weight: 500;
            }
            .alert-heading {
                font-size: 2rem;
                font-weight: 700;
            }
            .btn {
                padding: 10px 20px;
                font-size: 1.2rem;
                text-transform: uppercase;
            }
            .btn-secondary {
                background-color: #6c757d;
                border-color: #6c757d;
            }
            .btn-secondary:hover {
                background-color: #5a6268;
                border-color: #545b62;
            }
        </style>
    </head>
    <body>

        <div class="container">
            <!-- Maintenance Message -->
            <div class="alert alert-warning">
                <h4 class="alert-heading">We Are Under Maintenance</h4>
                <p>Sorry, this page is currently being worked on. We are making improvements to enhance your experience.</p>
                <hr>
                <p class="mb-0">Please check back later. We appreciate your patience!</p>
            </div>

            <!-- Button to redirect the user back -->
            <a href="farmerProductManagement.jsp" class="btn btn-secondary mt-4">Return to Product Management</a>
        </div>

        <!-- Optional: Bootstrap JS and dependencies -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.3/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    </body>
</html>
