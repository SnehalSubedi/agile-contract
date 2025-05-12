<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.agilecontract.Model.User"%>
<%
List<User> negotiators = (List<User>) request.getAttribute("negotiators");
%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add New Contract</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/sidebar.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/add-contract.css">
<style>
/* Reset and base styles */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: Arial, sans-serif;
	background-color: #f5f7fa;
	color: #333;
}

.container {
	display: flex;
	min-height: 100vh;
}

/* Sidebar styles */
.sidebar {
	width: 250px;
	background-color: #2c3e50;
	color: #fff;
	position: fixed;
	height: 100vh;
	box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
	z-index: 100;
}

.sidebar-header {
	padding: 20px;
	text-align: center;
	border-bottom: 1px solid #34495e;
}

.sidebar-nav {
	list-style: none;
	padding: 20px 0;
}

.sidebar-nav li a {
	display: block;
	padding: 15px 20px;
	color: #ecf0f1;
	text-decoration: none;
	transition: all 0.3s;
}

.sidebar-nav li a:hover {
	background-color: #34495e;
}

.sidebar-nav li a i {
	margin-right: 10px;
	width: 20px;
	text-align: center;
}

/* Main content styles */
.main-content {
	flex-grow: 1;
	margin-left: 250px;
	padding: 20px;
	display: flex;
	flex-direction: column;
	align-items: center;
}

.header {
	width: 100%;
	max-width: 800px;
	margin-bottom: 30px;
	padding-bottom: 15px;
	border-bottom: 1px solid #e1e5e8;
}

.header h1 {
	font-size: 24px;
	color: #2c3e50;
}

/* Form styles */
.form-section {
	width: 100%;
	display: flex;
	justify-content: center;
}

form {
	width: 100%;
	max-width: 800px;
	background-color: #fff;
	padding: 30px;
	border-radius: 8px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
}

.form-group {
	margin-bottom: 20px;
}

.form-row {
	display: flex;
	gap: 20px;
	margin-bottom: 20px;
}

.form-col {
	flex: 1;
}

label {
	display: block;
	margin-bottom: 8px;
	font-weight: 600;
	color: #34495e;
}

input[type="text"], input[type="date"], select {
	width: 100%;
	padding: 12px;
	border: 1px solid #ddd;
	border-radius: 4px;
	font-size: 16px;
	transition: border 0.3s;
}

input[type="text"]:focus, input[type="date"]:focus, select:focus {
	border-color: #3498db;
	outline: none;
}

.btn-primary {
	background-color: #3498db;
	color: white;
	border: none;
	padding: 12px 24px;
	font-size: 16px;
	border-radius: 4px;
	cursor: pointer;
	transition: background-color 0.3s;
	width: 100%;
}

.btn-primary:hover {
	background-color: #2980b9;
}

/* Error styling */
.error-message {
	color: #e74c3c;
	font-size: 0.8rem;
	margin-top: 4px;
	display: none;
}

input.error, select.error {
	border: 1px solid #e74c3c;
}

/* Responsive adjustments */
@media ( max-width : 768px) {
	.sidebar {
		width: 70px;
		overflow: hidden;
	}
	.sidebar-header h1 {
		display: none;
	}
	.sidebar-nav li a span {
		display: none;
	}
	.main-content {
		margin-left: 70px;
	}
	.form-row {
		flex-direction: column;
		gap: 0;
	}
}
</style>
</head>

