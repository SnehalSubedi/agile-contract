<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        .profile-container {
            max-width: 800px;
            margin: 2rem auto;
            padding: 2rem;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }

        .profile-header {
            display: flex;
            align-items: center;
            margin-bottom: 2rem;
        }

        .profile-avatar {
            position: relative;
            width: 120px;
            height: 120px;
            border-radius: 50%;
            overflow: hidden;
            margin-right: 2rem;
            background-color: #f0f0f0;
        }

        .profile-avatar img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .profile-avatar-edit {
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            background: rgba(0, 0, 0, 0.5);
            color: white;
            text-align: center;
            padding: 5px;
            cursor: pointer;
        }

        .profile-info h2 {
            margin: 0;
            color: #333;
        }

        .profile-info p {
            margin: 0.5rem 0;
            color: #666;
        }

        .profile-details {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 1.5rem;
        }

        .detail-card {
            background: #f9f9f9;
            padding: 1.5rem;
            border-radius: 8px;
        }

        .detail-card h3 {
            margin-top: 0;
            color: #444;
            border-bottom: 1px solid #eee;
            padding-bottom: 0.5rem;
        }

        .detail-item {
            margin: 1rem 0;
        }

        .detail-item strong {
            display: block;
            color: #555;
            margin-bottom: 0.3rem;
        }

        .detail-item span {
            color: #333;
        }

        .edit-btn {
            background: #4CAF50;
            color: white;
            border: none;
            padding: 0.5rem 1rem;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 1rem;
        }

        .edit-btn:hover {
            background: #45a049;
        }

        /* Modal Styles */
        .modal {
            display: none;
            position: fixed;
            z-index: 1000;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.4);
        }

        .modal-content {
            background-color: #fefefe;
            margin: 5% auto;
            padding: 2rem;
            border-radius: 8px;
            width: 50%;
            max-width: 600px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
        }

        .modal-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid #eee;
            padding-bottom: 1rem;
            margin-bottom: 1rem;
        }

        .modal-header h2 {
            margin: 0;
        }

        .close-btn {
            background: none;
            border: none;
            font-size: 1.5rem;
            cursor: pointer;
            color: #aaa;
        }

        .close-btn:hover {
            color: #333;
        }

        .form-group {
            margin-bottom: 1rem;
        }

        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: bold;
        }

        .form-group input,
        .form-group textarea,
        .form-group select {
            width: 100%;
            padding: 0.5rem;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .modal-footer {
            display: flex;
            justify-content: flex-end;
            margin-top: 1rem;
        }

        .save-btn {
            background: #4CAF50;
            color: white;
            border: none;
            padding: 0.5rem 1rem;
            border-radius: 4px;
            cursor: pointer;
        }

        .save-btn:hover {
            background: #45a049;
        }

        .cancel-btn {
            background: #f44336;
            color: white;
            border: none;
            padding: 0.5rem 1rem;
            border-radius: 4px;
            cursor: pointer;
            margin-right: 1rem;
        }

        .cancel-btn:hover {
            background: #d32f2f;
        }

        .alert {
            padding: 1rem;
            margin-bottom: 1rem;
            border-radius: 4px;
        }

        .alert-success {
            background-color: #dff0d8;
            color: #3c763d;
        }

        .alert-error {
            background-color: #f2dede;
            color: #a94442;
        }

        /* Root Variables */
        :root {
            --primary: #4CAF50;
            --dark: #333333;
            --gray: #666666;
            --light-gray: #f6f9fc;
            --border-color: #eee;
        }

        /* General Styling */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            color: var(--dark);
            background-color: var(--light-gray);
            margin: 0;
            padding: 0;
        }

        /* Hero Section */
        .hero {
            background: linear-gradient(135deg, #f6f9fc 0%, #edf2f7 100%);
            padding: 160px 0 100px;
            position: relative;
            overflow: hidden;
            text-align: center;
            margin-bottom: 2rem;
        }

        .hero-content {
            display: flex;
            align-items: center;
            position: relative;
            z-index: 2;
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }

        .hero-text {
            flex: 1;
            max-width: 600px;
        }

        .hero-title {
            font-size: 48px;
            font-weight: 700;
            margin-bottom: 20px;
            line-height: 1.2;
            color: var(--dark);
        }

        .hero-title span {
            color: var(--primary);
        }

        .hero-subtitle {
            font-size: 18px;
            color: var(--gray);
            margin-bottom: 30px;
        }

        /* Profile Container */
        .profile-container {
            max-width: 800px;
            margin: 2rem auto;
            padding: 2rem;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        }

        /* Profile Header */
        .profile-header {
            display: flex;
            align-items: center;
            margin-bottom: 2rem;
        }

        .profile-avatar {
            position: relative;
            width: 120px;
            height: 120px;
            border-radius: 50%;
            overflow: hidden;
            margin-right: 2rem;
            background-color: #f0f0f0;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        .profile-avatar img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .profile-avatar-edit {
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            background: rgba(0, 0, 0, 0.5);
            color: white;
            text-align: center;
            padding: 5px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .profile-avatar-edit:hover {
            background: rgba(76, 175, 80, 0.7);
        }

        .profile-info h2 {
            margin: 0;
            color: var(--dark);
            font-size: 28px;
        }

        .profile-info p {
            margin: 0.5rem 0;
            color: var(--gray);
        }

        /* Profile Details */
        .profile-details {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 1.5rem;
        }

        .detail-card {
            background: #f9f9fc;
            padding: 1.5rem;
            border-radius: 8px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .detail-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
        }

        .detail-card h3 {
            margin-top: 0;
            color: var(--dark);
            border-bottom: 1px solid var(--border-color);
            padding-bottom: 0.8rem;
            font-size: 22px;
        }

        .detail-item {
            margin: 1rem 0;
        }

        .detail-item strong {
            display: block;
            color: var(--gray);
            margin-bottom: 0.3rem;
            font-size: 14px;
        }

        .detail-item span {
            color: var(--dark);
            font-size: 16px;
        }

        /* Buttons */
        .edit-btn {
            background: var(--primary);
            color: white;
            border: none;
            padding: 10px 24px;
            border-radius: 30px;
            cursor: pointer;
            margin-top: 1rem;
            font-weight: 600;
            transition: background 0.3s ease, transform 0.2s ease;
            box-shadow: 0 4px 10px rgba(76, 175, 80, 0.2);
        }

        .edit-btn:hover {
            background: #45a049;
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(76, 175, 80, 0.3);
        }

        /* Modal Styles */
        .modal {
            display: none;
            position: fixed;
            z-index: 1000;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.5);
            backdrop-filter: blur(5px);
        }

        .modal-content {
            background-color: #fefefe;
            margin: 5% auto;
            padding: 2rem;
            border-radius: 10px;
            width: 50%;
            max-width: 600px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
            transform: translateY(0);
            animation: modalFade 0.3s ease;
        }

        @keyframes modalFade {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }

            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .modal-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid var(--border-color);
            padding-bottom: 1rem;
            margin-bottom: 1.5rem;
        }

        .modal-header h2 {
            margin: 0;
            color: var(--dark);
        }

        .close-btn {
            background: none;
            border: none;
            font-size: 1.5rem;
            cursor: pointer;
            color: #aaa;
            transition: color 0.3s ease;
        }

        .close-btn:hover {
            color: var(--dark);
        }

        /* Form Styles */
        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 600;
            color: var(--dark);
        }

        .form-group input,
        .form-group textarea,
        .form-group select {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 16px;
            transition: border 0.3s ease, box-shadow 0.3s ease;
        }

        .form-group input:focus,
        .form-group textarea:focus,
        .form-group select:focus {
            outline: none;
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(76, 175, 80, 0.2);
        }

        .modal-footer {
            display: flex;
            justify-content: flex-end;
            margin-top: 1.5rem;
        }

        .save-btn {
            background: var(--primary);
            color: white;
            border: none;
            padding: 12px 24px;
            border-radius: 30px;
            cursor: pointer;
            font-weight: 600;
            transition: background 0.3s ease, transform 0.2s ease;
            box-shadow: 0 4px 10px rgba(76, 175, 80, 0.2);
        }

        .save-btn:hover {
            background: #45a049;
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(76, 175, 80, 0.3);
        }

        .cancel-btn {
            background: #f44336;
            color: white;
            border: none;
            padding: 12px 24px;
            border-radius: 30px;
            cursor: pointer;
            margin-right: 1rem;
            font-weight: 600;
            transition: background 0.3s ease, transform 0.2s ease;
            box-shadow: 0 4px 10px rgba(244, 67, 54, 0.2);
        }

        .cancel-btn:hover {
            background: #d32f2f;
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(244, 67, 54, 0.3);
        }

        /* Alert Styles */
        .alert {
            padding: 1rem;
            margin-bottom: 1.5rem;
            border-radius: 8px;
            animation: alertFade 0.5s ease;
        }

        @keyframes alertFade {
            from {
                opacity: 0;
                transform: translateY(-10px);
            }

            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .alert-success {
            background-color: rgba(76, 175, 80, 0.1);
            color: #2e7d32;
            border-left: 4px solid var(--primary);
        }

        .alert-error {
            background-color: rgba(244, 67, 54, 0.1);
            color: #c62828;
            border-left: 4px solid #f44336;
        }

        /* Header styling - Optional but matches theme */
        header {
            background-color: white;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 100;
        }

        .header-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 0;
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }

        /* Responsive Styles */
        @media (max-width: 768px) {
            .profile-header {
                flex-direction: column;
                text-align: center;
            }

            .profile-avatar {
                margin-right: 0;
                margin-bottom: 1.5rem;
            }

            .profile-details {
                grid-template-columns: 1fr;
            }

            .modal-content {
                width: 90%;
                padding: 1.5rem;
            }

            .hero-title {
                font-size: 36px;
            }
        }

        /* Features Section */
        .features {
            padding: 100px 0;
            background-color: white;
        }

        .section-header {
            text-align: center;
            margin-bottom: 60px;
        }

        .section-title {
            font-size: 36px;
            font-weight: 700;
            margin-bottom: 15px;
            color: var(--dark);
        }

        .section-subtitle {
            font-size: 18px;
            color: var(--gray);
            max-width: 600px;
            margin: 0 auto;
        }

        /* Button Styles */
        .btn {
            display: inline-block;
            padding: 10px 20px;
            border-radius: 30px;
            text-decoration: none;
            transition: all 0.3s ease;
            font-weight: 600;
        }

        .btn-primary {
            background-color: var(--primary);
            color: white;
            box-shadow: 0 4px 10px rgba(76, 175, 80, 0.2);
        }

        .btn-primary:hover {
            background: #45a049;
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(76, 175, 80, 0.3);
        }

        .btn-outline {
            border: 2px solid var(--primary);
            color: var(--primary);
        }

        .btn-outline:hover {
            background-color: var(--primary);
            color: white;
        }

        .btn-large {
            padding: 14px 28px;
            font-size: 16px;
        }
    </style>
