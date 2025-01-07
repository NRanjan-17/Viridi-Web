package com.techno4.viridi.servlets;

import com.techno4.viridi.entities.PriceRequest;
import com.techno4.viridi.entities.User;
import com.techno4.viridi.entities.Product;
import com.techno4.viridi.dao.*;
import com.techno4.viridi.helper.FactoryProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.Date;

@WebServlet("/PriceRequestServlet")
public class PriceRequestServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
        String operation = request.getParameter("operation");
        HttpSession httpSession = request.getSession();
        
        if (operation.equals("submitRequest")) {
            // Handle new price request
            try {
                int productId = Integer.parseInt(request.getParameter("productId"));
                double requestedPrice = Double.parseDouble(request.getParameter("requestedPrice"));
                String message = request.getParameter("message");
                
                User user = (User) httpSession.getAttribute("current-user");
                if (user == null) {
                    httpSession.setAttribute("message", "Please login first");
                    response.sendRedirect("login.jsp");
                    return;
                }
                
                ProductDao productDao = new ProductDao(FactoryProvider.getFactory());
                Product product = productDao.getProductById(productId);
                
                PriceRequest priceRequest = new PriceRequest();
                priceRequest.setUser(user);
                priceRequest.setProduct(product);
                priceRequest.setRequestedPrice(requestedPrice);
                priceRequest.setMessage(message);
                
                PriceRequestDao priceRequestDao = new PriceRequestDao(FactoryProvider.getFactory());
                boolean saved = priceRequestDao.savePriceRequest(priceRequest);
                
                if (saved) {
                    httpSession.setAttribute("message", "Price request submitted successfully!");
                } else {
                    httpSession.setAttribute("message", "Failed to submit price request!");
                }
                response.sendRedirect("index.jsp?pid=" + productId);
                
            } catch (Exception e) {
                e.printStackTrace();
                httpSession.setAttribute("message", "Error: " + e.getMessage());
                response.sendRedirect("index.jsp");
            }
        } else if (operation.equals("respondRequest")) {
            // Handle farmer's response
            try {
                int requestId = Integer.parseInt(request.getParameter("requestId"));
                String status = request.getParameter("status");
                String farmerResponse = request.getParameter("farmerResponse");
                
                PriceRequestDao priceRequestDao = new PriceRequestDao(FactoryProvider.getFactory());
                PriceRequest priceRequest = priceRequestDao.getPriceRequestById(requestId);
                
                priceRequest.setStatus(status);
                priceRequest.setFarmerResponse(farmerResponse);
                priceRequest.setResponseDate(new Date());
                
                boolean updated = priceRequestDao.updatePriceRequest(priceRequest);
                
                if (updated) {
                    httpSession.setAttribute("message", "Response submitted successfully!");
                } else {
                    httpSession.setAttribute("message", "Failed to submit response!");
                }
                response.sendRedirect("farmer_requests.jsp");
                
            } catch (Exception e) {
                e.printStackTrace();
                httpSession.setAttribute("message", "Error: " + e.getMessage());
                response.sendRedirect("farmer_requests.jsp");
            }
        }
    }
}