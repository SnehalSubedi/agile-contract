<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FAQ | Agile Contracts</title>
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

        /* FAQ Section */
        .faq-hero {
            background: linear-gradient(135deg, #f6f9fc 0%, #edf2f7 100%);
            padding: 160px 0 80px;
            text-align: center;
        }

        .faq-hero h1 {
            font-size: 42px;
            font-weight: 700;
            margin-bottom: 15px;
            color: var(--dark);
        }

        .faq-hero p {
            font-size: 18px;
            color: var(--gray);
            max-width: 700px;
            margin: 0 auto;
        }

        .faq-container {
            padding: 80px 0;
        }

        .faq-section {
            margin-bottom: 50px;
        }

        .faq-section h2 {
            font-size: 28px;
            margin-bottom: 25px;
            color: var(--primary);
            position: relative;
            padding-bottom: 10px;
        }

        .faq-section h2::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 60px;
            height: 3px;
            background-color: var(--primary);
        }

        .faq-item {
            background-color: white;
            border-radius: 8px;
            margin-bottom: 15px;
            box-shadow: 0 3px 10px rgba(0, 0, 0, 0.05);
            overflow: hidden;
        }

        .faq-question {
            padding: 20px;
            font-size: 18px;
            font-weight: 600;
            color: var(--dark);
            cursor: pointer;
            display: flex;
            justify-content: space-between;
            align-items: center;
            transition: var(--transition);
        }

        .faq-question:hover {
            background-color: var(--gray-light);
        }

        .faq-question i {
            transition: var(--transition);
        }

        .faq-answer {
            padding: 0 20px;
            max-height: 0;
            overflow: hidden;
            transition: var(--transition);
        }

        .faq-answer-inner {
            padding: 0 0 20px;
            color: var(--gray);
        }

        .faq-item.active .faq-question {
            background-color: var(--gray-light);
        }

        .faq-item.active .faq-question i {
            transform: rotate(180deg);
        }

        .faq-item.active .faq-answer {
            max-height: 500px;
        }

        /* Contact CTA */
        .faq-cta {
            background-color: var(--light);
            padding: 60px 0;
            text-align: center;
        }

        .faq-cta h2 {
            font-size: 32px;
            margin-bottom: 20px;
            color: var(--dark);
        }

        .faq-cta p {
            color: var(--gray);
            max-width: 600px;
            margin: 0 auto 30px;
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

            .faq-hero {
                padding: 120px 0 60px;
            }

            .faq-hero h1 {
                font-size: 32px;
            }

            .faq-container {
                padding: 60px 0;
            }

            .faq-section h2 {
                font-size: 24px;
            }

            .faq-question {
                font-size: 16px;
                padding: 15px;
            }
        }
    </style>
</head>

