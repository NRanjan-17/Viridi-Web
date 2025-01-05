<%@page import="com.techno4.viridi.entities.User"%>
<%
    User user1 = (User) session.getAttribute("current-user");
%>

<nav class="navbar navbar-expand-lg navbar-dark custom-bg">
    <div class="container">
        <span class="navbar-brand" style="font-weight: 800; font-size: 28px;">VIRIDI</span>
        
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <!-- Left aligned items -->
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" style="font-weight: 400; font-size: 18px;" href="admin.jsp">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" style="font-weight: 400; font-size: 18px;" href="about.jsp">About</a>
                </li>
                <% if (user1 != null) { %>
                <li class="nav-item active">
                    <a class="nav-link" href="index.jsp">Products</a>
                </li>
                <% } %>
            </ul>

            <!-- Right aligned items -->
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="#!" data-toggle="modal" data-target="#cart">  
                        <i class="fa fa-shopping-cart" style="font-size: 18px;"></i> 
                        <span class="ml-0 cart-items">( 0 )</span>  
                    </a>
                </li>
                <% if (user1 == null) { %>
                <li class="nav-item active">
                    <a class="nav-link" style="font-weight: 400; font-size: 18px;" href="login.jsp">Login</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" style="font-weight: 400; font-size: 18px;" href="register.jsp">Register</a>
                </li>
                <% } else { %>
                <li class="nav-item active">
                    <a class="nav-link" href="<%= user1.getUserType().equals("admin") ? "admin.jsp" : "normal.jsp" %>">
                        <%= user1.getUserName() %>
                    </a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="LogoutServlet">Logout</a>
                </li>
                <% } %>
            </ul>
        </div>
    </div>
</nav>