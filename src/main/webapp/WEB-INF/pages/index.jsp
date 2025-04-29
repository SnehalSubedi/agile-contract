<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agile Contracts | Flexible Contract Solutions for Modern Business</title>
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

        /* Hero Section */
        .hero {
            background: linear-gradient(135deg, #f6f9fc 0%, #edf2f7 100%);
            padding: 160px 0 100px;
            position: relative;
            overflow: hidden;
        }

        .hero-content {
            display: flex;
            align-items: center;
            position: relative;
            z-index: 2;
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

        .hero-image {
            flex: 1;
            display: flex;
            justify-content: flex-end;
        }

        .hero-image img {
            max-width: 100%;
            height: auto;
            border-radius: 10px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        }

        .hero-buttons {
            display: flex;
            gap: 15px;
            margin-top: 30px;
        }

        .btn-large {
            padding: 14px 28px;
            font-size: 16px;
        }

        .hero-stats {
            display: flex;
            justify-content: space-between;
            margin-top: 60px;
            max-width: 500px;
        }

        .stat-item {
            text-align: center;
        }

        .stat-number {
            font-size: 36px;
            font-weight: 700;
            color: var(--primary);
            margin-bottom: 5px;
        }

        .stat-label {
            font-size: 14px;
            color: var(--gray);
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

        .features-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 30px;
        }

        .feature-card {
            background-color: white;
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            transition: var(--transition);
            height: 100%;
        }

        .feature-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
        }

        .feature-icon {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 20px;
            font-size: 24px;
        }

        .icon-primary {
            background-color: rgba(67, 97, 238, 0.1);
            color: var(--primary);
        }

        .icon-secondary {
            background-color: rgba(108, 99, 255, 0.1);
            color: var(--secondary);
        }

        .icon-accent {
            background-color: rgba(76, 201, 240, 0.1);
            color: var(--accent);
        }

        .feature-title {
            font-size: 20px;
            font-weight: 600;
            margin-bottom: 15px;
            color: var(--dark);
        }

        .feature-description {
            color: var(--gray);
        }

        /* How It Works Section */
        .how-it-works {
            padding: 100px 0;
            background-color: var(--light);
        }

        .steps {
            margin-top: 60px;
            position: relative;
        }

        .step-line {
            position: absolute;
            top: 40px;
            left: 40px;
            width: calc(100% - 80px);
            height: 3px;
            background-color: var(--gray-light);
            z-index: 1;
        }

        .steps-container {
            display: flex;
            justify-content: space-between;
            position: relative;
            z-index: 2;
        }

        .step {
            text-align: center;
            width: 220px;
        }

        .step-number {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            background-color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 20px;
            font-size: 24px;
            font-weight: 700;
            color: var(--primary);
            border: 3px solid var(--primary);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        .step-title {
            font-size: 18px;
            font-weight: 600;
            margin-bottom: 10px;
            color: var(--dark);
        }

        .step-description {
            font-size: 14px;
            color: var(--gray);
        }

        /* Benefits Section */
        .benefits {
            padding: 100px 0;
        }

        .benefits-container {
            display: flex;
            align-items: center;
            gap: 50px;
        }

        .benefits-image {
            flex: 1;
        }

        .benefits-image img {
            max-width: 100%;
            border-radius: 10px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        }

        .benefits-content {
            flex: 1;
        }

        .benefits-list {
            margin-top: 30px;
        }

        .benefit-item {
            display: flex;
            align-items: flex-start;
            margin-bottom: 20px;
        }

        .benefit-icon {
            min-width: 40px;
            height: 40px;
            border-radius: 50%;
            background-color: rgba(67, 97, 238, 0.1);
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--primary);
            margin-right: 15px;
            font-size: 16px;
        }

        .benefit-text h4 {
            font-size: 18px;
            font-weight: 600;
            margin-bottom: 5px;
            color: var(--dark);
        }

        .benefit-text p {
            color: var(--gray);
            font-size: 15px;
        }

        /* Testimonials Section */
        .testimonials {
            padding: 100px 0;
            background-color: var(--light);
        }

        .testimonials-container {
            position: relative;
            max-width: 900px;
            margin: 0 auto;
        }

        .testimonial-card {
            background-color: white;
            border-radius: 10px;
            padding: 40px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            margin: 60px 20px 0;
            text-align: center;
            position: relative;
        }

        .testimonial-avatar {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            object-fit: cover;
            position: absolute;
            top: -40px;
            left: 50%;
            transform: translateX(-50%);
            border: 4px solid white;
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
        }

        .testimonial-content {
            font-size: 16px;
            color: var(--gray);
            margin-bottom: 20px;
            font-style: italic;
            line-height: 1.8;
        }

        .testimonial-name {
            font-size: 18px;
            font-weight: 600;
            color: var(--dark);
            margin-bottom: 5px;
        }

        .testimonial-role {
            font-size: 14px;
            color: var(--gray);
        }

        .testimonial-quote {
            font-size: 48px;
            color: rgba(67, 97, 238, 0.1);
            position: absolute;
            top: 20px;
            left: 20px;
        }

        /* Call to Action Section */
        .cta {
            padding: 80px 0;
            background: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%);
            color: white;
            text-align: center;
        }

        .cta-title {
            font-size: 36px;
            font-weight: 700;
            margin-bottom: 20px;
        }

        .cta-subtitle {
            font-size: 18px;
            max-width: 600px;
            margin: 0 auto 40px;
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
        @media screen and (max-width: 991px) {
            .hero-content {
                flex-direction: column;
                text-align: center;
            }

            .hero-text {
                margin-bottom: 50px;
            }

            .hero-buttons {
                justify-content: center;
            }

            .hero-stats {
                max-width: 100%;
            }

            .benefits-container {
                flex-direction: column;
            }

            .step-line {
                display: none;
            }

            .steps-container {
                flex-direction: column;
                align-items: center;
                gap: 60px;
            }
        }

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

            .hero {
                padding: 120px 0 80px;
            }

            .hero-title {
                font-size: 36px;
            }

            .section-title {
                font-size: 30px;
            }

            .features-grid {
                grid-template-columns: 1fr;
            }

            .testimonial-card {
                padding: 30px 20px;
            }
        }
    </style>
