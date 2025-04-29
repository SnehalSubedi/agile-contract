<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="java.util.List" %>
        <%@ page import="com.agilecontract.Model.User" %>
            <% List<User> negotiators = (List<User>) request.getAttribute("negotiators");
                    %>
                    <!DOCTYPE html>
                    <html lang="en">

                    <head>
                        <link rel="stylesheet"
                            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

                        <meta charset="UTF-8">
                        <meta name="viewport" content="width=device-width, initial-scale=1.0">
                        <title>Add New Contract</title>
                        <link rel="stylesheet" href="<%= request.getContextPath() %>/css/sidebar.css">
                        <link rel="stylesheet" href="<%= request.getContextPath() %>/css/add-contract.css">
                    </head>

                    <body>
                        <div class="container">
                            <div class="sidebar">
                                <div class="sidebar-header">
                                    <h1>Agile Contracts</h1>
                                </div>
                                <ul class="sidebar-nav">
                                    <li><a href="<%= request.getContextPath() %>/"><i class="fas fa-home"></i> Home</a>
                                    </li>
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

                            <div class="main-content" style="width:100%; margin-right:100px;">
                                <div class="header">
                                    <div class="header-left">
                                        <h1>Add New Contract</h1>
                                    </div>
                                </div>

                                <div class="form-section">
                                    <form action="<%= request.getContextPath() %>/AddContractServlet" method="post">
                                        <div class="form-group">
                                            <label for="contractName">Contract Name</label>
                                            <input type="text" id="contractName" name="contractName" required>
                                        </div>

                                        <div class="form-group">
                                            <label for="client">Client</label>
                                            <input type="text" id="client" name="client" required>
                                        </div>

                                        <div class="form-row">
                                            <div class="form-col">
                                                <div class="form-group">
                                                    <label for="startDate">Start Date</label>
                                                    <input type="date" id="startDate" name="startDate" required>
                                                </div>
                                            </div>
                                            <div class="form-col">
                                                <div class="form-group">
                                                    <label for="endDate">End Date</label>
                                                    <input type="date" id="endDate" name="endDate" required>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="value">Contract Value ($)</label>
                                            <input type="number" id="value" name="value" required>
                                        </div>

                                        <div class="form-row">
                                            <div class="form-col">
                                                <div class="form-group">
                                                    <label for="status">Status</label>
                                                    <select id="status" name="status" required>
                                                        <option value="Active">Active</option>
                                                        <option value="Pending">Pending</option>
                                                        <option value="Draft">Draft</option>
                                                        <option value="Completed">Completed</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-col">
                                                <div class="form-group">
                                                    <label for="negotiator">Assign To</label>
                                                    <select name="negotiator" id="negotiator" required>
                                                        <option value="">Select Negotiator</option>
                                                        <% if (negotiators !=null) { for (User u : negotiators) { %>
                                                            <option value="<%= u.getId() %>">
                                                                <%= u.getId() %>
                                                            </option>
                                                            <% } } %>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <input type="submit" value="Save Contract" class="btn-primary">
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </body>

                    </html>