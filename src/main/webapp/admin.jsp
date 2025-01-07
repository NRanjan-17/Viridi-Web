
<%@page import="com.techno4.viridi.entities.*"%>
<%@page import="com.techno4.viridi.dao.*"%>
<%@page import="com.techno4.viridi.helper.FactoryProvider"%>
<%@page import="java.util.List"%>

<%
    // Authentication Check
    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("message", "You are not logged in !! Login first");
        response.sendRedirect("login.jsp");
        return;
    } else if (!user.getUserType().equals("admin")) {
        session.setAttribute("message", "You are not admin ! Do not access this page");
        response.sendRedirect("login.jsp");
        return;
    }

    // Initialize DAOs and fetch statistics
    UserDao userDao = new UserDao(FactoryProvider.getFactory());
    CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
    ProductDao productDao = new ProductDao(FactoryProvider.getFactory());

    long userCount = userDao.getUserCount();
    long categoryCount = categoryDao.getCategoryCount();
    long productCount = productDao.getProductCount();
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
        <link rel="icon" type="image/x-icon" href="img/logo.png">

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - VIRIDI</title>
    
    <%@include file="components/common_css_js.jsp" %>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    
    <style>
        :root {
            --primary-color: #2563eb;
            --success-color: #16a34a;
            --warning-color: #eab308;
            --danger-color: #dc2626;
            --info-color: #0891b2;
        }

        body {
            background-color: #f1f5f9;
            font-family: 'Segoe UI', system-ui, -apple-system, sans-serif;
        }

        /* Dashboard Cards */
        .stat-card {
            background: white;
            padding: 2rem;
            border-radius: 1rem;
            box-shadow: 0 4px 6px -1px rgb(0 0 0 / 0.1);
            transition: all 0.3s ease;
            margin-bottom: 1.5rem;
            border: 1px solid rgba(0, 0, 0, 0.05);
        }

        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 15px -3px rgb(0 0 0 / 0.1);
        }

        .stat-card .number {
            font-size: 2.5rem;
            font-weight: 700;
            color: #1e293b;
            line-height: 1;
            margin-bottom: 0.5rem;
        }

        .stat-card .label {
            font-size: 1.1rem;
            color: #64748b;
        }

        .stat-card i {
            font-size: 2rem;
            opacity: 0.9;
        }

        /* Action Cards */
        .action-card {
            background: white;
            padding: 2rem;
            border-radius: 1rem;
            box-shadow: 0 4px 6px -1px rgb(0 0 0 / 0.1);
            transition: all 0.3s ease;
            cursor: pointer;
            height: 100%;
            border: 1px solid rgba(0, 0, 0, 0.05);
        }

        .action-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 15px -3px rgb(0 0 0 / 0.1);
        }

        .action-card h4 {
            font-size: 1.5rem;
            font-weight: 600;
            margin-bottom: 1rem;
        }

        .action-card p {
            color: #64748b;
            font-size: 1.1rem;
            line-height: 1.5;
        }

        .action-card i {
            font-size: 2rem;
            transition: transform 0.2s;
        }

        .action-card:hover i {
            transform: scale(1.1);
        }

        /* Modal Styling */
        .modal-content {
            border: none;
            border-radius: 1rem;
            box-shadow: 0 20px 25px -5px rgb(0 0 0 / 0.1);
        }

        .modal-header {
            padding: 1.5rem;
            border-top-left-radius: 1rem;
            border-top-right-radius: 1rem;
        }

        .modal-body {
            padding: 2rem;
        }

        .form-control {
            padding: 0.75rem 1rem;
            border-radius: 0.5rem;
            border: 1px solid #e2e8f0;
            transition: all 0.2s;
        }

        .form-control:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.1);
        }

        .btn {
            padding: 0.75rem 1.5rem;
            border-radius: 0.5rem;
            font-weight: 500;
            transition: all 0.2s;
        }

        .btn:hover {
            transform: translateY(-1px);
        }

        /* Dashboard Header */
        .dashboard-header {
            margin-bottom: 2rem;
        }

        .dashboard-header h2 {
            font-size: 2.5rem;
            font-weight: 700;
            color: #1e293b;
            margin-bottom: 0.5rem;
        }

        .dashboard-header p {
            font-size: 1.1rem;
            color: #64748b;
        }

        /* Responsive Adjustments */
        @media (max-width: 768px) {
            .stat-card {
                margin-bottom: 1rem;
            }
            
            .action-card {
                margin-bottom: 1rem;
            }

            .dashboard-header h2 {
                font-size: 2rem;
            }
        }
    </style>
</head>

