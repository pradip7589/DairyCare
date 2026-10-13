<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%
    session = request.getSession(false); // don't create new session
    if (session == null || session.getAttribute("user") == null) {
        response.sendRedirect("login"); // redirect to login page
        return; // stop further execution
    }
    String userName = (String) session.getAttribute("user");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Daily Milk Collection | Dairy Farm Management</title>

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
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: 'Poppins', sans-serif;
	background: #f6f9f7;
	color: #26352d;
}

/* ================= LAYOUT ================= */
.dashboard-wrapper {
	display: flex;
	min-height: 100vh;
}

/* ================= SIDEBAR ================= */
.sidebar {
	width: 250px;
	background: #1f3b2d;
	color: #d9e6df;
	position: fixed;
	top: 0;
	left: 0;
	bottom: 0;
	display: flex;
	flex-direction: column;
	padding: 20px 0;
	z-index: 1030;
	transition: 0.3s;
}

.sidebar .logo {
	font-size: 22px;
	font-weight: 700;
	color: #ffffff;
	text-decoration: none;
	padding: 10px 24px 25px;
	display: flex;
	align-items: center;
	gap: 8px;
	border-bottom: 1px solid rgba(255, 255, 255, 0.08);
	margin-bottom: 15px;
}

.sidebar .logo i {
	color: #4ade80;
}

.sidebar-nav {
	flex: 1;
	overflow-y: auto;
}

.sidebar-nav .nav-link {
	color: #b9c9c0;
	font-weight: 500;
	padding: 12px 24px;
	display: flex;
	align-items: center;
	gap: 12px;
	border-left: 3px solid transparent;
	transition: 0.25s;
}

.sidebar-nav .nav-link i {
	font-size: 18px;
	width: 20px;
}

.sidebar-nav .nav-link:hover {
	background: rgba(255, 255, 255, 0.06);
	color: #ffffff;
}

.sidebar-nav .nav-link.active {
	background: rgba(255, 255, 255, 0.08);
	color: #ffffff;
	border-left-color: #4ade80;
}

.sidebar-footer {
	padding: 15px 24px 0;
	border-top: 1px solid rgba(255, 255, 255, 0.08);
}

.sidebar-footer .logout-btn {
	display: flex;
	align-items: center;
	gap: 10px;
	color: #f4b8b8;
	text-decoration: none;
	font-weight: 500;
	padding: 10px 0;
}

.sidebar-footer .logout-btn:hover {
	color: #ffffff;
}