<body>
    <%@ include file="header.jsp" %>

    <!-- FAQ Hero Section -->
    <section class="faq-hero">
        <div class="container">
            <h1>Frequently Asked Questions</h1>
            <p>Find answers to common questions about Agile Contracts and how they can benefit your business.</p>
        </div>
    </section>

    <!-- FAQ Content -->
    <section class="faq-container">
        <div class="container">
            <div class="faq-section">
                <h2>General Questions</h2>
                
                <div class="faq-item">
                    <div class="faq-question">
                        What are Agile Contracts?
                        <i class="fas fa-chevron-down"></i>
                    </div>
                    <div class="faq-answer">
                        <div class="faq-answer-inner">
                            Agile Contracts are flexible agreements designed to accommodate changing requirements in business relationships. Unlike traditional contracts, they allow for iterative development, regular feedback, and adjustments based on evolving needs while maintaining clear accountability and measurable outcomes.
                        </div>
                    </div>
                </div>
                
                <div class="faq-item">
                    <div class="faq-question">
                        How do Agile Contracts differ from traditional contracts?
                        <i class="fas fa-chevron-down"></i>
                    </div>
                    <div class="faq-answer">
                        <div class="faq-answer-inner">
                            Traditional contracts typically define all requirements upfront and are difficult to change, while Agile Contracts are designed for flexibility. They focus on outcomes rather than fixed specifications, allow for regular review points, and include mechanisms for adapting to changing circumstances without requiring complete renegotiation.
                        </div>
                    </div>
                </div>
                
                <div class="faq-item">
                    <div class="faq-question">
                        What types of businesses benefit most from Agile Contracts?
                        <i class="fas fa-chevron-down"></i>
                    </div>
                    <div class="faq-answer">
                        <div class="faq-answer-inner">
                            Agile Contracts are particularly beneficial for businesses in dynamic industries like software development, consulting, creative services, and any project-based work where requirements may evolve. However, any business that values flexibility and collaboration in their partnerships can benefit from this approach.
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="faq-section">
                <h2>Implementation</h2>
                
                <div class="faq-item">
                    <div class="faq-question">
                        How do I transition from traditional to Agile Contracts?
                        <i class="fas fa-chevron-down"></i>
                    </div>
                    <div class="faq-answer">
                        <div class="faq-answer-inner">
                            Transitioning to Agile Contracts involves several steps: educating stakeholders about the benefits, starting with pilot projects, using our templates as a foundation, and gradually expanding as you gain experience. Our team provides onboarding support and training to ensure a smooth transition.
                        </div>
                    </div>
                </div>
                
                <div class="faq-item">
                    <div class="faq-question">
                        What if my partners/clients aren't familiar with Agile Contracts?
                        <i class="fas fa-chevron-down"></i>
                    </div>
                    <div class="faq-answer">
                        <div class="faq-answer-inner">
                            We provide educational resources and templates you can share with your partners to help explain the benefits. Many of our clients find that once the advantages are explained (faster time-to-value, reduced risk, better alignment), partners are eager to adopt this more collaborative approach.
                        </div>
                    </div>
                </div>
                
                <div class="faq-item">
                    <div class="faq-question">
                        How long does implementation typically take?
                        <i class="fas fa-chevron-down"></i>
                    </div>
                    <div class="faq-answer">
                        <div class="faq-answer-inner">
                            Implementation time varies based on your needs. For basic setup with our templates, you can be operational in a few days. Full implementation with custom workflows and integration with your existing systems typically takes 2-4 weeks. We offer different implementation packages to match your timeline and requirements.
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="faq-section">
                <h2>Pricing & Plans</h2>
                
                <div class="faq-item">
                    <div class="faq-question">
                        What pricing plans are available?
                        <i class="fas fa-chevron-down"></i>
                    </div>
                    <div class="faq-answer">
                        <div class="faq-answer-inner">
                            We offer several pricing tiers to fit businesses of all sizes: Starter (for small teams), Professional (for growing businesses), and Enterprise (for large organizations with advanced needs). All plans include our core features, with higher tiers offering more advanced functionality, support, and customization options.
                        </div>
                    </div>
                </div>
                
                <div class="faq-item">
                    <div class="faq-question">
                        Is there a free trial available?
                        <i class="fas fa-chevron-down"></i>
                    </div>
                    <div class="faq-answer">
                        <div class="faq-answer-inner">
                            Yes! We offer a 14-day free trial of our Professional plan with no credit card required. This gives you full access to all features so you can evaluate how Agile Contracts will work for your business.
                        </div>
                    </div>
                </div>
                
                <div class="faq-item">
                    <div class="faq-question">
                        Do you offer discounts for non-profits or educational institutions?
                        <i class="fas fa-chevron-down"></i>
                    </div>
                    <div class="faq-answer">
                        <div class="faq-answer-inner">
                            Yes, we provide special pricing for qualified non-profit organizations and educational institutions. Please contact our sales team with documentation of your status to learn more about our discounted offerings.
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="faq-section">
                <h2>Security & Compliance</h2>
                
                <div class="faq-item">
                    <div class="faq-question">
                        How secure is my contract data?
                        <i class="fas fa-chevron-down"></i>
                    </div>
                    <div class="faq-answer">
                        <div class="faq-answer-inner">
                            Security is our top priority. We use enterprise-grade encryption for data both in transit and at rest, regular security audits, and comply with industry-standard security protocols. Our infrastructure is hosted on secure cloud platforms with 99.9% uptime guarantees.
                        </div>
                    </div>
                </div>
                
                <div class="faq-item">
                    <div class="faq-question">
                        Do Agile Contracts meet legal requirements?
                        <i class="fas fa-chevron-down"></i>
                    </div>
                    <div class="faq-answer">
                        <div class="faq-answer-inner">
                            Absolutely. While flexible, Agile Contracts are fully legally binding documents. Our templates are developed in consultation with legal experts and can be customized to meet jurisdiction-specific requirements. We recommend consulting with your legal team for specific compliance needs.
                        </div>
                    </div>
                </div>
                
                <div class="faq-item">
                    <div class="faq-question">
                        What compliance standards do you support?
                        <i class="fas fa-chevron-down"></i>
                    </div>
                    <div class="faq-answer">
                        <div class="faq-answer-inner">
                            Our platform supports compliance with GDPR, CCPA, SOC 2, and other major regulatory frameworks. We can also accommodate industry-specific requirements for healthcare (HIPAA), finance, and other regulated sectors through our Enterprise plan.
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Contact CTA -->
    <section class="faq-cta">
        <div class="container">
            <h2>Still have questions?</h2>
            <p>Our team is ready to help you understand how Agile Contracts can transform your business relationships.</p>
            <a href="contact.html" class="btn btn-primary">Contact Our Team</a>
        </div>
    </section>
       <%@ include file="footer.jsp" %>

    <script>
        // FAQ Accordion Functionality
        document.querySelectorAll('.faq-question').forEach(question => {
            question.addEventListener('click', () => {
                const item = question.parentNode;
                item.classList.toggle('active');
                
                // Close other open items
                document.querySelectorAll('.faq-item').forEach(otherItem => {
                    if (otherItem !== item && otherItem.classList.contains('active')) {
                        otherItem.classList.remove('active');
                    }
                });
            });
        });
    </script>
</body>
</html>