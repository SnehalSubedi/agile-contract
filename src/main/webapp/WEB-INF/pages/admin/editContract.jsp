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
            :root {
            --primary: #4361ee;
            --secondary: #3a0ca3;
            --background: #f9fafb;
            --text: #333;
            --border: #e0e0e0;
            --sidebar-width: 240px;
        }
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
                
                /* Validation styling */
                .field-container {
                    position: relative;
                    margin-bottom: 5px;
                }
                
                .error-message {
                    color: red;
                    font-size: 0.8rem;
                    margin-top: -15px;
                    margin-bottom: 15px;
                }
                
                input.invalid {
                    border: 1px solid red;
                }
                
                input.valid {
                    border: 1px solid #4CAF50;
                }
                
                   /* Submit button styling */
        #submitBtn{
            background-color: var(--primary);
            color: white;
            cursor: pointer;
            font-weight: 600;
            padding: 14px 24px;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            transition: background-color 0.3s, transform 0.2s;
            width: auto;
            min-width: 180px;
            margin-top: 12px;
            display: block;
            margin-left: auto;
            margin-right: auto; /* Center the submit button */
        }

        .submitBtn:hover {
            background-color: var(--secondary);
            transform: translateY(-2px);
        }

        .submitBtn:active {
            transform: translateY(0);
        }
        #back-btn{
         background-color: var(--primary);
            color: white;
            cursor: pointer;
            font-weight: 600;
            padding: 14px 24px;
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
                            <input type="text" name="contractName" id="contractName" value="${contract.contractName}" required />
                            <div class="error-message" id="contractNameError"></div>

                            <label for="clientName">Client Name:</label>
                            <input type="text" name="clientName" id="clientName" value="${contract.clientName}" required />
                            <div class="error-message" id="clientNameError"></div>

                            <label for="startDate">Start Date:</label>
                            <input type="date" name="startDate" value="${contract.startDate}" required /><br><br>

                            <label for="endDate">End Date:</label>
                            <input type="date" name="endDate" value="${contract.endDate}" required /><br><br>

                            <label for="value">Contract Value:</label>
                            <input type="number" step="0.01" name="value" id="contractValue" value="${contract.value}" required />
                            <div class="error-message" id="valueError"></div>

                            <label for="status">Status:</label>
                            <select name="status" required>
                                <option value="Pending" ${contract.status=='Pending' ? 'selected' : '' }>Pending
                                </option>
                                <option value="Draft" ${contract.status=='Draft' ? 'selected' : '' }>Draft</option>
                                <option value="Active" ${contract.status=='Active' ? 'selected' : '' }>Active</option>
                                <option value="Expired" ${contract.status=='Expired' ? 'selected' : '' }>Expired
                                </option>
                            </select><br><br>

                            <button type="submit" id="submitBtn">Update Contract</button>
                        </form>
                    </div>

                    <br>
                    <a id="back-btn" href="DashboardServlet">Back to Dashboard</a>
                </div>
            </div>

            <script>
                document.addEventListener('DOMContentLoaded', function() {
                    // Get form elements
                    const contractNameInput = document.getElementById('contractName');
                    const clientNameInput = document.getElementById('clientName');
                    const contractValueInput = document.getElementById('contractValue');
                    const contractNameError = document.getElementById('contractNameError');
                    const clientNameError = document.getElementById('clientNameError');
                    const valueError = document.getElementById('valueError');
                    const submitButton = document.getElementById('submitBtn');
                    
                    // Validation functions
                    function validateContractName() {
                        const value = contractNameInput.value.trim();
                        
                        // Check for special characters
                        const hasSpecialChars = /[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]+/.test(value);
                        
                        // Check word count (5 words max)
                        const wordCount = value.split(/\s+/).filter(word => word.length > 0).length;
                        
                        if (hasSpecialChars) {
                            contractNameError.textContent = 'No special characters allowed';
                            contractNameInput.classList.add('invalid');
                            contractNameInput.classList.remove('valid');
                            return false;
                        } else if (wordCount > 5) {
                            contractNameError.textContent = 'Maximum 5 words allowed';
                            contractNameInput.classList.add('invalid');
                            contractNameInput.classList.remove('valid');
                            return false;
                        } else {
                            contractNameError.textContent = '';
                            contractNameInput.classList.remove('invalid');
                            contractNameInput.classList.add('valid');
                            return true;
                        }
                    }
                    
                    function validateClientName() {
                        const value = clientNameInput.value.trim();
                        
                        // Check for letters only (allowing spaces)
                        const hasOnlyLetters = /^[A-Za-z\s]+$/.test(value);
                        
                        if (!hasOnlyLetters) {
                            clientNameError.textContent = 'Letters only, no numbers or special characters';
                            clientNameInput.classList.add('invalid');
                            clientNameInput.classList.remove('valid');
                            return false;
                        } else {
                            clientNameError.textContent = '';
                            clientNameInput.classList.remove('invalid');
                            clientNameInput.classList.add('valid');
                            return true;
                        }
                    }
                    
                    function validateContractValue() {
                        const value = contractValueInput.value.trim();
                        
                        // Check for numbers only with max 8 digits before decimal point
                        const isValid = /^\d{1,8}(\.\d+)?$/.test(value);
                        
                        if (!isValid) {
                            valueError.textContent = 'Maximum 8 digits, numbers only';
                            contractValueInput.classList.add('invalid');
                            contractValueInput.classList.remove('valid');
                            return false;
                        } else {
                            valueError.textContent = '';
                            contractValueInput.classList.remove('invalid');
                            contractValueInput.classList.add('valid');
                            return true;
                        }
                    }
                    
                    // Add real-time validation
                    contractNameInput.addEventListener('input', validateContractName);
                    clientNameInput.addEventListener('input', validateClientName);
                    contractValueInput.addEventListener('input', validateContractValue);
                    
                    // Form submission validation
                    document.querySelector('form').addEventListener('submit', function(event) {
                        const isContractNameValid = validateContractName();
                        const isClientNameValid = validateClientName();
                        const isContractValueValid = validateContractValue();
                        
                        if (!isContractNameValid || !isClientNameValid || !isContractValueValid) {
                            event.preventDefault();
                        }
                    });
                    
                    // Initial validation on page load
                    validateContractName();
                    validateClientName();
                    validateContractValue();
                });
            </script>
        </body>

        </html>