/* ================= MAIN CONTENT ================= */
.main-content {
	margin-left: 250px;
	width: calc(100% - 250px);
	padding: 0 0 40px;
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

.topbar .search-box {
	background: #f6f9f7;
	border-radius: 8px;
	padding: 8px 15px;
	display: flex;
	align-items: center;
	gap: 8px;
	width: 320px;
}

.topbar .search-box input {
	border: none;
	background: transparent;
	outline: none;
	width: 100%;
	font-size: 14px;
}

.topbar .search-box i {
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

/* ================= CONTENT AREA ================= */
.content-area {
	padding: 28px 30px;
}

.page-heading {
	margin-bottom: 28px;
	display: flex;
	align-items: center;
	justify-content: space-between;
	flex-wrap: wrap;
	gap: 12px;
}

.page-heading h2 {
	font-weight: 700;
	color: #1f3b2d;
}

.page-heading p {
	color: #718078;
	font-size: 14px;
	margin-top: 2px;
}

.date-chip {
	background: #ffffff;
	border: 1px solid #e3ece6;
	border-radius: 10px;
	padding: 8px 16px;
	font-size: 13px;
	font-weight: 500;
	color: #1f3b2d;
	display: flex;
	align-items: center;
	gap: 8px;
	box-shadow: 0 3px 10px rgba(0, 0, 0, 0.03);
}

.date-chip i {
	color: #198754;
}

/* ================= FORM CARD ================= */
.form-card {
	background: #ffffff;
	border-radius: 18px;
	box-shadow: 0 10px 35px rgba(31, 59, 45, 0.08);
	overflow: hidden;
	border: 1px solid #eef3f0;
}

.form-card .card-header {
	background: linear-gradient(135deg, #198754 0%, #146c43 100%);
	padding: 26px 30px;
	position: relative;
	overflow: hidden;
}

.form-card .card-header::before {
	content: "";
	position: absolute;
	width: 140px;
	height: 140px;
	background: rgba(255, 255, 255, 0.08);
	border-radius: 50%;
	top: -60px;
	right: -40px;
}

.form-card .card-header .icon-badge {
	width: 46px;
	height: 46px;
	background: rgba(255, 255, 255, 0.18);
	border-radius: 12px;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 22px;
	color: #ffffff;
	margin-bottom: 10px;
}

.form-card .card-header h4 {
	color: #ffffff;
	font-weight: 700;
	position: relative;
	z-index: 1;
}

.form-card .card-header small {
	color: rgba(255, 255, 255, 0.85);
	position: relative;
	z-index: 1;
}

.form-card .card-body {
	padding: 34px 30px 30px;
}

.field-label {
	font-size: 13px;
	font-weight: 600;
	color: #37443d;
	text-transform: uppercase;
	letter-spacing: 0.4px;
	margin-bottom: 8px;
	display: flex;
	align-items: center;
	gap: 6px;
}

.field-label i {
	color: #198754;
	font-size: 14px;
}

.input-group-text {
	background: #f6f9f7;
	color: #198754;
	border: 1.5px solid #e3ece6;
	border-right: none;
	font-size: 16px;
}

.form-control {
	border: 1.5px solid #e3ece6;
	border-left: none;
	border-right: none;
	padding: 11px 14px;
	font-size: 15px;
}

.input-group-text.unit-text {
	border-left: none;
	border-right: 1.5px solid #e3ece6;
	font-size: 13px;
	font-weight: 600;
	color: #718078;
}

.form-control:focus {
	box-shadow: none;
	border-color: #198754;
}

.input-group:focus-within .input-group-text {
	border-color: #198754;
}

.mb-field {
	margin-bottom: 22px;
}

.form-divider {
	border: none;
	border-top: 1px dashed #e3ece6;
	margin: 26px 0;
}

.btn-success {
	background: #198754;
	border-color: #198754;
	padding: 13px;
	font-weight: 600;
	letter-spacing: 0.3px;
	box-shadow: 0 8px 18px rgba(25, 135, 84, 0.25);
	transition: 0.25s;
}

.btn-success:hover {
	background: #146c43;
	border-color: #146c43;
	box-shadow: 0 10px 22px rgba(25, 135, 84, 0.32);
	transform: translateY(-1px);
}

.helper-text {
	font-size: 12px;
	color: #9aa8a0;
	margin-top: 6px;
	display: block;
}

/* ================= SIDEBAR TOGGLE (mobile) ================= */
.sidebar-toggle {
	display: none;
	border: none;
	background: transparent;
	font-size: 22px;
	color: #37443d;
}

@media (max-width: 992px) {
	.sidebar {
		left: -250px;
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
	.topbar .search-box {
		display: none;
	}
	.page-heading {
		flex-direction: column;
		align-items: flex-start;
	}
}
</style>

</head>

<body>

	<div class="dashboard-wrapper">

		<!-- ================= SIDEBAR ================= -->
		<aside class="sidebar" id="sidebar">

			<a href="index" class="logo"> <i class="bi bi-cow"></i> DairyCare
			</a>

			<nav class="sidebar-nav nav flex-column">
				<a href="dashboard" class="nav-link"> <i class="bi bi-grid-1x2-fill"></i> Dashboard
				</a>
				<a href="health" class="nav-link"> <i class="bi bi-heart-pulse"></i> Livestock
				</a>
				<a href="milk" class="nav-link active"> <i class="bi bi-droplet"></i> Milk Production
				</a>
				<a href="report" class="nav-link"> <i class="bi bi-bar-chart-fill"></i> Reports
				</a>
				<a href="feed" class="nav-link"> <i class="bi bi-basket2-fill"></i> Feed & Resources
				</a>
				<a href="setting" class="nav-link"> <i class="bi bi-gear-fill"></i> Settings
				</a>
			</nav>

			<div class="sidebar-footer">
				<a href="logout" class="logout-btn"> <i class="bi bi-box-arrow-right"></i> Logout
				</a>
			</div>

		</aside>

		<!-- ================= MAIN CONTENT ================= -->
		<div class="main-content">

			<!-- TOPBAR -->
			<div class="topbar">
				<div class="d-flex align-items-center gap-3">
					<button class="sidebar-toggle" onclick="document.getElementById('sidebar').classList.toggle('show')">
						<i class="bi bi-list"></i>
					</button>
					<div class="search-box">
						<i class="bi bi-search"></i>
						<input type="text" placeholder="Search cattle, records...">
					</div>
				</div>

				<div class="topbar-right">
					<a href="#" class="icon-btn"> <i class="bi bi-bell-fill"></i>
						<span class="badge-dot"></span>
					</a>
					<div class="user-chip">
						<img src="assets/images/cow_face.jpg" alt="user">
						<div>
							<div class="name"><%= userName %></div>
							<div class="role">Farm Manager</div>
						</div>
					</div>
				</div>
			</div>

			<!-- CONTENT -->
			<div class="content-area">

				<div class="page-heading">
					<div>
						<h2>Daily Milk Collection</h2>
						<p>Enter today's milk collection details for your records.</p>
					</div>
					<div class="date-chip">
						<i class="bi bi-calendar-event"></i>
						<span id="todayDate"></span>
					</div>
				</div>

				<div class="row justify-content-center">

					<div class="col-md-8 col-lg-6">

						<form action="AddDailyMilkCollection" method="post">

							<div class="card form-card">

								<div class="card-header">
									<div class="icon-badge">
										<i class="bi bi-droplet-fill"></i>
									</div>
									<h4 class="mb-1">Daily Milk Collection</h4>
									<small>Enter today's milk collection details</small>
								</div>

								<div class="card-body">

									<!-- Milk -->
									<div class="mb-field">
										<label class="field-label">
											<i class="bi bi-droplet-fill"></i> Milk Quantity
										</label>

										<div class="input-group">
											<span class="input-group-text">
												<i class="bi bi-droplet-fill"></i>
											</span>

											<input type="number"
												   name="milk"
												   class="form-control"
												   placeholder="Enter milk quantity"
												   step="0.01"
												   min="0"
												   required>

											<span class="input-group-text unit-text">Ltr</span>
										</div>
										<span class="helper-text">Total volume collected today, in liters</span>
									</div>

									<!-- Fat -->
									<div class="mb-field">
										<label class="field-label">
											<i class="bi bi-percent"></i> Fat
										</label>

										<div class="input-group">
											<span class="input-group-text">
												<i class="bi bi-percent"></i>
											</span>

											<input type="number"
												   name="fat"
												   class="form-control"
												   placeholder="Enter fat percentage"
												   step="0.01"
												   min="0"
												   required>

											<span class="input-group-text unit-text">%</span>
										</div>
									</div>

									<!-- SNF -->
									<div class="mb-field">
										<label class="field-label">
											<i class="bi bi-percent"></i> SNF
										</label>

										<div class="input-group">
											<span class="input-group-text">
												<i class="bi bi-percent"></i>
											</span>

											<input type="number"
												   name="snf"
												   class="form-control"
												   placeholder="Enter SNF percentage"
												   step="0.01"
												   min="0"
												   required>

											<span class="input-group-text unit-text">%</span>
										</div>
									</div>

									<hr class="form-divider">

									<!-- Submit -->
									<div class="d-grid">
										<button type="submit"
												class="btn btn-success btn-lg rounded-3">

											<i class="bi bi-check-circle me-2"></i>
											Submit Collection

										</button>
									</div>

								</div>

							</div>

						</form>

					</div>

				</div>

			</div>

		</div>

	</div>

	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

	<script>
		document.getElementById('todayDate').textContent = new Date().toLocaleDateString('en-IN', {
			day: 'numeric', month: 'long', year: 'numeric'
		});
	</script>

</body>
</html>