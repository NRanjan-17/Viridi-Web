package com.techno4.viridi.servlets;

import com.techno4.viridi.dao.CategoryDao;
import com.techno4.viridi.dao.ProductDao;
import com.techno4.viridi.entities.Category;
import com.techno4.viridi.entities.Product;
import com.techno4.viridi.helper.FactoryProvider;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@MultipartConfig
public class ProductOperationServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String op = request.getParameter("operation");

            if (op == null) {
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message", "Error: Operation not specified");
                response.sendRedirect("admin.jsp");
                return;
            }

            if (op.trim().equals("addcategory")) {
                // Add category
                String title = request.getParameter("catTitle");
                String description = request.getParameter("catDescription");

                if (title == null || title.trim().isEmpty()) {
                    HttpSession httpSession = request.getSession();
                    httpSession.setAttribute("message", "Category title cannot be empty");
                    response.sendRedirect("admin.jsp");
                    return;
                }

                Category category = new Category();
                category.setCategoryTitle(title);
                category.setCategoryDescription(description);

                CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
                int catId = categoryDao.saveCategory(category);

                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message", "Category added successfully : " + catId);
                response.sendRedirect("admin.jsp");
                return;

            } else if (op.trim().equals("addproduct")) {
                // Add product
                try {
                    String pName = request.getParameter("pName");
                    String pDesc = request.getParameter("pDesc");
                    int pPrice = Integer.parseInt(request.getParameter("pPrice"));
                    int pDiscount = Integer.parseInt(request.getParameter("pDiscount"));
                    int pQuantity = Integer.parseInt(request.getParameter("pQuantity"));
                    int catId = Integer.parseInt(request.getParameter("catId"));
                    Part part = request.getPart("pPic");

                    Product p = new Product();
                    p.setpName(pName);
                    p.setpDesc(pDesc);
                    p.setpPrice(pPrice);
                    p.setpDiscount(pDiscount);
                    p.setpQuantity(pQuantity);
                    p.setpPhoto(part.getSubmittedFileName());

                    CategoryDao cdoa = new CategoryDao(FactoryProvider.getFactory());
                    Category category = cdoa.getCategoryById(catId);
                    p.setCategory(category);

                    ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
                    pdao.saveProduct(p);

                    // File upload handling
                    String uploadPath = request.getServletContext().getRealPath("") + "img" + File.separator + "products";
                    Path uploadDir = Paths.get(uploadPath);
                    
                    // Create directories if they don't exist
                    if (!Files.exists(uploadDir)) {
                        Files.createDirectories(uploadDir);
                    }

                    String fileName = part.getSubmittedFileName();
                    String filePath = uploadPath + File.separator + fileName;

                    try (FileOutputStream fos = new FileOutputStream(filePath);
                         InputStream is = part.getInputStream()) {
                        
                        byte[] data = new byte[is.available()];
                        is.read(data);
                        fos.write(data);
                    }

                    HttpSession httpSession = request.getSession();
                    httpSession.setAttribute("message", "Product is added successfully..");
                    response.sendRedirect("admin.jsp");
                    
                } catch (NumberFormatException e) {
                    HttpSession httpSession = request.getSession();
                    httpSession.setAttribute("message", "Error: Invalid number format in product details");
                    response.sendRedirect("admin.jsp");
                } catch (Exception e) {
                    HttpSession httpSession = request.getSession();
                    httpSession.setAttribute("message", "Error: " + e.getMessage());
                    response.sendRedirect("admin.jsp");
                }
                return;
            }
           
    else if (op.trim().equals("updateproduct")) {
    try {
        int productId = Integer.parseInt(request.getParameter("id"));
        String pName = request.getParameter("pName");
        String pDesc = request.getParameter("pDesc");
        int pPrice = Integer.parseInt(request.getParameter("pPrice"));
        int pDiscount = Integer.parseInt(request.getParameter("pDiscount"));
        int pQuantity = Integer.parseInt(request.getParameter("pQuantity"));
        Part part = request.getPart("pPic");

        ProductDao productDao = new ProductDao(FactoryProvider.getFactory());
        Product product = productDao.getProductById(productId);
        
        if (product == null) {
            throw new Exception("Product not found");
        }

        // Update basic product details
        product.setpName(pName);
        product.setpDesc(pDesc);
        product.setpPrice(pPrice);
        product.setpDiscount(pDiscount);
        product.setpQuantity(pQuantity);

        // Handle image upload only if a new image is provided
        if (part != null && part.getSize() > 0) {
            String fileName = part.getSubmittedFileName();
            if (fileName != null && !fileName.trim().isEmpty()) {
                String uploadPath = request.getServletContext().getRealPath("") + "img" + File.separator + "products";
                
                // Create directories if they don't exist
                Files.createDirectories(Paths.get(uploadPath));

                // Delete old image if it exists
                if (product.getpPhoto() != null) {
                    File oldFile = new File(uploadPath + File.separator + product.getpPhoto());
                    if (oldFile.exists()) {
                        oldFile.delete();
                    }
                }

                // Save new image
                try (FileOutputStream fos = new FileOutputStream(uploadPath + File.separator + fileName);
                     InputStream is = part.getInputStream()) {
                    byte[] data = new byte[is.available()];
                    is.read(data);
                    fos.write(data);
                }
                
                product.setpPhoto(fileName);
            }
        }

        // Update the product in the database
        boolean updated = productDao.updateProduct(product);
        
        HttpSession httpSession = request.getSession();
        if (updated) {
            httpSession.setAttribute("message", "Product updated successfully!");
        } else {
            httpSession.setAttribute("message", "Failed to update product.");
        }
        response.sendRedirect("farmerProductManagement.jsp");
        
    } catch (NumberFormatException e) {
        HttpSession httpSession = request.getSession();
        httpSession.setAttribute("message", "Error: Invalid number format in product details");
        response.sendRedirect("editProduct.jsp?id=" + request.getParameter("id"));
    } catch (Exception e) {
        HttpSession httpSession = request.getSession();
        httpSession.setAttribute("message", "Error: " + e.getMessage());
        response.sendRedirect("editProduct.jsp?id=" + request.getParameter("id"));
    }
    return;
}
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Product Operations Servlet";
    }
}