<body>
    <%@include file="components/navbar.jsp" %>
    
    <div class="container py-5">
        <!-- Dashboard Header -->
        <div class="dashboard-header">
            <h2>Admin Dashboard</h2>
            <p>Welcome back, <%= user.getUserName() %>! Here's your overview.</p>
        </div>

        <!-- Statistics Cards -->
        <div class="row mb-4">
            <!-- Users Stats -->
            <div class="col-md-4">
                <div class="stat-card">
                    <div class="d-flex justify-content-between align-items-center">
                        <div>
                            <div class="number"><%= userCount %></div>
                            <div class="label">Total Users</div>
                        </div>
                        <i class="fas fa-users text-primary"></i>
                    </div>
                </div>
            </div>

            <!-- Categories Stats -->
            <div class="col-md-4">
                <div class="stat-card">
                    <div class="d-flex justify-content-between align-items-center">
                        <div>
                            <div class="number"><%= categoryCount %></div>
                            <div class="label">Categories</div>
                        </div>
                        <i class="fas fa-th-list text-success"></i>
                    </div>
                </div>
            </div>

            <!-- Products Stats -->
            <div class="col-md-4">
                <div class="stat-card">
                    <div class="d-flex justify-content-between align-items-center">
                        <div>
                            <div class="number"><%= productCount %></div>
                            <div class="label">Products</div>
                        </div>
                        <i class="fas fa-box text-warning"></i>
                    </div>
                </div>
            </div>
        </div>

        <!-- Action Cards -->
        <div class="row mb-4">
            <!-- Add Category Card -->
            <div class="col-md-6 mb-4">
                <div class="action-card" data-toggle="modal" data-target="#add-category-modal">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h4 class="text-primary">Add Category</h4>
                        <i class="fas fa-folder-plus text-primary"></i>
                    </div>
                    <p>Create new product categories to organize your inventory effectively.</p>
                </div>
            </div>

            <!-- Add Product Card -->
            <div class="col-md-6 mb-4">
                <div class="action-card" data-toggle="modal" data-target="#add-product-modal">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h4 class="text-success">Add Product</h4>
                        <i class="fas fa-plus-square text-success"></i>
                    </div>
                    <p>Add new products to your inventory with detailed information.</p>
                </div>
            </div>
        </div>

        <!-- Management Cards -->
        <div class="row">
            <!-- Product Management Card -->
            <div class="col-md-6 mb-4">
                <div class="action-card">
                    <a href="farmerProductManagement.jsp" class="text-decoration-none">
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <h4 class="text-info">Manage Products</h4>
                            <i class="fas fa-eye text-info"></i>
                        </div>
                        <p class="text-muted">View and manage your product inventory in one place.</p>
                    </a>
                </div>
            </div>

            <!-- Customer Responses Card -->
            <div class="col-md-6 mb-4">
                <div class="action-card">
                    <a href="FarmerRequest.jsp" class="text-decoration-none">
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <h4 class="text-danger">Customer Responses</h4>
                            <i class="fas fa-comments text-danger"></i>
                        </div>
                        <p class="text-muted">Handle customer inquiries and price negotiations.</p>
                    </a>
                </div>
            </div>
        </div>
    </div>

    <!-- Add Category Modal -->
    <div class="modal fade" id="add-category-modal" tabindex="-1">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header bg-primary text-white">
                    <h5 class="modal-title">Add New Category</h5>
                    <button type="button" class="close text-white" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <form action="ProductOperationServlet" method="post">
                        <input type="hidden" name="operation" value="addcategory">
                        <div class="form-group mb-3">
                            <input type="text" class="form-control" name="catTitle" placeholder="Category Title" required>
                        </div>
                        <div class="form-group mb-4">
                            <textarea class="form-control" name="catDescription" rows="5" placeholder="Category Description" required></textarea>
                        </div>
                        <div class="text-end">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                            <button type="submit" class="btn btn-primary ms-2">Add Category</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Add Product Modal -->
    <div class="modal fade" id="add-product-modal" tabindex="-1">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header bg-success text-white">
                    <h5 class="modal-title">Add New Product</h5>
                    <button type="button" class="close text-white" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="operation" value="addproduct">
                        <div class="form-group mb-3">
                            <input type="text" class="form-control" name="pName" placeholder="Product Title" required>
                        </div>
                        <div class="form-group mb-3">
                            <textarea class="form-control" name="pDesc" rows="3" placeholder="Product Description"></textarea>
                        </div>
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <input type="number" class="form-control" name="pPrice" placeholder="Price" required>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <input type="number" class="form-control" name="pDiscount" placeholder="Discount %" required>
                                </div>
                            </div>
                        </div>
                        <div class="form-group mb-3">
                            <input type="number" class="form-control" name="pQuantity" placeholder="Quantity" required>
                        </div>
                        <div class="form-group mb-3">
                            <select name="catId" class="form-control">
                                <% 
                                    List<Category> list = categoryDao.getCategories();
                                    for(Category c : list) {
                                %>
                                <option value="<%= c.getCategoryId()%>"><%= c.getCategoryTitle()%></option>
                                <% } %>
                            </select>
                        </div>
                        <div class="form-group mb-4">
                            <label class="form-label">Product Image</label>
                            <input type="file" class="form-control" name="pPic" required>
                        </div>
                        <div class="text-end">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                            <button type="submit" class="btn btn-success ms-2">Add Product</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <%@include file="components/common_modals.jsp" %>
</body>
</html>