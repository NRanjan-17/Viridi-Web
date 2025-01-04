<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About FarmConnect</title>
    <%@include file="components/common_css_js.jsp" %>
    
    <style>
        /* Custom Styles */
        .hero-section {
            background-image: url('img/farmconnect-hero.jpg');
            background-size: cover;
            background-position: center;
            padding: 100px 0;
            color: white;
            text-align: center;
            border-bottom: 5px solid #28a745;
        }

        .hero-section h1 {
            font-size: 3rem;
            font-weight: bold;
        }

        .hero-section p {
            font-size: 1.25rem;
        }

        .section-title {
            font-size: 2rem;
            font-weight: bold;
            margin-top: 40px;
            color: #007bff;
        }

        .card-body {
            padding: 30px;
            color: #333;
        }

        .icon-box {
            font-size: 3rem;
            color: #28a745;
            text-align: center;
            margin-bottom: 20px;
        }

        .feature-list {
            list-style-type: none;
            padding: 0;
        }

        .feature-list li {
            font-size: 1.1rem;
            margin: 10px 0;
        }

        .feature-list li i {
            margin-right: 10px;
            color: #007bff;
        }

        .testimonial-section {
            background-color: #f8f9fa;
            padding: 50px 0;
            margin-top: 50px;
        }

        .testimonial {
            text-align: center;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 8px;
            margin: 20px;
        }

        .testimonial img {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            margin-bottom: 15px;
        }

        .cta-button {
            background-color: #28a745;
            color: white;
            font-size: 1.25rem;
            padding: 15px 30px;
            border: none;
            border-radius: 50px;
            text-align: center;
            display: block;
            margin: 40px auto;
            width: fit-content;
        }

        .cta-button:hover {
            background-color: #218838;
            text-decoration: none;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .hero-section h1 {
                font-size: 2.5rem;
            }

            .hero-section p {
                font-size: 1rem;
            }

            .testimonial-section {
                padding: 30px 0;
            }

            .cta-button {
                font-size: 1.1rem;
                padding: 12px 25px;
            }
        }
    </style>
</head>
<body>

    <%@include file="components/navbar.jsp" %>

    <!-- Hero Section -->
    <div class="hero-section">
        <h1>Welcome to FarmConnect</h1>
        <p>Bringing Farmers and Consumers Together for a Better Tomorrow</p>
    </div>

    <!-- Mission and Vision Section -->
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <h2 class="section-title">Our Mission</h2>
                <p>Our mission is to empower farmers by providing them with a platform where they can connect directly with consumers, offering fresh, quality produce with transparency and ease. We aim to make agriculture more efficient, sustainable, and accessible to all, ensuring a positive impact on both the environment and the economy.</p>
            </div>
            <div class="col-md-6">
                <h2 class="section-title">Our Vision</h2>
                <p>We envision a world where farmers and consumers work hand in hand, eliminating the barriers in the supply chain. By leveraging technology and providing a marketplace that promotes fairness and sustainability, we are creating a future where agriculture thrives in a modern, connected world.</p>
            </div>
        </div>
    </div>

    <!-- Key Features Section -->
    <div class="container">
        <h2 class="section-title text-center">Key Features</h2>
        <div class="row">
            <div class="col-md-4">
                <div class="icon-box">
                    <i class="fas fa-users"></i>
                </div>
                <h4 class="text-center">Farmer-Consumer Connection</h4>
                <p>FarmConnect bridges the gap between farmers and consumers, ensuring direct transactions without middlemen.</p>
            </div>
            <div class="col-md-4">
                <div class="icon-box">
                    <i class="fas fa-cogs"></i>
                </div>
                <h4 class="text-center">Seamless Technology</h4>
                <p>Our platform uses advanced technology to ensure smooth transactions, quick payments, and easy product browsing.</p>
            </div>
            <div class="col-md-4">
                <div class="icon-box">
                    <i class="fas fa-truck"></i>
                </div>
                <h4 class="text-center">Fast Delivery</h4>
                <p>FarmConnect ensures timely delivery of fresh produce, right from the farm to your doorstep.</p>
            </div>
        </div>
    </div>

    <!-- Impact Section (Infographic Style) -->
    <div class="container text-center">
        <h2 class="section-title">Our Impact</h2>
        <div class="row">
            <div class="col-md-3">
                <h3>100+</h3>
                <p>Farmers Empowered</p>
            </div>
            <div class="col-md-3">
                <h3>5000+</h3>
                <p>Happy Customers</p>
            </div>
            <div class="col-md-3">
                <h3>50+</h3>
                <p>Types of Produce</p>
            </div>
            <div class="col-md-3">
                <h3>24/7</h3>
                <p>Customer Support</p>
            </div>
        </div>
    </div>

    <!-- Testimonial Section -->
    <div class="testimonial-section">
        <h2 class="section-title text-center">What Our Users Say</h2>
        <div class="row">
            <div class="col-md-4">
                <div class="testimonial">
                    <img src="img/testimonial1.jpg" alt="Customer 1">
                    <p>"FarmConnect has made it so easy for me to purchase fresh, organic produce. Highly recommend!"</p>
                    <h5>- John Doe, Consumer</h5>
                </div>
            </div>
            <div class="col-md-4">
                <div class="testimonial">
                    <img src="img/testimonial2.jpg" alt="Farmer 1">
                    <p>"As a farmer, FarmConnect has given me the opportunity to directly connect with customers, ensuring better prices and faster sales."</p>
                    <h5>- Jane Smith, Farmer</h5>
                </div>
            </div>
            <div class="col-md-4">
                <div class="testimonial">
                    <img src="img/testimonial3.jpg" alt="Customer 2">
                    <p>"I love the convenience and freshness of the produce I get from FarmConnect. The delivery is always on time!"</p>
                    <h5>- Sarah Lee, Consumer</h5>
                </div>
            </div>
        </div>
    </div>

    <!-- Call to Action -->
    <div class="container">
        <a href="register.jsp" class="cta-button">Join FarmConnect Today</a>
    </div>

    <%@include file="components/common_modals.jsp" %>

</body>
</html>
