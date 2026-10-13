<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>DairyCare - Services</title>

<!-- Bootstrap 5 -->
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
    rel="stylesheet">

<!-- Bootstrap Icons -->
<link
    rel="stylesheet"
    href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">


<style>

/* ================= GENERAL ================= */

body {
    margin: 0;
    background: #f5f8f6;
    font-family: Arial, sans-serif;
    color: #37443d;
}


/* ================= NAVBAR ================= */

.navbar-custom {
    background: #ffffff;
    padding: 15px 0;
    box-shadow: 0 3px 15px rgba(0, 0, 0, 0.08);
    position: sticky;
    top: 0;
    z-index: 1000;
}

.logo {
    font-size: 25px;
    font-weight: 700;
    color: #198754;
    text-decoration: none;
}

.logo i {
    margin-right: 8px;
}

.nav-link {
    color: #37443d !important;
    font-weight: 500;
    margin: 0 8px;
    transition: 0.3s;
}

.nav-link:hover {
    color: #198754 !important;
}

.login-btn {
    border: 1px solid #198754;
    color: #198754;
    padding: 9px 20px;
    border-radius: 8px;
    font-weight: 500;
    text-decoration: none;
    transition: 0.3s;
}

.login-btn:hover {
    background: #198754;
    color: white;
}

.register-btn {
    background: #198754;
    color: white;
    padding: 10px 21px;
    border-radius: 8px;
    font-weight: 500;
    text-decoration: none;
    transition: 0.3s;
}

.register-btn:hover {
    background: #146c43;
    color: white;
}

.logout-btn {
	background: #dc3545;
	color: white;
	padding: 10px 21px;
	border-radius: 8px;
	font-weight: 500;
	text-decoration: none;
	transition: 0.3s;
}

.logout-btn:hover {
	background: #bb2d3b;
	color: white;
}

/* ================= HERO ================= */

.services-hero {
    background: linear-gradient(135deg, #e8f5ee, #ffffff);
    padding: 70px 0;
    text-align: center;
}

.services-hero h1 {
    font-size: 44px;
    font-weight: 700;
    color: #198754;
    margin-bottom: 15px;
}

.services-hero p {
    max-width: 700px;
    margin: auto;
    font-size: 18px;
    line-height: 1.8;
    color: #6c757d;
}


/* ================= SERVICES SECTION ================= */

.services-section {
    padding: 70px 0;
}

.section-title {
    text-align: center;
    margin-bottom: 45px;
}

.section-title h2 {
    font-size: 32px;
    font-weight: 700;
    color: #212529;
}

.section-title p {
    color: #6c757d;
    max-width: 650px;
    margin: 10px auto;
}


/* ================= SERVICE CARD ================= */

.service-card {
    background: #ffffff;
    border: 1px solid #e5ece7;
    border-radius: 18px;
    padding: 35px 28px;
    height: 100%;
    text-align: center;
    box-shadow: 0 7px 25px rgba(0, 0, 0, 0.06);
    transition: 0.3s;
}

.service-card:hover {
    transform: translateY(-8px);
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.10);
}

.service-icon {
    width: 75px;
    height: 75px;
    margin: 0 auto 22px;
    border-radius: 50%;
    background: #e8f5ee;
    color: #198754;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 32px;
}

.service-card h4 {
    color: #212529;
    font-weight: 700;
    margin-bottom: 15px;
}

.service-card p {
    color: #6c757d;
    line-height: 1.7;
    margin-bottom: 20px;
}


/* ================= SERVICE LIST ================= */

.service-list {
    list-style: none;
    padding: 0;
    margin: 0;
    text-align: left;
}

.service-list li {
    padding: 7px 0;
    color: #59645e;
}

.service-list i {
    color: #198754;
    margin-right: 8px;
}


/* ================= CTA ================= */

.cta-section {
    padding: 20px 0 70px;
}

.cta-box {
    background: #198754;
    border-radius: 20px;
    padding: 55px 30px;
    text-align: center;
    color: white;
    box-shadow: 0 12px 30px rgba(25, 135, 84, 0.20);
}

.cta-box h2 {
    font-weight: 700;
    margin-bottom: 15px;
}

