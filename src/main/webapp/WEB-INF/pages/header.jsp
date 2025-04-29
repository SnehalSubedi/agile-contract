<%@ page contentType="text/html;charset=UTF-8" language="java" %>

    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Agile Contracts</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css" />

    </head>

    <body>
        <!-- Header & Navigation -->
        <header>
            <div class="container header-container">
                <a href="${pageContext.request.contextPath}/" class="logo">
                    <i class="fas fa-file-contract"></i>
                    <span>Agile Contracts</span>
                </a>

                <nav>
                    <ul class="nav-menu" id="navMenu">
                        <li><a href="${pageContext.request.contextPath}/">Home</a></li>
                        <li>
                            <% String role=(String) session.getAttribute("role"); if ("Admin".equals(role)) { %>
                                <a href="<%= request.getContextPath() %>/Admin-Dashboard">
                                    <i class="fas fa-tachometer-alt"></i> Admin Dashboard
                                </a>
                                <% } else { %>
                                    <a href="<%= request.getContextPath() %>/userdashboard">
                                        <i class="fas fa-tachometer-alt"></i> User Dashboard
                                    </a>
                                    <% } %>
                        </li>
                        <li><a href="${pageContext.request.contextPath}/about">About Us</a></li>
                        <li><a href="${pageContext.request.contextPath}/contact">Contact Us</a></li>

                    </ul>
                </nav>
                <!-- USER DROPDOWN IF LOGGED IN -->
                <c:if test="${not empty user}">
                    <div class="user-dropdown">
                        <button class="user-btn" aria-expanded="false" aria-controls="userDropdownMenu">
                            <div class="user-avatar">
                                <c:choose>
                                    <c:when test="${not empty user.imagePath}">
                                        <img src="${pageContext.request.contextPath}/resources/uploads/${user.imagePath}"
                                            alt="Profile" class="user-avatar-img"
                                            onerror="this.onerror=null;this.parentElement.textContent='${user.fullName.substring(0,1)}'" />
                                    </c:when>

                                </c:choose>
                            </div>
                            <span class="user-name">${user.fullName}</span>
                            <i class="fas fa-chevron-down"></i>
                        </button>

                        <div class="dropdown-content" id="userDropdownMenu">
                            <a href="${pageContext.request.contextPath}/profile">
                                <i class="fas fa-user"></i> My Profile
                            </a>

                            <% if ("Admin".equals(role)) { %>
                                <a href="<%= request.getContextPath() %>/Admin-Dashboard">
                                    <i class="fas fa-tachometer-alt"></i> Admin Dashboard
                                </a>
                                <% } else { %>
                                    <a href="<%= request.getContextPath() %>/userdashboard">
                                        <i class="fas fa-tachometer-alt"></i> User Dashboard
                                    </a>
                                    <% } %>


                                        <a href="${pageContext.request.contextPath}/settings">
                                            <i class="fas fa-cog"></i> Settings
                                        </a>
                                        <div class="divider"></div>
                                        <a href="${pageContext.request.contextPath}/logout">
                                            <i class="fas fa-sign-out-alt"></i> Logout
                                        </a>
                        </div>
                    </div>
                </c:if>




                <button class="mobile-menu-btn" id="mobileMenuBtn">
                    <i class="fas fa-bars"></i>
                </button>
            </div>
        </header>

        <script>
            document.addEventListener('DOMContentLoaded', function () {
                const mobileMenuBtn = document.getElementById('mobileMenuBtn');
                const navMenu = document.getElementById('navMenu');
                const navButtons = document.getElementById('navButtons');
                const userBtn = document.querySelector('.user-btn');
                const dropdownMenu = document.querySelector('.dropdown-content');

                if (mobileMenuBtn && navMenu) {
                    mobileMenuBtn.addEventListener('click', function (e) {
                        e.stopPropagation();
                        navMenu.classList.toggle('active');
                        if (navButtons) navButtons.classList.toggle('active');
                        const isExpanded = mobileMenuBtn.getAttribute('aria-expanded') === 'true';
                        mobileMenuBtn.setAttribute('aria-expanded', !isExpanded);
                        mobileMenuBtn.querySelector('i').classList.toggle('fa-bars');
                        mobileMenuBtn.querySelector('i').classList.toggle('fa-times');
                    });
                }

                if (userBtn && dropdownMenu) {
                    userBtn.addEventListener('click', function (e) {
                        e.stopPropagation();
                        const isExpanded = userBtn.getAttribute('aria-expanded') === 'true';
                        userBtn.setAttribute('aria-expanded', !isExpanded);
                        dropdownMenu.style.display = isExpanded ? 'none' : 'block';
                    });
                }

                // Close menus when clicking outside
                document.addEventListener('click', function (event) {
                    if (navMenu && navMenu.classList.contains('active') &&
                        !navMenu.contains(event.target) &&
                        event.target !== mobileMenuBtn) {
                        navMenu.classList.remove('active');
                        if (navButtons) navButtons.classList.remove('active');
                        if (mobileMenuBtn) {
                            mobileMenuBtn.setAttribute('aria-expanded', 'false');
                            mobileMenuBtn.querySelector('i').classList.add('fa-bars');
                            mobileMenuBtn.querySelector('i').classList.remove('fa-times');
                        }
                    }

                    if (dropdownMenu && dropdownMenu.style.display === 'block' &&
                        !dropdownMenu.contains(event.target) &&
                        event.target !== userBtn && !userBtn.contains(event.target)) {
                        dropdownMenu.style.display = 'none';
                        if (userBtn) userBtn.setAttribute('aria-expanded', 'false');
                    }
                });

                // Handle image loading errors
                document.querySelectorAll('.user-avatar-img').forEach(img => {
                    img.onerror = function () {
                        const parent = this.parentElement;
                        const userName = parent.nextElementSibling?.textContent || '';
                        parent.textContent = userName.trim().substring(0, 1).toUpperCase();
                    };
                });
            });
        </script>
    </body>

    </html>