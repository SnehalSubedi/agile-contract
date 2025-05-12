<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Our Services | Agile Contracts</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary: #4361ee;
            --primary-dark: #3a56d4;
            --secondary: #6c63ff;
            --accent: #4cc9f0;
            --light: #f8f9fa;
            --dark: #2d3748;
            --gray: #718096;
            --gray-light: #e2e8f0;
            --success: #48bb78;
            --warning: #f6ad55;
            --danger: #f56565;
            --transition: all 0.3s ease;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        html {
            scroll-behavior: smooth;
        }

        body {
            color: var(--dark);
            line-height: 1.6;
            overflow-x: hidden;
        }

        a {
            text-decoration: none;
            color: inherit;
        }

        ul {
            list-style: none;
        }

        .container {
            width: 100%;
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }

        /* Header & Navigation */
        header {
            background-color: white;
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .header-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px 0;
        }

        .logo {
            font-size: 24px;
            font-weight: 700;
            color: var(--primary);
            display: flex;
            align-items: center;
        }

        .logo i {
            margin-right: 10px;
        }

        .nav-menu {
            display: flex;
        }

        .nav-menu li {
            margin-left: 30px;
        }

        .nav-menu a {
            font-weight: 500;
            transition: var(--transition);
            position: relative;
        }

        .nav-menu a:hover {
            color: var(--primary);
        }

        .nav-menu a::after {
            content: '';
            position: absolute;
            bottom: -5px;
            left: 0;
            width: 0;
            height: 2px;
            background-color: var(--primary);
            transition: var(--transition);
        }

        .nav-menu a:hover::after {
            width: 100%;
        }

        .nav-buttons {
            display: flex;
            align-items: center;
        }

        .btn {
            padding: 10px 20px;
            border-radius: 6px;
            font-weight: 500;
            cursor: pointer;
            transition: var(--transition);
            display: inline-block;
            text-align: center;
        }

        .btn-outline {
            border: 1px solid var(--primary);
            color: var(--primary);
            background-color: transparent;
            margin-right: 15px;
        }

        .btn-outline:hover {
            background-color: var(--primary);
            color: white;
        }

        .btn-primary {
            background-color: var(--primary);
            color: white;
            border: 1px solid var(--primary);
        }

        .btn-primary:hover {
            background-color: var(--primary-dark);
            border-color: var(--primary-dark);
        }

        .mobile-menu-btn {
            display: none;
            background: none;
            border: none;
            font-size: 24px;
            cursor: pointer;
            color: var(--dark);
        }

        /* Services Hero */
        .services-hero {
            background: linear-gradient(135deg, #f6f9fc 0%, #edf2f7 100%);
            padding: 160px 0 80px;
            text-align: center;
        }

        .services-hero h1 {
            font-size: 42px;
            font-weight: 700;
            margin-bottom: 15px;
            color: var(--dark);
        }

        .services-hero p {
            font-size: 18px;
            color: var(--gray);
            max-width: 700px;
            margin: 0 auto;
        }

        /* Services Section */
        .services-section {
            padding: 80px 0;
        }

        .services-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
            gap: 30px;
            margin-top: 50px;
        }

        .service-card {
            background-color: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            transition: var(--transition);
        }

        .service-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
        }

        .service-image {
            height: 200px;
            background-color: var(--gray-light);
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--primary);
            font-size: 60px;
        }

        .service-content {
            padding: 30px;
        }

        .service-title {
            font-size: 22px;
            font-weight: 600;
            margin-bottom: 15px;
            color: var(--dark);
        }

        .service-description {
            color: var(--gray);
            margin-bottom: 20px;
        }

        .service-features {
            margin-bottom: 25px;
        }

        .service-features li {
            display: flex;
            align-items: center;
            margin-bottom: 8px;
            color: var(--gray);
        }

        .service-features li i {
            color: var(--primary);
            margin-right: 10px;
            font-size: 14px;
        }

        .service-link {
            color: var(--primary);
            font-weight: 500;
            display: flex;
            align-items: center;
        }

        .service-link i {
            margin-left: 5px;
            transition: var(--transition);
        }

        .service-link:hover i {
            transform: translateX(5px);
        }

        /* Solutions Section */
        .solutions-section {
            padding: 80px 0;
            background-color: var(--light);
        }

        .solutions-tabs {
            display: flex;
            justify-content: center;
            margin-bottom: 40px;
            flex-wrap: wrap;
            gap: 10px;
        }

        .tab-btn {
            padding: 12px 25px;
            background-color: white;
            border: 1px solid var(--gray-light);
            border-radius: 6px;
            cursor: pointer;
            transition: var(--transition);
            font-weight: 500;
        }

        .tab-btn:hover {
            background-color: var(--gray-light);
        }

        .tab-btn.active {
            background-color: var(--primary);
            color: white;
            border-color: var(--primary);
        }

        .solutions-content {
            display: none;
            animation: fadeIn 0.5s ease;
        }

        .solutions-content.active {
            display: block;
        }

        .solution-item {
            background-color: white;
            border-radius: 10px;
            padding: 30px;
            margin-bottom: 20px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
        }

        .solution-title {
            font-size: 20px;
            font-weight: 600;
            margin-bottom: 15px;
            color: var(--dark);
        }

        .solution-description {
            color: var(--gray);
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        /* Industries Section */
        .industries-section {
            padding: 80px 0;
        }

        .industries-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-top: 50px;
        }

        .industry-card {
            background-color: white;
            border-radius: 10px;
            padding: 30px;
            text-align: center;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            transition: var(--transition);
        }

        .industry-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
        }

        .industry-icon {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            background-color: rgba(67, 97, 238, 0.1);
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 20px;
            color: var(--primary);
            font-size: 24px;
        }

        .industry-title {
            font-size: 18px;
            font-weight: 600;
            margin-bottom: 10px;
            color: var(--dark);
        }

        .industry-description {
            color: var(--gray);
            font-size: 14px;
        }

        /* CTA Section */
        .services-cta {
            background: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%);
            padding: 80px 0;
            color: white;
            text-align: center;
        }

        .services-cta h2 {
            font-size: 32px;
            margin-bottom: 20px;
        }

        .services-cta p {
            max-width: 600px;
            margin: 0 auto 30px;
            opacity: 0.9;
        }

        .btn-light {
            background-color: white;
            color: var(--primary);
            border: none;
            padding: 14px 30px;
            font-size: 16px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        .btn-light:hover {
            background-color: rgba(255, 255, 255, 0.9);
        }

        /* Footer */
        footer {
            background-color: var(--dark);
            color: white;
            padding: 80px 0 20px;
        }

        .footer-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 40px;
            margin-bottom: 60px;
        }

        .footer-col h3 {
            font-size: 18px;
            font-weight: 600;
            margin-bottom: 20px;
            position: relative;
            padding-bottom: 10px;
        }

        .footer-col h3::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 40px;
            height: 2px;
            background-color: var(--primary);
        }

        .footer-col ul li {
            margin-bottom: 10px;
        }

        .footer-col ul li a {
            color: rgba(255, 255, 255, 0.7);
            transition: var(--transition);
        }

        .footer-col ul li a:hover {
            color: var(--primary);
        }

        .footer-social {
            display: flex;
            gap: 15px;
            margin-top: 20px;
        }

        .social-icon {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background-color: rgba(255, 255, 255, 0.1);
            display: flex;
            align-items: center;
            justify-content: center;
            transition: var(--transition);
        }

        .social-icon:hover {
            background-color: var(--primary);
        }

        .footer-bottom {
            text-align: center;
            padding-top: 20px;
            border-top: 1px solid rgba(255, 255, 255, 0.1);
            color: rgba(255, 255, 255, 0.7);
            font-size: 14px;
        }

        /* Responsive Styles */
        @media screen and (max-width: 768px) {
            .header-container {
                padding: 15px 0;
            }

            .nav-menu,
            .nav-buttons {
                display: none;
            }

            .mobile-menu-btn {
                display: block;
            }

            .services-hero {
                padding: 120px 0 60px;
            }

            .services-hero h1 {
                font-size: 32px;
            }

            .services-grid {
                grid-template-columns: 1fr;
            }

            .service-image {
                height: 150px;
                font-size: 40px;
            }

            .industries-grid {
                grid-template-columns: 1fr 1fr;
            }
        }

        @media screen and (max-width: 480px) {
            .industries-grid {
                grid-template-columns: 1fr;
            }

            .solutions-tabs {
                flex-direction: column;
            }
        }
    </style>
