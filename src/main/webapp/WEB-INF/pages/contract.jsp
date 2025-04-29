<%@ page contentType="text/html;charset=UTF-8" language="java" %>
  <%@ page import="java.util.List" %>
    <%@ page import="com.agilecontract.Model.Contract" %>
      <% List<Contract> contracts = (List<Contract>) request.getAttribute("contracts");
          int activeContracts = contracts != null ? (int) contracts.stream().filter(c ->
          "Active".equalsIgnoreCase(c.getStatus())).count() : 0;
          %>
          <%@ include file="header.jsp" %>

            <!DOCTYPE html>
            <html>

            <head>
              <meta charset="UTF-8">
              <title>My Contracts</title>
              <style>
                /* CSS Variables */
                :root {
                  --primary: #4CAF50;
                  --primary-dark: #388E3C;
                  --primary-light: #C8E6C9;
                  --accent: #FF9800;
                  --text-color: #333333;
                  --gray: #666666;
                  --light-gray: #EEEEEE;
                  --border-color: #E0E0E0;
                  --success: #2e7d32;
                  --warning: #ff8f00;
                  --error: #c62828;
                  --info: #1565c0;
                  --box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
                  --transition: all 0.3s ease;
                  --primary: #4361ee;
                  --primary-dark: #3a56d4;
                  --secondary: #6c63ff;
                  --accent: #4cc9f0;
                  --light: #f8f9fa;
                  --dark: #2d3748;
                  --gray: #718096;
                  --gray-light: #e2e8f0;
                  --success: #48bb78;
                  --transition: all 0.3s ease;
                }

                /* Base Styles */
                body {
                  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                  margin: 0;
                  padding: 0;
                  background-color: #f8f9fc;
                  color: var(--text-color);
                  line-height: 1.6;
                }

                a {
                  text-decoration: none;
                  color: var(--primary);
                  transition: var(--transition);
                }

                a:hover {
                  color: var(--primary-dark);
                }

                button {
                  cursor: pointer;
                  transition: var(--transition);
                }

                h1,
                h2,
                h3,
                h4,
                h5,
                h6 {
                  margin-top: 0;
                  color: var(--text-color);
                  font-weight: 600;
                }

                /* Container */
                .profile-container {
                  max-width: 1200px;
                  margin: 25px auto;
                  padding: 20px;
                  background-color: #ffffff;
                  border-radius: 10px;
                  box-shadow: var(--box-shadow);
                }

                /* Hero Section */
                .hero {
                  background: linear-gradient(135deg, var(--primary-dark), var(--primary));
                  color: white;
                  padding: 60px 20px;
                  text-align: center;
                  position: relative;
                }

                .hero::after {
                  content: '';
                  position: absolute;
                  bottom: 0;
                  left: 0;
                  right: 0;
                  height: 50px;
                  background: linear-gradient(to bottom right, transparent 49%, white 50%);
                }

                .hero-content {
                  max-width: 800px;
                  margin: 0 auto;
                }

                .hero-title {
                  font-size: 2.8rem;
                  margin-bottom: 10px;
                  font-weight: 700;
                  text-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                }

                .hero-title span {
                  color: var(--accent);
                }

                .hero-subtitle {
                  font-size: 1.2rem;
                  margin-bottom: 30px;
                  opacity: 0.9;
                }

                /* Profile Details Cards */
                .profile-details {
                  display: grid;
                  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
                  gap: 20px;
                  margin-bottom: 30px;
                }

                .detail-card {
                  background-color: #ffffff;
                  border-radius: 8px;
                  padding: 20px;
                  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
                  border-left: 4px solid var(--primary);
                }

                .detail-card h3 {
                  margin-top: 0;
                  color: var(--primary);
                  font-size: 1.3rem;
                  margin-bottom: 20px;
                  padding-bottom: 10px;
                  border-bottom: 1px solid var(--light-gray);
                }

                .detail-item {
                  display: flex;
                  justify-content: space-between;
                  margin-bottom: 15px;
                  align-items: center;
                }

                .detail-item:last-child {
                  margin-bottom: 0;
                }

                .detail-item strong {
                  color: var(--gray);
                }

                .detail-item span {
                  font-weight: 600;
                  color: var(--text-color);
                }

                /* Form Elements */
                .form-group {
                  margin-bottom: 15px;
                }

                .form-group label {
                  display: block;
                  margin-bottom: 8px;
                  font-weight: 500;
                  color: var(--gray);
                }

                /* Button Styles */
                .edit-btn {
                  background-color: var(--primary);
                  color: white;
                  border: none;
                  padding: 10px 15px;
                  border-radius: 5px;
                  font-weight: 500;
                  text-transform: uppercase;
                  font-size: 0.9rem;
                  letter-spacing: 0.5px;
                  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
                  transition: var(--transition);
                  width: 100%;
                }

                .edit-btn:hover {
                  background-color: var(--primary-dark);
                  transform: translateY(-2px);
                  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
                }

                /* Table Styles */
                #contracts-table {
                  width: 100%;
                  border-collapse: collapse;
                  margin-top: 1rem;
                  background: #fff;
                  border-radius: 8px;
                  overflow: hidden;
                  box-shadow: var(--box-shadow);
                }

                #contracts-table th {
                  background-color: var(--primary);
                  color: white;
                  padding: 15px;
                  text-align: left;
                  font-weight: 600;
                }

                #contracts-table td {
                  padding: 15px;
                  border-bottom: 1px solid var(--border-color);
                  color: var(--gray);
                }

                #contracts-table tr:last-child td {
                  border-bottom: none;
                }

                #contracts-table tr:hover {
                  background-color: rgba(76, 175, 80, 0.05);
                }

                /* Status Badges */
                .status-badge {
                  display: inline-block;
                  padding: 6px 12px;
                  border-radius: 20px;
                  font-size: 12px;
                  font-weight: 600;
                  text-transform: uppercase;
                  letter-spacing: 0.5px;
                }

                .status-badge.active {
                  background-color: rgba(76, 175, 80, 0.1);
                  color: var(--success);
                }

                .status-badge.pending {
                  background-color: rgba(255, 193, 7, 0.1);
                  color: var(--warning);
                }

                .status-badge.expired {
                  background-color: rgba(244, 67, 54, 0.1);
                  color: var(--error);
                }

                .status-badge.completed {
                  background-color: rgba(33, 150, 243, 0.1);
                  color: var(--info);
                }

                /* Action Buttons */
                .action-btn {
                  padding: 8px 14px;
                  border: none;
                  border-radius: 4px;
                  cursor: pointer;
                  font-size: 13px;
                  font-weight: 500;
                  margin-right: 5px;
                  transition: var(--transition);
                }

                .action-btn:last-child {
                  margin-right: 0;
                }

                .view-btn {
                  background-color: #2196F3;
                  color: white;
                }

                .view-btn:hover {
                  background-color: #1976D2;
                  transform: translateY(-1px);
                }

                .edit-btn {
                  background-color: #FFC107;
                  color: #212121;
                }

                .edit-btn:hover {
                  background-color: #FFB300;
                  transform: translateY(-1px);
                }

                /* Filter Controls */
                .filter-controls {
                  background-color: #f9f9fc;
                  padding: 20px;
                  border-radius: 8px;
                  margin-bottom: 20px;
                  box-shadow: inset 0 0 5px rgba(0, 0, 0, 0.05);
                }

                .filter-input {
                  width: 100%;
                  padding: 12px;
                  border: 1px solid #ddd;
                  border-radius: 6px;
                  font-size: 14px;
                  transition: var(--transition);
                  background-color: white;
                }

                .filter-input:focus {
                  outline: none;
                  border-color: var(--primary);
                  box-shadow: 0 0 0 3px rgba(76, 175, 80, 0.2);
                }

                .filter-input::placeholder {
                  color: #aaa;
                }

                /* Alert Box */
                .alert {
                  background-color: #f8f9fa;
                  border-left: 4px solid var(--primary);
                  color: var(--gray);
                  padding: 20px;
                  border-radius: 8px;
                  text-align: center;
                  margin: 20px 0;
                }

                /* Responsive Styles */
                @media (max-width: 1024px) {
                  .profile-details {
                    grid-template-columns: 1fr;
                  }

                  .hero-title {
                    font-size: 2.4rem;
                  }
                }

                @media (max-width: 768px) {
                  .filter-controls .form-group {
                    grid-column: span 6;
                  }

                  .profile-container {
                    padding: 15px;
                  }

                  .hero {
                    padding: 40px 15px;
                  }

                  .hero-title {
                    font-size: 2rem;
                  }

                  .detail-card {
                    padding: 15px;
                  }
                }

                @media (max-width: 480px) {
                  .hero-title {
                    font-size: 1.8rem;
                  }

                  .hero-subtitle {
                    font-size: 1rem;
                  }

                  .detail-item {
                    flex-direction: column;
                    align-items: flex-start;
                  }

                  .detail-item span {
                    margin-top: 5px;
                  }

                  .action-btn {
                    display: block;
                    width: 100%;
                    margin-right: 0;
                    margin-bottom: 5px;
                  }
                }
              </style>
            </head>

            <body>
              <!-- Hero Section -->
              <div class="hero">
                <div class="hero-content">
                  <div class="hero-text">
                    <h1 class="hero-title">My <span>Contracts</span></h1>
                    <p class="hero-subtitle">View and manage all contracts assigned to you</p>
                  </div>
                </div>
              </div>

              <!-- Contract Stats Cards -->
              <div class="profile-container">
                <div class="profile-details">
                  <div class="detail-card">
                    <h3>Contract Summary</h3>
                    <div class="detail-item">
                      <strong>Total Contracts</strong>
                      <span>
                        <%= contracts !=null ? contracts.size() : 0 %>
                      </span>
                    </div>
                    <div class="detail-item">
                      <strong>Active Contracts</strong>
                      <span>
                        <%= activeContracts %>
                      </span>
                    </div>
                    <div class="detail-item">
                      <strong>Completion Rate</strong>
                      <span>
                        <%= contracts !=null && !contracts.isEmpty() ? String.format("%.1f%%", (activeContracts * 100.0
                          / contracts.size())) : "0%" %>
                      </span>
                    </div>
                  </div>

                  <div class="detail-card">
                    <h3>Quick Actions</h3>
                    <div class="detail-item">
                      <button class="edit-btn" onclick="location.href='#'">Create New Contract</button>
                    </div>
                    <div class="detail-item">
                      <button class="edit-btn" onclick="location.href='#'">View Expiring Soon</button>
                    </div>
                    <div class="detail-item">
                      <button class="edit-btn" onclick="location.href='#'">Export Data</button>
                    </div>
                  </div>
                </div>
              </div>

              <!-- Contracts Table Section -->
              <div class="profile-container">
                <h2 style="margin-top: 0;">Contracts Assigned to Me</h2>

                <!-- Filter Controls -->
                <div class="filter-controls" style="margin-bottom: 20px;">
                  <div style="display: grid; grid-template-columns: repeat(6, 1fr); gap: 10px; margin-bottom: 10px;">
                    <div class="form-group">
                      <label>Contract Name</label>
                      <input type="text" class="filter-input" data-column="0" placeholder="Search...">
                    </div>
                    <div class="form-group">
                      <label>Client Name</label>
                      <input type="text" class="filter-input" data-column="1" placeholder="Search...">
                    </div>
                    <div class="form-group">
                      <label>Start Date</label>
                      <input type="text" class="filter-input" data-column="2" placeholder="YYYY-MM-DD">
                    </div>
                    <div class="form-group">
                      <label>End Date</label>
                      <input type="text" class="filter-input" data-column="3" placeholder="YYYY-MM-DD">
                    </div>
                    <div class="form-group">
                      <label>Value</label>
                      <input type="text" class="filter-input" data-column="4" placeholder="e.g. 5000">
                    </div>
                    <div class="form-group">
                      <label>Status</label>
                      <input type="text" class="filter-input" data-column="5" placeholder="e.g. Active">
                    </div>
                  </div>
                  <button class="edit-btn" onclick="resetFilters()">Reset Filters</button>
                </div>

                <% if (contracts !=null && !contracts.isEmpty()) { %>
                  <div style="overflow-x: auto;">
                    <table id="contracts-table">
                      <thead>
                        <tr>
                          <th>Contract Name</th>
                          <th>Client Name</th>
                          <th>Start Date</th>
                          <th>End Date</th>
                          <th>Value</th>
                          <th>Status</th>
                          <th>Actions</th>
                        </tr>
                      </thead>
                      <tbody>
                        <% for (Contract contract : contracts) { %>
                          <tr>
                            <td>
                              <%= contract.getContractName() %>
                            </td>
                            <td>
                              <%= contract.getClientName() %>
                            </td>
                            <td>
                              <%= contract.getStartDate() %>
                            </td>
                            <td>
                              <%= contract.getEndDate() %>
                            </td>
                            <td>$<%= contract.getValue() %>
                            </td>
                            <td>
                              <span class="status-badge <%= contract.getStatus().toLowerCase() %>">
                                <%= contract.getStatus() %>
                              </span>
                            </td>
                            <td>
                              <button class="action-btn view-btn"
                                onclick="viewContract('<%= contract.getId() %>')">View</button>
                              <button class="action-btn edit-btn"
                                onclick="editContract('<%= contract.getId() %>')">Edit</button>
                            </td>
                          </tr>
                          <% } %>
                      </tbody>
                    </table>
                  </div>
                  <% } else { %>
                    <div class="alert"
                      style="background-color: #f8f9fa; color: #666; text-align: center; padding: 20px;">
                      No contracts assigned to you. Would you like to <a href="#" style="color: var(--primary);">create
                        a new contract</a>?
                    </div>
                    <% } %>
              </div>

              <style>
                /* Table Styles */
                #contracts-table {
                  width: 100%;
                  border-collapse: collapse;
                  margin-top: 1rem;
                  background: #fff;
                  border-radius: 8px;
                  overflow: hidden;
                  box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
                }

                #contracts-table th {
                  background-color: var(--primary);
                  color: white;
                  padding: 12px 15px;
                  text-align: left;
                  font-weight: 600;
                }

                #contracts-table td {
                  padding: 12px 15px;
                  border-bottom: 1px solid var(--border-color);
                  color: var(--gray);
                }

                #contracts-table tr:last-child td {
                  border-bottom: none;
                }

                #contracts-table tr:hover {
                  background-color: rgba(76, 175, 80, 0.05);
                }

                /* Status Badges */
                .status-badge {
                  display: inline-block;
                  padding: 4px 10px;
                  border-radius: 20px;
                  font-size: 12px;
                  font-weight: 600;
                }

                .status-badge.active {
                  background-color: rgba(76, 175, 80, 0.1);
                  color: #2e7d32;
                }

                .status-badge.pending {
                  background-color: rgba(255, 193, 7, 0.1);
                  color: #ff8f00;
                }

                .status-badge.expired {
                  background-color: rgba(244, 67, 54, 0.1);
                  color: #c62828;
                }

                .status-badge.completed {
                  background-color: rgba(33, 150, 243, 0.1);
                  color: #1565c0;
                }

                /* Action Buttons */
                .action-btn {
                  padding: 6px 12px;
                  border: none;
                  border-radius: 4px;
                  cursor: pointer;
                  font-size: 13px;
                  font-weight: 500;
                  margin-right: 5px;
                  transition: all 0.3s ease;
                }

                .view-btn {
                  background-color: #2196F3;
                  color: white;
                }

                .edit-btn {
                  background-color: #FFC107;
                  color: #212121;
                }

                .action-btn:hover {
                  opacity: 0.9;
                  transform: translateY(-1px);
                }

                /* Filter Controls */
                .filter-controls {
                  background-color: #f9f9fc;
                  padding: 15px;
                  border-radius: 8px;
                  margin-bottom: 20px;
                }

                .filter-input {
                  width: 100%;
                  padding: 10px;
                  border: 1px solid #ddd;
                  border-radius: 6px;
                  font-size: 14px;
                  transition: border 0.3s ease, box-shadow 0.3s ease;
                }

                .filter-input:focus {
                  outline: none;
                  border-color: var(--primary);
                  box-shadow: 0 0 0 3px rgba(76, 175, 80, 0.2);
                }

                /* Responsive Adjustments */
                @media (max-width: 768px) {
                  .filter-controls .form-group {
                    grid-column: span 6;
                  }

                  #contracts-table {
                    display: block;
                    overflow-x: auto;
                  }
                }
              </style>

              <script>
                document.addEventListener('DOMContentLoaded', function () {
                  // Initialize filter inputs
                  const filterInputs = document.querySelectorAll('.filter-input');

                  filterInputs.forEach(input => {
                    input.addEventListener('keyup', function () {
                      const columnIndex = this.dataset.column;
                      const filterValue = this.value.toLowerCase();
                      const table = document.getElementById('contracts-table');
                      const rows = table.getElementsByTagName('tr');

                      for (let i = 1; i < rows.length; i++) {
                        const cell = rows[i].getElementsByTagName('td')[columnIndex];
                        if (cell) {
                          const text = cell.textContent || cell.innerText;
                          if (text.toLowerCase().indexOf(filterValue) > -1) {
                            rows[i].style.display = '';
                          } else {
                            rows[i].style.display = 'none';
                          }
                        }
                      }
                    });
                  });
                });

                function resetFilters() {
                  document.querySelectorAll('.filter-input').forEach(input => {
                    input.value = '';
                  });

                  const rows = document.querySelectorAll('#contracts-table tbody tr');
                  rows.forEach(row => {
                    row.style.display = '';
                  });
                }

                function viewContract(id) {
                  // Implement view functionality
                  console.log('View contract:', id);
                }

                function editContract(id) {
                  // Implement edit functionality
                  console.log('Edit contract:', id);
                }
              </script>
            </body>

            </html>