</head>

<body>
    <%@ include file="header.jsp" %>


        <!-- Hero Section -->
        <section class="hero" id="home">
            <div class="container hero-content">
                <div class="hero-text">
                    <h1 class="hero-title">Modern <span>Agile Contracts</span> for Today's Business</h1>
                    <p class="hero-subtitle">Streamline your contract management with our flexible, agile solutions
                        designed for the modern business landscape. Stay compliant, adapt quickly, and focus on growth.
                    </p>

                    <div class="hero-buttons">
                        <a href="#" class="btn btn-primary btn-large">Get Started</a>
                        <a href="#" class="btn btn-outline btn-large">Watch Demo</a>
                    </div>

                    <div class="hero-stats">
                        <div class="stat-item">
                            <div class="stat-number">500+</div>
                            <div class="stat-label">Companies</div>
                        </div>
                        <div class="stat-item">
                            <div class="stat-number">10k+</div>
                            <div class="stat-label">Contracts</div>
                        </div>
                        <div class="stat-item">
                            <div class="stat-number">98%</div>
                            <div class="stat-label">Satisfaction</div>
                        </div>
                    </div>
                </div>


            </div>
        </section>

        <!-- Features Section -->
        <section class="features" id="features">
            <div class="container">
                <div class="section-header">
                    <h2 class="section-title">Powerful Features for Agile Contracts</h2>
                    <p class="section-subtitle">Our comprehensive solution helps you create, manage, and track contracts
                        with flexibility and ease.</p>
                </div>

                <div class="features-grid">
                    <div class="feature-card">
                        <div class="feature-icon icon-primary">
                            <i class="fas fa-bolt"></i>
                        </div>
                        <h3 class="feature-title">Quick Contract Creation</h3>
                        <p class="feature-description">Create contracts in minutes, not hours, with customizable
                            templates and a user-friendly interface designed for agile workflows.</p>
                    </div>

                    <div class="feature-card">
                        <div class="feature-icon icon-secondary">
                            <i class="fas fa-sync-alt"></i>
                        </div>
                        <h3 class="feature-title">Flexible Amendments</h3>
                        <p class="feature-description">Easily adapt to changing requirements with our flexible amendment
                            system that maintains complete version history.</p>
                    </div>

                    <div class="feature-card">
                        <div class="feature-icon icon-accent">
                            <i class="fas fa-shield-alt"></i>
                        </div>
                        <h3 class="feature-title">Secure Compliance</h3>
                        <p class="feature-description">Stay compliant with regulatory requirements through automated
                            checks and built-in compliance frameworks.</p>
                    </div>

                    <div class="feature-card">
                        <div class="feature-icon icon-primary">
                            <i class="fas fa-chart-line"></i>
                        </div>
                        <h3 class="feature-title">Performance Tracking</h3>
                        <p class="feature-description">Monitor contract performance with real-time analytics and
                            customizable dashboards to measure outcomes against goals.</p>
                    </div>

                    <div class="feature-card">
                        <div class="feature-icon icon-secondary">
                            <i class="fas fa-users"></i>
                        </div>
                        <h3 class="feature-title">Collaborative Workflow</h3>
                        <p class="feature-description">Enable stakeholders to collaborate seamlessly with role-based
                            permissions and in-app communication tools.</p>
                    </div>

                    <div class="feature-card">
                        <div class="feature-icon icon-accent">
                            <i class="fas fa-file-signature"></i>
                        </div>
                        <h3 class="feature-title">Digital Signatures</h3>
                        <p class="feature-description">Securely sign contracts digitally with legally binding
                            e-signatures that streamline the approval process.</p>
                    </div>
                </div>
            </div>
        </section>

        <!-- How It Works Section -->
        <section class="how-it-works" id="how-it-works">
            <div class="container">
                <div class="section-header">
                    <h2 class="section-title">How Agile Contracts Work</h2>
                    <p class="section-subtitle">Our streamlined process makes contract management simple and efficient
                        from start to finish.</p>
                </div>

                <div class="steps">
                    <div class="step-line"></div>
                    <div class="steps-container">
                        <div class="step">
                            <div class="step-number">1</div>
                            <h3 class="step-title">Create Template</h3>
                            <p class="step-description">Choose from pre-built templates or create your own agile
                                contract structure.</p>
                        </div>

                        <div class="step">
                            <div class="step-number">2</div>
                            <h3 class="step-title">Set Terms</h3>
                            <p class="step-description">Define flexible terms, milestones, and deliverables for your
                                agile contract.</p>
                        </div>

                        <div class="step">
                            <div class="step-number">3</div>
                            <h3 class="step-title">Review & Sign</h3>
                            <p class="step-description">Collaborate with stakeholders, review, and sign digitally with
                                ease.</p>
                        </div>

                        <div class="step">
                            <div class="step-number">4</div>
                            <h3 class="step-title">Manage & Track</h3>
                            <p class="step-description">Monitor performance, make adjustments, and ensure successful
                                outcomes.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Benefits Section -->
        <section class="benefits" id="benefits">
            <div class="container benefits-container">
                <div class="benefits-image">
                    <img src="/api/placeholder/500/400" alt="Agile Contracts Benefits">
                </div>

                <div class="benefits-content">
                    <div class="section-header" style="text-align: left; margin-bottom: 0;">
                        <h2 class="section-title">Why Choose Agile Contracts?</h2>
                        <p class="section-subtitle">Our approach to contract management delivers measurable business
                            value across your organization.</p>
                    </div>

                    <ul class="benefits-list">
                        <li class="benefit-item">
                            <div class="benefit-icon">
                                <i class="fas fa-check"></i>
                            </div>
                            <div class="benefit-text">
                                <h4>Reduced Contract Cycle Time</h4>
                                <p>Close deals 70% faster with streamlined workflows and automated processes.</p>
                            </div>
                        </li>

                        <li class="benefit-item">
                            <div class="benefit-icon">
                                <i class="fas fa-check"></i>
                            </div>
                            <div class="benefit-text">
                                <h4>Lower Administrative Costs</h4>
                                <p>Cut contract administration costs by up to 40% through efficiency and automation.</p>
                            </div>
                        </li>

                        <li class="benefit-item">
                            <div class="benefit-icon">
                                <i class="fas fa-check"></i>
                            </div>
                            <div class="benefit-text">
                                <h4>Enhanced Compliance</h4>
                                <p>Reduce compliance risks with built-in checks and comprehensive audit trails.</p>
                            </div>
                        </li>

                        <li class="benefit-item">
                            <div class="benefit-icon">
                                <i class="fas fa-check"></i>
                            </div>
                            <div class="benefit-text">
                                <h4>Improved Visibility</h4>
                                <p>Gain complete visibility into contract status, milestones, and performance metrics.
                                </p>
                            </div>
                        </li>

                        <li class="benefit-item">
                            <div class="benefit-icon">
                                <i class="fas fa-check"></i>
                            </div>
                            <div class="benefit-text">
                                <h4>Adaptability to Change</h4>
                                <p>Quickly adapt to changing business needs with flexible contract frameworks.</p>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </section>

        <!-- Testimonials Section -->
        <section class="testimonials" id="testimonials">
            <div class="container">
                <div class="section-header">
                    <h2 class="section-title">What Our Clients Say</h2>
                    <p class="section-subtitle">Discover how businesses are transforming their contract management with
                        our agile solutions.</p>
                </div>

                <div class="testimonials-container">
                    <div class="testimonial-card">
                        <img src="/api/placeholder/80/80" alt="Sarah Johnson" class="testimonial-avatar">
                        <i class="fas fa-quote-left testimonial-quote"></i>
                        <p class="testimonial-content">"AgileContracts has transformed how we handle client agreements.
                            The flexibility to adapt terms as projects evolve has been invaluable, and the time saved on
                            administration lets us focus on delivering results for our clients."</p>
                        <h4 class="testimonial-name">Sarah Johnson</h4>
                        <p class="testimonial-role">CEO, Innovate Solutions</p>
                    </div>
                </div>
            </div>
        </section>

        <!-- Call to Action Section -->
        <section class="cta">
            <div class="container">
                <h2 class="cta-title">Ready to Transform Your Contract Management?</h2>
                <p class="cta-subtitle">Join thousands of businesses using AgileContracts to streamline their
                    operations.</p>
                <a href="#" class="btn btn-light">Start Your Free 14-Day Trial</a>
            </div>
        </section>

        <!-- Footer -->
        <footer>
            <div class="container">
                <div class="footer-container">
                    <div class="footer-col">
                        <h3>About Us</h3>
                        <ul>
                            <li><a href="#">Company