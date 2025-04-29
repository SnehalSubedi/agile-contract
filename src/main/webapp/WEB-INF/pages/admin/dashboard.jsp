<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="java.util.*, com.agilecontract.Model.Contract, java.time.format.DateTimeFormatter" %>
        <% DateTimeFormatter dateFormatter=DateTimeFormatter.ofPattern("MMM dd, yyyy"); %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Agile Contracts Dashboard</title>
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
                <link rel="stylesheet" href="css/sidebar.css">
                <link rel="stylesheet" href="css/admin-dashboard.css">
                <style>
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

                    /* Dropdown menu hidden by default */
                    .dropdown-menu {
                        display: none;
                        position: absolute;
                        background-color: #ffffff;
                        min-width: 160px;
                        border: 1px solid #ccc;
                        box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
                        z-index: 1;
                    }

                    /* Dropdown items style */
                    .dropdown-menu a {
                        color: #333;
                        padding: 10px 15px;
                        text-decoration: none;
                        display: block;
                    }

                    /* Hover effect on dropdown items */
                    .dropdown-menu a:hover {
                        background-color: #f1f1f1;
                    }

                    /* Show the dropdown menu when hovering */
                    .dropdown:hover .dropdown-menu {
                        display: block;
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
                                <h1>Contracts Dashboard</h1>
                                <p class="welcome-message">Welcome back, <%= request.getAttribute("userName") !=null ?
                                        request.getAttribute("userName") : "Admin" %>!</p>
                            </div>
                            <div class="header-right">
                                <div class="search-box">
                                    <i class="fas fa-search"></i>
                                    <input type="text" id="contractSearch" placeholder="Search contracts..."
                                        onkeyup="searchContracts()">
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

                        <!-- Dashboard Cards -->
                        <div class="dashboard-cards">
                            <div class="card card-primary">
                                <div class="card-icon"><i class="fas fa-file-contract"></i></div>
                                <div class="card-title">Active Contracts</div>
                                <div class="card-value">
                                    <%= request.getAttribute("activeContracts") !=null ?
                                        request.getAttribute("activeContracts") : 0 %>
                                </div>
                                <div class="card-footer">Currently active</div>
                            </div>

                            <div class="card card-warning">
                                <div class="card-icon"><i class="fas fa-clock"></i></div>
                                <div class="card-title">Pending Contracts</div>
                                <div class="card-value">
                                    <%= request.getAttribute("pendingContracts") !=null ?
                                        request.getAttribute("pendingContracts") : 0 %>
                                </div>
                                <div class="card-footer">Awaiting approval</div>
                            </div>

                            <div class="card card-secondary">
                                <div class="card-icon"><i class="fas fa-file-alt"></i></div>
                                <div class="card-title">Draft Contracts</div>
                                <div class="card-value">
                                    <%= request.getAttribute("draftContracts") !=null ?
                                        request.getAttribute("draftContracts") : 0 %>
                                </div>
                                <div class="card-footer">In progress</div>
                            </div>

                            <div class="card card-danger">
                                <div class="card-icon"><i class="fas fa-exclamation-triangle"></i></div>
                                <div class="card-title">Expired Contracts</div>
                                <div class="card-value">
                                    <%= request.getAttribute("expiredContracts") !=null ?
                                        request.getAttribute("expiredContracts") : 0 %>
                                </div>
                                <div class="card-footer">Needs renewal</div>
                            </div>
                        </div>

                        <!-- Contracts Table -->
                        <div class="contracts-table">
                            <div class="table-header">
                                <h2>Recent Contracts</h2>
                                <div class="table-actions">

                                    <div class="dropdown">
                                        <button class="dropdown-toggle" type="button">
                                            <i class="fas fa-filter"></i> Filter
                                        </button>
                                        <div class="dropdown-menu">
                                            <a class="dropdown-item" href="#" onclick="filterContracts('all')">All
                                                Contracts</a>
                                            <a class="dropdown-item" href="#"
                                                onclick="filterContracts('Active')">Active</a>
                                            <a class="dropdown-item" href="#"
                                                onclick="filterContracts('Pending')">Pending</a>
                                            <a class="dropdown-item" href="#"
                                                onclick="filterContracts('Draft')">Draft</a>
                                            <a class="dropdown-item" href="#"
                                                onclick="filterContracts('Expired')">Expired</a>
                                        </div>
                                    </div>
                                    <a href="<%= request.getContextPath() %>/AddContractServlet"
                                        class="btn btn-primary">
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
                                    <% Object recentContractsObj=request.getAttribute("recentContracts"); if
                                        (recentContractsObj instanceof List) { List<Contract> contracts = (List
                                        <Contract>) recentContractsObj;
                                            if (contracts != null && !contracts.isEmpty()) {
                                            for (Contract c : contracts) {
                                            %>
                                            <tr data-status="<%= c.getStatus().toLowerCase() %>">
                                                <td>
                                                    <%= c.getId() %>
                                                </td>
                                                <td>
                                                    <%= c.getContractName() %>
                                                </td>
                                                <td>
                                                    <%= c.getClientName() %>
                                                </td>
                                                <td>
                                                    <%= c.getNegotiatorName() !=null ? c.getNegotiatorName()
                                                        : "Not assigned" %>
                                                </td>
                                                <td>
                                                    <%= c.getStartDate() !=null ? dateFormatter.format(c.getStartDate())
                                                        : "N/A" %>
                                                </td>
                                                <td>
                                                    <%= c.getEndDate() !=null ? dateFormatter.format(c.getEndDate())
                                                        : "N/A" %>
                                                </td>
                                                <td>$<%= c.getValue() !=null ? String.format("%,.2f", c.getValue())
                                                        : "0.00" %>
                                                </td>
                                                <td>
                                                    <span
                                                        class="status-badge status-<%= c.getStatus().toLowerCase() %>">
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
                                                        <button class="btn btn-icon btn-more" title="More options"
                                                            onclick="showContractOptions(<%= c.getId() %>)">
                                                            <i class="fas fa-ellipsis-v"></i>
                                                        </button>
                                                    </div>
                                                </td>
                                            </tr>
                                            <% } } else { %>
                                                <tr>
                                                    <td colspan="9">
                                                        <div class="empty-state">
                                                            <i class="fas fa-file-contract"></i>
                                                            <h3>No contracts found</h3>
                                                            <p>You haven't added any contracts yet. Get started by
                                                                creating your first contract.</p>
                                                            <a href="<%= request.getContextPath() %>/admin/add-contract.jsp"
                                                                class="btn btn-primary">
                                                                <i class="fas fa-plus"></i> Add New Contract
                                                            </a>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <% } } else { %>
                                                    <tr>
                                                        <td colspan="9">
                                                            <div class="empty-state error-state">
                                                                <i class="fas fa-exclamation-circle"></i>
                                                                <h3>Error loading contracts</h3>
                                                                <p>There was an issue retrieving contract data. Please
                                                                    try again later.</p>
                                                                <button class="btn btn-secondary"
                                                                    onclick="window.location.reload()">
                                                                    <i class="fas fa-sync-alt"></i> Refresh
                                                                </button>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <% } %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <!-- Contract Options Modal -->
                <div id="contractOptionsModal" class="modal">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h3>Contract Options</h3>
                            <span class="close" onclick="closeModal()">&times;</span>
                        </div>
                        <div class="modal-body">
                            <ul class="options-list">
                                <li><a href="#" id="viewOption"><i class="fas fa-eye"></i> View Details</a></li>
                                <li><a href="#" id="editOption"><i class="fas fa-edit"></i> Edit Contract</a></li>
                                <li><a href="#" id="renewOption"><i class="fas fa-redo"></i> Renew Contract</a></li>
                                <li><a href="#" id="deleteOption" class="text-danger"><i class="fas fa-trash"></i>
                                        Delete Contract</a></li>
                            </ul>
                        </div>
                    </div>
                </div>

                <script>
                    // Search functionality
                    function searchContracts() {
                        const input = document.getElementById("contractSearch").value.toLowerCase();
                        const table = document.getElementById("contractsTable");
                        const rows = table.getElementsByTagName("tr");

                        for (let i = 1; i < rows.length; i++) {
                            const cells = rows[i].getElementsByTagName("td");
                            let found = false;

                            // Search in contract ID, name, client name, and negotiator name
                            for (let j = 0; j < 4; j++) {
                                if (cells[j].textContent.toLowerCase().includes(input)) {
                                    found = true;
                                    break;
                                }
                            }

                            rows[i].style.display = found ? "" : "none";
                        }
                    }

                    // Filter by status
                    function filterContracts(status) {
                        const rows = document.querySelectorAll("#contractsTable tbody tr");

                        rows.forEach(row => {
                            if (status === 'all') {
                                row.style.display = "";
                            } else {
                                row.style.display = row.dataset.status === status.toLowerCase() ? "" : "none";
                            }
                        });

                        // Update dropdown text
                        document.querySelector("#filterDropdown i").nextSibling.textContent =
                            status === 'all' ? ' Filter' : ` Filter (${status})`;
                    }

                    // Contract options modal
                    let currentContractId = 0;

                    function showContractOptions(contractId) {
                        currentContractId = contractId;
                        const modal = document.getElementById("contractOptionsModal");

                        // Set links
                        document.getElementById("viewOption").href =
                            `<%= request.getContextPath() %>/AdminController?action=viewContract&id=${contractId}`;
                        document.getElementById("editOption").href =
                            `<%= request.getContextPath() %>/EditContractServlet?contractId=${contractId}`;
                        document.getElementById("deleteOption").href =
                            `<%= request.getContextPath() %>/DeleteContractServlet?contractId=${contractId}`;

                        modal.style.display = "block";
                    }

                    function closeModal() {
                        document.getElementById("contractOptionsModal").style.display = "none";
                    }

                    // Close modal when clicking outside
                    window.onclick = function (event) {
                        const modal = document.getElementById("contractOptionsModal");
                        if (event.target === modal) {
                            closeModal();
                        }
                    }
                </script>
            </body>

            </html>