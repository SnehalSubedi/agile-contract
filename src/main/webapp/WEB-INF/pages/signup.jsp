<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Agile Contracts - Sign Up</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/register.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/footer.css" />
</head>

<body>
    <%-- <%@ include file="header.jsp" %> --%>

    <div class="container">
        <div class="sidebar">
            <img src="${pageContext.request.contextPath}/resources/images/logo.png" alt="Agile Contracts Logo"
                class="sidebar-image">
        </div>
        <div class="signup-form">
            <h1>JOIN AGILE CONTRACTS</h1>
            <p>Signup and start managing your contracts!</p>

            <c:if test="${not empty sessionScope.signuperror}">
                <div class="error-message">
                    ${signuperror}
                </div>
            </c:if>
            <!-- This div will be used for client-side validation messages -->
            <div id="validationError" class="error-message" style="display: none;"></div>

            <form action="${pageContext.request.contextPath}/register" method="POST" enctype="multipart/form-data" onsubmit="return validateForm()" novalidate>
                <!-- Image Preview -->
                <div class="image-preview-container">
                    <img id="preview" class="image-preview"
                        src="${pageContext.request.contextPath}/images/system/default_user.png"
                        alt="Profile Image Preview" />
                </div>

                <!-- Upload Image -->
                <div class="form-group">
                    <label for="profileImage">UPLOAD PROFILE IMAGE</label>
                    <input type="file" id="profileImage" name="profileImage" accept="image/*"
                        onchange="previewImage(event)" required>
                </div>

                <div class="form-group">
                    <label for="username">USER NAME (Unique, max 15 letters)</label>
                    <input type="text" id="username" name="username" placeholder="myname"
                        pattern="^[A-Za-z]{1,15}$" 
                        title="Only letters allowed. Maximum 15 characters. No numbers or special characters." required>
                </div>

                <div class="form-group">
                    <label for="fullname">FULL NAME (1-3 words, letters only)</label>
                    <input type="text" id="fullname" name="fullname" placeholder="e.g. Jiara Martins" 
                        pattern="^[A-Za-z]+(?: [A-Za-z]+){0,2}$" 
                        title="1-3 words with letters only. No numbers or special characters." required>
                </div>

                <div class="form-group">
                    <label for="email">EMAIL</label>
                    <input type="email" id="email" name="email" placeholder="e.g. hello@reallygreatsite.com" required>
                </div>

                <div class="form-group">
                    <label for="password">PASSWORD (minimum 7 characters)</label>
                    <input type="password" id="password" name="password" minlength="7" required>
                </div>

                <div class="form-group">
                    <label for="contact">PHONE (must start with 97 or 98, 10 digits)</label>
                    <input type="text" id="contact" name="contact" placeholder="e.g. 9800000000"
                        pattern="^(97|98)[0-9]{8}$" title="Must start with 97 or 98 and be 10 digits long" required>
                </div>

                <button type="submit" class="signup-button">SIGN UP</button>
            </form>

            <p class="login-link">Already have an account?
                <a href="${pageContext.request.contextPath}/login">Login here</a>
            </p>
        </div>
    </div>

    <%-- <%@ include file="footer.jsp" %> --%>

    <!-- JavaScript for validation and image preview -->
    <script>
        function previewImage(event) {
            const reader = new FileReader();
            reader.onload = function () {
                const output = document.getElementById('preview');
                output.src = reader.result;
            };
            reader.readAsDataURL(event.target.files[0]);
        }

        function showError(message) {
            // Use the validation error div
            const errorDiv = document.getElementById('validationError');
            errorDiv.textContent = message;
            errorDiv.style.display = 'block';
            
            // Scroll to the error message
            errorDiv.scrollIntoView({ behavior: 'smooth', block: 'center' });
        }

        function clearErrors() {
            const errorDiv = document.getElementById('validationError');
            errorDiv.style.display = 'none';
        }

        function validateForm() {
            clearErrors();
            
            // Username validation
            const username = document.getElementById('username').value;
            if (username.length > 15) {
                showError("Username must be maximum 15 characters");
                return false;
            }

            // Password validation
            const password = document.getElementById('password').value;
            if (password.length <= 6) {
                showError("Password must be greater than 6 characters");
                return false;
            }

            // Full name validation
            const fullname = document.getElementById('fullname').value.trim();
            const nameWords = fullname.split(" ").filter(word => word.length > 0);
            if (nameWords.length < 1 || nameWords.length > 3) {
                showError("Full name must have between 1 and 3 words");
                return false;
            }
            
            const nameRegex = /^[A-Za-z]+(?: [A-Za-z]+){0,2}$/;
            if (!nameRegex.test(fullname)) {
                showError("Full name must contain only letters with no numbers or special characters");
                return false;
            }

            // Phone validation (redundant as pattern already checks this, but added for completeness)
            const phone = document.getElementById('contact').value;
            const phoneRegex = /^(97|98)[0-9]{8}$/;
            if (!phoneRegex.test(phone)) {
                showError("Phone number must start with 97 or 98 and be exactly 10 digits");
                return false;
            }

            return true;
        }
    </script>
</body>
</html>