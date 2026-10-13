<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Terms & Conditions | DairyCare</title>

    <!-- Bootstrap 5.3.3 -->
    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet">

    <!-- Bootstrap Icons -->
    <link
        rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

    <!-- Google Font -->
    <link
        href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
        rel="stylesheet">

    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: #f5f9f6;
            color: #343a40;
        }

        /* ================= NAVBAR ================= */

        .navbar {
            background: #198754;
            padding: 14px 0;
            box-shadow: 0 3px 12px rgba(0, 0, 0, 0.08);
        }

        .navbar-brand {
            font-size: 23px;
            font-weight: 700;
            color: white !important;
            display: flex;
            align-items: center;
            gap: 9px;
        }

        .navbar-brand i {
            font-size: 28px;
        }

        .navbar-nav .nav-link {
            color: rgba(255,255,255,0.9) !important;
            font-size: 14px;
            font-weight: 500;
            margin-left: 12px;
            transition: 0.3s;
        }

        .navbar-nav .nav-link:hover {
            color: #ffffff !important;
        }

        .navbar-nav .active {
            color: #ffffff !important;
            font-weight: 600;
        }

        /* ================= HERO ================= */

        .terms-hero {
            background: linear-gradient(
                135deg,
                #198754,
                #157347
            );
            color: white;
            padding: 65px 20px;
            text-align: center;
        }

        .terms-hero i {
            font-size: 55px;
            margin-bottom: 15px;
        }

        .terms-hero h1 {
            font-size: 38px;
            font-weight: 700;
            margin-bottom: 10px;
        }

        .terms-hero p {
            max-width: 700px;
            margin: auto;
            font-size: 15px;
            opacity: 0.9;
        }

        /* ================= MAIN CONTENT ================= */

        .terms-wrapper {
            max-width: 1050px;
            margin: 50px auto;
            padding: 0 20px;
        }

        .terms-card {
            background: #ffffff;
            border-radius: 16px;
            padding: 40px;
            box-shadow: 0 8px 30px rgba(0,0,0,0.06);
        }

        .last-updated {
            background: #e9f7ef;
            border-left: 4px solid #198754;
            padding: 14px 18px;
            border-radius: 7px;
            margin-bottom: 35px;
            font-size: 14px;
            color: #495057;
        }

        .term-section {
            margin-bottom: 35px;
        }

        .term-section h3 {
            color: #198754;
            font-size: 20px;
            font-weight: 600;
            margin-bottom: 13px;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .term-section h3 i {
            font-size: 21px;
        }

        .term-section p {
            color: #5f6368;
            font-size: 14px;
            line-height: 1.8;
            margin-bottom: 10px;
        }

        .term-section ul {
            padding-left: 20px;
            margin-top: 10px;
        }

        .term-section ul li {
            color: #5f6368;
            font-size: 14px;
            line-height: 1.8;
            margin-bottom: 7px;
        }

        /* ================= HIGHLIGHT BOX ================= */

        .important-box {
            background: #fff8e1;
            border-left: 4px solid #ffc107;
            padding: 18px;
            border-radius: 8px;
            margin: 20px 0;
        }

        .important-box strong {
            color: #856404;
        }

        .important-box p {
            margin-top: 7px;
            margin-bottom: 0;
            font-size: 13px;
        }

        /* ================= CONTACT BOX ================= */

        .contact-box {
            background: #198754;
            color: white;
            border-radius: 12px;
            padding: 28px;
            margin-top: 40px;
            text-align: center;
        }

        .contact-box i {
            font-size: 35px;
            margin-bottom: 10px;
        }

        .contact-box h4 {
            font-weight: 600;
            margin-bottom: 8px;
        }

        .contact-box p {
            font-size: 14px;
            opacity: 0.9;
            margin-bottom: 0;
        }

        /* ================= FOOTER ================= */

        footer {
            background: #212529;
            color: #adb5bd;
            padding: 35px 20px;
            margin-top: 60px;
        }

        .footer-brand {
            color: white;
            font-size: 20px;
            font-weight: 600;
        }

        .footer-text {
            font-size: 13px;
            margin-top: 8px;
        }

        .footer-links a {
            color: #adb5bd;
            text-decoration: none;
            font-size: 13px;
            margin: 0 8px;
            transition: 0.3s;
        }

        .footer-links a:hover {
            color: #ffffff;
        }

        .copyright {
            border-top: 1px solid #343a40;
            margin-top: 25px;
            padding-top: 20px;
            text-align: center;
            font-size: 12px;
        }

        /* ================= RESPONSIVE ================= */

        @media (max-width: 768px) {

            .terms-hero {
                padding: 45px 20px;
            }

            .terms-hero h1 {
                font-size: 30px;
            }

            .terms-card {
                padding: 25px 20px;
            }

            .navbar-nav .nav-link {
                margin-left: 0;
                margin-top: 5px;
            }
        }

    </style>

</head>

<body>


<!-- ================= NAVBAR ================= -->

<nav class="navbar navbar-expand-lg">

    <div class="container">

        <a class="navbar-brand" href="dashboard">
            <i class="bi bi-heart-pulse-fill"></i>
            DairyCare
        </a>

        <button
            class="navbar-toggler"
            type="button"
            data-bs-toggle="collapse"
            data-bs-target="#navbarMenu">

            <span class="navbar-toggler-icon"></span>

        </button>

        <div class="collapse navbar-collapse" id="navbarMenu">

            <ul class="navbar-nav ms-auto">

                <li class="nav-item">
                    <a class="nav-link" href="dashboard">
                        Home
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="about">
                        About
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="services">
                        Services
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="contact">
                        Contact
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link active" href="terms">
                        Terms
                    </a>
                </li>

            </ul>

        </div>

    </div>

</nav>


<!-- ================= HERO ================= -->

<section class="terms-hero">

    <i class="bi bi-file-earmark-text"></i>

    <h1>Terms & Conditions</h1>

    <p>
        Please read these terms and conditions carefully before using
        the DairyCare platform and its services.
    </p>

</section>


<!-- ================= TERMS CONTENT ================= -->

<div class="terms-wrapper">

    <div class="terms-card">

        <div class="last-updated">

            <i class="bi bi-calendar-check me-2"></i>

            <strong>Last Updated:</strong>
            October 2026

        </div>


        <!-- 1 -->

        <div class="term-section">

            <h3>
                <i class="bi bi-info-circle-fill"></i>
                1. Acceptance of Terms
            </h3>

            <p>
                Welcome to DairyCare. By accessing or using the DairyCare
                platform, you agree to comply with and be bound by these
                Terms & Conditions.
            </p>

            <p>
                If you do not agree with any part of these terms,
                please discontinue using the DairyCare system.
            </p>

        </div>


        <!-- 2 -->

        <div class="term-section">

            <h3>
                <i class="bi bi-laptop"></i>
                2. Use of the DairyCare System
            </h3>

            <p>
                DairyCare is designed to assist dairy farmers and farm
                administrators in managing dairy-related information
                efficiently.
            </p>

            <p>Users agree to:</p>

            <ul>

                <li>
                    Provide accurate and updated information.
                </li>

                <li>
                    Use the system only for legitimate dairy management
                    purposes.
                </li>

                <li>
                    Keep their account credentials confidential.
                </li>

                <li>
                    Avoid unauthorized access to other users' information.
                </li>

                <li>
                    Follow applicable laws and regulations while using
                    the platform.
                </li>

            </ul>

        </div>


        <!-- 3 -->

        <div class="term-section">

            <h3>
                <i class="bi bi-person-check-fill"></i>
                3. User Account
            </h3>

            <p>
                Some DairyCare features may require users to create an
                account. Users are responsible for maintaining the
                confidentiality of their login credentials.
            </p>

            <p>
                Users are responsible for all activities performed through
                their account and should immediately report any suspected
                unauthorized access.
            </p>

        </div>


        <!-- 4 -->

        <div class="term-section">

            <h3>
                <i class="bi bi-database-fill"></i>
                4. Farm Data
            </h3>

            <p>
                DairyCare may store information related to dairy farm
                operations, including cattle records, milk production,
                health records, vaccination information and other
                management data.
            </p>

            <p>
                Users are responsible for ensuring that the information
                entered into the system is accurate and appropriate.
            </p>

        </div>


        <!-- 5 -->

        <div class="term-section">

            <h3>
                <i class="bi bi-robot"></i>
                5. AI Assistant
            </h3>

            <p>
                DairyCare may provide an Artificial Intelligence (AI)
                Assistant to help users understand farm information,
                generate summaries and provide general recommendations.
            </p>

            <div class="important-box">

                <strong>
                    <i class="bi bi-exclamation-triangle-fill me-2"></i>
                    Important Notice
                </strong>

                <p>
                    AI-generated information is provided for general
                    assistance and informational purposes only. AI
                    responses should not be considered a substitute for
                    professional veterinary, medical, agricultural or
                    financial advice.
                </p>

            </div>

            <p>
                Users should verify important recommendations with a
                qualified professional before taking significant action.
            </p>

        </div>


        <!-- 6 -->

        <div class="term-section">

            <h3>
                <i class="bi bi-shield-lock-fill"></i>
                6. Privacy and Data Protection
            </h3>

            <p>
                DairyCare respects user privacy. Information collected
                through the platform should be handled responsibly and
                used only for legitimate system and service purposes.
            </p>

            <p>
                Users should avoid entering unnecessary sensitive or
                confidential information into the system.
            </p>

        </div>


        <!-- 7 -->

        <div class="term-section">

            <h3>
                <i class="bi bi-shield-exclamation"></i>
                7. Security
            </h3>

            <p>
                DairyCare implements reasonable technical measures to
                protect information stored within the system.
            </p>

            <p>
                However, no online system can guarantee complete security.
                Users should maintain strong passwords and avoid sharing
                their login credentials.
            </p>

        </div>


        <!-- 8 -->

        <div class="term-section">

            <h3>
                <i class="bi bi-exclamation-octagon-fill"></i>
                8. Limitation of Liability
            </h3>

            <p>
                DairyCare is intended to provide management assistance
                and informational support. The system does not guarantee
                specific farming, production, health or financial results.
            </p>

            <p>
                Users are responsible for decisions made based on
                information provided by the platform.
            </p>

        </div>


        <!-- 9 -->

        <div class="term-section">

            <h3>
                <i class="bi bi-tools"></i>
                9. System Availability
            </h3>

            <p>
                DairyCare may occasionally be unavailable because of
                maintenance, technical issues, network problems or
                circumstances beyond the control of the system
                administrators.
            </p>

        </div>


        <!-- 10 -->

        <div class="term-section">

            <h3>
                <i class="bi bi-c-circle"></i>
                10. Intellectual Property
            </h3>

            <p>
                The DairyCare name, interface design, software components,
                logos and other original content are protected by
                applicable intellectual property laws.
            </p>

            <p>
                Users may not copy, modify, distribute or reproduce
                protected DairyCare content without appropriate
                authorization.
            </p>

        </div>


        <!-- 11 -->

        <div class="term-section">

            <h3>
                <i class="bi bi-ban"></i>
                11. Prohibited Activities
            </h3>

            <p>Users must not:</p>

            <ul>

                <li>
                    Attempt to gain unauthorized access to the system.
                </li>

                <li>
                    Introduce malicious software or harmful code.
                </li>

                <li>
                    Misuse another user's account.
                </li>

                <li>
                    Manipulate or intentionally corrupt farm data.
                </li>

                <li>
                    Use the platform for illegal activities.
                </li>

            </ul>

        </div>


        <!-- 12 -->

        <div class="term-section">

            <h3>
                <i class="bi bi-arrow-repeat"></i>
                12. Changes to Terms
            </h3>

            <p>
                DairyCare reserves the right to update these Terms &
                Conditions when necessary. Updated terms may be published
                on this page.
            </p>

            <p>
                Continued use of the platform after changes are published
                indicates acceptance of the updated terms.
            </p>

        </div>


        <!-- 13 -->

        <div class="term-section">

            <h3>
                <i class="bi bi-x-circle-fill"></i>
                13. Termination
            </h3>

            <p>
                Access to DairyCare may be suspended or terminated if a
                user violates these Terms & Conditions, misuses the
                platform or engages in unauthorized activities.
            </p>

        </div>


        <!-- 14 -->

        <div class="term-section">

            <h3>
                <i class="bi bi-check-circle-fill"></i>
                14. Agreement
            </h3>

            <p>
                By using DairyCare, you acknowledge that you have read,
                understood and agreed to these Terms & Conditions.
            </p>

        </div>


        <!-- CONTACT -->

        <div class="contact-box">

            <i class="bi bi-headset"></i>

            <h4>Need Help?</h4>

            <p>
                If you have questions about these Terms & Conditions,
                please contact the DairyCare support team.
            </p>

        </div>

    </div>

</div>


<!-- ================= FOOTER ================= -->

<footer>

    <div class="container text-center">

        <div class="footer-brand">

            <i class="bi bi-heart-pulse-fill me-2"></i>
            DairyCare

        </div>

        <p class="footer-text">
            Smart Dairy Farm Management System
        </p>

        <div class="footer-links mt-3">

            <a href="dashboard">Home</a>

            <a href="about">About</a>

            <a href="services">Services</a>

            <a href="contact">Contact</a>

            <a href="terms">Terms & Conditions</a>

        </div>

        <div class="copyright">

            © 2026 DairyCare. All Rights Reserved.

        </div>

    </div>

</footer>


<!-- Bootstrap JS -->

<script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
</script>

</body>

</html>