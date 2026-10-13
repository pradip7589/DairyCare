<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>DairyCare - About Us</title>

<!-- Bootstrap 5 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Bootstrap Icons -->
<link rel="stylesheet"
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

/* ================= HERO SECTION ================= */
.about-hero {
	background: linear-gradient(135deg, #e8f5ee, #ffffff);
	padding: 75px 0;
}

.about-hero h1 {
	font-size: 46px;
	font-weight: 700;
	color: #198754;
}

.about-hero p {
	font-size: 18px;
	line-height: 1.8;
	color: #5f6b65;
}

.hero-icon {
	width: 180px;
	height: 180px;
	margin: auto;
	border-radius: 50%;
	background: #ffffff;
	display: flex;
	align-items: center;
	justify-content: center;
	box-shadow: 0 10px 35px rgba(0, 0, 0, 0.08);
}

.hero-icon i {
	font-size: 90px;
	color: #198754;
}

/* ================= SECTION TITLE ================= */
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

/* ================= ABOUT CONTENT ================= */
.about-section {
	padding: 70px 0;
}

.about-card {
	background: #ffffff;
	border-radius: 16px;
	padding: 35px;
	height: 100%;
	box-shadow: 0 8px 30px rgba(0, 0, 0, 0.06);
	border: 1px solid #e8eee9;
}

.about-card h3 {
	font-size: 23px;
	font-weight: 700;
	color: #198754;
	margin-bottom: 18px;
}

.about-card p {
	color: #6c757d;
	line-height: 1.8;
}

/* ================= FEATURES ================= */
.features-section {
	background: #ffffff;
	padding: 70px 0;
}

.feature-card {
	background: #f8faf9;
	border: 1px solid #e5ece7;
	border-radius: 15px;
	padding: 30px 20px;
	text-align: center;
	height: 100%;
	transition: 0.3s;
}

.feature-card:hover {
	transform: translateY(-6px);
	box-shadow: 0 10px 25px rgba(0, 0, 0, 0.08);
}

.feature-icon {
	width: 65px;
	height: 65px;
	margin: 0 auto 20px;
	border-radius: 50%;
	background: #e8f5ee;
	color: #198754;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 28px;
}

.feature-card h4 {
	font-weight: 600;
	color: #212529;
	margin-bottom: 12px;
}

.feature-card p {
	color: #6c757d;
	line-height: 1.6;
}

/* ================= MISSION ================= */
.mission-section {
	padding: 70px 0;
}

.mission-box {
	background: #198754;
	color: white;
	border-radius: 20px;
	padding: 55px 40px;
	text-align: center;
	box-shadow: 0 10px 30px rgba(25, 135, 84, 0.2);
}

.mission-box i {
	font-size: 45px;
	margin-bottom: 20px;
}

.mission-box h2 {
	font-weight: 700;
	margin-bottom: 15px;
}

.mission-box p {
	max-width: 750px;
	margin: auto;
	line-height: 1.8;
	opacity: 0.95;
}

/* ================= FOOTER ================= */
.footer {
	background: #212529;
	color: #adb5bd;
	padding: 25px 0;
	text-align: center;
}

.footer strong {
	color: #ffffff;
}

.footer i {
	color: #198754;
	margin-right: 5px;
}

/* ================= RESPONSIVE ================= */
@media ( max-width : 768px) {
	.about-hero {
		text-align: center;
		padding: 55px 20px;
	}
	.about-hero h1 {
		font-size: 36px;
	}
	.hero-icon {
		width: 140px;
		height: 140px;
		margin-top: 35px;
	}
	.hero-icon i {
		font-size: 70px;
	}
}
</style>

</head>


<body>


	<!-- ================= NAVBAR ================= -->

	<nav class="navbar navbar-expand-lg navbar-custom">

		<div class="container">

			<!-- Logo -->

			<a href="index" class="logo"> <i class="bi bi-cow"></i> DairyCare
			</a>


			<!-- Mobile Menu Button -->

			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarMenu">

				<span class="navbar-toggler-icon"></span>

			</button>


			<!-- Navigation Menu -->

			<div class="collapse navbar-collapse" id="navbarMenu">

				<ul class="navbar-nav mx-auto">

					<li class="nav-item"><a class="nav-link" href="index">
							Home </a></li>

					<li class="nav-item"><a class="nav-link active" href="about">
							About </a></li>

					<li class="nav-item"><a class="nav-link" href="services">service</a></li>

					<li class="nav-item"><a class="nav-link" href="contact">
							Contact </a></li>

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

	<section class="about-hero">

		<div class="container">

			<div class="row align-items-center">

				<div class="col-lg-7">

					<span class="badge text-bg-success mb-3"> About DairyCare </span>

					<h1>
						Smart Management for <br> Modern Dairy Farming
					</h1>

					<p class="mt-3">DairyCare is a simple and efficient dairy
						management system designed to help dairy farmers manage their
						daily milk collection, quantity, fat percentage, rates and records
						in one place.</p>

					<a href="register" class="btn btn-success btn-lg mt-3 px-4"> <i
						class="bi bi-person-plus me-2"></i> Get Started

					</a>

				</div>


				<div class="col-lg-5 text-center">

					<div
						style="width: 300px; height: 300px; overflow: hidden; border-radius: 50%; position: relative; display: inline-block;">
						<img src="assets/images/DairyCare_logo.png" alt="cow"
							style="width: 100%; height: 100%; object-fit: cover; transform: scale(2); transform-origin: center; display: block;">
					</div>
				</div>

			</div>

		</div>

	</section>


	<!-- ================= ABOUT ================= -->

	<section class="about-section">

		<div class="container">

			<div class="section-title">

				<h2>About Our System</h2>

				<p>A simple digital solution for organizing and managing
					dairy-related information efficiently.</p>

			</div>


			<div class="row g-4">

				<div class="col-md-6">

					<div class="about-card">

						<h3>
							<i class="bi bi-bullseye me-2"></i> Our Purpose
						</h3>

						<p>DairyCare aims to reduce manual record keeping and make
							dairy management easier. The system allows users to maintain
							accurate records of milk production and related information.</p>

						<p>By storing information digitally, farmers can access their
							records quickly and manage their daily activities more
							efficiently.</p>

					</div>

				</div>


				<div class="col-md-6">

					<div class="about-card">

						<h3>
							<i class="bi bi-lightbulb me-2"></i> Why DairyCare?
						</h3>

						<p>Traditional dairy management can involve a large amount of
							paperwork and manual calculations. DairyCare provides a
							structured platform to organize important dairy records.</p>

						<p>The system focuses on simplicity, accuracy and easy access
							to information.</p>

					</div>

				</div>

			</div>

		</div>

	</section>


	<!-- ================= FEATURES ================= -->

	<section class="features-section">

		<div class="container">

			<div class="section-title">

				<h2>What DairyCare Offers</h2>

				<p>Useful features designed to simplify everyday dairy
					management.</p>

			</div>


			<div class="row g-4">


				<!-- Feature 1 -->

				<div class="col-md-6 col-lg-3">

					<div class="feature-card">

						<div class="feature-icon">
							<i class="bi bi-droplet"></i>
						</div>

						<h4>Milk Records</h4>

						<p>Maintain daily milk quantity records in an organized
							manner.</p>

					</div>

				</div>


				<!-- Feature 2 -->

				<div class="col-md-6 col-lg-3">

					<div class="feature-card">

						<div class="feature-icon">
							<i class="bi bi-speedometer2"></i>
						</div>

						<h4>Fat Tracking</h4>

						<p>Store and manage milk fat percentage for individual
							records.</p>

					</div>

				</div>


				<!-- Feature 3 -->

				<div class="col-md-6 col-lg-3">

					<div class="feature-card">

						<div class="feature-icon">
							<i class="bi bi-currency-rupee"></i>
						</div>

						<h4>Rate Management</h4>

						<p>Keep track of milk rates and simplify daily calculations.</p>

					</div>

				</div>


				<!-- Feature 4 -->

				<div class="col-md-6 col-lg-3">

					<div class="feature-card">

						<div class="feature-icon">
							<i class="bi bi-calendar-check"></i>
						</div>

						<h4>Daily Records</h4>

						<p>Organize dairy information according to date for easy
							access.</p>

					</div>

				</div>

			</div>

		</div>

	</section>


	<!-- ================= MISSION ================= -->

	<section class="mission-section">

		<div class="container">

			<div class="mission-box">

				<i class="bi bi-heart-pulse"></i>

				<h2>Our Mission</h2>

				<p>Our mission is to make dairy management simpler, more
					organized and accessible through technology. DairyCare brings
					essential dairy records together in a user-friendly digital
					platform.</p>

			</div>

		</div>

	</section>


	<!-- ================= FOOTER ================= -->

	<footer class="footer">

		<div class="container">

			<p class="mb-0">

				<i class="bi bi-cow"></i> <strong>DairyCare</strong> &nbsp; | &nbsp;

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
