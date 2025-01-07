<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.techno4.viridi.helper.Helper"%>
<%@page import="com.techno4.viridi.entities.Category"%>
<%@page import="com.techno4.viridi.dao.CategoryDao"%>
<%@page import="com.techno4.viridi.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.techno4.viridi.dao.ProductDao"%>
<%@page import="com.techno4.viridi.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Viridi - Home</title>
    <%@include file="components/common_css_js.jsp" %>
        <link rel="icon" type="image/x-icon" href="img/logo.png">

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
</head>
<body>

<%@include file="components/navbar.jsp" %>

<div class="container-fluid">
    <div class="row mt-3 mx-2">

        <% 
            String cat = request.getParameter("category");
            ProductDao dao = new ProductDao(FactoryProvider.getFactory());
            List<Product> list = null;

            if (cat == null || cat.trim().equals("all")) {
                list = dao.getAllProducts();
            } else {
                int cid = Integer.parseInt(cat.trim());
                list = dao.getAllProductsById(cid);
            }

            CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
            List<Category> clist = cdao.getCategories();
        %>

        <!-- Show categories -->
        <div class="col-md-2">
            <div class="list-group mt-4">
                <a href="index.jsp?category=all" class="list-group-item list-group-item-action active">All Products</a>
                <% for (Category c : clist) { %>
                    <a href="index.jsp?category=<%= c.getCategoryId() %>" class="list-group-item list-group-item-action"><%= c.getCategoryTitle() %></a>
                <% } %>
            </div>
        </div>

        <!-- Show products -->
        <div class="col-md-10">
            <div class="row mt-4">
                <div class="col-md-12">
                    <div class="card-columns">
                        <% for (Product p : list) { %>
                            <!-- Product card -->
                            <div class="card product-card">
                                <div class="container text-center">
                                    <img src="img/products/<%= p.getpPhoto() %>" style="max-height: 200px; max-width: 100%; width: auto;" class="card-img-top m-2" alt="...">
                                </div>
                                <div class="card-body">
                                    <h5 class="card-title"><%= p.getpName() %></h5>
                                    <p class="card-text"><%= Helper.get10Words(p.getpDesc()) %></p>
                                </div>
                                <div class="card-footer text-center">
                                    <button class="btn custom-bg text-white" onclick="add_to_cart(<%= p.getpId() %>, '<%= p.getpName() %>', <%= p.getPriceAfterApplyingDiscount() %>)">Add to Cart</button>
                                    <button class="btn btn-outline-success"> &#8377; <%= p.getPriceAfterApplyingDiscount() %>/- <span class="text-secondary discount-label"> &#8377; <%= p.getpPrice() %> , <%= p.getpDiscount() %>% off </span> </button>
                                    <button class="btn btn-warning" onclick="openPriceRequestModal(<%= p.getpId() %>, <%= p.getpPrice() %>)">Request Lower Price</button>
                                </div>
                            </div>
                        <% } %>

                        <% if (list.size() == 0) { %>
                            <h3>No item in this category</h3>
                        <% } %>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Price Request Modal -->
<div class="modal fade" id="priceRequestModal" tabindex="-1" role="dialog" aria-labelledby="priceRequestModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document ```jsp
    ">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="priceRequestModalLabel">Request Special Price</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="PriceRequestServlet" method="post">
                    <input type="hidden" name="operation" value="submitRequest">
                    <input type="hidden" name="productId" id="productId" value="">
                    <div class="form-group">
                        <label id="currentPriceLabel">Current Price: ₹</label>
                    </div>
                    <div class="form-group">
                        <label for="requestedPrice">Your Requested Price:</label>
                        <input type="number" class="form-control" name="requestedPrice" required min="1" step="0.01">
                    </div>
                    <div class="form-group">
                        <label for="message">Message to Farmer (Optional):</label>
                        <textarea class="form-control" name="message" rows="3" placeholder="Explain why you're requesting this price..."></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary">Submit Request</button>
                </form>
            </div>
        </div>
    </div>
</div>

<%@include file="components/common_modals.jsp" %>

<script>
    function openPriceRequestModal(productId, currentPrice) {
        document.getElementById('productId').value = productId;
        document.getElementById('currentPriceLabel').innerText = "Current Price: ₹" + currentPrice;
        $('#priceRequestModal').modal('show');
    }
</script>

</body>
</html>