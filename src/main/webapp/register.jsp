<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>New User - Sign Up</title>

    <%@include file="components/common_css_js.jsp" %>
    <style>
        /* Custom Styling */
        .card {
            border: 1px solid #e0e0e0;
            border-radius: 12px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }

        .card-body {
            padding: 30px;
        }

        .card-title {
            font-size: 1.5rem;
            font-weight: bold;
            color: #333;
        }

        .form-control {
            border-radius: 8px;
            padding: 12px 15px;
            margin-bottom: 15px;
        }

        .btn {
            border-radius: 8px;
            padding: 10px 20px;
        }

        .btn-outline-success {
            background-color: #28a745;
            color: white;
            border: 1px solid #28a745;
        }

        .btn-outline-success:hover {
            background-color: #218838;
        }

        .btn-outline-warning {
            background-color: #ffc107;
            color: white;
            border: 1px solid #ffc107;
        }

        .btn-outline-warning:hover {
            background-color: #e0a800;
        }

        .form-group label {
            font-weight: bold;
            color: #555;
        }

        .form-group input, .form-group textarea {
            font-size: 1rem;
        }

        .logo-container img {
            width: 120px;
            height: auto;
            margin-bottom: 20px;
        }

        .footer-links a {
            color: #007bff;
            text-decoration: none;
            font-size: 0.9rem;
        }

        .footer-links a:hover {
            text-decoration: underline;
        }

        @media (max-width: 576px) {
            .card {
                margin: 20px;
            }

            .form-control {
                font-size: 0.9rem;
            }

            .btn {
                font-size: 0.9rem;
                width: 100%;
            }
        }
    </style>
</head>
<body>

    <%@include file="components/navbar.jsp" %>

    <div class="container-fluid">
        <div class="row justify-content-center mt-5">
            <div class="col-md-6 col-lg-4">

                <div class="card">
                    <%@include file="components/message.jsp" %>

                    <div class="card-body">
                        <!-- Logo -->
                        <div class="logo-container text-center">
                            <img src="img/fclogo2.png" alt="FarmConnect Logo">
                        </div>

                        <!-- Sign Up Form -->
                        <h3 class="card-title text-center">Sign up here!</h3>
                        <form action="RegisterServlet" method="post">

                            <div class="form-group">
                                <label for="name">User Name</label>
                                <input name="user_name" type="text" class="form-control" id="name" placeholder="Enter your name" value="${param.user_name}" required>
                            </div>

                            <div class="form-group">
                                <label for="email">User Email</label>
                                <input name="user_email" type="email" class="form-control" id="email" placeholder="Enter your email" value="${param.user_email}" required>
                            </div>

                            <div class="form-group">
                                <label for="password">Password</label>
                                <input name="user_password" type="password" class="form-control" id="password" placeholder="Enter your password" required>
                            </div>

                            <div class="form-group">
                                <label for="phone">Phone Number</label>
                                <input name="user_phone" type="tel" class="form-control" id="phone" placeholder="Enter your phone number" value="${param.user_phone}" required>
                            </div>

                            <div class="form-group">
                                <label for="address">Address</label>
                                <textarea name="user_address" class="form-control" id="address" placeholder="Enter your address" style="height: 120px;" required>${param.user_address}</textarea>
                            </div>

                            <!-- Submit and Reset Buttons -->
                            <div class="text-center">
                                <button type="submit" class="btn btn-outline-success">Register</button>
                                <button type="reset" class="btn btn-outline-warning">Reset</button>
                            </div>
                        </form>

                        <!-- Footer Links -->
                        <div class="text-center mt-3 footer-links">
                            <p>Already have an account? <a href="login.jsp">Login here</a></p>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <%@include file="components/common_modals.jsp" %>

</body>
</html>
