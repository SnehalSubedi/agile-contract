<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="java.util.*, com.agilecontract.Model.Contract" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Edit Contract</title>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
            <link rel="stylesheet" href="css/sidebar.css">
            <link rel="stylesheet" href="css/admin-dashboard.css">
            <style>
                /* Edit Contract Form Styling */
                .edit-form-container {
                    max-width: 600px;
                    margin: 40px auto;
                    padding: 20px;
                    background-color: #fff;
                    border-radius: 8px;
                    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                }

                .edit-form-container form {
                    display: flex;
                    flex-direction: column;
                }

                .edit-form-container label {
                    font-size: 1rem;
                    margin-bottom: 5px;
                    font-weight: bold;
                }

                .edit-form-container input[type="text"],
                .edit-form-container input[type="date"],
                .edit-form-container input[type="number"],
                .edit-form-container select {
                    padding: 8px 12px;
                    margin-bottom: 20px;
                    font-size: 1rem;
                    border: 1px solid #ccc;
                    border-radius: 4px;
                    transition: border-color 0.3s;
                }

                .edit-form-container input[type="text"]:focus,
                .edit-form-container input[type="date"]:focus,
                .edit-form-container input[type="number"]:focus,
                .edit-form-container select:focus {
                    border-color: #4CAF50;
                    outline: none;
                }

                .edit-form-container button {
                    padding: 10px 20px;
                    font-size: 1.1rem;
                    color: #fff;
                    background-color: #4CAF50;
                    border: none;
                    border-radius: 4px;
                    cursor: pointer;
                    transition: background-color 0.3s;
                }

                .edit-form-container button:hover {
                    background-color: #45a049;
                }

                .edit-form-container button:active {
                    background-color: #388e3c;
                }

                .edit-form-container h2 {
                    margin-bottom: 30px;
                    text-align: center;
                    font-size: 1.5rem;
                    color: #333;
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
                        <li><a href="<%= request.getContextPath() %>/Admin-Dashboard"><i class="fas fa-th-large"></i>
                                Dashboard</a></li>
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
                            <h1>Edit Contract</h1>
                        </div>
                        <div class="header-right">
                            <div class="search-box">
                                <i class="fas fa-search"></i>
                                <input type="text" placeholder="Search contracts...">
                            </div>
                            <div class="user-profile">
                                <img src="images/profile.png" alt="User Profile">
                                <div class="user-info">
                                    <div class="name">
                                        <%= request.getAttribute("userName") !=null ? request.getAttribute("userName")
                                            : "Admin" %>
                                    </div>
                                    <div class="role">Contract Manager</div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Edit Contract Form -->
                    <div class="edit-form-container">
                        <form action="EditContractServlet" method="post">
                            <input type="hidden" name="contractId" value="${contract.id}" />

                            <label for="contractName">Contract Name:</label>
                            <input type="text" name="contractName" value="${contract.contractName}" required /><br><br>

                            <label for="clientName">Client Name:</label>
                            <input type="text" name="clientName" value="${contract.clientName}" required /><br><br>

                            <label for="startDate">Start Date:</label>
                            <input type="date" name="startDate" value="${contract.startDate}" required /><br><br>

                            <label for="endDate">End Date:</label>
                            <input type="date" name="endDate" value="${contract.endDate}" required /><br><br>

                            <label for="value">Contract Value:</label>
                            <input type="number" step="0.01" name="value" value="${contract.value}" required /><br><br>

                            <label for="status">Status:</label>
                            <select name="status" required>
                                <option value="Pending" ${contract.status=='Pending' ? 'selected' : '' }>Pending
                                </option>
                                <option value="Draft" ${contract.status=='Draft' ? 'selected' : '' }>Draft</option>
                                <option value="Active" ${contract.status=='Active' ? 'selected' : '' }>Active</option>
                                <option value="Expired" ${contract.status=='Expired' ? 'selected' : '' }>Expired
                                </option>
                            </select><br><br>


                            <button type="submit">Update Contract</button>
                        </form>
                    </div>

                    <br>
                    <a href="DashboardServlet">Back to Dashboard</a>
                </div>
            </div>
        </body>

        </html>