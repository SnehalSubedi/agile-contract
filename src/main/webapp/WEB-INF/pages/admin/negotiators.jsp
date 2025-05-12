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
        /* Global Styles */
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f9fc;
            color: #5a5c69;
        }

        .container {
            display: flex;
            min-height: 100vh;
        }

        /* Table Styles */
        .negotiators-table {
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08);
            padding: 25px;
            margin-top: 20px;
            overflow: hidden;
        }

        .table-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            padding-bottom: 15px;
            border-bottom: 1px solid #e3e6f0;
        }

        .table-header h2 {
            color: #2e3a59;
            font-size: 22px;
            font-weight: 600;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }

        thead th {
            background-color: #4e73df0f;
            color: #4e73df;
            padding: 15px;
            text-align: left;
            font-weight: 600;
            font-size: 14px;
            border-bottom: 2px solid #e3e6f0;
        }

        tbody td {
            padding: 15px;
            border-bottom: 1px solid #e3e6f0;
            vertical-align: middle;
            font-size: 15px;
        }

        tbody tr:hover {
            background-color: #f8f9fc;
        }

        tbody tr:last-child td {
            border-bottom: none;
        }

        /* Action Buttons */
        .action-buttons {
            display: flex;
            gap: 10px;
            justify-content: flex-end;
        }

        .btn-icon {
            width: 36px;
            height: 36px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
            color: white;
            text-decoration: none;
            transition: all 0.2s ease;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .btn-icon:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
        }

        .btn-view {
            background-color: #4e73df;
        }

        .btn-view:hover {
            background-color: #3a5fcb;
        }

        .btn-edit {
            background-color: #1cc88a;
        }

        .btn-edit:hover {
            background-color: #18aa74;
        }

        .btn-delete {
            background-color: #e74a3b;
        }

        .btn-delete:hover {
            background-color: #d13c2e;
        }

        /* Empty State */
        .empty-state {
            text-align: center;
            padding: 60px 20px;
            color: #858796;
        }

        .empty-state i {
            font-size: 60px;
            color: #d1d3e2;
            margin-bottom: 25px;
        }

        .empty-state h3 {
            font-size: 24px;
            margin-bottom: 15px;
            color: #5a5c69;
        }

        .empty-state p {
            margin-bottom: 25px;
            max-width: 500px;
            margin-left: auto;
            margin-right: auto;
            line-height: 1.6;
        }

        /* Profile Picture */
        .profile-pic {
            width: 45px;
            height: 45px;
            border-radius: 50%;
            overflow: hidden;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: 600;
            font-size: 18px;
            background-color: #4e73df;
            border: 2px solid #eaecf4;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .profile-pic img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        /* Main Content */
        .main-content {
            flex: 1;
            padding: 30px;
            overflow: auto;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }

        .header-left h1 {
            color: #4e73df;
            font-size: 28px;
            margin-bottom: 5px;
        }

        .welcome-message {
            color: #858796;
            font-size: 16px;
        }

        .header-right {
            display: flex;
            align-items: center;
            gap: 20px;
        }

        /* Search Box */
        .search-box {
            position: relative;
        }

        .search-box input {
            padding: 12px 15px 12px 40px;
            border-radius: 25px;
            border: 1px solid #e3e6f0;
            width: 250px;
            font-size: 14px;
            transition: all 0.3s ease;
            color: #5a5c69;
        }

        .search-box input:focus {
            width: 300px;
            border-color: #4e73df;
            outline: none;
            box-shadow: 0 0 0 0.2rem rgba(78, 115, 223, 0.25);
        }

        .search-box i {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #858796;
        }

        /* User Profile */
        .user-profile {
            display: flex;
            align-items: center;
            gap: 15px;
            cursor: pointer;
            padding: 10px 15px;
            border-radius: 5px;
            transition: background-color 0.2s;
        }

        .user-profile:hover {
            background-color: #f8f9fc;
        }

        .user-profile img {
            width: 45px;
            height: 45px;
            border-radius: 50%;
            object-fit: cover;
            border: 2px solid #4e73df;
        }

        .user-info {
            display: flex;
            flex-direction: column;
        }

        .user-info .name {
            font-weight: 600;
            color: #3a3b45;
        }

        .user-info .role {
            font-size: 12px;
            color: #858796;
        }

        /* Button Styles */
        .btn {
            padding: 10px 20px;
            border-radius: 5px;
            font-weight: 600;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            transition: all 0.2s ease;
            border: none;
            cursor: pointer;
            font-size: 14px;
        }

        .btn-primary {
            background-color: #4e73df;
            color: white;
        }

        .btn-primary:hover {
            background-color: #3a5fcb;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        /* Responsive Styles */
        @media (max-width: 1024px) {
            .header {
                flex-direction: column;
                align-items: flex-start;
                gap: 15px;
            }

            .header-right {
                width: 100%;
                justify-content: space-between;
            }

            .search-box input {
                width: 200px;
            }

            .search-box input:focus {
                width: 220px;
            }
        }

        @media (max-width: 768px) {
            .main-content {
                padding: 20px;
            }

            .table-header {
                flex-direction: column;
                align-items: flex-start;
                gap: 15px;
            }

            .negotiators-table {
                padding: 15px;
                overflow-x: auto;
            }

            table {
                min-width: 700px;
            }

            .header-right {
                flex-direction: column;
                align-items: flex-start;
            }

            .search-box {
                width: 100%;
            }

            .search-box input, .search-box input:focus {
                width: 100%;
            }
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
                <li><a href="<%= request.getContextPath() %>/Admin-Dashboard"><i class="fas fa-th-large"></i> Dashboard</a></li>
                <li><a href="<%= request.getContextPath() %>/Admin-Dashboard?action=viewContracts"><i class="fas fa-file-contract"></i> View Contracts</a></li>
                <li><a href="<%= request.getContextPath() %>/AddContractServlet"><i class="fas fa-plus-circle"></i> Add Contract</a></li>
                <li><a href="<%= request.getContextPath() %>/FetchAllNegotiator" class="active"><i class="fas fa-user-tie"></i> Negotiators</a></li>
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
                        <input type="text" id="negotiatorSearch" placeholder="Search negotiators..." onkeyup="searchNegotiators()">
                    </div>
                    <div class="user-profile">
                        <img src="images/profile.png" alt="User Profile">
                        <div class="user-info">
                            <div class="name">
                                <%= request.getAttribute("userName") != null ? request.getAttribute("userName") : "Admin" %>
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
                        <a href="<%= request.getContextPath() %>/AddNegotiatorServlet" class="btn btn-primary">
                            <i class="fas fa-plus"></i> Add Negotiator
                        </a>
                    </div>
                </div>

                <table id="negotiatorsTable">
                    <thead>
                        <tr>
                            <th>Image</th>
                            
                            <th>Name</th>
                            <th>Email</th>
                            <th>Contact</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                        List<User> negotiators = (List<User>) request.getAttribute("negotiators");
                        if (negotiators != null && !negotiators.isEmpty()) {
                            for (User negotiator : negotiators) {
                        %>
                        <tr>
                            <td>
                                <div class="profile-pic">
                                    <% if (negotiator.getImagePath() != null && !negotiator.getImagePath().isEmpty()) { %>
                                        <img src="resources/uploads/<%= negotiator.getImagePath() %>" alt="<%= negotiator.getFullName() %>" />
                                    <% } else { %>
                                        <%= negotiator.getImagePath() %>
                                    <% } %>
                                </div>
                            </td>
                            <td><%= negotiator.getFullName() %></td>
                            <td><%= negotiator.getEmail() %></td>
                            <td><%= negotiator.getContactNumber() %></td>
                            <%= negotiator.getId() %>
                           
                            <td>
                                <div class="action-buttons">
                                    <a href="<%= request.getContextPath() %>/ViewNegotiatorServlet?id=<%= negotiator.getId() %>" class="btn-icon btn-view" title="View Details">
                                        <i class="fas fa-eye"></i>
                                    </a>
                                    <a href="<%= request.getContextPath() %>/EditNegotiatorServlet?id=<%= negotiator.getId() %>" class="btn-icon btn-edit" title="Edit">
                                        <i class="fas fa-edit"></i>
                                    </a>
                                    <a href="<%= request.getContextPath() %>/DeleteNegotiatorServlet?id=<%= negotiator.getId() %>" class="btn-icon btn-delete" title="Delete" onclick="return confirm('Are you sure you want to delete this negotiator?')">
                                        <i class="fas fa-trash"></i>
                                    </a>
                                </div>
                            </td>
                        </tr>
                        <% 
                            } 
                        } else { 
                        %>
                        <tr>
                            <td colspan="6">
                                <div class="empty-state">
                                    <i class="fas fa-user-tie"></i>
                                    <h3>No negotiators found</h3>
                                    <p>You haven't added any negotiators yet. Get started by adding your first negotiator.</p>
                                    <a href="<%= request.getContextPath() %>/AddNegotiator" class="btn btn-primary">
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

                // Skip if it's the empty state row
                if (cells.length <= 1) continue;

                // Search in name, email, and contact number
                for (let j = 1; j < 4; j++) {
                    if (cells[j] && cells[j].textContent.toLowerCase().includes(input)) {
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