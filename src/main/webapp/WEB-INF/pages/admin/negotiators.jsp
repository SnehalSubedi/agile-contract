<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="java.util.*, com.agilecontract.Model.User, java.text.SimpleDateFormat" %>
        <% SimpleDateFormat dateFormat=new SimpleDateFormat("MMM dd, yyyy"); %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Agile Contracts - Negotiators</title>
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
                <link rel="stylesheet" href="css/sidebar.css">
                <link rel="stylesheet" href="css/admin-dashboard.css">
                <style>
                    .negotiators-table {
                        background: white;
                        border-radius: 8px;
                        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                        padding: 20px;
                        margin-top: 20px;
                    }

                    .action-buttons {
                        display: flex;
                        gap: 8px;
                    }

                    .btn-icon {
                        width: 32px;
                        height: 32px;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        border-radius: 50%;
                        color: white;
                        text-decoration: none;
                    }

                    .btn-view {
                        background-color: #4e73df;
                    }

                    .btn-edit {
                        background-color: #1cc88a;
                    }

                    .btn-delete {
                        background-color: #e74a3b;
                    }

                    .empty-state {
                        text-align: center;
                        padding: 40px 20px;
                    }

                    .empty-state i {
                        font-size: 48px;
                        color: #dddfeb;
                        margin-bottom: 20px;
                    }

                    .profile-pic {
                        width: 40px;
                        height: 40px;
                        border-radius: 50%;
                        object-fit: cover;
                        background-color: #f8f9fc;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        color: #4e73df;
                        font-weight: bold;
                    }
                </style>
            </head>

            <body>
                <div class="container">
                    <!-- Sidebar -->
                    <div class="sidebar">
                        <div class="sidebar-header">
                            <h1>Agile Contracts</h1>
                        </div>
                        <ul class="sidebar-nav">
                            <li><a href="<%= request.getContextPath() %>/"><i class="fas fa-home"></i> Home</a></li>
                            <li><a href="<%= request.getContextPath() %>/Admin-Dashboard"><i
                                        class="fas fa-th-large"></i> Dashboard</a></li>
                            <li><a href="<%= request.getContextPath() %>/Admin-Dashboard?action=viewContracts"><i
                                        class="fas fa-file-contract"></i> View Contracts</a></li>
                            <li><a href="<%= request.getContextPath() %>/AddContractServlet"><i
                                        class="fas fa-plus-circle"></i> Add Contract</a></li>
                            <li><a href="<%= request.getContextPath() %>/FetchAllNegotiator" class=""><i
                                        class="fas fa-user-tie"></i> Negotiators</a></li>
                            <li><a href="#"><i class="fas fa-chart-line"></i> Reports</a></li>
                        </ul>
                    </div>

                    <!-- Main Content -->
                    <div class="main-content">
                        <div class="header">
                            <div class="header-left">
                                <h1>Contract Negotiators</h1>
                                <p class="welcome-message">Manage all contract negotiators</p>
                            </div>
                            <div class="header-right">
                                <div class="search-box">
                                    <i class="fas fa-search"></i>
                                    <input type="text" id="negotiatorSearch" placeholder="Search negotiators..."
                                        onkeyup="searchNegotiators()">
                                </div>
                                <div class="user-profile">
                                    <img src="images/profile.png" alt="User Profile">
                                    <div class="user-info">
                                        <div class="name">
                                            <%= request.getAttribute("userName") !=null ?
                                                request.getAttribute("userName") : "Admin" %>
                                        </div>
                                        <div class="role">Contract Manager</div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Negotiators Table -->
                        <div class="negotiators-table">
                            <div class="table-header">
                                <h2>All Negotiators</h2>
                                <div class="table-actions">
                                    <a href="<%= request.getContextPath() %>/AddNegotiator" class="btn btn-primary">
                                        <i class="fas fa-plus"></i> Add Negotiator
                                    </a>
                                </div>
                            </div>

                            <table id="negotiatorsTable">
                                <thead>
                                    <tr>
                                        <th></th>
                                        <th>Name</th>
                                        <th>Email</th>
                                        <th>Contact</th>
                                        <th>Member Since</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% List<User> negotiators = (List<User>) request.getAttribute("negotiators");
                                            if (negotiators != null && !negotiators.isEmpty()) {
                                            for (User negotiator : negotiators) {
                                            %>
                                            <tr>
                                                <td>
                                                    <div class="profile-pic">
                                                        <%= negotiator.getFullName().substring(0, 1).toUpperCase() %>
                                                    </div>
                                                </td>
                                                <td>
                                                    <%= negotiator.getFullName() %>
                                                </td>
                                                <td>
                                                    <%= negotiator.getEmail() %>
                                                </td>
                                                <td>
                                                    <%= negotiator.getContactNumber() %>
                                                </td>
                                                <td>
                                                    <div class="action-buttons">
                                                        <a href="<%= request.getContextPath() %>/ViewNegotiatorServlet?id=<%= negotiator.getId() %>"
                                                            class="btn btn-icon btn-view" title="View Details">
                                                            <i class="fas fa-eye"></i>
                                                        </a>
                                                        <a href="<%= request.getContextPath() %>/EditNegotiatorServlet?id=<%= negotiator.getId() %>"
                                                            class="btn btn-icon btn-edit" title="Edit">
                                                            <i class="fas fa-edit"></i>
                                                        </a>
                                                        <a href="<%= request.getContextPath() %>/DeleteNegotiatorServlet?id=<%= negotiator.getId() %>"
                                                            class="btn btn-icon btn-delete" title="Delete"
                                                            onclick="return confirm('Are you sure you want to delete this negotiator?')">
                                                            <i class="fas fa-trash"></i>
                                                        </a>
                                                    </div>
                                                </td>
                                            </tr>
                                            <% } } else { %>
                                                <tr>
                                                    <td colspan="6">
                                                        <div class="empty-state">
                                                            <i class="fas fa-user-tie"></i>
                                                            <h3>No negotiators found</h3>
                                                            <p>You haven't added any negotiators yet. Get started by
                                                                adding your first negotiator.</p>
                                                            <a href="<%= request.getContextPath() %>/admin/add-negotiator.jsp"
                                                                class="btn btn-primary">
                                                                <i class="fas fa-plus"></i> Add Negotiator
                                                            </a>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <% } %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <script>
                    // Search functionality
                    function searchNegotiators() {
                        const input = document.getElementById("negotiatorSearch").value.toLowerCase();
                        const table = document.getElementById("negotiatorsTable");
                        const rows = table.getElementsByTagName("tr");

                        for (let i = 1; i < rows.length; i++) {
                            const cells = rows[i].getElementsByTagName("td");
                            let found = false;

                            // Search in name, email, and contact number
                            for (let j = 1; j < 4; j++) {
                                if (cells[j].textContent.toLowerCase().includes(input)) {
                                    found = true;
                                    break;
                                }
                            }

                            rows[i].style.display = found ? "" : "none";
                        }
                    }
                </script>
            </body>

            </html>