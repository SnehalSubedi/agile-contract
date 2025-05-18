<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*, com.agilecontract.Model.User" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agile Contracts - Edit Negotiator</title>
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

        /* Form Styles */
        .edit-negotiator-form {
            background: white;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
            padding: 30px;
            margin-top: 20px;
            max-width: 1000px;
            width: 100%;
        }

        .form-group {
            margin-bottom: 24px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: #4e73df;
            font-size: 14px;
        }

        .form-control {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #d1d3e2;
            border-radius: 4px;
            font-size: 15px;
            transition: all 0.3s ease;
            color: #3a3b45;
            background-color: #fff;
        }

        .form-control:valid {
            border-color: #1cc88a;
        }

        .form-control:invalid {
            border-color: #e74a3b;
        }

        .form-control:focus {
            border-color: #4e73df;
            box-shadow: 0 0 0 0.2rem rgba(78, 115, 223, 0.25);
            outline: none;
        }

        input[type="file"].form-control {
            padding: 8px;
        }

        .form-row {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            margin-bottom: 20px;
        }

        .form-col {
            flex: 1;
            min-width: 250px;
        }

        .btn-row {
            display: flex;
            gap: 15px;
            justify-content: flex-end;
            margin-top: 35px;
        }

        .btn {
            padding: 12px 24px;
            border-radius: 4px;
            font-weight: 500;
            cursor: pointer;
            text-decoration: none;
            border: none;
            font-size: 15px;
            transition: all 0.2s ease;
            display: inline-flex;
            align-items: center;
            justify-content: center;
        }

        .btn-primary {
            background-color: #4e73df;
            color: white;
        }

        .btn-secondary {
            background-color: #f8f9fc;
            color: #5a5c69;
            border: 1px solid #d1d3e2;
        }

        .btn:hover {
            transform: translateY(-1px);
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }

        .btn-primary:hover {
            background-color: #4262c7;
        }

        .btn-secondary:hover {
            background-color: #eaecf4;
        }

        /* Profile Header */
        .profile-header {
            display: flex;
            align-items: center;
            gap: 25px;
            margin-bottom: 35px;
            padding-bottom: 20px;
            border-bottom: 1px solid #e3e6f0;
        }

        .profile-pic {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            background-color: #f4f5f9;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
            border: 3px solid #4e73df;
        }

        .profile-pic img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .profile-header h2 {
            color: #2e3a59;
            margin-bottom: 5px;
            font-size: 24px;
        }

        .profile-header p {
            color: #5a5c69;
            font-size: 16px;
        }

        /* Messages */
        .error-message {
            color: #e74a3b;
            font-size: 14px;
            margin-top: 5px;
            display: flex;
            align-items: center;
            gap: 5px;
        }

        .error-message:before {
            content: "\f071";
            font-family: "Font Awesome 6 Free";
            font-weight: 900;
        }

        .success-message {
            background-color: #1cc88a;
            color: white;
            padding: 15px;
            border-radius: 4px;
            margin-bottom: 25px;
            display: flex;
            align-items: center;
            gap: 10px;
            font-weight: 500;
        }

        /* Main Content */
        .main-content {
            flex: 1;
            padding: 30px;
            max-width: 100%;
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
        }

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

        /* Tooltip styles */
        .tooltip {
            position: relative;
            display: inline-block;
        }

        .tooltip .tooltiptext {
            visibility: hidden;
            width: 200px;
            background-color: #555;
            color: #fff;
            text-align: center;
            border-radius: 6px;
            padding: 5px;
            position: absolute;
            z-index: 1;
            bottom: 125%;
            left: 50%;
            margin-left: -100px;
            opacity: 0;
            transition: opacity 0.3s;
            font-size: 12px;
            font-weight: normal;
        }

        .tooltip:hover .tooltiptext {
            visibility: visible;
            opacity: 1;
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .form-row {
                flex-direction: column;
                gap: 0;
            }
            
            .form-col {
                width: 100%;
            }
            
            .profile-header {
                flex-direction: column;
                text-align: center;
                gap: 15px;
            }
            
            .btn-row {
                flex-direction: column;
                gap: 10px;
            }
            
            .btn {
                width: 100%;
            }
            
            .header {
                flex-direction: column;
                gap: 15px;
                text-align: center;
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
                    <h1>Edit Negotiator</h1>
                    <p class="welcome-message">Update negotiator details</p>
                </div>
                <div class="header-right">
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

            <!-- Edit Negotiator Form -->
            <div class="edit-negotiator-form">
                <% 
                    User negotiator = (User) request.getAttribute("negotiator");
                    String successMessage = (String) request.getAttribute("successMessage");
                    
                    if (successMessage != null && !successMessage.isEmpty()) {
                %>
                <div class="success-message">
                    <i class="fas fa-check-circle"></i> <%= successMessage %>
                </div>
                <% } %>

                <div class="profile-header">
                    <div class="profile-pic">
                        <img id="profileImageDisplay" 
                             src="resources/uploads/<%= negotiator.getImagePath() %>" 
                             alt="<%= negotiator.getFullName() %>" 
                             style="cursor: pointer; width: 150px; height: 150px; object-fit: cover; border-radius: 50%;" 
                             onclick="document.getElementById('profileImage').click();" />
                    </div>
                    <div>
                        <h2><%= negotiator.getFullName() %></h2>
                        <p><%= negotiator.getEmail() %></p>
                    </div>
                </div>

                <form action="<%= request.getContextPath() %>/EditNegotiatorServlet" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
                    <input type="hidden" name="negotiatorId" value="<%= negotiator.getId() %>">
                    <input type="hidden" name="oldImagePath" value="<%= negotiator.getImagePath() %>">

                    <div class="form-row">
                        <div class="form-col">
                            <div class="form-group">
                                <label for="fullName">Full Name 
                                    <span class="tooltip">
                                        <i class="fas fa-info-circle" style="color: #4e73df;"></i>
                                        <span class="tooltiptext">1-3 words only (letters and spaces, no numbers or special characters)</span>
                                    </span>
                                </label>
                                <input type="text" id="fullName" name="fullName" class="form-control"
                                       value="<%= negotiator.getFullName() %>"
                                       pattern="^[A-Za-z]+(?: [A-Za-z]+){0,2}$" 
                                       title="1-3 words only (letters and spaces, no numbers or special characters)"
                                       required>
                            </div>
                        </div>
                        <div class="form-col">
                            <div class="form-group">
                                <label for="email">Email Address</label>
                                <input type="email" id="email" name="email" class="form-control" 
                                       value="<%= negotiator.getEmail() %>" 
                                       required>
                                <% 
                                    String emailError = (String) request.getAttribute("emailError");
                                    if (emailError != null && !emailError.isEmpty()) {
                                %>
                                <div class="error-message"><%= emailError %></div>
                                <% } %>
                            </div>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-col">
                            <div class="form-group">
                                <label for="contactNumber">Contact Number 
                                    <span class="tooltip">
                                        <i class="fas fa-info-circle" style="color: #4e73df;"></i>
                                        <span class="tooltiptext">Must start with 97 or 98 and be exactly 10 digits</span>
                                    </span>
                                </label>
                                <input type="tel" id="contactNumber" name="contactNumber" class="form-control"
                                       value="<%= negotiator.getContactNumber() %>"
                                       pattern="^(97|98)\d{8}$" 
                                       title="Must start with 97 or 98 and be exactly 10 digits"
                                       required>
                            </div>
                        </div>
                        <div class="form-col">
                            <div class="form-group">
                                <label for="role">Role</label>
                                <input type="text" id="role" name="role" class="form-control" 
                                       value="<%= negotiator.getRole() != null ? negotiator.getRole() : "" %>">
                            </div>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-col">
                            <div class="form-group">
                                <label for="userName">Username 
                                    <span class="tooltip">
                                        <i class="fas fa-info-circle" style="color: #4e73df;"></i>
                                        <span class="tooltiptext">Maximum 15 characters</span>
                                    </span>
                                </label>
                                <input type="text" id="userName" name="userName" class="form-control" 
                                       value="<%= negotiator.getUsername() %>" 
                                       maxlength="15"
                                       title="Maximum 15 characters"
                                       required>
                                <% 
                                    String userNameError = (String) request.getAttribute("userNameError");
                                    if (userNameError != null && !userNameError.isEmpty()) {
                                %>
                                <div class="error-message"><%= userNameError %></div>
                                <% } %>
                            </div>
                        </div>
                        <div class="form-col">
                            <div class="form-group">
                                <label for="password">Reset Password (leave blank to keep current password) 
                                    <span class="tooltip">
                                        <i class="fas fa-info-circle" style="color: #4e73df;"></i>
                                        <span class="tooltiptext">If changing, must be at least 6 characters</span>
                                    </span>
                                </label>
                                <input type="password" id="password" name="password" class="form-control"
                                       minlength="6"
                                       title="Password must be at least 6 characters (leave blank to keep current)">
                            </div>
                        </div>
                    </div>

                    <!-- Profile Image Upload Section -->
                    <div class="form-row">
                        <div class="form-col">
                            <div class="form-group">
                                <label for="profileImage">Profile Image</label>
                                <input type="file" id="profileImage" name="image" accept="image/*" class="form-control" style="display: none;">
                                <small>Click the profile picture above to select a new image.</small>
                            </div>
                        </div>
                    </div>

                    <div class="btn-row">
                        <a href="<%= request.getContextPath() %>/FetchAllNegotiator" class="btn btn-secondary">Cancel</a>
                        <button type="submit" class="btn btn-primary">Save Changes</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script>
        // Profile image preview functionality
        document.getElementById("profileImage").addEventListener("change", function(event) {
            const [file] = event.target.files;
            if (file) {
                document.getElementById("profileImageDisplay").src = URL.createObjectURL(file);
            }
        });

        // Form validation
        function validateForm() {
            const passwordField = document.getElementById('password');
            
            // Only validate password if it's not empty
            if (passwordField.value.trim() !== '') {
                if (passwordField.value.length < 6) {
                    alert('Password must be at least 6 characters long');
                    passwordField.focus();
                    return false;
                }
            }

            // Validate full name has 1-3 words
            const fullName = document.getElementById('fullName').value.trim();
            if (!/^[A-Za-z]+(?: [A-Za-z]+){0,2}$/.test(fullName)) {
                alert('Full name must be 1-3 words with only letters and spaces');
                return false;
            }

            // Validate contact number starts with 97 or 98 and is 10 digits
            const contactNumber = document.getElementById('contactNumber').value.trim();
            if (!/^(97|98)\d{8}$/.test(contactNumber)) {
                alert('Contact number must start with 97 or 98 and be exactly 10 digits');
                return false;
            }

            // Validate username is not longer than 15 characters
            const userName = document.getElementById('userName').value.trim();
            if (userName.length > 15) {
                alert('Username cannot be longer than 15 characters');
                return false;
            }

            return true;
        }
    </script>
</body>
</html>
