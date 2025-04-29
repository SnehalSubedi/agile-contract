<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Agile Contracts - Login</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css" />
</head>

<body>
    <div class="container">
        <div class="sidebar">
            <img src="${pageContext.request.contextPath}/resources/images/logo.png" alt="Agile Contracts Logo"
                class="sidebar-image">
        </div>

        <div class="login-form">
            <h1>Welcome to Agile Contracts</h1>
            <p>Simplify, secure, succeed!</p>

            <% String error=(String) request.getAttribute("error"); if (error !=null && !error.isEmpty()) { %>
                <div class="error">
                    <%= error %>
                </div>
                <% } %>


                    <form action="${pageContext.request.contextPath}/login" method="post">
                        <label for="username">Username</label>
                        <input type="text" id="username" name="username" placeholder="Enter username" required />


                        <label for="password">Password</label>
                        <input type="password" id="password" name="password" placeholder="Enter password" required />

                        <button type="submit">Login</button>
                    </form>
        </div>
    </div>
</body>

</html>