</head>

<body>
    <br><br><br>
    <%@ include file="header.jsp" %>

        <div class="profile-container">
            <% if (request.getAttribute("success") !=null) { %>
                <div class="alert alert-success">
                    <%= request.getAttribute("success") %>
                </div>
                <% } %>

                    <% if (request.getAttribute("error") !=null) { %>
                        <div class="alert alert-error">
                            <%= request.getAttribute("error") %>
                        </div>
                        <% } %>

                            <br>
                            <div class="profile-header">
                                <div class="profile-avatar">
                                    <c:choose>
                                        <c:when test="${not empty user.imagePath}">
                                            <img src="${pageContext.request.contextPath}/resources/uploads/${user.imagePath}"
                                                alt="Profile Image">
                                        </c:when>
                                        <c:otherwise>
                                            <div
                                                style="display: flex; align-items: center; justify-content: center; height: 100%; font-size: 3rem; color: #555;">
                                                ${user.fullName.substring(0,1)}
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                    <div class="profile-avatar-edit" onclick="openImageModal()">
                                        <i class="fas fa-camera"></i> Change Photo
                                    </div>
                                </div>
                                <div class="profile-info">
                                    <h2>${user.fullName}</h2>
                                    <p><i class="fas fa-user-tag"></i> ${user.role}</p>
                                    <p><i class="fas fa-envelope"></i> ${user.email}</p>
                                    <button class="edit-btn" onclick="openEditModal()">
                                        <i class="fas fa-edit"></i> Edit Profile
                                    </button>
                                </div>
                            </div>

                            <div class="profile-details">
                                <div class="detail-card">
                                    <h3>Personal Information</h3>
                                    <div class="detail-item">
                                        <strong>Username</strong>
                                        <span>${user.username}</span>
                                    </div>
                                    <div class="detail-item">
                                        <strong>Full Name</strong>
                                        <span>${user.fullName}</span>
                                    </div>
                                    <div class="detail-item">
                                        <strong>Email</strong>
                                        <span>${user.email}</span>
                                    </div>
                                </div>

                                <div class="detail-card">
                                    <h3>Additional Information</h3>
                                    <div class="detail-item">
                                        <strong>Contact Number</strong>
                                        <span>${not empty user.contactNumber ? user.contactNumber : 'Not
                                            specified'}</span>
                                    </div>
                                </div>
                            </div>
        </div>

        <!-- Edit Profile Modal -->
        <div id="editModal" class="modal">
            <div class="modal-content">
                <div class="modal-header">
                    <h2>Edit Profile</h2>
                    <button class="close-btn" onclick="closeEditModal()">&times;</button>
                </div>
                <form action="${pageContext.request.contextPath}/profile" method="post">
                    <input type="hidden" name="action" value="updateProfile">

                    <div class="form-group">
                        <label for="fullName">Full Name</label>
                        <input type="text" id="fullName" name="fullName" value="${user.fullName}" required>
                    </div>

                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" id="email" name="email" value="${user.email}" required>
                    </div>

                    <div class="form-group">
                        <label for="contactNumber">Contact Number</label>
                        <input type="text" id="contactNumber" name="contactNumber" value="${user.contactNumber}">
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="cancel-btn" onclick="closeEditModal()">Cancel</button>
                        <button type="submit" class="save-btn">Save Changes</button>
                    </div>
                </form>
            </div>
        </div>

        <!-- Change Image Modal -->
        <div id="imageModal" class="modal">
            <div class="modal-content">
                <div class="modal-header">
                    <h2>Change Profile Picture</h2>
                    <button class="close-btn" onclick="closeImageModal()">&times;</button>
                </div>
                <form action="${pageContext.request.contextPath}/profile" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="action" value="updateImage">

                    <div class="form-group">
                        <label for="profileImage">Select Image</label>
                        <input type="file" id="profileImage" name="profileImage" accept="image/*" required>
                        <p style="font-size: 0.8rem; color: #666;">Recommended size: 500x500 pixels</p>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="cancel-btn" onclick="closeImageModal()">Cancel</button>
                        <button type="submit" class="save-btn">Upload Image</button>
                    </div>
                </form>
            </div>
        </div>

        <script>
            // Edit Profile Modal Functions
            function openEditModal() {
                document.getElementById('editModal').style.display = 'block';
            }

            function closeEditModal() {
                document.getElementById('editModal').style.display = 'none';
            }

            // Image Modal Functions
            function openImageModal() {
                document.getElementById('imageModal').style.display = 'block';
            }

            function closeImageModal() {
                document.getElementById('imageModal').style.display = 'none';
            }

            // Close modals when clicking outside
            window.onclick = function (event) {
                if (event.target == document.getElementById('editModal')) {
                    closeEditModal();
                }
                if (event.target == document.getElementById('imageModal')) {
                    closeImageModal();
                }
            }
        </script>
</body>

</html>