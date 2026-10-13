<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>DairyCare - Animal Health</title>

<!-- Bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Bootstrap Icons -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">


<style>

/* ================= GLOBAL ================= */

* {
	box-sizing: border-box;
}

body {
	margin: 0;
	font-family: 'Poppins', sans-serif;
	background: #f6f9f7;
	color: #26352d;
}

a {
	text-decoration: none;
}


/* ================= SIDEBAR ================= */

.sidebar {
	position: fixed;
	top: 0;
	left: 0;
	width: 250px;
	height: 100vh;
	background: #1f3b2d;
	padding: 24px 18px;
	z-index: 1030;
	display: flex;
	flex-direction: column;
}

.logo {
	display: flex;
	align-items: center;
	gap: 10px;
	color: #ffffff;
	font-size: 22px;
	font-weight: 700;
	padding: 0 12px 25px;
	text-decoration: none;
}

.logo i {
	color: #4ade80;
	font-size: 27px;
}

.sidebar-nav {
	gap: 7px;
}

.sidebar-nav .nav-link {
	display: flex;
	align-items: center;
	gap: 13px;
	color: #cbd8d0;
	padding: 12px 14px;
	border-radius: 10px;
	font-size: 14px;
	font-weight: 500;
	transition: 0.25s;
}

.sidebar-nav .nav-link i {
	font-size: 18px;
}

.sidebar-nav .nav-link:hover {
	background: rgba(255, 255, 255, 0.08);
	color: #ffffff;
}

.sidebar-nav .nav-link.active {
	background: #198754;
	color: #ffffff;
}

.sidebar-footer {
	margin-top: auto;
	padding: 15px 12px 5px;
	border-top: 1px solid rgba(255, 255, 255, 0.08);
}

.sidebar-footer .logout-btn {
	display: flex;
	align-items: center;
	gap: 10px;
	color: #f4b8b8;
	font-size: 14px;
	font-weight: 500;
	padding: 10px 0;
	text-decoration: none;
}

.sidebar-footer .logout-btn:hover {
	color: #ffffff;
}


/* ================= MAIN CONTENT ================= */

.main-content {
	margin-left: 250px;
	width: calc(100% - 250px);
	min-height: 100vh;
	padding-bottom: 40px;
}


/* ================= TOPBAR ================= */

.topbar {
	background: #ffffff;
	padding: 16px 30px;
	display: flex;
	align-items: center;
	justify-content: space-between;
	box-shadow: 0 3px 15px rgba(0, 0, 0, 0.06);
	position: sticky;
	top: 0;
	z-index: 1020;
}

.search-box {
	background: #f6f9f7;
	border-radius: 8px;
	padding: 8px 15px;
	display: flex;
	align-items: center;
	gap: 8px;
	width: 320px;
}

.search-box input {
	border: none;
	background: transparent;
	outline: none;
	width: 100%;
	font-size: 14px;
}

.search-box i {
	color: #718078;
}

.topbar-right {
	display: flex;
	align-items: center;
	gap: 20px;
}

.icon-btn {
	position: relative;
	color: #37443d;
	font-size: 20px;
	text-decoration: none;
}

.icon-btn:hover {
	color: #198754;
}

.icon-btn .badge-dot {
	position: absolute;
	top: -3px;
	right: -3px;
	width: 8px;
	height: 8px;
	background: #dc3545;
	border-radius: 50%;
}

.user-chip {
	display: flex;
	align-items: center;
	gap: 10px;
}

.user-chip img {
	width: 38px;
	height: 38px;
	border-radius: 50%;
	object-fit: cover;
}

.user-chip .name {
	font-weight: 600;
	font-size: 14px;
	line-height: 1.2;
}

.user-chip .role {
	font-size: 12px;
	color: #718078;
}

.sidebar-toggle {
	display: none;
	border: none;
	background: transparent;
	font-size: 23px;
	color: #37443d;
}


/* ================= CONTENT AREA ================= */

.content-area {
	padding: 28px 30px;
}


/* ================= PAGE HEADER ================= */

.page-heading {
	display: flex;
	align-items: center;
	justify-content: space-between;
	margin-bottom: 25px;
}

.page-heading h2 {
	margin: 0;
	font-size: 25px;
	font-weight: 700;
	color: #1f3b2d;
}

.page-heading p {
	margin: 5px 0 0;
	font-size: 14px;
	color: #718078;
}

.health-status {
	background: #e1f3e9;
	color: #198754;
	padding: 8px 14px;
	border-radius: 20px;
	font-size: 12px;
	font-weight: 600;
}

.health-status i {
	margin-right: 5px;
}


/* ================= HERO ================= */

