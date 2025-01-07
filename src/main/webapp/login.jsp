<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Login - VIRIDI</title>
    <link rel="icon" type="image/x-icon" href="img/logo.png">

    <%@include file="components/common_css_js.jsp" %>

    <style>
        /* Background gradient for aesthetic look */
        body {
            background: url('img/background.jpg') no-repeat center center fixed; /* Use a cool background image */
            background-size: cover; /* Cover the entire viewport */
            height: 100vh;
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        /* Styling for the login card */
        .card {
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            background: white;
            width: 100%;
            max-width: 450px;
            padding: 30px;
            text-align: center;
            transition: box-shadow 0.3s ease;
            margin-top: 50px; /* Add margin to separate from navbar */
        }

        .card:hover {
            box-shadow: 0px 15px 50px rgba(0, 0, 0, 0.2);
        }

        /* Card header with custom background */
        .card-header {
            background-color: #28a745;
            color: white;
            font-size: 1.5rem;
            padding: 15px;
            border-radius: 10px;
            text-align: center;
        }

        /* Logo at the top of the card */
        .card-logo img {
            width: 120px;
            margin-bottom: 20px;
        }

        /* Input field and button design */
        .form-control, .btn-primary, .btn-outline-primary {
            border-radius: 25px;
            padding: 15px;
            font-size: 1.1rem;
            transition: 0.3s ease;
        }

        /* Focus effect on inputs */
        .form-control:focus {
            border-color: #28a745;
            box-shadow: 0 0 10px rgba(40, 167, 69, 0.5);
        }

        .btn-primary {
            background-color: #28a745;
            color: white;
            border: none;
        }

        .btn-primary:hover {
            background-color: #218838;
            transform: scale(1.05);
        }

        .btn-outline-primary {
            border: 2px solid #28a745;
            color: #28a745;
        }

        .btn-outline-primary:hover {
            background-color: #28a745;
            color: white;
        }

        /* Link styling for registration */
        .link-text {
            font-size: 1rem;
            color: #007bff;
            text-decoration: none;
            margin-top: 20px;
            display: block;
        }

        .link-text:hover {
            text-decoration: underline;
        }

        /* Message area styling */
        .message {
            color: #dc3545;
            margin-bottom: 15px;
            font-size: 0.95rem;
        }

        /* Responsive design for mobile screens */
        @media (max-width: 576px) {
            .card {
                padding: 20px;
                width: 90%;
            }

            .form-control, .btn-primary {
                font-size: 1rem;
            }

            .card-header {
                font-size: 1.25rem;
            }
        }
    </style>
</head>
<body>

    <%@include file="components/navbar.jsp" %> <!-- Navbar included at the top -->

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">

                <div class="card">

                    <!-- Logo at the top -->
                    <div class="card-logo">
                        <img src="img/logo.png" alt="Green Technology MarketPlace Logo">
                    </div>

                    <!-- Card Header -->
                    <div class="card-header">
                        <h3>Login Here</h3>
                    </div>

                    <!-- Card Body -->
                    <div class="card-body">
                        <%@include file="components/message.jsp" %>

                        <form action="LoginServlet" method="post">
                            <!-- Phone Input -->
                            <div class="form-group">
                                <label for="phone">Mobile Number</label>
                                <input name="phone" type="tel" class="form-control" id="phone" placeholder="Enter your mobile number" required>
                                <small id="phoneHelp" class="form-text text-muted">Welcome Back 😊</small>
                            </div>

                            <!-- Password Input -->
                            <div class="form-group">
                                <label for="password">Password</label>
                                <input name="password" type="password" class="form-control" id="password" placeholder="Enter your password" required>
                            </div>

                            <!-- Registration Link -->
                            <a href="register.jsp" class="link-text">If not registered, click here</a>

                            <!-- Buttons -->
                            <div class="text-center mt-3">
                                <button type="submit" class="btn btn-primary">
                                    <i class="fas fa-sign-in-alt"></i> Login
                                </button>
                                <button type="reset" class="btn btn-outline-primary">
                                    <i class="fas fa-undo"></i> Reset
                                </button>
                            </div>
                        </form>

                    </div>

                </div>

            </div>
        </div>
    </div>

</body>
</html>