.cta-box p {
    max-width: 650px;
    margin: 0 auto 25px;
    line-height: 1.7;
    opacity: 0.95;
}

.cta-btn {
    display: inline-block;
    background: white;
    color: #198754;
    padding: 12px 25px;
    border-radius: 8px;
    text-decoration: none;
    font-weight: 600;
    transition: 0.3s;
}

.cta-btn:hover {
    background: #f1f1f1;
    color: #146c43;
}


/* ================= FOOTER ================= */

.footer {
    background: #212529;
    color: #adb5bd;
    padding: 25px 0;
    text-align: center;
}

.footer strong {
    color: white;
}

.footer i {
    color: #198754;
    margin-right: 5px;
}


/* ================= RESPONSIVE ================= */

@media (max-width: 768px) {

    .services-hero {
        padding: 55px 20px;
    }

    .services-hero h1 {
        font-size: 36px;
    }

    .service-card {
        padding: 30px 22px;
    }

}

</style>

</head>


<body>


<!-- ================= NAVBAR ================= -->

<nav class="navbar navbar-expand-lg navbar-custom">

    <div class="container">

        <!-- Logo -->

        <a href="index" class="logo">
            <i class="bi bi-cow"></i>
            DairyCare
        </a>


        <!-- Mobile Menu Button -->

        <button class="navbar-toggler"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#navbarMenu">

            <span class="navbar-toggler-icon"></span>

        </button>


        <!-- Navigation Menu -->

        <div class="collapse navbar-collapse" id="navbarMenu">

            <ul class="navbar-nav mx-auto">

                <li class="nav-item">
                    <a class="nav-link" href="index">
                        Home
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="about">
                        About
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link active" href="services">
                        Services
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="contact">
                        Contact
                    </a>
                </li>

            </ul>


            <!-- Login / Register -->

            
				<div class="d-flex gap-2">

					<%
					if (session.getAttribute("user") == null) {
					%>

					<!-- Show when NOT logged in -->
					<a href="login" class="login-btn"> <i
						class="bi bi-box-arrow-in-right"></i> Login
					</a> <a href="register" class="register-btn"> <i
						class="bi bi-person-plus"></i> Register
					</a>

					<%
					} else {
					%>

					<!-- Show when logged in -->
					<a href="logout" class="logout-btn"> <i
						class="bi bi-box-arrow-right"></i> Logout
					</a>

					<%
					}
					%>

				</div>

        </div>

    </div>

</nav>


<!-- ================= HERO ================= -->

<section class="services-hero">

    <div class="container">

        <span class="badge text-bg-success mb-3">
            DairyCare Services
        </span>

        <h1>
            Everything You Need
            <br>
            to Manage Your Dairy
        </h1>

        <p>
            DairyCare provides simple and organized tools to manage
            milk records, quality information, rates and daily dairy
            activities efficiently.
        </p>

    </div>

</section>


<!-- ================= SERVICES ================= -->

