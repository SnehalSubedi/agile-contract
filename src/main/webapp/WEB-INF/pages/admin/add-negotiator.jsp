<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Add New Contract Negotiator</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link rel="stylesheet" href="../css/sidebar.css">
        <link rel="stylesheet" href="../css/sidebar.css">
        <link rel="stylesheet" href="css/sidebar.css">
        <link rel="stylesheet" href="css/admin-dashboard.css">

        <style>
            /* Base styles */
            :root {
                --primary: #4361ee;
                --secondary: #3a0ca3;
                --background: #f9fafb;
                --text: #333;
                --border: #e0e0e0;
                --sidebar-width: 240px;
            }

            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                margin: 0;
                padding: 0;
                background-color: var(--background);
                color: var(--text);
            }

            .container {
                display: flex;
                min-height: 100vh;
            }

            .main-content {
                flex: 1;
                padding: 20px 30px;
                margin-left: var(--sidebar-width);
            }

            .header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 20px;
            }

            .header-left h1 {
                font-size: 24px;
                font-weight: 600;
                color: #333;
                margin: 0;
            }

            /* Enhanced Form Styles */
            .form-section {
                background-color: white;
                padding: 32px;
                border-radius: 12px;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
                margin-top: 20px;
                max-width: 800px;
            }

            .form-section h2 {
                margin-bottom: 24px;
                font-size: 22px;
                color: #333;
                border-bottom: 1px solid var(--border);
                padding-bottom: 12px;
            }

            .form-group {
                margin-bottom: 24px;
            }

            .form-group label {
                font-weight: 600;
                display: block;
                margin-bottom: 10px;
                color: #444;
                font-size: 14px;
            }

            .form-group input,
            .form-group textarea,
            .form-group select {
                width: 100%;
                padding: 12px 14px;
                border-radius: 8px;
                border: 1px solid #ddd;
                font-size: 15px;
                transition: border 0.3s ease, box-shadow 0.3s ease;
            }

            .form-group input:focus,
            .form-group textarea:focus,
            .form-group select:focus {
                outline: none;
                border-color: var(--primary);
                box-shadow: 0 0 0 3px rgba(67, 97, 238, 0.15);
            }

            /* Form layout improvements */
            .form-row {
                display: flex;
                gap: 20px;
                margin-bottom: 0;
            }

            .form-col {
                flex: 1;
            }

            /* Create a two-column layout for certain form fields */
            .form-grid {
                display: grid;
                grid-template-columns: 1fr 1fr;
                gap: 20px;
            }

            /* Submit button styling */
            .form-group input[type="submit"] {
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
            }

            .form-group input[type="submit"]:hover {
                background-color: var(--secondary);
                transform: translateY(-2px);
            }

            .form-group input[type="submit"]:active {
                transform: translateY(0);
            }

            /* Status field styling */
            #status {
                background-color: white;
                cursor: pointer;
            }

            /* Field validation styles */
            .form-group input:invalid {
                border-color: #e74c3c;
            }

            /* Date fields styling */
            input[type="date"] {
                cursor: pointer;
            }

            /* Image preview styles */
            .image-preview-container {
                margin-top: 10px;
                display: flex;
                flex-direction: column;
                align-items: flex-start;
            }

            .image-preview {
                max-width: 200px;
                max-height: 200px;
                border-radius: 8px;
                border: 1px solid #ddd;
                display: none;
                object-fit: cover;
            }

            .file-input-container {
                position: relative;
                overflow: hidden;
                display: inline-block;
            }

            .file-input-label {
                background-color: #f0f0f0;
                color: #333;
                padding: 10px 15px;
                border-radius: 6px;
                cursor: pointer;
                display: inline-block;
                transition: background-color 0.3s;
                border: 1px solid #ddd;
            }

            .file-input-label:hover {
                background-color: #e0e0e0;
            }

            .file-input-label .fa-upload {
                margin-right: 8px;
            }

            .file-name {
                margin-top: 8px;
                font-size: 14px;
                color: #666;
                display: none;
            }
        </style>
    </head>

    <body>
        <div class="container">
            <!-- Sidebar (same as dashboard) -->
            <div class="sidebar">
                <div class="sidebar-header">
                    <h1>Agile Contracts</h1>
                </div>
                <ul class="sidebar-nav">
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
                        <h1>Add New Contract Negotiator</h1>
                    </div>
                </div>

                <div class="form-section">
                    <form action="/agile-contract/AddNegotiatorServlet" method="post" enctype="multipart/form-data">
                        <div class="form-group">
                            <label for="username">Username</label>
                            <input type="text" id="username" name="username" required>
                        </div>

                        <div class="form-group">
                            <label for="password">Password</label>
                            <input type="password" id="password" name="password" required>
                        </div>

                        <div class="form-group">
                            <label for="fullName">Full Name</label>
                            <input type="text" id="fullName" name="fullName" required>
                        </div>

                        <div class="form-group">
                            <label for="email">Email</label>
                            <input type="email" id="email" name="email" required>
                        </div>

                        <div class="form-group">
                            <label for="contactNumber">Contact Number</label>
                            <input type="text" id="contactNumber" name="contactNumber" required>
                        </div>

                        <!-- Enhanced Image Field with Preview -->
                        <div class="form-group">
                            <label for="image">Profile Image</label>
                            <div class="file-input-container">
                                <label for="image" class="file-input-label">
                                    <i class="fas fa-upload"></i> Choose File
                                </label>
                                <input type="file" id="image" name="image" accept="image/*" style="display: none;"
                                    onchange="previewImage(this);">
                            </div>
                            <div class="file-name" id="fileName"></div>
                            <div class="image-preview-container">
                                <img id="imagePreview" class="image-preview" alt="Image Preview">
                            </div>
                        </div>

                        <div class="form-group">
                            <input type="submit" value="Save Contract Negotiator">
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <script>
            function previewImage(input) {
                const preview = document.getElementById('imagePreview');
                const fileName = document.getElementById('fileName');

                if (input.files && input.files[0]) {
                    const reader = new FileReader();

                    reader.onload = function (e) {
                        preview.src = e.target.result;
                        preview.style.display = 'block';
                    }

                    reader.readAsDataURL(input.files[0]);

                    // Display file name
                    fileName.textContent = input.files[0].name;
                    fileName.style.display = 'block';
                } else {
                    preview.style.display = 'none';
                    fileName.style.display = 'none';
                }
            }
        </script>
    </body>

    </html>