<body>
	<div class="container">
		<div class="sidebar">
			<div class="sidebar-header">
				<h1>Agile Contracts</h1>
			</div>
			<ul class="sidebar-nav">
				<li><a href="<%=request.getContextPath()%>/"><i
						class="fas fa-home"></i> <span>Home</span></a></li>
				<li><a href="<%=request.getContextPath()%>/Admin-Dashboard"><i
						class="fas fa-th-large"></i> <span>Dashboard</span></a></li>
				<li><a
					href="<%=request.getContextPath()%>/Admin-Dashboard?action=viewContracts"><i
						class="fas fa-file-contract"></i> <span>View Contracts</span></a></li>
				<li><a
					href="<%=request.getContextPath()%>/AddContractServlet"><i
						class="fas fa-plus-circle"></i> <span>Add Contract</span></a></li>
				<li><a
					href="<%=request.getContextPath()%>/FetchAllNegotiator"><i
						class="fas fa-user-tie"></i> <span>Negotiators</span></a></li>
				<li><a href="#"><i class="fas fa-chart-line"></i> <span>Reports</span></a></li>
			</ul>
		</div>

		<div class="main-content">
			<div class="header">
				<h1>Add New Contract</h1>
			</div>
			<%
			if (request.getAttribute("error") != null) {
			%>
			<div style="color: red;"><%=request.getAttribute("error")%></div>
			<%
			}
			%>


			<div class="form-section">
				<form action="<%=request.getContextPath()%>/AddContractServlet"
					method="post" id="contractForm">
					<div class="form-group">
						<label for="contractName">Contract Name</label> <input type="text"
							id="contractName" name="contractName"
							placeholder="Enter contract name" required>
						<div class="error-message" id="contractNameError">Contract
							name must not contain special characters and be 5 words or less</div>
					</div>

					<div class="form-group">
						<label for="client">Client</label> <input type="text" id="client"
							name="client" placeholder="Enter client name" required>
						<div class="error-message" id="clientError">Client name must
							contain letters only (no numbers or special characters)</div>
					</div>

					<div class="form-row">
						<div class="form-col">
							<div class="form-group">
								<label for="startDate">Start Date</label> <input type="date"
									id="startDate" name="startDate" required
									value="<%=java.time.LocalDate.now()%>">
							</div>
						</div>
						<div class="form-col">
							<div class="form-group">
								<label for="endDate">End Date</label> <input type="date"
									id="endDate" name="endDate" required>
								<div class="error-message" id="dateError">End date must be
									after start date</div>
							</div>
						</div>
					</div>

					<div class="form-group">
						<label for="value">Contract Value ($)</label> <input type="text"
							id="value" name="value" placeholder="Enter contract value"
							required>
						<div class="error-message" id="valueError">Contract value
							must be numeric, up to 8 digits only</div>
					</div>

					<div class="form-row">
						<div class="form-col">
							<div class="form-group">
								<label for="status">Status</label> <select id="status"
									name="status" required>
									<option value="Active">Active</option>
									<option value="Pending">Pending</option>
									<option value="Draft">Draft</option>
									<option value="Expired">Expired</option>
								</select>
							</div>
						</div>
						<div class="form-col">
							<div class="form-group">
								<label for="negotiator">Assign To</label> <select
									name="negotiator" id="negotiator" required>
									<option value="">Select Negotiator</option>
									<%
									if (negotiators != null && !negotiators.isEmpty()) {
										for (User u : negotiators) {
									%>
									<option value="<%=u.getId()%>"><%=u.getFullName()%>
										(ID:
										<%=u.getId()%>)
									</option>
									<%
									}
									}
									%>
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

	<script>
        document.addEventListener('DOMContentLoaded', function() {
            const form = document.getElementById('contractForm');

            form.addEventListener('submit', function(event) {
                let isValid = true;

                const contractName = document.getElementById('contractName').value;
                const contractNameRegex = /^[a-zA-Z0-9\s]+$/;

                if (!contractNameRegex.test(contractName) || contractName.trim().split(/\s+/).length > 5) {
                    showError('contractName');
                    isValid = false;
                } else {
                    hideError('contractName');
                }

                const client = document.getElementById('client').value;
                const clientRegex = /^[a-zA-Z\s]+$/;
                if (!clientRegex.test(client)) {
                    showError('client');
                    isValid = false;
                } else {
                    hideError('client');
                }

                const value = document.getElementById('value').value;
                const valueRegex = /^\d{1,8}$/;
                if (!valueRegex.test(value)) {
                    showError('value');
                    isValid = false;
                } else {
                    hideError('value');
                }

                const startDate = new Date(document.getElementById('startDate').value);
                const endDate = new Date(document.getElementById('endDate').value);
                if (endDate <= startDate) {
                    showError('endDate', 'dateError');
                    isValid = false;
                } else {
                    hideError('endDate', 'dateError');
                }

                if (!isValid) event.preventDefault();
            });

            const showError = (id, errorId = id + 'Error') => {
                document.getElementById(id).classList.add('error');
                document.getElementById(errorId).style.display = 'block';
            };

            const hideError = (id, errorId = id + 'Error') => {
                document.getElementById(id).classList.remove('error');
                document.getElementById(errorId).style.display = 'none';
            };

            // Real-time validation handlers
            document.getElementById('contractName').addEventListener('input', () => {
                const val = document.getElementById('contractName').value;
                const valid = /^[a-zA-Z0-9\s]+$/.test(val) && val.trim().split(/\s+/).length <= 5;
                valid ? hideError('contractName') : showError('contractName');
            });

            document.getElementById('client').addEventListener('input', () => {
                const valid = /^[a-zA-Z\s]+$/.test(document.getElementById('client').value);
                valid ? hideError('client') : showError('client');
            });

            document.getElementById('value').addEventListener('input', () => {
                const valid = /^\d{1,8}$/.test(document.getElementById('value').value);
                valid ? hideError('value') : showError('value');
            });

            document.getElementById('startDate').addEventListener('change', validateDateRange);
            document.getElementById('endDate').addEventListener('change', validateDateRange);

            function validateDateRange() {
                const start = new Date(document.getElementById('startDate').value);
                const end = new Date(document.getElementById('endDate').value);
                if (end <= start) {
                    showError('endDate', 'dateError');
                } else {
                    hideError('endDate', 'dateError');
                }
            }
        });
    </script>
</body>

</html>