<section class="services-section">

    <div class="container">

        <div class="section-title">

            <h2>Our Services</h2>

            <p>
                Manage your dairy operations with simple and
                easy-to-use features.
            </p>

        </div>


        <div class="row g-4">


            <!-- SERVICE 1 -->

            <div class="col-md-6 col-lg-4">

                <div class="service-card">

                    <div class="service-icon">
                        <i class="bi bi-droplet"></i>
                    </div>

                    <h4>Milk Collection</h4>

                    <p>
                        Record and manage daily milk collection
                        information in an organized way.
                    </p>

                    <ul class="service-list">

                        <li>
                            <i class="bi bi-check-circle-fill"></i>
                            Daily milk quantity
                        </li>

                        <li>
                            <i class="bi bi-check-circle-fill"></i>
                            Farmer records
                        </li>

                        <li>
                            <i class="bi bi-check-circle-fill"></i>
                            Date-wise information
                        </li>

                    </ul>

                </div>

            </div>


            <!-- SERVICE 2 -->

            <div class="col-md-6 col-lg-4">

                <div class="service-card">

                    <div class="service-icon">
                        <i class="bi bi-speedometer2"></i>
                    </div>

                    <h4>Milk Quality</h4>

                    <p>
                        Keep track of important milk quality
                        information for better record management.
                    </p>

                    <ul class="service-list">

                        <li>
                            <i class="bi bi-check-circle-fill"></i>
                            Fat percentage
                        </li>

                        <li>
                            <i class="bi bi-check-circle-fill"></i>
                            Quality records
                        </li>

                        <li>
                            <i class="bi bi-check-circle-fill"></i>
                            Easy data management
                        </li>

                    </ul>

                </div>

            </div>


            <!-- SERVICE 3 -->

            <div class="col-md-6 col-lg-4">

                <div class="service-card">

                    <div class="service-icon">
                        <i class="bi bi-currency-rupee"></i>
                    </div>

                    <h4>Rate Management</h4>

                    <p>
                        Manage milk rates and keep your pricing
                        information organized.
                    </p>

                    <ul class="service-list">

                        <li>
                            <i class="bi bi-check-circle-fill"></i>
                            Milk rate records
                        </li>

                        <li>
                            <i class="bi bi-check-circle-fill"></i>
                            Simple calculations
                        </li>

                        <li>
                            <i class="bi bi-check-circle-fill"></i>
                            Easy access
                        </li>

                    </ul>

                </div>

            </div>


            <!-- SERVICE 4 -->

            <div class="col-md-6 col-lg-4">

                <div class="service-card">

                    <div class="service-icon">
                        <i class="bi bi-calendar3"></i>
                    </div>

                    <h4>Daily Records</h4>

                    <p>
                        Maintain organized dairy records based
                        on individual dates.
                    </p>

                    <ul class="service-list">

                        <li>
                            <i class="bi bi-check-circle-fill"></i>
                            Date-wise records
                        </li>

                        <li>
                            <i class="bi bi-check-circle-fill"></i>
                            Quick record access
                        </li>

                        <li>
                            <i class="bi bi-check-circle-fill"></i>
                            Organized information
                        </li>

                    </ul>

                </div>

            </div>


            <!-- SERVICE 5 -->

            <div class="col-md-6 col-lg-4">

                <div class="service-card">

                    <div class="service-icon">
                        <i class="bi bi-database-check"></i>
                    </div>

                    <h4>Record Management</h4>

                    <p>
                        Store and manage dairy information in a
                        structured digital system.
                    </p>

                    <ul class="service-list">

                        <li>
                            <i class="bi bi-check-circle-fill"></i>
                            Digital records
                        </li>

                        <li>
                            <i class="bi bi-check-circle-fill"></i>
                            Easy updates
                        </li>

                        <li>
                            <i class="bi bi-check-circle-fill"></i>
                            Organized database
                        </li>

                    </ul>

                </div>

            </div>


            <!-- SERVICE 6 -->

            <div class="col-md-6 col-lg-4">

                <div class="service-card">

                    <div class="service-icon">
                        <i class="bi bi-shield-check"></i>
                    </div>

                    <h4>Secure Access</h4>

                    <p>
                        Provide registered users with controlled
                        access to their dairy management system.
                    </p>

                    <ul class="service-list">

                        <li>
                            <i class="bi bi-check-circle-fill"></i>
                            User login
                        </li>

                        <li>
                            <i class="bi bi-check-circle-fill"></i>
                            Registration
                        </li>

                        <li>
                            <i class="bi bi-check-circle-fill"></i>
                            Protected records
                        </li>

                    </ul>

                </div>

            </div>

        </div>

    </div>

</section>


<!-- ================= CALL TO ACTION ================= -->

<section class="cta-section">

    <div class="container">

        <div class="cta-box">

            <i class="bi bi-cow fs-1"></i>

            <h2 class="mt-3">
                Start Managing Your Dairy Better
            </h2>

            <p>
                Join DairyCare and keep your dairy records
                organized, accessible and easy to manage.
            </p>

            <a href="register" class="cta-btn">

                <i class="bi bi-person-plus me-2"></i>
                Create Account

            </a>

        </div>

    </div>

</section>


<!-- ================= FOOTER ================= -->

<footer class="footer">

    <div class="container">

        <p class="mb-0">

            <i class="bi bi-cow"></i>

            <strong>DairyCare</strong>

            &nbsp; | &nbsp;

            Smart Dairy Management System

        </p>

    </div>

</footer>


<!-- Bootstrap JS -->

<script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
</script>


</body>

</html>
