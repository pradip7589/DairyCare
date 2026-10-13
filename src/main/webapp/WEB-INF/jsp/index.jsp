<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>DairyCare | Smart Dairy Farm Management</title>

<!-- Google Font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">

<!-- Bootstrap 5 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Bootstrap Icons -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<style>
:root {
	--green: #198754;
	--green-dark: #146c43;
	--green-deep: #1f3b2d;
	--green-soft: #e1f3e9;
	--bg: #f6f9f7;
	--text: #26352d;
	--muted: #718078;
}

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

html {
	scroll-behavior: smooth;
}

body {
	font-family: 'Poppins', sans-serif;
	background: #ffffff;
	color: var(--text);
}

section {
	scroll-margin-top: 80px;
}

/* ================= NAVBAR ================= */
.navbar-custom {
	background: rgba(255, 255, 255, 0.95);
	backdrop-filter: blur(8px);
	padding: 14px 0;
	box-shadow: 0 3px 15px rgba(0, 0, 0, 0.06);
	position: sticky;
	top: 0;
	z-index: 1000;
}

.logo {
	font-size: 24px;
	font-weight: 700;
	color: var(--green);
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
	color: var(--green) !important;
}

.login-btn {
	border: 1px solid var(--green);
	color: var(--green);
	padding: 9px 20px;
	border-radius: 8px;
	font-weight: 500;
	text-decoration: none;
	transition: 0.3s;
}

.login-btn:hover {
	background: var(--green);
	color: #fff;
}

.register-btn {
	background: var(--green);
	color: #fff;
	padding: 10px 21px;
	border-radius: 8px;
	font-weight: 500;
	text-decoration: none;
	transition: 0.3s;
}

.register-btn:hover {
	background: var(--green-dark);
	color: #fff;
}

.logout-btn {
	background: #dc3545;
	color: #fff;
	padding: 10px 21px;
	border-radius: 8px;
	font-weight: 500;
	text-decoration: none;
	transition: 0.3s;
}

.logout-btn:hover {
	background: #bb2d3b;
	color: #fff;
}

