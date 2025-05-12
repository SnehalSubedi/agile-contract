<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us | Agile Contracts</title>
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
            text-align: center;
        }

        .hero-title {
            font-size: 48px;
            font-weight: 700;
            margin-bottom: 20px;
            color: var(--dark);
        }

        .hero-title span {
            color: var(--primary);
        }

        .hero-subtitle {
            font-size: 18px;
            color: var(--gray);
            max-width: 700px;
            margin: 0 auto;
        }

        /* Section Styling */
        .section {
            padding: 80px 0;
        }

        .section-light {
            background-color: white;
        }

        .section-dark {
            background-color: var(--light);
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
            max-width: 700px;
            margin: 0 auto;
        }

        /* Our Story Section */
        .story-container {
            display: flex;
            align-items: center;
            gap: 50px;
        }

        .story-image {
            flex: 1;
        }

        .story-image img {
            width: 100%;
            max-width: 500px;
            border-radius: 10px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        }

        .story-content {
            flex: 1;
        }

        .story-text {
            margin-bottom: 30px;
        }

        .timeline {
            margin-top: 40px;
        }

        .timeline-item {
            display: flex;
            margin-bottom: 30px;
            position: relative;
        }

        .timeline-year {
            min-width: 100px;
            padding-right: 20px;
            font-weight: 700;
            font-size: 20px;
            color: var(--primary);
        }

        .timeline-content {
            position: relative;
            padding-left: 20px;
            border-left: 2px solid var(--primary);
        }

        .timeline-content::before {
            content: '';
            position: absolute;
            left: -6px;
            top: 8px;
            width: 10px;
            height: 10px;
            border-radius: 50%;
            background-color: var(--primary);
        }

        .timeline-title {
            font-weight: 600;
            margin-bottom: 5px;
        }

        .timeline-description {
            color: var(--gray);
        }

        /* Mission & Values Section */
        .mission-values {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 30px;
        }

        .mission-card,
        .value-card {
            background-color: white;
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            height: 100%;
            transition: var(--transition);
        }

        .mission-card:hover,
        .value-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
        }

        .card-icon {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 20px;
            font-size: 24px;
            background-color: rgba(67, 97, 238, 0.1);
            color: var(--primary);
        }

        .card-title {
            font-size: 20px;
            font-weight: 600;
            margin-bottom: 15px;
            color: var(--dark);
        }

        .card-description {
            color: var(--gray);
        }

        /* Team Section */
        .team-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 30px;
        }

        .team-member {
            background-color: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            transition: var(--transition);
        }

        .team-member:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
        }

        .member-image {
            width: 100%;
            height: 250px;
            object-fit: cover;
        }

        .member-info {
            padding: 20px;
            text-align: center;
        }

        .member-name {
            font-size: 18px;
            font-weight: 600;
            margin-bottom: 5px;
            color: var(--dark);
        }

        .member-role {
            font-size: 14px;
            color: var(--primary);
            margin-bottom: 15px;
        }

        .member-bio {
            color: var(--gray);
            font-size: 14px;
            margin-bottom: 15px;
        }

        .member-social {
            display: flex;
            justify-content: center;
            gap: 10px;
        }

        .social-link {
            width: 36px;
            height: 36px;
            border-radius: 50%;
            background-color: var(--light);
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--gray);
            transition: var(--transition);
        }

        .social-link:hover {
            background-color: var(--primary);
            color: white;
        }

        /* Stats Section */
        .stats-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 30px;
            text-align: center;
        }

        .stat-item {
            background-color: white;
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
        }

        .stat-icon {
            font-size: 36px;
            color: var(--primary);
            margin-bottom: 15px;
        }

        .stat-number {
            font-size: 36px;
            font-weight: 700;
            color: var(--dark);
            margin-bottom: 5px;
        }

        .stat-text {
            color: var(--gray);
        }

        /* Investors Section */
        .investors-logos {
            display: flex;
            justify-content: space-around;
            align-items: center;
            flex-wrap: wrap;
            gap: 30px;
            margin-top: 50px;
        }

        .investor-logo {
            filter: grayscale(100%);
            opacity: 0.7;
            transition: var(--transition);
            max-width: 150px;
            height: auto;
        }

        .investor-logo:hover {
            filter: grayscale(0%);
            opacity: 1;
        }

        /* Call to Action Section */
        .cta {
            background: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%);
            color: white;
            text-align: center;
            padding: 80px 0;
        }

        .cta-title {
            font-size: 36px;
            font-weight: 700;
            margin-bottom: 20px;
        }

        .cta-subtitle {
            font-size: 18px;
            max-width: 700px;
            margin: 0 auto 40px;
            opacity: 0.9;
        }

        .btn-light {
            background-color: white;
            color: var(--primary);
            border: none;
            padding: 14px 30px;
            font-size: 16px;
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

        .footer-social a {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background-color: rgba(255, 255, 255, 0.1);
            display: flex;
            align-items: center;
            justify-content: center;
            transition: var(--transition);
        }

        .footer-social a:hover {
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
            .story-container {
                flex-direction: column;
            }

            .story-image {
                margin-bottom: 40px;
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

            .timeline-item {
                flex-direction: column;
            }

            .timeline-year {
                margin-bottom: 10px;
            }
        }
    </style>
</head>

<body>
    <br><br><br>
    <%@ include file="header.jsp" %>



        <!-- Hero Section -->
        <section class="hero">
            <div class="container">
                <h1 class="hero-title">About <span>AgileContracts</span></h1>
                <p class="hero-subtitle">We're on a mission to transform how businesses create, manage, and optimize
                    their contracts in an agile world.</p>
            </div>
        </section>

        <!-- Our Story Section -->
        <section class="section section-light">
            <div class="container">
                <div class="section-header">
                    <h2 class="section-title">Our Story</h2>
                    <p class="section-subtitle">From a small startup to an industry leader in agile contract management.
                    </p>
                </div>

                <div class="story-container">
                    <div class="story-image">
                        <img src="/api/placeholder/500/350" alt="Agile Contracts Founding Team">
                    </div>

                    <div class="story-content">
                        <div class="story-text">
                            <p>AgileContracts was founded in 2018 by a team of legal and technology experts who saw the
                                challenges businesses faced with traditional contract management in an increasingly
                                agile world.</p>
                            <br>
                            <p>After experiencing firsthand the frustrations of rigid contract structures that couldn't
                                adapt to evolving project requirements, our founders set out to create a solution that
                                would bring the principles of agility to contract management.</p>
                            <br>
                            <p>What began as a simple tool for small teams has grown into a comprehensive platform
                                trusted by organizations of all sizes across the globe. Throughout our journey, we've
                                remained committed to our core belief that contracts should be flexible, transparent,
                                and designed to foster collaboration rather than conflict.</p>
                        </div>

                        <div class="timeline">
                            <div class="timeline-item">
                                <div class="timeline-year">2018</div>
                                <div class="timeline-content">
                                    <h4 class="timeline-title">Company Founded</h4>
                                    <p class="timeline-description">AgileContracts was established in San Francisco, CA.
                                    </p>
                                </div>
                            </div>

                            <div class="timeline-item">
                                <div class="timeline-year">2019</div>
                                <div class="timeline-content">
                                    <h4 class="timeline-title">First Product Launch</h4>
                                    <p class="timeline-description">Released our core platform for agile contract
                                        management.</p>
                                </div>
                            </div>

                            <div class="timeline-item">
                                <div class="timeline-year">2021</div>
                                <div class="timeline-content">
                                    <h4 class="timeline-title">Series A Funding</h4>
                                    <p class="timeline-description">Secured $12M in funding to accelerate growth and
                                        innovation.</p>
                                </div>
                            </div>

                            <div class="timeline-item">
                                <div class="timeline-year">2023</div>
                                <div class="timeline-content">
                                    <h4 class="timeline-title">Global Expansion</h4>
                                    <p class="timeline-description">Opened offices in London, Singapore, and Toronto.
                                    </p>
                                </div>
                            </div>

                            <div class="timeline-item">
                                <div class="timeline-year">2025</div>
                                <div class="timeline-content">
                                    <h4 class="timeline-title">Enterprise Platform</h4>
                                    <p class="timeline-description">Launched our advanced enterprise solution with AI
                                        capabilities.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Mission & Values Section -->
        <section class="section section-dark">
            <div class="container">
                <div class="section-header">
                    <h2 class="section-title">Our Mission & Values</h2>
                    <p class="section-subtitle">The principles that guide everything we do at AgileContracts.</p>
                </div>

                <div class="mission-values">
                    <div class="mission-card">
                        <div class="card-icon">
                            <i class="fas fa-bullseye"></i>
                        </div>
                        <h3 class="card-title">Our Mission</h3>
                        <p class="card-description">
                            To empower businesses with contract management solutions that embrace change, foster
                            collaboration, and drive successful outcomes in an agile business environment.
                        </p>
                        <br>
                        <p class="card-description">
                            We believe contracts should be enablers of business relationships, not barriers. By making
                            contracts more flexible, transparent, and aligned with modern work methodologies, we help
                            organizations build stronger partnerships and achieve their goals faster.
                        </p>
                    </div>

                    <div class="value-card">
                        <div class="card-icon">
                            <i class="fas fa-hands-helping"></i>
                        </div>
                        <h3 class="card-title">Collaboration</h3>
                        <p class="card-description">
                            We believe in the power of teamwork, both within our organization and in the partnerships we
                            build with our clients. Great solutions emerge from diverse perspectives working together.
                        </p>
                    </div>

                    <div class="value-card">
                        <div class="card-icon">
                            <i class="fas fa-bolt"></i>
                        </div>
                        <h3 class="card-title">Agility</h3>
                        <p class="card-description">
                            We embrace change and adapt quickly. Our approach to product development and customer
                            service reflects the same agile principles we champion in our platform.
                        </p>
                    </div>

                    <div class="value-card">
                        <div class="card-icon">
                            <i class="fas fa-lightbulb"></i>
                        </div>
                        <h3 class="card-title">Innovation</h3>
                        <p class="card-description">
                            We're constantly looking for new ways to solve complex contract challenges. By combining
                            legal expertise with cutting-edge technology, we create solutions that transform how
                            businesses operate.
                        </p>
                    </div>

                    <div class="value-card">
                        <div class="card-icon">
                            <i class="fas fa-lock"></i>
                        </div>
                        <h3 class="card-title">Trust</h3>
                        <p class="card-description">
                            We take our responsibility seriously as stewards of our customers' critical contract data.
                            Security, reliability, and integrity are the foundation of everything we build.
                        </p>
                    </div>
                </div>
            </div>
        </section>

        <!-- Team Section -->
        <section class="section section-light">
            <div class="container">
                <div class="section-header">
                    <h2 class="section-title">Meet Our Leadership Team</h2>
                    <p class="section-subtitle">The experienced professionals guiding our vision and operations.</p>
                </div>

                <div class="team-grid">
                    <div class="team-member">
                        <img src="https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.agilebusiness.org%2Fbusiness-agility%2Ffba%2Fagile-strategy.html&psig=AOvVaw1gn4tJlQjzUFcQNFyNUQ1S&ust=1745920184615000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCPiwqdW5-owDFQAAAAAdAAAAABAE"
                            alt="Jennifer Smith" class="member-image">
                        <div class="member-info">
                            <h3 class="member-name">Jennifer Smith</h3>
                            <p class="member-role">Co-Founder & CEO</p>
                            <p class="member-bio">Former legal tech executive with 15+ years of experience in contract
                                law and software development.</p>
                            <div class="member-social">
                                <a href="#" class="social-link"><i class="fab fa-linkedin-in"></i></a>
                                <a href="#" class="social-link"><i class="fab fa-twitter"></i></a>
                            </div>
                        </div>
                    </div>

                    <div class="team-member">
                        <img src="https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.agilebusiness.org%2Fbusiness-agility%2Ffba%2Fagile-strategy.html&psig=AOvVaw1gn4tJlQjzUFcQNFyNUQ1S&ust=1745920184615000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCPiwqdW5-owDFQAAAAAdAAAAABAE"
                            alt="Michael Chen" class="member-image">
                        <div class="member-info">
                            <h3 class="member-name">Michael Chen</h3>
                            <p class="member-role">Co-Founder & CTO</p>
                            <p class="member-bio">Tech innovator with extensive background in AI and enterprise software
                                solutions.</p>
                            <div class="member-social">
                                <a href="#" class="social-link"><i class="fab fa-linkedin-in"></i></a>
                                <a href="#" class="social-link"><i class="fab fa-github"></i></a>
                            </div>
                        </div>
                    </div>

                    <div class="team-member">
                        <img src="/api/placeholder/250/250" alt="Sophia Rodriguez" class="member-image">
                        <div class="member-info">
                            <h3 class="member-name">Sophia Rodriguez</h3>
                            <p class="member-role">Chief Product Officer</p>
                            <p class="member-bio">Product visionary who previously led innovation at leading SaaS
                                companies.</p>
                            <div class="member-social">
                                <a href="#" class="social-link"><i class="fab fa-linkedin-in"></i></a>
                                <a href="#" class="social-link"><i class="fab fa-twitter"></i></a>
                            </div>
                        </div>
                    </div>

                    <div class="team-member">
                        <img src="/api/placeholder/250/250" alt="David Johnson" class="member-image">
                        <div class="member-info">
                            <h3 class="member-name">David Johnson</h3>
                            <p class="member-role">Chief Revenue Officer</p>
                            <p class="member-bio">Sales leader with a track record of scaling B2B SaaS businesses
                                globally.</p>
                            <div class="member-social">
                                <a href="#" class="social-link"><i class="fab fa-linkedin-in"></i></a>
                                <a href="#" class="social-link"><i class="fab fa-twitter"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Stats Section -->
        <section class="section section-dark">
            <div class="container">
                <div class="section-header">
                    <h2 class="section-title">AgileContracts by the Numbers</h2>
                    <p class="section-subtitle">Our impact on contract management across industries.</p>
                </div>

                <div class="stats-container">
                    <div class="stat-item">
                        <div class="stat-icon">
                            <i class="fas fa-users"></i>
                        </div>
                        <div class="stat-number">500+</div>
                        <div class="stat-text">Companies Worldwide</div>
                    </div>

                    <div class="stat-item">
                        <div class="stat-icon">
                            <i class="fas fa-file-contract"></i>
                        </div>
                        <div class="stat-number">10k+</div>
                        <div class="stat-text">Contracts Managed</div>
                    </div>

                    <div class="stat-item">
                        <div class="stat-icon">
                            <i class="fas fa-globe-americas"></i>
                        </div>
                        <div class="stat-number">20+</div>
                        <div class="stat-text">Countries</div>
                    </div>

                    <div class="stat-item">
                        <div class="stat-icon">
                            <i class="fas fa-laptop-code"></i>
                        </div>
                        <div class="stat-number">98%</div>
                        <div class="stat-text">Customer Satisfaction</div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Investors Section -->
        <section class="section section-light">
            <div class="container">
                <div class="section-header">
                    <h2 class="section-title">Our Investors & Partners</h2>
                    <p class="section-subtitle">The organizations who believe in our vision and support our growth.</p>
                </div>

                <div class="investors-logos">
                    <img src="/api/placeholder/150/60" alt="Venture Capital Firm" class="investor-logo">
                    <img src="/api/placeholder/150/60" alt="Venture Capital Firm" class="investor-logo">
                    <img src="/api/placeholder/150/60" alt="Venture Capital Firm" class="investor-logo">
                    <img src="/api/placeholder/150/60" alt="Technology Partner" class="investor-logo">
                    <img src="/api/placeholder/150/60" alt="Technology Partner" class="investor-logo">
                </div>
            </div>
        </section>

              <%@ include file="footer.jsp" %>