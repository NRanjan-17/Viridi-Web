<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.techno4.viridi.entities.Product"%>
<%@page import="com.techno4.viridi.dao.ProductDao"%>
<%@page import="com.techno4.viridi.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Manage Your Products</title>
    <%@include file="components/common_css_js.jsp" %>
        <link rel="icon" type="image/x-icon" href="img/logo.png">

</head>
<body>

<%@include file="components/navbar.jsp" %>

<div class="container">
    <h2>Your Products</h2>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Description</th>
                <th>Price</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <%
                ProductDao productDao = new ProductDao(FactoryProvider.getFactory());
                List<Product> products = productDao.getAllProducts(); // You may want to filter by farmer ID

                for (Product product : products) {
            %>
            <tr>
                <td><%= product.getpId() %></td>
                <td><%= product.getpName() %></td>
                <td><%= product.getpDesc() %></td>
                <td>&#8377; <%= product.getPriceAfterApplyingDiscount() %></td>
                <td>
                    <a href="editProduct.jsp?id=<%= product.getpId() %>" class="btn btn-warning">Edit</a>
                    <a href="deleteproduct?id=<%= product.getpId() %>" class="btn btn-danger">Delete</a>
                </td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
</div>

</body>
</html>