.health-hero {
	background: linear-gradient(135deg, #1f3b2d, #198754);
	border-radius: 18px;
	padding: 30px;
	color: white;
	margin-bottom: 25px;
	position: relative;
	overflow: hidden;
}

.health-hero::after {
	content: "";
	position: absolute;
	width: 220px;
	height: 220px;
	border-radius: 50%;
	background: rgba(255, 255, 255, 0.07);
	right: -60px;
	top: -80px;
}

.health-hero-content {
	position: relative;
	z-index: 1;
}

.health-hero h3 {
	font-size: 23px;
	font-weight: 600;
	margin-bottom: 10px;
}

.health-hero p {
	margin: 0;
	font-size: 14px;
	color: #e5f4ea;
	max-width: 700px;
	line-height: 1.7;
}

.hero-icon {
	position: absolute;
	right: 40px;
	bottom: 20px;
	font-size: 75px;
	color: rgba(255, 255, 255, 0.13);
}


/* ================= SECTION TITLE ================= */

.section-title {
	font-size: 18px;
	font-weight: 600;
	color: #1f3b2d;
	margin-bottom: 16px;
}


/* ================= HEALTH CARDS ================= */

.health-card {
	background: #ffffff;
	border: 1px solid #e8eee9;
	border-radius: 15px;
	padding: 22px;
	height: 100%;
	box-shadow: 0 7px 22px rgba(0, 0, 0, 0.04);
	transition: 0.25s;
}

.health-card:hover {
	transform: translateY(-4px);
	box-shadow: 0 12px 28px rgba(0, 0, 0, 0.08);
	border-color: #cde7d7;
}

.health-card-icon {
	width: 50px;
	height: 50px;
	border-radius: 12px;
	background: #e1f3e9;
	color: #198754;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 23px;
	margin-bottom: 16px;
}

.health-card h5 {
	font-size: 15px;
	font-weight: 600;
	margin-bottom: 8px;
	color: #26352d;
}

.health-card p {
	font-size: 13px;
	color: #718078;
	line-height: 1.7;
	margin: 0;
}


/* ================= CHECKLIST ================= */

.checklist-box {
	background: #ffffff;
	border-radius: 16px;
	padding: 25px;
	box-shadow: 0 7px 22px rgba(0, 0, 0, 0.04);
	border: 1px solid #e8eee9;
}

.check-item {
	display: flex;
	align-items: center;
	gap: 12px;
	padding: 13px 0;
	border-bottom: 1px solid #eef2ef;
	font-size: 13px;
	color: #46544c;
}

.check-item:last-child {
	border-bottom: none;
}

.check-icon {
	width: 30px;
	height: 30px;
	border-radius: 50%;
	background: #e1f3e9;
	color: #198754;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-shrink: 0;
}

.check-icon i {
	font-size: 14px;
}


/* ================= TIP ================= */

.dairy-tip {
	background: #fff8e8;
	border: 1px solid #f5dfaa;
	border-radius: 15px;
	padding: 22px;
	height: 100%;
}

.tip-icon {
	width: 42px;
	height: 42px;
	border-radius: 10px;
	background: #ffe9a8;
	color: #a97800;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 20px;
	margin-bottom: 13px;
}

.dairy-tip h5 {
	font-size: 15px;
	font-weight: 600;
	color: #725700;
}

.dairy-tip p {
	font-size: 13px;
	color: #806b32;
	line-height: 1.7;
	margin: 0;
}


/* ================= QUICK STATS ================= */

.quick-stat {
	background: #ffffff;
	border-radius: 15px;
	padding: 20px;
	border: 1px solid #e8eee9;
	box-shadow: 0 7px 22px rgba(0, 0, 0, 0.04);
	text-align: center;
}

.quick-stat i {
	font-size: 25px;
	color: #198754;
	margin-bottom: 8px;
}

.quick-stat h4 {
	margin: 0;
	font-size: 20px;
	font-weight: 700;
	color: #1f3b2d;
}

.quick-stat span {
	font-size: 12px;
	color: #718078;
}


/* ================= RESPONSIVE ================= */

@media (max-width: 992px) {

	.sidebar {
		left: -250px;
		transition: 0.3s;
	}

	.sidebar.show {
		left: 0;
	}

	.main-content {
		margin-left: 0;
		width: 100%;
	}

	.sidebar-toggle {
		display: inline-block;
	}

	.search-box {
		display: none;
	}

	.topbar {
		padding: 15px 20px;
	}

	.content-area {
		padding: 22px 20px;
	}

	.page-heading {
		align-items: flex-start;
		gap: 15px;
	}

	.hero-icon {
		display: none;
	}
}


@media (max-width: 576px) {

	.page-heading {
		display: block;
	}

	.health-status {
		display: inline-block;
		margin-top: 12px;
	}

	.page-heading h2 {
		font-size: 21px;
	}

	.health-hero {
		padding: 22px;
	}

	.health-hero h3 {
		font-size: 20px;
	}

	.user-chip .role {
		display: none;
	}

	.user-chip img {
		width: 35px;
		height: 35px;
	}

	.content-area {
		padding: 20px 15px;
	}

}

</style>

</head>


<body>


<%
	/* ================= SESSION PROTECTION ================= */

	session = request.getSession(false);

	if (session == null || session.getAttribute("user") == null) {
		response.sendRedirect("login");
		return;
	}

	String userName = (String) session.getAttribute("user");
%>


<div class="dashboard-wrapper">


	<!-- ================= SIDEBAR ================= -->

	<aside class="sidebar" id="sidebar">

		<a href="index" class="logo">
			<i class="bi bi-cow"></i>
			<span>DairyCare</span>
		</a>


		<nav class="sidebar-nav nav flex-column">

			<a href="dashboard" class="nav-link">
				<i class="bi bi-grid-1x2-fill"></i>
				<span>Dashboard</span>
			</a>

			<!-- ACTIVE PAGE -->
			<a href="health" class="nav-link active">
				<i class="bi bi-heart-pulse"></i>
				<span>Livestock</span>
			</a>

			<a href="milk" class="nav-link">
				<i class="bi bi-droplet"></i>
				<span>Milk Production</span>
			</a>

			<a href="report" class="nav-link">
				<i class="bi bi-bar-chart-fill"></i>
				<span>Reports</span>
			</a>

			<a href="feed" class="nav-link">
				<i class="bi bi-basket2-fill"></i>
				<span>Feed & Resources</span>
			</a>

			<a href="settings" class="nav-link">
				<i class="bi bi-gear-fill"></i>
				<span>Settings</span>
			</a>

		</nav>


		<div class="sidebar-footer">

			<a href="logout" class="logout-btn">
				<i class="bi bi-box-arrow-right"></i>
				<span>Logout</span>
			</a>

		</div>

	</aside>



	<!-- ================= MAIN CONTENT ================= -->

	<div class="main-content">


		<!-- ================= TOPBAR ================= -->

		<div class="topbar">

			<div class="d-flex align-items-center gap-3">

				<button class="sidebar-toggle"
					onclick="document.getElementById('sidebar').classList.toggle('show')">

					<i class="bi bi-list"></i>

				</button>


				<div class="search-box">

					<i class="bi bi-search"></i>

					<input type="text"
						placeholder="Search cattle, records...">

				</div>

			</div>


			<div class="topbar-right">

				<a href="#" class="icon-btn">

					<i class="bi bi-bell-fill"></i>

					<span class="badge-dot"></span>

				</a>


				<div class="user-chip">

					<img src="assets/images/cow_face.jpg"
						alt="user">

					<div>

						<div class="name">
							<%= userName %>
						</div>

						<div class="role">
							Farm Manager
						</div>

					</div>

				</div>

			</div>

		</div>



		<!-- ================= CONTENT ================= -->

		<div class="content-area">


			<!-- PAGE HEADING -->

			<div class="page-heading">

				<div>

					<h2>Animal Health & Care</h2>

					<p>
						Monitor and maintain the health of your dairy livestock.
					</p>

				</div>


				<div class="health-status">

					<i class="bi bi-check-circle-fill"></i>

					Health Monitoring Active

				</div>

			</div>



			<!-- ================= HERO ================= -->

			<div class="health-hero">

				<div class="health-hero-content">

					<h3>
						Keep Your Livestock Healthy
					</h3>

					<p>
						Regular health monitoring, proper nutrition,
						vaccination and a clean environment help maintain
						healthy cattle and improve dairy productivity.
					</p>

				</div>


				<i class="bi bi-heart-pulse hero-icon"></i>

			</div>



			<!-- ================= HEALTH PRACTICES ================= -->

			<div class="section-title">
				Essential Health Practices
			</div>


			<div class="row g-4 mb-4">


				<!-- CARD 1 -->

				<div class="col-md-6 col-xl-4">

					<div class="health-card">

						<div class="health-card-icon">

							<i class="bi bi-clipboard2-pulse"></i>

						</div>

						<h5>
							Regular Health Check-ups
						</h5>

						<p>
							Check cattle regularly for changes in
							behavior, appetite, body condition and
							other health symptoms.
						</p>

					</div>

				</div>



				<!-- CARD 2 -->

				<div class="col-md-6 col-xl-4">

					<div class="health-card">

						<div class="health-card-icon">

							<i class="bi bi-shield-plus"></i>

						</div>

						<h5>
							Vaccination
						</h5>

						<p>
							Follow proper vaccination schedules to
							protect cattle from common diseases and
							maintain herd health.
						</p>

					</div>

				</div>



				<!-- CARD 3 -->

				<div class="col-md-6 col-xl-4">

					<div class="health-card">

						<div class="health-card-icon">

							<i class="bi bi-egg-fried"></i>

						</div>

						<h5>
							Balanced Nutrition
						</h5>

						<p>
							Provide balanced feed containing essential
							nutrients to support cattle health and
							milk production.
						</p>

					</div>

				</div>



				<!-- CARD 4 -->

				<div class="col-md-6 col-xl-4">

					<div class="health-card">

						<div class="health-card-icon">

							<i class="bi bi-droplet-fill"></i>

						</div>

						<h5>
							Clean Drinking Water
						</h5>

						<p>
							Ensure clean and fresh drinking water is
							available to cattle throughout the day.
						</p>

					</div>

				</div>



				<!-- CARD 5 -->

				<div class="col-md-6 col-xl-4">

					<div class="health-card">

						<div class="health-card-icon">

							<i class="bi bi-house-heart"></i>

						</div>

						<h5>
							Clean Cattle Shed
						</h5>

						<p>
							Keep the cattle shed clean, dry and
							well ventilated to reduce the risk of
							infections and diseases.
						</p>

					</div>

				</div>



				<!-- CARD 6 -->

				<div class="col-md-6 col-xl-4">

					<div class="health-card">

						<div class="health-card-icon">

							<i class="bi bi-person-badge"></i>

						</div>

						<h5>
							Veterinary Care
						</h5>

						<p>
							Consult a qualified veterinarian whenever
							unusual symptoms or serious health problems
							are observed.
						</p>

					</div>

				</div>

			</div>



			<!-- ================= QUICK STATS ================= -->

			<div class="section-title">
				Health Overview
			</div>


			<div class="row g-4 mb-4">


				<div class="col-md-4">

					<div class="quick-stat">

						<i class="bi bi-heart-pulse-fill"></i>

						<h4>Healthy</h4>

						<span>
							Overall Herd Status
						</span>

					</div>

				</div>


				<div class="col-md-4">

					<div class="quick-stat">

						<i class="bi bi-shield-check"></i>

						<h4>Up to Date</h4>

						<span>
							Vaccination Status
						</span>

					</div>

				</div>


				<div class="col-md-4">

					<div class="quick-stat">

						<i class="bi bi-calendar-check"></i>

						<h4>Daily</h4>

						<span>
							Health Monitoring
						</span>

					</div>

				</div>

			</div>



			<!-- ================= CHECKLIST + TIP ================= -->

			<div class="row g-4">


				<!-- DAILY CHECKLIST -->

				<div class="col-lg-8">

					<div class="checklist-box">

						<div class="section-title mb-2">
							Daily Health Checklist
						</div>


						<div class="check-item">

							<div class="check-icon">
								<i class="bi bi-check-lg"></i>
							</div>

							<span>
								Check appetite and feeding behavior
							</span>

						</div>


						<div class="check-item">

							<div class="check-icon">
								<i class="bi bi-check-lg"></i>
							</div>

							<span>
								Observe activity and movement
							</span>

						</div>


						<div class="check-item">

							<div class="check-icon">
								<i class="bi bi-check-lg"></i>
							</div>

							<span>
								Monitor milk quantity and quality
							</span>

						</div>


						<div class="check-item">

							<div class="check-icon">
								<i class="bi bi-check-lg"></i>
							</div>

							<span>
								Provide clean drinking water
							</span>

						</div>


						<div class="check-item">

							<div class="check-icon">
								<i class="bi bi-check-lg"></i>
							</div>

							<span>
								Keep cattle shed clean and dry
							</span>

						</div>


						<div class="check-item">

							<div class="check-icon">
								<i class="bi bi-check-lg"></i>
							</div>

							<span>
								Record unusual health symptoms
							</span>

						</div>

					</div>

				</div>



				<!-- DAIRY TIP -->

				<div class="col-lg-4">

					<div class="dairy-tip">

						<div class="tip-icon">

							<i class="bi bi-lightbulb-fill"></i>

						</div>

						<h5>
							DairyCare Tip
						</h5>

						<p>
							Healthy cattle mean better milk,
							better productivity, and a healthier
							dairy farm.
						</p>

					</div>

				</div>

			</div>


		</div>

	</div>

</div>


<!-- Bootstrap JS -->

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
</script>


</body>

</html>