/* ================= HERO ================= */
.hero {
	position: relative;
	background: linear-gradient(150deg, var(--green-deep) 0%, #198754 130%);
	color: #fff;
	padding: 90px 0 110px;
	overflow: hidden;
}

.hero::before {
	content: "";
	position: absolute;
	width: 420px;
	height: 420px;
	background: rgba(255, 255, 255, 0.05);
	border-radius: 50%;
	top: -140px;
	right: -100px;
}

.hero::after {
	content: "";
	position: absolute;
	width: 300px;
	height: 300px;
	background: rgba(255, 255, 255, 0.04);
	border-radius: 50%;
	bottom: -120px;
	left: -80px;
}

.hero .container {
	position: relative;
	z-index: 1;
}

.hero-badge {
	display: inline-flex;
	align-items: center;
	gap: 8px;
	background: rgba(255, 255, 255, 0.12);
	border: 1px solid rgba(255, 255, 255, 0.2);
	padding: 7px 16px;
	border-radius: 30px;
	font-size: 13px;
	font-weight: 500;
	margin-bottom: 22px;
}

.hero h1 {
	font-size: 52px;
	font-weight: 700;
	line-height: 1.15;
}

.hero h1 span {
	color: #4ade80;
}

.hero p.lead-text {
	font-size: 17px;
	line-height: 1.8;
	color: #d9e6df;
	margin-top: 22px;
	max-width: 560px;
}

.btn-hero-primary {
	background: #ffffff;
	color: var(--green-deep);
	padding: 14px 28px;
	border-radius: 10px;
	font-weight: 600;
	text-decoration: none;
	transition: 0.3s;
	display: inline-flex;
	align-items: center;
	gap: 8px;
}

.btn-hero-primary:hover {
	background: #e1f3e9;
	color: var(--green-deep);
	transform: translateY(-2px);
}

.btn-hero-outline {
	border: 1px solid rgba(255, 255, 255, 0.5);
	color: #fff;
	padding: 13px 28px;
	border-radius: 10px;
	font-weight: 500;
	text-decoration: none;
	transition: 0.3s;
	display: inline-flex;
	align-items: center;
	gap: 8px;
}

.btn-hero-outline:hover {
	background: rgba(255, 255, 255, 0.12);
	color: #fff;
}

.hero-stats {
	display: flex;
	gap: 38px;
	margin-top: 44px;
	flex-wrap: wrap;
}

.hero-stats h4 {
	font-size: 26px;
	font-weight: 700;
	margin: 0;
}

.hero-stats small {
	color: #b9d0c3;
	font-size: 13px;
}

/* Hero preview card */
.preview-card {
	background: #fff;
	color: var(--text);
	border-radius: 20px;
	padding: 26px;
	box-shadow: 0 30px 60px rgba(0, 0, 0, 0.25);
}

.preview-head {
	display: flex;
	align-items: center;
	gap: 14px;
	margin-bottom: 20px;
}

.preview-head img {
	width: 56px;
	height: 56px;
	border-radius: 50%;
	object-fit: cover;
	border: 3px solid var(--green-soft);
}

.preview-head h6 {
	margin: 0;
	font-weight: 600;
}

.preview-head small {
	color: var(--muted);
}

.mini-stat {
	background: var(--bg);
	border-radius: 12px;
	padding: 14px;
	text-align: center;
	height: 100%;
}

.mini-stat i {
	font-size: 20px;
	color: var(--green);
}

.mini-stat h5 {
	font-weight: 700;
	margin: 6px 0 0;
}

.mini-stat small {
	color: var(--muted);
	font-size: 12px;
}

.bar-chart {
	display: flex;
	align-items: flex-end;
	gap: 10px;
	height: 90px;
	margin-top: 20px;
}

.bar-chart div {
	flex: 1;
	background: var(--green);
	border-radius: 6px 6px 0 0;
	opacity: 0.9;
}

/* ================= SECTIONS ================= */
.section {
	padding: 90px 0;
}

.section-alt {
	background: var(--bg);
}

.section-title {
	text-align: center;
	max-width: 620px;
	margin: 0 auto 55px;
}

.section-title .eyebrow {
	display: inline-block;
	color: var(--green);
	background: var(--green-soft);
	font-size: 13px;
	font-weight: 600;
	padding: 5px 14px;
	border-radius: 20px;
	margin-bottom: 14px;
}

.section-title h2 {
	font-weight: 700;
	color: var(--green-deep);
}

.section-title p {
	color: var(--muted);
	margin-top: 10px;
}

/* Feature cards */
.feature-card {
	background: #fff;
	border: 1px solid #e5eee8;
	border-radius: 16px;
	padding: 30px 26px;
	height: 100%;
	transition: 0.3s;
}

.feature-card:hover {
	transform: translateY(-7px);
	box-shadow: 0 14px 32px rgba(0, 0, 0, 0.08);
	border-color: transparent;
}

.feature-icon {
	width: 58px;
	height: 58px;
	background: var(--green-soft);
	color: var(--green);
	border-radius: 14px;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 26px;
	margin-bottom: 20px;
}

.feature-card h5 {
	font-weight: 600;
	font-size: 18px;
}

.feature-card p {
	color: var(--muted);
	font-size: 14px;
	line-height: 1.7;
	margin-bottom: 14px;
}

.feature-card a {
	color: var(--green);
	font-weight: 500;
	font-size: 14px;
	text-decoration: none;
}

.feature-card a:hover {
	text-decoration: underline;
}

/* How it works */
.step-card {
	text-align: center;
	padding: 10px 20px;
}

.step-number {
	width: 64px;
	height: 64px;
	border-radius: 50%;
	background: var(--green);
	color: #fff;
	font-size: 24px;
	font-weight: 700;
	display: flex;
	align-items: center;
	justify-content: center;
	margin: 0 auto 20px;
	box-shadow: 0 0 0 8px var(--green-soft);
}

.step-card h5 {
	font-weight: 600;
}

.step-card p {
	color: var(--muted);
	font-size: 14px;
	line-height: 1.7;
}

/* AI section */
.ai-box {
	background: linear-gradient(150deg, var(--green-deep), #198754 140%);
	border-radius: 24px;
	padding: 55px 50px;
	color: #fff;
	position: relative;
	overflow: hidden;
}

.ai-box::before {
	content: "";
	position: absolute;
	width: 300px;
	height: 300px;
	background: rgba(255, 255, 255, 0.05);
	border-radius: 50%;
	top: -100px;
	right: -80px;
}

.ai-box > * {
	position: relative;
	z-index: 1;
}

.ai-box h2 {
	font-weight: 700;
}

.ai-box p {
	color: #d9e6df;
	line-height: 1.8;
}

.ai-list {
	list-style: none;
	margin-top: 22px;
}

.ai-list li {
	display: flex;
	align-items: center;
	gap: 12px;
	margin-bottom: 12px;
	font-size: 14.5px;
}

.ai-list .check {
	width: 24px;
	height: 24px;
	border-radius: 50%;
	background: rgba(255, 255, 255, 0.18);
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 12px;
	flex-shrink: 0;
}

.chat-mock {
	background: #fff;
	border-radius: 18px;
	padding: 20px;
	color: var(--text);
	box-shadow: 0 20px 45px rgba(0, 0, 0, 0.2);
}

.chat-mock .msg {
	padding: 10px 14px;
	border-radius: 12px;
	font-size: 13.5px;
	margin-bottom: 10px;
	max-width: 88%;
}

.chat-mock .user {
	background: var(--green-soft);
	margin-left: auto;
}

.chat-mock .bot {
	background: var(--bg);
}

/* About */
.about-icon-box {
	background: var(--green-soft);
	border-radius: 24px;
	padding: 50px;
	text-align: center;
}

.about-icon-box i {
	font-size: 110px;
	color: var(--green);
}

.about-points p {
	color: var(--muted);
	line-height: 1.9;
}

.about-point {
	display: flex;
	gap: 12px;
	margin-top: 14px;
	font-weight: 500;
}

.about-point i {
	color: var(--green);
	font-size: 20px;
}

/* CTA */
.cta {
	background: var(--green-soft);
	border-radius: 24px;
	padding: 60px 30px;
	text-align: center;
}

.cta h2 {
	font-weight: 700;
	color: var(--green-deep);
}

.cta p {
	color: var(--muted);
	max-width: 520px;
	margin: 12px auto 28px;
}

.btn-green {
	background: var(--green);
	color: #fff;
	padding: 13px 28px;
	border-radius: 10px;
	font-weight: 600;
	text-decoration: none;
	transition: 0.3s;
	display: inline-flex;
	align-items: center;
	gap: 8px;
}

.btn-green:hover {
	background: var(--green-dark);
	color: #fff;
	transform: translateY(-2px);
}

/* ================= FOOTER ================= */
footer {
	background: var(--green-deep);
	color: #fff;
	padding: 60px 0 25px;
}

footer h5 {
	font-weight: 600;
}

footer p, footer li a {
	color: #c9d8d0;
	font-size: 14px;
}

footer ul {
	list-style: none;
	padding: 0;
}

footer li {
	margin-bottom: 8px;
}

footer li a {
	text-decoration: none;
	transition: 0.3s;
}

footer li a:hover {
	color: #4ade80;
}

.footer-bottom {
	border-top: 1px solid rgba(255, 255, 255, 0.1);
	margin-top: 35px;
	padding-top: 20px;
	text-align: center;
	color: #aebdb5;
	font-size: 13px;
}

/* ================= RESPONSIVE ================= */
@media (max-width: 992px) {
	.hero {
		padding: 70px 0 80px;
		text-align: center;
	}
	.hero h1 {
		font-size: 38px;
	}
	.hero p.lead-text {
		margin-left: auto;
		margin-right: auto;
	}
	.hero .hero-actions, .hero-stats {
		justify-content: center;
	}
	.preview-card {
		margin-top: 50px;
	}
	.ai-box {
		padding: 40px 28px;
	}
	.section {
		padding: 70px 0;
	}
}
</style>
</head>

<body>

	<!-- ================= NAVBAR ================= -->
	<nav class="navbar navbar-expand-lg navbar-custom">
		<div class="container">

			<a href="index" class="logo"> <i class="bi bi-cow"></i> DairyCare
			</a>

			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarMenu">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarMenu">

				<ul class="navbar-nav mx-auto">
					<li class="nav-item"><a class="nav-link" href="index">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="about">About</a></li>
					<li class="nav-item"><a class="nav-link" href="services">service</a></li>
					<li class="nav-item"><a class="nav-link" href="contact">Contact</a></li>
				</ul>

				<div class="d-flex gap-2 mt-3 mt-lg-0">

					<%
					if (session.getAttribute("user") == null) {
					%>

					<a href="login" class="login-btn"> <i
						class="bi bi-box-arrow-in-right"></i> Login
					</a> <a href="register" class="register-btn"> <i
						class="bi bi-person-plus"></i> Register
					</a>

					<%
					} else {
					%>

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
	<section class="hero">
		<div class="container">
			<div class="row align-items-center g-5">

				<div class="col-lg-6">

					<div class="hero-badge">
						<i class="bi bi-stars"></i> Now with AI Farm Assistant
					</div>

					<h1>
						Smart <span>Dairy Farm</span> Management Made Simple
					</h1>

					<p class="lead-text">Monitor livestock health, track daily milk
						production and manage farm resources from one modern platform —
						built to help your dairy business grow.</p>

					<div class="d-flex flex-wrap gap-3 mt-4 hero-actions">
						<a href="login" class="btn-hero-primary"> <i
							class="bi bi-speedometer2"></i> Get Started
						</a> <a href="#features" class="btn-hero-outline"> Explore Features <i
							class="bi bi-arrow-down"></i>
						</a>
					</div>

					<div class="hero-stats">
						<div>
							<h4>500+</h4>
							<small>Cattle Managed</small>
						</div>
						<div>
							<h4>24/7</h4>
							<small>Farm Monitoring</small>
						</div>
						<div>
							<h4>99%</h4>
							<small>Record Accuracy</small>
						</div>
					</div>

				</div>

				<div class="col-lg-6">
					<div class="preview-card">

						<div class="preview-head">
							<img src="assets/images/cow_face.jpg" alt="cow">
							<div>
								<h6>Green Valley Dairy</h6>
								<small>Today's overview</small>
							</div>
						</div>

						<div class="row g-3">
							<div class="col-4">
								<div class="mini-stat">
									<i class="bi bi-heart-pulse"></i>
									<h5>128</h5>
									<small>Cattle</small>
								</div>
							</div>
							<div class="col-4">
								<div class="mini-stat">
									<i class="bi bi-droplet"></i>
									<h5>842 L</h5>
									<small>Milk Today</small>
								</div>
							</div>
							<div class="col-4">
								<div class="mini-stat">
									<i class="bi bi-graph-up-arrow"></i>
									<h5>+6.2%</h5>
									<small>Growth</small>
								</div>
							</div>
						</div>

						<div class="bar-chart">
							<div style="height: 45%;"></div>
							<div style="height: 62%;"></div>
							<div style="height: 70%;"></div>
							<div style="height: 52%;"></div>
							<div style="height: 82%;"></div>
							<div style="height: 92%;"></div>
							<div style="height: 100%;"></div>
						</div>

					</div>
				</div>

			</div>
		</div>
	</section>

	<!-- ================= FEATURES ================= -->
	<section class="section" id="features">
		<div class="container">

			<div class="section-title">
				<span class="eyebrow">Features</span>
				<h2>Everything You Need to Run Your Dairy</h2>
				<p>Powerful tools designed for simple and efficient dairy farm
					management.</p>
			</div>

			<div class="row g-4">

				<div class="col-md-6 col-lg-4">
					<div class="feature-card">
						<div class="feature-icon">
							<i class="bi bi-heart-pulse"></i>
						</div>
						<h5>Livestock Management</h5>
						<p>Maintain detailed information about cattle, their health,
							feeding and veterinary records.</p>
						<a href="health">Learn more <i class="bi bi-arrow-right"></i></a>
					</div>
				</div>

				<div class="col-md-6 col-lg-4">
					<div class="feature-card">
						<div class="feature-icon">
							<i class="bi bi-droplet"></i>
						</div>
						<h5>Milk Production</h5>
						<p>Track daily milk quantity, fat and SNF values with accurate
							records for better productivity.</p>
						<a href="milk">Learn more <i class="bi bi-arrow-right"></i></a>
					</div>
				</div>

				<div class="col-md-6 col-lg-4">
					<div class="feature-card">
						<div class="feature-icon">
							<i class="bi bi-graph-up"></i>
						</div>
						<h5>Reports & Analytics</h5>
						<p>Analyze your dairy operations and make better decisions using
							organized farm data.</p>
						<a href="report">Learn more <i class="bi bi-arrow-right"></i></a>
					</div>
				</div>

				<div class="col-md-6 col-lg-4">
					<div class="feature-card">
						<div class="feature-icon">
							<i class="bi bi-basket2"></i>
						</div>
						<h5>Feed & Resources</h5>
						<p>Keep track of feed stock and farm resources and get reminded
							before supplies run low.</p>
						<a href="login">Learn more <i class="bi bi-arrow-right"></i></a>
					</div>
				</div>

				<div class="col-md-6 col-lg-4">
					<div class="feature-card">
						<div class="feature-icon">
							<i class="bi bi-bell"></i>
						</div>
						<h5>Smart Alerts</h5>
						<p>Get instant alerts for cattle needing attention, low stock and
							important farm events.</p>
						<a href="login">Learn more <i class="bi bi-arrow-right"></i></a>
					</div>
				</div>

				<div class="col-md-6 col-lg-4">
					<div class="feature-card">
						<div class="feature-icon">
							<i class="bi bi-robot"></i>
						</div>
						<h5>AI Farm Assistant</h5>
						<p>Ask questions about your farm in plain language and get instant
							answers from your own data.</p>
						<a href="login">Learn more <i class="bi bi-arrow-right"></i></a>
					</div>
				</div>

			</div>
		</div>
	</section>

	<!-- ================= HOW IT WORKS ================= -->
	<section class="section section-alt" id="how-it-works">
		<div class="container">

			<div class="section-title">
				<span class="eyebrow">How It Works</span>
				<h2>Get Started in 3 Simple Steps</h2>
				<p>Set up your farm and start managing it in minutes.</p>
			</div>

			<div class="row g-4">

				<div class="col-md-4">
					<div class="step-card">
						<div class="step-number">1</div>
						<h5>Create Your Account</h5>
						<p>Register with your farm details to set up your personal
							DairyCare workspace.</p>
					</div>
				</div>

				<div class="col-md-4">
					<div class="step-card">
						<div class="step-number">2</div>
						<h5>Add Your Farm Data</h5>
						<p>Enter cattle details, daily milk collection and feed stock
							records in a few clicks.</p>
					</div>
				</div>

				<div class="col-md-4">
					<div class="step-card">
						<div class="step-number">3</div>
						<h5>Track & Grow</h5>
						<p>Use reports, alerts and the AI assistant to make smarter
							decisions every day.</p>
					</div>
				</div>

			</div>
		</div>
	</section>

	<!-- ================= AI ASSISTANT ================= -->
	<section class="section">
		<div class="container">
			<div class="ai-box">
				<div class="row align-items-center g-5">

					<div class="col-lg-6">
						<h2>Meet Your AI Farm Assistant</h2>
						<p class="mt-3">Stop digging through records. Just ask a
							question and get an instant, easy-to-understand answer based on
							your own farm data.</p>

						<ul class="ai-list">
							<li><span class="check"><i class="bi bi-check-lg"></i></span>
								Ask about cattle health and milk yield</li>
							<li><span class="check"><i class="bi bi-check-lg"></i></span>
								Get quick summaries of daily production</li>
							<li><span class="check"><i class="bi bi-check-lg"></i></span>
								Available right inside your dashboard</li>
						</ul>
					</div>

					<div class="col-lg-6">
						<div class="chat-mock">
							<div class="msg user">Which cattle need attention?</div>
							<div class="msg bot">Kaveri (#C-098) needs attention — her
								milk yield dropped to 9.4 L/day and her last checkup was 10 Sep.</div>
							<div class="msg user">What was today's milk yield?</div>
							<div class="msg bot mb-0">Today's total milk yield is 842 L,
								up 6.2% from yesterday.</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</section>

	<!-- ================= ABOUT ================= -->
	<section class="section section-alt" id="about">
		<div class="container">
			<div class="row align-items-center g-5">

				<div class="col-lg-5">
					<div class="about-icon-box">
						<i class="bi bi-building-check"></i>
					</div>
				</div>

				<div class="col-lg-7 about-points">
					<span class="section-title d-block text-start mb-2"> <span
						class="eyebrow">About Us</span>
					</span>
					<h2 class="fw-bold" style="color: var(--green-deep);">About
						Dairy Farm Management</h2>

					<p class="mt-3">Dairy farm management is the organized process
						of handling milk production, livestock care and farm resources to
						ensure efficiency and profitability.</p>

					<p>Our system combines traditional farming practices with smart
						digital tools to help create a sustainable and efficiently managed
						dairy business.</p>

					<div class="about-point">
						<i class="bi bi-check-circle-fill"></i> Healthy cattle, tracked
						and monitored
					</div>
					<div class="about-point">
						<i class="bi bi-check-circle-fill"></i> Accurate milk yield and
						quality records
					</div>
					<div class="about-point">
						<i class="bi bi-check-circle-fill"></i> Data-driven decisions for
						better profitability
					</div>
				</div>

			</div>
		</div>
	</section>

	<!-- ================= CTA ================= -->
	<section class="section">
		<div class="container">
			<div class="cta">
				<h2>Ready to Simplify Your Dairy Management?</h2>
				<p>Join DairyCare today and take control of your livestock, milk
					production and farm records.</p>
				<a href="register" class="btn-green"> <i
					class="bi bi-person-plus"></i> Create Free Account
				</a>
			</div>
		</div>
	</section>

	<!-- ================= FOOTER ================= -->
	<footer>
		<div class="container">
			<div class="row g-4">

				<div class="col-lg-5">
					<h5>
						<i class="bi bi-cow"></i> DairyCare
					</h5>
					<p class="mt-2">Smart management for a better dairy business.
						Monitor livestock, track milk production and manage your farm
						from one place.</p>
				</div>

				<div class="col-6 col-lg-3 offset-lg-1">
					<h5 class="fs-6">Quick Links</h5>
					<ul class="mt-3">
						<li><a href="index">Home</a></li>
						<li><a href="about">About</a></li>
						<li><a href="services">Services</a></li>
						<li><a href="contact">Contact</a></li>
					</ul>
				</div>

				<div class="col-6 col-lg-3">
					<h5 class="fs-6">Get Started</h5>
					<ul class="mt-3">
						<li><a href="login">Login</a></li>
						<li><a href="register">Register</a></li>
					</ul>
				</div>

			</div>

			<div class="footer-bottom">© 2026 Dairy Farm Management | All
				Rights Reserved</div>
		</div>
	</footer>

	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>