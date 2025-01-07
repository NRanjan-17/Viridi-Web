<%@ page import="com.techno4.viridi.entities.Product"%>
<%@ page import="com.techno4.viridi.dao.ProductDao"%>
<%@ page import="com.techno4.viridi.helper.FactoryProvider"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Edit Product</title>
        <link rel="icon" type="image/x-icon" href="img/logo.png">

    <%@include file="components/common_css_js.jsp" %>
</head>
<body>
    <%@include file="components/navbar.jsp" %>
    
    <div class="container mt-4">
        <%-- Message display --%>
        <% String message = (String) session.getAttribute("message");
           if (message != null) { %>
            <div class="alert alert-info alert-dismissible fade show" role="alert">
                <%= message %>
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
        <% session.removeAttribute("message");
           } %>

        <%
            String idParam = request.getParameter("id");
            if (idParam == null || idParam.trim().isEmpty()) {
                out.println("<div class='alert alert-danger'>Error: Product ID is missing.</div>");
                return;
            }

            int productId;
            try {
                productId = Integer.parseInt(idParam);
            } catch (NumberFormatException e) {
                out.println("<div class='alert alert-danger'>Error: Invalid Product ID format.</div>");
                return;
            }
            
            ProductDao productDao = new ProductDao(FactoryProvider.getFactory());
            Product product = productDao.getProductById(productId);
            
            if (product == null) {
                out.println("<div class='alert alert-danger'>Error: Product not found.</div>");
                return;
            }
        %>

        <div class="card">
            <div class="card-header">
                <h2>Edit Product</h2>
            </div>
            <div class="card-body">
                <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="operation" value="updateproduct">
                    <input type="hidden" name="id" value="<%= product.getpId() %>"/>
                    
                    <div class="form-group">
                        <label for="name">Product Name:</label>
                        <input type="text" class="form-control" id="name" name="pName" 
                               value="<%= product.getpName() %>" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="description">Description:</label>
                        <textarea class="form-control" id="description" name="pDesc" 
                                  rows="3" required><%= product.getpDesc() %></textarea>
                    </div>
                    
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="price">Price:</label>
                                <input type="number" class="form-control" id="price" 
                                       name="pPrice" value="<%= product.getpPrice() %>" required>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="discount">Discount (%):</label>
                                <input type="number" class="form-control" id="discount" 
                                       name="pDiscount" value="<%= product.getpDiscount() %>" required>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="quantity">Quantity:</label>
                                <input type="number" class="form-control" id="quantity" 
                                       name="pQuantity" value="<%= product.getpQuantity() %>" required>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label>Current Image:</label>
                        <img src="img/products/<%= product.getpPhoto() %>" 
                             style="max-width: 100px; display: block; margin: 10px 0;">
                        <label for="pPic">Update Image (optional):</label>
                        <input type="file" class="form-control-file" id="pPic" name="pPic">
                    </div>

                    <div class="text-center">
                        <a href="farmerProductManagement.jsp" class="btn btn-secondary mr-2">Cancel</a>
                        <button type="submit" class="btn btn-primary">Update Product</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>