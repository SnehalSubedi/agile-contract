<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*, com.agilecontract.Model.Contract, java.time.format.DateTimeFormatter" %>
<%
    DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("MMM dd, yyyy");
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agile Contracts - All Contracts</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="css/sidebar.css">
    <link rel="stylesheet" href="css/admin-dashboard.css">
    <style>
        .contracts-table {
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin-top: 20px;
        }

        .status-badge {
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 500;
        }

        .status-active {
            background-color: #e6f7ee;
            color: #10b759;
        }

        .status-pending {
            background-color: #fff8e6;
            color: #ff9500;
        }

        .status-draft {
            background-color: #e6f3ff;
            color: #0077ff;
        }

        .status-expired {
            background-color: #ffebee;
            color: #ff3b30;
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
            border: none;
            cursor: pointer;
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

        .btn-more {
            background-color: #858796;
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

        .dropdown {
            position: relative;
            display: inline-block;
        }

        .dropdown-toggle {
            background-color: #ffffff;
            color: #333;
            padding: 10px 20px;
            font-size: 16px;
            border: 1px solid #ccc;
            cursor: pointer;
        }

        .dropdown-menu {
            display: none;
            position: absolute;
            background-color: #ffffff;
            min-width: 160px;
            border: 1px solid #ccc;
            box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
            z-index: 1;
        }

        .dropdown-menu a {
            color: #333;
            padding: 10px 15px;
            text-decoration: none;
            display: block;
        }

        .dropdown-menu a:hover {
            background-color: #f1f1f1;
        }

        .dropdown:hover .dropdown-menu {
            display: block;
        }

        /* Modal styles */
        .modal {
            display: none;
            position: fixed;
            z-index: 1000;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
        }

        .modal-content {
            background-color: #fff;
            border-radius: 8px;
            width: 400px;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            padding: 20px;
            text-align: center;
        }

        .modal-content h3 {
            margin-top: 0;
        }

        .modal-content p {
            margin-bottom: 20px;
        }

        .modal-buttons {
            display: flex;
            justify-content: center;
            gap: 10px;
        }

        .btn-cancel {
            background-color: #858796;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
        }

        .btn-confirm-delete {
            background-color: #e74a3b;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
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
                <li><a href="<%= request.getContextPath() %>/FetchAllNegotiator"><i class="fas fa-user-tie"></i> Negotiators</a></li>
                <li><a href="#"><i class="fas fa-chart-line"></i> Reports</a></li>
            </ul>
        </div>

        <!-- Main Content -->
        <div class="main-content">
            <div class="header">
                <div class="header-left">
                    <h1>All Contracts</h1>
                    <p class="welcome-message">Manage all contract records</p>
                </div>
                <div class="header-right">
                    <div class="search-box">
                        <i class="fas fa-search"></i>
                        <input type="text" id="contractSearch" placeholder="Search contracts..." onkeyup="searchContracts()">
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

            <!-- Contracts Table -->
            <div class="contracts-table">
                <div class="table-header">
                    <h2>Contract List</h2>
                    <div class="table-actions">
                        <div class="dropdown">
                            <button class="btn btn-outline dropdown-toggle">
                                <i class="fas fa-filter"></i> Filter
                            </button>
                            <div class="dropdown-menu">
                                <a href="#" onclick="filterContracts('all')">All Contracts</a>
                                <a href="#" onclick="filterContracts('active')">Active</a>
                                <a href="#" onclick="filterContracts('pending')">Pending</a>
                                <a href="#" onclick="filterContracts('draft')">Draft</a>
                                <a href="#" onclick="filterContracts('expired')">Expired</a>
                            </div>
                        </div>
                        <a href="<%= request.getContextPath() %>/AddContractServlet" class="btn btn-primary">
                            <i class="fas fa-plus"></i> New Contract
                        </a>
                    </div>
                </div>

                <table id="contractsTable">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Contract Name</th>
                            <th>Client</th>
                            <th>Negotiator</th>
                            <th>Start Date</th>
                            <th>End Date</th>
                            <th>Value</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            Object contractsObj = request.getAttribute("contracts");
                            if (contractsObj instanceof List) {
                                List<Contract> contracts = (List<Contract>) contractsObj;
                                if (!contracts.isEmpty()) {
                                    for (Contract c : contracts) {
                        %>
                        <tr data-status="<%= c.getStatus().toLowerCase() %>">
                            <td><%= c.getId() %></td>
                            <td><%= c.getContractName() %></td>
                            <td><%= c.getClientName() %></td>
                            <td><%= c.getNegotiatorName() != null ? c.getNegotiatorName() : "Not assigned" %></td>
                            <td><%= c.getStartDate() != null ? dateFormatter.format(c.getStartDate()) : "N/A" %></td>
                            <td><%= c.getEndDate() != null ? dateFormatter.format(c.getEndDate()) : "N/A" %></td>
                            <td>$<%= c.getValue() != null ? String.format("%,.2f", c.getValue()) : "0.00" %></td>
                            <td>
                                <span class="status-badge status-<%= c.getStatus().toLowerCase() %>">
                                    <%= c.getStatus() %>
                                </span>
                            </td>
                         <td>
    <div class="action-buttons">
        <a href="<%= request.getContextPath() %>/AdminController?action=viewContract&id=<%= c.getId() %>"
           class="btn btn-icon btn-view" title="View Details">
            <i class="fas fa-eye"></i>
        </a>
        <a href="<%= request.getContextPath() %>/EditContractServlet?contractId=<%= c.getId() %>"
           class="btn btn-icon btn-edit" title="Edit">
            <i class="fas fa-edit"></i>
        </a>
        <!-- Direct delete action -->
        <a href="<%= request.getContextPath() %>/DeleteContractServlet?contractId=<%= c.getId() %>"
           class="btn btn-icon btn-delete" title="Delete Contract">
            <i class="fas fa-trash-alt"></i>
        </a>
        <button class="btn btn-icon btn-more" title="More options"
                onclick="showContractOptions(<%= c.getId() %>)">
            <i class="fas fa-ellipsis-v"></i>
        </button>
    </div>
</td>

                        </tr>
                        <%
                                    }
                                } else {
                        %>
                        <tr>
                            <td colspan="9">
                                <div class="empty-state">
                                    <i class="fas fa-file-contract"></i>
                                    <h3>No contracts found</h3>
                                    <p>You haven't added any contracts yet. Get started by creating your first contract.</p>
                                    <a href="<%= request.getContextPath() %>/AddContractServlet" class="btn btn-primary">
                                        <i class="fas fa-plus"></i> Add New Contract
                                    </a>
                                </div>
                            </td>
                        </tr>
                        <%
                                }
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- Delete Confirmation Modal -->
    <div id="deleteModal" class="modal">
        <div class="modal-content">
            <h3>Confirm Delete</h3>
            <p>Are you sure you want to delete the contract "<span id="contractNameToDelete"></span>"?</p>
            <p>This action cannot be undone.</p>
            <div class="modal-buttons">
                <button class="btn-cancel" onclick="closeDeleteModal()">Cancel</button>
                <button class="btn-confirm-delete" id="confirmDeleteBtn">Delete</button>
            </div>
        </div>
    </div>

    <!-- JS Scripts -->
    <script>
        function searchContracts() {
            const input = document.getElementById("contractSearch").value.toLowerCase();
            const rows = document.querySelectorAll("#contractsTable tbody tr");

            rows.forEach(row => {
                const rowText = row.innerText.toLowerCase();
                row.style.display = rowText.includes(input) ? "" : "none";
            });
        }

        function filterContracts(status) {
            const rows = document.querySelectorAll("#contractsTable tbody tr");

            rows.forEach(row => {
                const rowStatus = row.getAttribute("data-status");
                if (status === "all" || rowStatus === status.toLowerCase()) {
                    row.style.display = "";
                } else {
                    row.style.display = "none";
                }
            });
        }

        function showContractOptions(contractId) {
            alert("More options for contract ID: " + contractId);
        }

        // Delete contract functionality
        function confirmDelete(contractId, contractName) {
            document.getElementById("contractNameToDelete").textContent = contractName;
            document.getElementById("confirmDeleteBtn").onclick = function() {
                window.location.href = "<%= request.getContextPath() %>/DeleteContractServlet?contractId=" + contractId;
            };
            document.getElementById("deleteModal").style.display = "block";
        }

        function closeDeleteModal() {
            document.getElementById("deleteModal").style.display = "none";
        }

        // Close modal if clicking outside of it
        window.onclick = function(event) {
            const modal = document.getElementById("deleteModal");
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }
    </script>
</body>
</html>
