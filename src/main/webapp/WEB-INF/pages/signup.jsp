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
                            ` ${signuperror}
                        </div>
                    </c:if>


                    <form action="${pageContext.request.contextPath}/register" method="POST"
                        enctype="multipart/form-data">
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
                            <label for="username">USER NAME (Unique)</label>
                            <input type="text" id="username" name="username" placeholder="myname" required>
                        </div>

                        <div class="form-group">
                            <label for="fullname">FULL NAME</label>
                            <input type="text" id="fullname" name="fullname" placeholder="e.g. Jiara Martins" required>
                        </div>

                        <div class="form-group">
                            <label for="email">EMAIL</label>
                            <input type="email" id="email" name="email" placeholder="e.g. hello@reallygreatsite.com"
                                required>
                        </div>

                        <div class="form-group">
                            <label for="password">PASSWORD</label>
                            <input type="password" id="password" name="password" required>
                        </div>

                        <div class="form-group">
                            <label for="contact">PHONE</label>
                            <input type="text" id="contact" name="contact" placeholder="e.g. 9800000000" required>
                        </div>

                        <button type="submit" class="signup-button">SIGN UP</button>
                    </form>

                    <p class="login-link">Already have an account?
                        <a href="${pageContext.request.contextPath}/login">Login here</a>
                    </p>
                </div>
            </div>

            <%-- <%@ include file="footer.jsp" %> --%>

                <!-- JavaScript to preview selected image -->
                <script>
                    function previewImage(event) {
                        const reader = new FileReader();
                        reader.onload = function () {
                            const output = document.getElementById('preview');
                            output.src = reader.result;
                        };
                        reader.readAsDataURL(event.target.files[0]);
                    }
                </script>
    </body>

    </html>