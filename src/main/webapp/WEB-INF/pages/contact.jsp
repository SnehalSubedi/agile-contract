<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Contact Us | Agile Contracts</title>
  <style>
    :root {
      --primary: #3498db;
      --primary-dark: #2980b9;
      --secondary: #2c3e50;
      --light: #ecf0f1;
      --gray: #95a5a6;
      --success: #2ecc71;
    }

    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    body {
      background-color: #f9f9f9;
      color: #333;
      line-height: 1.6;
    }


    .hero {
      background-color: var(--primary);
      color: white;
      padding: 4rem 0;
      text-align: center;
    }

    .hero h1 {
      font-size: 2.5rem;
      margin-bottom: 1rem;
    }

    .hero p {
      font-size: 1.2rem;
      max-width: 800px;
      margin: 0 auto;
    }

    .contact-container {
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 3rem;
      padding: 4rem 0;
    }

    .contact-info {
      display: flex;
      flex-direction: column;
      gap: 2rem;
    }

    .info-item {
      display: flex;
      align-items: flex-start;
      gap: 1rem;
    }

    .info-icon {
      background-color: var(--primary);
      color: white;
      width: 40px;
      height: 40px;
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      flex-shrink: 0;
    }

    .info-text h3 {
      color: var(--secondary);
      margin-bottom: 0.5rem;
    }

    .social-links {
      display: flex;
      gap: 1rem;
      margin-top: 2rem;
    }

    .social-link {
      background-color: var(--gray);
      color: white;
      width: 40px;
      height: 40px;
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      text-decoration: none;
      transition: background-color 0.3s;
    }

    .social-link:hover {
      background-color: var(--primary);
    }

    .contact-form {
      background-color: white;
      padding: 2rem;
      border-radius: 8px;
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
    }

    .form-group {
      margin-bottom: 1.5rem;
    }

    .form-group label {
      display: block;
      margin-bottom: 0.5rem;
      color: var(--secondary);
      font-weight: 500;
    }

    .form-control {
      width: 100%;
      padding: 0.75rem;
      border: 1px solid #ddd;
      border-radius: 4px;
      font-size: 1rem;
    }

    textarea.form-control {
      min-height: 150px;
      resize: vertical;
    }

    .form-control:focus {
      outline: none;
      border-color: var(--primary);
      box-shadow: 0 0 0 2px rgba(52, 152, 219, 0.2);
    }

    .btn {
      display: inline-block;
      background-color: var(--primary);
      color: white;
      padding: 0.75rem 1.5rem;
      border: none;
      border-radius: 4px;
      font-size: 1rem;
      cursor: pointer;
      transition: background-color 0.3s;
    }

    .btn:hover {
      background-color: var(--primary-dark);
    }

    .map-container {
      margin-top: 4rem;
      border-radius: 8px;
      overflow: hidden;
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
      height: 400px;
    }

    footer {
      background-color: var(--secondary);
      color: white;
      padding: 2rem 0;
      margin-top: 4rem;
    }

    .footer-content {
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    .footer-links {
      display: flex;
      list-style: none;
      gap: 1.5rem;
    }

    .footer-links a {
      color: white;
      text-decoration: none;
      transition: color 0.3s;
    }

    .footer-links a:hover {
      color: var(--primary);
    }

    .copyright {
      margin-top: 1rem;
      text-align: center;
      color: var(--gray);
      font-size: 0.9rem;
    }

    /* Responsive styles */
    @media (max-width: 768px) {
      .contact-container {
        grid-template-columns: 1fr;
      }

      .nav-links {
        display: none;
      }
    }
  </style>
</head>

<body>
  <%@ include file="header.jsp" %>

    <!-- Hero Section -->
    <section class="hero">
      <div class="container">
        <h1>Get in Touch</h1>
        <p>We're here to answer any questions you may have about our agile contract services. Reach out to us and we'll
          respond as soon as possible.</p>
      </div>
    </section>

    <!-- Contact Section -->
    <section class="container">
      <div class="contact-container">
        <div class="contact-info">
          <h2>Contact Information</h2>
          <p>Feel free to reach out to us using any of the following methods. Our team is ready to assist you.</p>

          <div class="info-item">
            <div class="info-icon">
              <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none"
                stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <path
                  d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z">
                </path>
              </svg>
            </div>
            <div class="info-text">
              <h3>Phone</h3>
              <p>+1 (555) 123-4567</p>
            </div>
          </div>

          <div class="info-item">
            <div class="info-icon">
              <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none"
                stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path>
                <polyline points="22,6 12,13 2,6"></polyline>
              </svg>
            </div>
            <div class="info-text">
              <h3>Email</h3>
              <p>info@agilecontracts.com</p>
            </div>
          </div>

          <div class="info-item">
            <div class="info-icon">
              <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none"
                stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path>
                <circle cx="12" cy="10" r="3"></circle>
              </svg>
            </div>
            <div class="info-text">
              <h3>Office</h3>
              <p>123 Business Avenue, Suite 500<br>San Francisco, CA 94107</p>
            </div>
          </div>

          <div class="info-item">
            <div class="info-icon">
              <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none"
                stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <circle cx="12" cy="12" r="10"></circle>
                <polyline points="12 6 12 12 16 14"></polyline>
              </svg>
            </div>
            <div class="info-text">
              <h3>Business Hours</h3>
              <p>Monday - Friday: 9:00 AM - 5:00 PM<br>Saturday & Sunday: Closed</p>
            </div>
          </div>

          <div class="social-links">
            <a href="#" class="social-link">
              <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none"
                stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <path d="M18 2h-3a5 5 0 0 0-5 5v3H7v4h3v8h4v-8h3l1-4h-4V7a1 1 0 0 1 1-1h3z"></path>
              </svg>
            </a>
            <a href="#" class="social-link">
              <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none"
                stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <path
                  d="M23 3a10.9 10.9 0 0 1-3.14 1.53 4.48 4.48 0 0 0-7.86 3v1A10.66 10.66 0 0 1 3 4s-4 9 5 13a11.64 11.64 0 0 1-7 2c9 5 20 0 20-11.5a4.5 4.5 0 0 0-.08-.83A7.72 7.72 0 0 0 23 3z">
                </path>
              </svg>
            </a>
            <a href="#" class="social-link">
              <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none"
                stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <path d="M16 8a6 6 0 0 1 6 6v7h-4v-7a2 2 0 0 0-2-2 2 2 0 0 0-2 2v7h-4v-7a6 6 0 0 1 6-6z"></path>
                <rect x="2" y="9" width="4" height="12"></rect>
                <circle cx="4" cy="4" r="2"></circle>
              </svg>
            </a>
            <a href="#" class="social-link">
              <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none"
                stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <rect x="2" y="2" width="20" height="20" rx="5" ry="5"></rect>
                <path d="M16 11.37A4 4 0 1 1 12.63 8 4 4 0 0 1 16 11.37z"></path>
                <line x1="17.5" y1="6.5" x2="17.51" y2="6.5"></line>
              </svg>
            </a>
          </div>
        </div>

        <div class="contact-form">
          <h2>Send a Message</h2>
          <p>Have a question or want to work with us? Fill out the form below.</p>

          <form action="#" method="POST">
            <div class="form-group">
              <label for="name">Full Name</label>
              <input type="text" id="name" name="name" class="form-control" placeholder="Your full name" required>
            </div>

            <div class="form-group">
              <label for="email">Email Address</label>
              <input type="email" id="email" name="email" class="form-control" placeholder="Your email address"
                required>
            </div>

            <div class="form-group">
              <label for="phone">Phone Number</label>
              <input type="tel" id="phone" name="phone" class="form-control" placeholder="Your phone number">
            </div>

            <div class="form-group">
              <label for="subject">Subject</label>
              <input type="text" id="subject" name="subject" class="form-control" placeholder="What is this regarding?">
            </div>

            <div class="form-group">
              <label for="message">Message</label>
              <textarea id="message" name="message" class="form-control" placeholder="Your message" required></textarea>
            </div>

            <button type="submit" class="btn">Send Message</button>
          </form>
        </div>
      </div>

      <!-- Map Section -->
      <div class="map-container">
        <img src="/api/placeholder/1200/400" alt="Map location of Agile Contracts office"
          style="width: 100%; height: 100%; object-fit: cover;">
      </div>
    </section>

    <!-- Footer -->
    <footer>
      <div class="container">
        <div class="footer-content">
          <div class="logo">Agile<span>Contracts</span></div>
          <ul class="footer-links">
            <li><a href="#">Privacy Policy</a></li>
            <li><a href="#">Terms of Service</a></li>
            <li><a href="#">FAQ</a></li>
            <li><a href="#">Careers</a></li>
          </ul>
        </div>
        <div class="copyright">
          &copy; 2025 Agile Contracts. All rights reserved.
        </div>
      </div>
    </footer>
</body>

</html>