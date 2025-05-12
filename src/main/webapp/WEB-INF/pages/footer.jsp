
<!-- Footer -->
<footer class="footer">
    <div class="footer-container">
        <div class="footer-about">
            <div class="footer-logo">
                <i class="fas fa-file-contract"></i> Agile Contracts
            </div>
            <p>Streamlining contract management for modern businesses. Our platform helps you negotiate, track, and manage contracts efficiently.</p>
            <div class="social-links">
                <a href="#" aria-label="Facebook"><i class="fab fa-facebook-f"></i></a>
                <a href="#" aria-label="Twitter"><i class="fab fa-twitter"></i></a>
                <a href="#" aria-label="LinkedIn"><i class="fab fa-linkedin-in"></i></a>
                <a href="#" aria-label="Instagram"><i class="fab fa-instagram"></i></a>
            </div>
        </div>
        
        <div class="footer-links">
            <h3>Navigation</h3>
            <ul>
                <li><a href="${pageContext.request.contextPath}/">Home</a></li>
                <li>
                    <c:choose>
                        <c:when test="${sessionScope.role eq 'Admin'}">
                            <a href="${pageContext.request.contextPath}/Admin-Dashboard">
                                <i class="fas fa-tachometer-alt"></i> Admin Dashboard
                            </a>
                        </c:when>
                        <c:otherwise>
                            <a href="${pageContext.request.contextPath}/userdashboard">
                                <i class="fas fa-tachometer-alt"></i> User Dashboard
                            </a>
                        </c:otherwise>
                    </c:choose>
                </li>
                <li><a href="${pageContext.request.contextPath}/about">About Us</a></li>
                <li><a href="${pageContext.request.contextPath}/contact">Contact Us</a></li>
                <li><a href="${pageContext.request.contextPath}/faq">FAQ</a></li>
                <li><a href="${pageContext.request.contextPath}/ourservices">Our Services</a></li>
            </ul>
        </div>
        
        <div class="footer-links">
            <h3>Account</h3>
            <ul>
                <c:if test="${not empty user}">
                    <li><a href="${pageContext.request.contextPath}/profile"><i class="fas fa-user"></i> My Profile</a></li>
                    <li><a href="${pageContext.request.contextPath}/settings"><i class="fas fa-cog"></i> Settings</a></li>
                    <li><a href="${pageContext.request.contextPath}/logout"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
                </c:if>
                <c:if test="${empty user}">
                    <li><a href="${pageContext.request.contextPath}/login"><i class="fas fa-sign-in-alt"></i> Login</a></li>
                    <li><a href="${pageContext.request.contextPath}/register"><i class="fas fa-user-plus"></i> Register</a></li>
                </c:if>
            </ul>
        </div>
        
        <div class="footer-contact">
            <h3>Contact Us</h3>
            <p><i class="fas fa-map-marker-alt"></i> 123 Business Ave, Suite 500, New York, NY 10001</p>
            <p><i class="fas fa-phone"></i> +1 (555) 123-4567</p>
            <p><i class="fas fa-envelope"></i> support@agilecontracts.com</p>
            <p><i class="fas fa-clock"></i> Mon-Fri: 9AM - 5PM</p>
        </div>
    </div>
    
    <div class="footer-bottom">
        <p>&copy; <jsp:useBean id="date" class="java.util.Date" /> 
        <fmt:formatDate value="${date}" pattern="yyyy" /> Agile Contracts. All rights reserved.</p>
    </div>
</footer>

<style>
    /* Footer Styles */
    .footer {
        background-color: #2c3e50;
        color: #ecf0f1;
        padding: 40px 0 20px;
        font-size: 14px;
        margin:0;
        
    }

    .footer-container {
        max-width: 1200px;
        margin: 0 auto;
        padding: 0 20px;
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
        gap: 30px;
    }

    .footer-logo {
        font-size: 24px;
        font-weight: 700;
        margin-bottom: 15px;
        color: #fff;
        display: flex;
        align-items: center;
        gap: 10px;
    }

    .footer-logo i {
        font-size: 28px;
        color: #4e73df;
    }

    .footer-about p {
        margin-bottom: 20px;
        line-height: 1.6;
    }

    .footer-links h3, 
    .footer-contact h3 {
        color: #fff;
        font-size: 18px;
        margin-bottom: 20px;
        position: relative;
        padding-bottom: 10px;
    }

    .footer-links h3::after,
    .footer-contact h3::after {
        content: '';
        position: absolute;
        left: 0;
        bottom: 0;
        width: 40px;
        height: 2px;
        background: #4e73df;
    }

    .footer-links ul {
        list-style: none;
        padding: 0;
    }

    .footer-links li {
        margin-bottom: 10px;
    }

    .footer-links a {
        color: #bdc3c7;
        text-decoration: none;
        transition: all 0.3s ease;
        display: flex;
        align-items: center;
        gap: 8px;
    }

    .footer-links a:hover {
        color: #4e73df;
        padding-left: 5px;
    }

    .footer-contact p {
        margin-bottom: 15px;
        display: flex;
        align-items: center;
    }

    .footer-contact i {
        margin-right: 10px;
        color: #4e73df;
        min-width: 20px;
    }

    .footer-bottom {
        text-align: center;
        padding-top: 20px;
        margin-top: 30px;
        border-top: 1px solid rgba(255, 255, 255, 0.1);
    }

    .social-links {
        display: flex;
        gap: 15px;
        margin-top: 20px;
    }

    .social-links a {
        color: #fff;
        background: rgba(255, 255, 255, 0.1);
        width: 36px;
        height: 36px;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        transition: all 0.3s ease;
    }

    .social-links a:hover {
        background: #4e73df;
        transform: translateY(-3px);
    }
</style>