<%@page import="java.util.List"%>
<%@page import="com.techno4.viridi.entities.Product"%>
<%@page import="com.techno4.viridi.entities.PriceRequest"%>
<%@page import="com.techno4.viridi.entities.PriceRequest"%>
<%@page import="com.techno4.viridi.dao.PriceRequestDao"%>
<%@page import="com.techno4.viridi.helper.FactoryProvider"%>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
    <title>Price Requests Data</title>
    <link rel="icon" type="image/x-icon" href="img/logo.png">

    <%@include file="components/common_css_js.jsp" %>
    
</head>
<body>
    <%@include file="components/navbar.jsp" %>
    
    <div class="container mt-4">
        <h2>Price Request Details</h2>
        
        <div class="table-responsive">
            <table class="table table-bordered table-striped">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Product Name</th>
                        <th>Original Price</th>
                        <th>Requested Price</th>
                        <th>Request Date</th>
                        <th>Message</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        PriceRequestDao priceRequestDao = new PriceRequestDao(FactoryProvider.getFactory());
                        List<PriceRequest> requests = priceRequestDao.getAllPriceRequests();
                        
                        for(PriceRequest req : requests) {
                            Product product = req.getProduct();
                    %>
                        <tr>
                            <td><%= req.getId() %></td>
                            <td>
                                <% if(product != null) { %>
                                    <%= product.getpName() %>
                                <% } else { %>
                                    Product Not Found
                                <% } %>
                            </td>
                            <td>
                                <% if(product != null) { %>
                                    $<%= product.getpPrice() %>
                                <% } else { %>
                                    N/A
                                <% } %>
                            </td>
                            <td>$<%= req.getRequestedPrice() %></td>
                          
                            <td>
                                <%= new SimpleDateFormat("dd-MM-yyyy HH:mm").format(req.getRequestDate()) %>
                            </td>
                            <td><%= req.getMessage() != null ? req.getMessage() : "No message" %></td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>