</head>

<body>
    <%@ include file="header.jsp" %>

    <!-- Services Hero -->
    <section class="services-hero">
        <div class="container">
            <h1>Our Comprehensive Services</h1>
            <p>Discover how our Agile Contracts solutions can transform your business relationships and streamline your contract management processes.</p>
        </div>
    </section>

    <!-- Main Services Section -->
    <section class="services-section">
        <div class="container">
            <div class="section-header">
                <h2 class="section-title">Core Services</h2>
                <p class="section-subtitle">We offer a complete suite of services to support your agile contract needs at every stage.</p>
            </div>

            <div class="services-grid">
                <div class="service-card">
                    <div class="service-image">
                        <i class="fas fa-file-contract"></i>
                    </div>
                    <div class="service-content">
                        <h3 class="service-title">Agile Contract Creation</h3>
                        <p class="service-description">Transform your traditional contracts into flexible, outcome-based agreements with our expert guidance and customizable templates.</p>
                        <ul class="service-features">
                            <li><i class="fas fa-check"></i> Customizable contract templates</li>
                            <li><i class="fas fa-check"></i> Legal compliance review</li>
                            <li><i class="fas fa-check"></i> Stakeholder alignment workshops</li>
                            <li><i class="fas fa-check"></i> Outcome-based metrics design</li>
                        </ul>
                        <a href="#" class="service-link">Learn more <i class="fas fa-arrow-right"></i></a>
                    </div>
                </div>

                <div class="service-card">
                    <div class="service-image">
                        <i class="fas fa-project-diagram"></i>
                    </div>
                    <div class="service-content">
                        <h3 class="service-title">Implementation & Integration</h3>
                        <p class="service-description">Seamlessly integrate agile contracts into your existing workflows with our implementation services.</p>
                        <ul class="service-features">
                            <li><i class="fas fa-check"></i> Workflow design</li>
                            <li><i class="fas fa-check"></i> System integration</li>
                            <li><i class="fas fa-check"></i> Change management</li>
                            <li><i class="fas fa-check"></i> Training & onboarding</li>
                        </ul>
                        <a href="#" class="service-link">Learn more <i class="fas fa-arrow-right"></i></a>
                    </div>
                </div>

                <div class="service-card">
                    <div class="service-image">
                        <i class="fas fa-chart-line"></i>
                    </div>
                    <div class="service-content">
                        <h3 class="service-title">Performance Management</h3>
                        <p class="service-description">Monitor and optimize your agile contracts with our comprehensive performance tracking and analytics.</p>
                        <ul class="service-features">
                            <li><i class="fas fa-check"></i> Real-time dashboards</li>
                            <li><i class="fas fa-check"></i> Outcome measurement</li>
                            <li><i class="fas fa-check"></i> Regular review cycles</li>
                            <li><i class="fas fa-check"></i> Continuous improvement</li>
                        </ul>
                        <a href="#" class="service-link">Learn more <i class="fas fa-arrow-right"></i></a>
                    </div>
                </div>

                <div class="service-card">
                    <div class="service-image">
                        <i class="fas fa-user-graduate"></i>
                    </div>
                    <div class="service-content">
                        <h3 class="service-title">Training & Certification</h3>
                        <p class="service-description">Build internal expertise with our comprehensive training programs and certification courses.</p>
                        <ul class="service-features">
                            <li><i class="fas fa-check"></i> Agile Contracts fundamentals</li>
                            <li><                            <li><i class="fas fa-check"></i> Advanced negotiation techniques</li>
                            <li><i class="fas fa-check"></i> Implementation best practices</li>
                            <li><i class="fas fa-check"></i> Certification programs</li>
                        </ul>
                        <a href="#" class="service-link">Learn more <i class="fas fa-arrow-right"></i></a>
                    </div>
                </div>

                <div class="service-card">
                    <div class="service-image">
                        <i class="fas fa-hands-helping"></i>
                    </div>
                    <div class="service-content">
                        <h3 class="service-title">Consulting Services</h3>
                        <p class="service-description">Our experts provide tailored advice to help you maximize the benefits of agile contracting in your specific context.</p>
                        <ul class="service-features">
                            <li><i class="fas fa-check"></i> Strategic assessment</li>
                            <li><i class="fas fa-check"></i> Contract optimization</li>
                            <li><i class="fas fa-check"></i> Relationship management</li>
                            <li><i class="fas fa-check"></i> Risk mitigation</li>
                        </ul>
                        <a href="#" class="service-link">Learn more <i class="fas fa-arrow-right"></i></a>
                    </div>
                </div>

                <div class="service-card">
                    <div class="service-image">
                        <i class="fas fa-shield-alt"></i>
                    </div>
                    <div class="service-content">
                        <h3 class="service-title">Compliance & Risk Management</h3>
                        <p class="service-description">Ensure your agile contracts meet all regulatory requirements while maintaining flexibility.</p>
                        <ul class="service-features">
                            <li><i class="fas fa-check"></i> Regulatory compliance</li>
                            <li><i class="fas fa-check"></i> Risk assessment</li>
                            <li><i class="fas fa-check"></i> Audit support</li>
                            <li><i class="fas fa-check"></i> Dispute resolution</li>
                        </ul>
                        <a href="#" class="service-link">Learn more <i class="fas fa-arrow-right"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Solutions Section -->
    <section class="solutions-section">
        <div class="container">
            <div class="section-header">
                <h2 class="section-title">Tailored Solutions</h2>
                <p class="section-subtitle">We provide specialized solutions for different contract scenarios and business needs.</p>
            </div>

            <div class="solutions-tabs">
                <button class="tab-btn active" data-tab="software">Software Development</button>
                <button class="tab-btn" data-tab="consulting">Professional Services</button>
                <button class="tab-btn" data-tab="outsourcing">Outsourcing</button>
                <button class="tab-btn" data-tab="partnerships">Strategic Partnerships</button>
            </div>

            <div class="solutions-content active" id="software">
                <div class="solution-item">
                    <h3 class="solution-title">Iterative Delivery Contracts</h3>
                    <p class="solution-description">Structure contracts that align with agile software development cycles, with payments tied to working software increments rather than fixed deliverables.</p>
                </div>
                <div class="solution-item">
                    <h3 class="solution-title">Feature-Based Pricing</h3>
                    <p class="solution-description">Value-based pricing models that focus on business outcomes rather than hourly rates or fixed bids.</p>
                </div>
                <div class="solution-item">
                    <h3 class="solution-title">Technical Debt Management</h3>
                    <p class="solution-description">Contractual frameworks that account for and manage technical debt in a transparent way.</p>
                </div>
            </div>

            <div class="solutions-content" id="consulting">
                <div class="solution-item">
                    <h3 class="solution-title">Outcome-Based Consulting</h3>
                    <p class="solution-description">Move beyond time-and-materials to contracts that tie fees to measurable business outcomes.</p>
                </div>
                <div class="solution-item">
                    <h3 class="solution-title">Knowledge Transfer Frameworks</h3>
                    <p class="solution-description">Ensure value continues after the engagement ends with built-in knowledge transfer requirements.</p>
                </div>
            </div>

            <div class="solutions-content" id="outsourcing">
                <div class="solution-item">
                    <h3 class="solution-title">Flexible Capacity Contracts</h3>
                    <p class="solution-description">Scale teams up and down as needed while maintaining quality and continuity.</p>
                </div>
                <div class="solution-item">
                    <h3 class="solution-title">Multi-Vendor Coordination</h3>
                    <p class="solution-description">Contracts that facilitate collaboration between multiple vendors on complex projects.</p>
                </div>
            </div>

            <div class="solutions-content" id="partnerships">
                <div class="solution-item">
                    <h3 class="solution-title">Joint Innovation Agreements</h3>
                    <p class="solution-description">Frameworks for co-development and shared IP that encourage innovation while protecting interests.</p>
                </div>
                <div class="solution-item">
                    <h3 class="solution-title">Revenue Sharing Models</h3>
                    <p class="solution-description">Align incentives through performance-based revenue sharing arrangements.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Industries Section -->
    <section class="industries-section">
        <div class="container">
            <div class="section-header">
                <h2 class="section-title">Industry Specializations</h2>
                <p class="section-subtitle">We have deep experience implementing agile contracts across these industries.</p>
            </div>

            <div class="industries-grid">
                <div class="industry-card">
                    <div class="industry-icon">
                        <i class="fas fa-laptop-code"></i>
                    </div>
                    <h3 class="industry-title">Technology</h3>
                    <p class="industry-description">Software development, IT services, cloud computing, and digital transformation.</p>
                </div>

                <div class="industry-card">
                    <div class="industry-icon">
                        <i class="fas fa-heartbeat"></i>
                    </div>
                    <h3 class="industry-title">Healthcare</h3>
                    <p class="industry-description">Digital health solutions, medical technology, and healthcare IT services.</p>
                </div>

                <div class="industry-card">
                    <div class="industry-icon">
                        <i class="fas fa-university"></i>
                    </div>
                    <h3 class="industry-title">Financial Services</h3>
                    <p class="industry-description">Fintech, banking, insurance, and regulatory technology solutions.</p>
                </div>

                <div class="industry-card">
                    <div class="industry-icon">
                        <i class="fas fa-shopping-cart"></i>
                    </div>
                    <h3 class="industry-title">Retail & E-commerce</h3>
                    <p class="industry-description">Digital commerce platforms, omnichannel solutions, and retail technology.</p>
                </div>

                <div class="industry-card">
                    <div class="industry-icon">
                        <i class="fas fa-industry"></i>
                    </div>
                    <h3 class="industry-title">Manufacturing</h3>
                    <p class="industry-description">Industry 4.0, smart factories, and industrial IoT solutions.</p>
                </div>

                <div class="industry-card">
                    <div class="industry-icon">
                        <i class="fas fa-truck"></i>
                    </div>
                    <h3 class="industry-title">Logistics</h3>
                    <p class="industry-description">Supply chain optimization, transportation management, and logistics technology.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- CTA Section -->
    <section class="services-cta">
        <div class="container">
            <h2>Ready to Transform Your Contracts?</h2>
            <p>Discover how agile contracts can create more value, reduce risk, and improve relationships with your partners and vendors.</p>
            <a href="#" class="btn btn-light">Schedule a Consultation</a>
        </div>
    </section>
       <%@ include file="footer.jsp" %>

    <script>
        // Tab functionality
        const tabBtns = document.querySelectorAll('.tab-btn');
        const tabContents = document.querySelectorAll('.solutions-content');

        tabBtns.forEach(btn => {
            btn.addEventListener('click', () => {
                const tabId = btn.getAttribute('data-tab');
                
                // Remove active class from all buttons and contents
                tabBtns.forEach(btn => btn.classList.remove('active'));
                tabContents.forEach(content => content.classList.remove('active'));
                
                // Add active class to clicked button and corresponding content
                btn.classList.add('active');
                document.getElementById(tabId).classList.add('active');
            });
        });

        // Mobile menu toggle functionality would go here
        // This would be implemented in the header.jsp file
    </script>
</body>
</html>