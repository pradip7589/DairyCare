<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Settings | DairyCare</title>

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

/* =========================================================
   GLOBAL
========================================================= */
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

.dashboard-wrapper {
	display: flex;
	min-height: 100vh;
}

/* =========================================================
   SIDEBAR
========================================================= */
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

.logout-btn {
	display: flex;
	align-items: center;
	gap: 10px;
	color: #f4b8b8;
	text-decoration: none;
	font-weight: 500;
	padding: 10px 0;
}

.logout-btn:hover {
	color: #ffffff;
}

/* =========================================================
   MAIN CONTENT
========================================================= */
.main-content {
	margin-left: 250px;
	width: calc(100% - 250px);
	padding-bottom: 40px;
}

/* =========================================================
   TOPBAR
========================================================= */
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

.topbar h4 {
	font-weight: 600;
	margin: 0;
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

.badge-dot {
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

/* =========================================================
   CONTENT
========================================================= */
.content-area {
	padding: 28px 30px;
}

.page-heading {
	margin-bottom: 24px;
}

.page-heading h2 {
	font-weight: 700;
	color: #1f3b2d;
	margin-bottom: 5px;
}

.page-heading p {
	color: #718078;
	font-size: 14px;
}

/* =========================================================
   SETTINGS LAYOUT
========================================================= */
.settings-card {
	background: #ffffff;
	border-radius: 15px;
	box-shadow: 0 8px 25px rgba(0, 0, 0, 0.05);
	overflow: hidden;
	margin-bottom: 24px;
}

.settings-header {
	padding: 20px 24px;
	border-bottom: 1px solid #eef2ef;
	display: flex;
	align-items: center;
	gap: 12px;
}

.settings-header .icon {
	width: 42px;
	height: 42px;
	border-radius: 10px;
	background: #e1f3e9;
	color: #198754;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 20px;
}

.settings-header h5 {
	margin: 0;
	font-size: 17px;
	font-weight: 600;
	color: #26352d;
}

.settings-header p {
	margin: 2px 0 0;
	font-size: 12px;
	color: #718078;
}

.settings-body {
	padding: 24px;
}

/* =========================================================
   FORM
========================================================= */
.form-label {
	font-size: 13px;
	font-weight: 600;
	color: #37443d;
	margin-bottom: 7px;
}

.form-control, .form-select {
	border: 1px solid #dfe8e2;
	border-radius: 9px;
	padding: 11px 13px;
	font-size: 13px;
	color: #26352d;
	background: #ffffff;
}

.form-control:focus, .form-select:focus {
	border-color: #4ade80;
	box-shadow: 0 0 0 0.2rem rgba(74, 222, 128, 0.12);
}

.form-control::placeholder {
	color: #a2aaa6;
}

/* =========================================================
   PROFILE
========================================================= */
.profile-section {
	display: flex;
	align-items: center;
	gap: 20px;
	padding-bottom: 22px;
	margin-bottom: 24px;
	border-bottom: 1px solid #eef2ef;
}

.profile-image {
	width: 82px;
	height: 82px;
	border-radius: 50%;
	object-fit: cover;
	border: 4px solid #e1f3e9;
}

.profile-info h6 {
	font-size: 16px;
	font-weight: 600;
	margin-bottom: 3px;
}

.profile-info p {
	font-size: 12px;
	color: #718078;
	margin-bottom: 10px;
}

.upload-btn {
	border: 1px solid #198754;
	color: #198754;
	background: #ffffff;
	border-radius: 7px;
	padding: 6px 12px;
	font-size: 12px;
	text-decoration: none;
	display: inline-block;
}

.upload-btn:hover {
	background: #198754;
	color: #ffffff;
}

/* =========================================================
   SAVE BUTTON
========================================================= */
.save-btn {
	background: #198754;
	border: none;
	color: #ffffff;
	padding: 10px 20px;
	border-radius: 8px;
	font-size: 13px;
	font-weight: 500;
	transition: 0.2s;
}

.save-btn:hover {
	background: #157347;
	transform: translateY(-1px);
}

.cancel-btn {
	background: #f6f9f7;
	border: 1px solid #dfe8e2;
	color: #526058;
	padding: 10px 20px;
	border-radius: 8px;
	font-size: 13px;
	font-weight: 500;
}

/* =========================================================
   NOTIFICATION SETTINGS
========================================================= */
.notification-item {
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 15px 0;
	border-bottom: 1px solid #eef2ef;
}

.notification-item:last-child {
	border-bottom: none;
}

.notification-info {
	display: flex;
	align-items: center;
	gap: 13px;
}

.notification-icon {
	width: 40px;
	height: 40px;
	border-radius: 9px;
	background: #f0f7f3;
	color: #198754;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 18px;
}

.notification-info h6 {
	margin: 0 0 3px;
	font-size: 13px;
	font-weight: 600;
}

.notification-info p {
	margin: 0;
	font-size: 11px;
	color: #718078;
}

/* Bootstrap switch */
.form-check-input {
	width: 2.5em;
	height: 1.3em;
	cursor: pointer;
}

.form-check-input:checked {
	background-color: #198754;
	border-color: #198754;
}

/* =========================================================
   FARM INFORMATION
========================================================= */
.info-box {
	background: #f8fbf9;
	border: 1px solid #e5eee8;
	border-radius: 10px;
	padding: 15px;
	margin-bottom: 20px;
}

.info-box i {
	color: #198754;
	font-size: 18px;
	margin-right: 8px;
}

.info-box span {
	font-size: 12px;
	color: #718078;
}

/* =========================================================
   DANGER ZONE
========================================================= */
.danger-card {
	border: 1px solid #f3d4d7;
	background: #fffafa;
	border-radius: 12px;
	padding: 18px;
}

.danger-card h6 {
	color: #dc3545;
	font-weight: 600;
	font-size: 14px;
}

.danger-card p {
	color: #718078;
	font-size: 12px;
	margin-bottom: 12px;
}

.delete-btn {
	border: 1px solid #dc3545;
	background: #ffffff;
	color: #dc3545;
	border-radius: 7px;
	padding: 7px 13px;
	font-size: 12px;
}

.delete-btn:hover {
	background: #dc3545;
	color: #ffffff;
}

/* =========================================================
   SIDEBAR MOBILE
========================================================= */
.sidebar-toggle {
	display: none;
	border: none;
	background: transparent;
	font-size: 22px;
	color: #37443d;
}

/* =========================================================
   RESPONSIVE
========================================================= */
@media ( max-width : 992px) {
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
	.search-box {
		display: none;
	}
}

@media ( max-width : 576px) {
	.content-area {
		padding: 20px 15px;
	}
	.topbar {
		padding: 14px 18px;
	}
	.settings-body {
		padding: 18px;
	}
	.profile-section {
		align-items: flex-start;
	}
	.user-chip .role {
		display: none;
	}
}
</style>

</head>


<body>


	<%
	/* =========================================================
	   SESSION CHECK
	========================================================= */

	if (session.getAttribute("user") == null) {

		response.sendRedirect("login");

		return;
	}

	String userName = (String) session.getAttribute("user");
	%>


	<div class="dashboard-wrapper">


		<!-- =====================================================
    						 	SIDEBAR
		 ===================================================== -->

		<aside class="sidebar" id="sidebar">

			<a href="index" class="logo"> <i class="bi bi-cow"></i> DairyCare
			</a>


			<nav class="sidebar-nav nav flex-column">

				<a href="dashboard" class="nav-link"> <i
					class="bi bi-grid-1x2-fill"></i> Dashboard
				</a> <a href="health" class="nav-link"> <i class="bi bi-heart-pulse"></i>
					Livestock
				</a> <a href="milk" class="nav-link"> <i class="bi bi-droplet"></i>
					Milk Production
				</a> <a href="report" class="nav-link"> <i
					class="bi bi-bar-chart-fill"></i> Reports
				</a> <a href="feed" class="nav-link"> <i class="bi bi-basket2-fill"></i>
					Feed & Resources
				</a>

				<!-- ACTIVE SETTINGS -->

				<a href="setting" class="nav-link active"> <i
					class="bi bi-gear-fill"></i> Settings
				</a>

			</nav>


			<div class="sidebar-footer">

				<a href="logout" class="logout-btn"> <i
					class="bi bi-box-arrow-right"></i> Logout

				</a>

			</div>

		</aside>


		<!-- =====================================================
     						MAIN CONTENT
		 ===================================================== -->

		<div class="main-content">


			<!-- =====================================================
    								 TOPBAR
			 ===================================================== -->

			<div class="topbar">

				<div class="d-flex align-items-center gap-3">

					<button class="sidebar-toggle"
						onclick="document.getElementById('sidebar').classList.toggle('show')">

						<i class="bi bi-list"></i>

					</button>

					<div class="search-box">

						<i class="bi bi-search"></i> <input type="text"
							placeholder="Search settings...">

					</div>

				</div>


				<div class="topbar-right">

					<a href="#" class="icon-btn"> <i class="bi bi-bell-fill"></i> <span
						class="badge-dot"></span>

					</a>


					<div class="user-chip">

						<img src="assets/images/cow_face.jpg" alt="user">

						<div>

							<div class="name">
								<%=userName%>
							</div>

							<div class="role">Farm Manager</div>

						</div>

					</div>

				</div>

			</div>


			<!-- =====================================================
     								CONTENT
			 ===================================================== -->

			<div class="content-area">


				<!-- PAGE HEADING -->

				<div class="page-heading">

					<h2>Settings</h2>

					<p>Manage your DairyCare account, farm information and
						preferences.</p>

				</div>



				<div class="row g-4">


					<!-- =====================================================
     										LEFT COLUMN
					 ===================================================== -->

					<div class="col-lg-8">


						<!-- =====================================================
    										PROFILE SETTINGS
						 ===================================================== -->

						<div class="settings-card">


							<div class="settings-header">

								<div class="icon">

									<i class="bi bi-person-fill"></i>

								</div>

								<div>

									<h5>Profile Settings</h5>

									<p>Update your personal information</p>

								</div>

							</div>


							<div class="settings-body">


								<!-- PROFILE IMAGE -->

								<div class="profile-section">

									<img src="assets/images/cow_face.jpg" class="profile-image"
										alt="Profile">

									<div class="profile-info">

										<h6>
											<%=userName%>
										</h6>

										<p>Farm Manager</p>

										<a href="#" class="upload-btn"> <i class="bi bi-camera"></i>
											Change Photo

										</a>

									</div>

								</div>


								<!-- FORM -->

								<form action="updateProfile" method="post">
									<div class="row g-3">
										<p>${profileMessage }</p>
										<div class="col-md-6">
											<label class="form-label"> Full Name </label> <input
												type="text" name="fullName" class="form-control"
												value="<%=userName%>" placeholder="Enter your name">
										</div>

										<div class="col-md-6">
											<label class="form-label"> Email Address </label> <input
												type="email" name="email" class="form-control"
												placeholder="example@gmail.com">
										</div>

										<div class="col-md-6">
											<label class="form-label"> Phone Number </label> <input
												type="text" name="phone" class="form-control"
												placeholder="+91 XXXXX XXXXX">
										</div>

										<div class="col-md-6">
											<label class="form-label"> Role </label> <select name="role"
												class="form-select">
												<option selected>Farm Manager</option>
												<option>Farm Owner</option>
											</select>
										</div>

									</div>

									<div class="d-flex justify-content-end gap-2 mt-4">
										<button type="button" class="cancel-btn">Cancel</button>
										<button type="submit" class="save-btn">
											<i class="bi bi-check-lg"></i> Save Changes
										</button>
									</div>

								</form>


							</div>

						</div>



						<!-- =====================================================
     										FARM INFORMATION
						 ===================================================== -->

						<div class="settings-card">


							<div class="settings-header">

								<div class="icon">

									<i class="bi bi-house-heart-fill"></i>

								</div>

								<div>

									<h5>Farm Information</h5>

									<p>Manage your farm details</p>

								</div>

							</div>


							<div class="settings-body">

								<form action="updateFarmDetails" method="post">
									<div class="info-box">
										<p>${farmMessage }</p>
										<i class="bi bi-info-circle-fill"></i> <span> Keep your
											farm information updated for accurate reports and management
											records. </span>
									</div>

									<div class="row g-3">

										<div class="col-md-6">
											<label class="form-label"> Farm Name </label> <input
												type="text" name="farmName" class="form-control"
												placeholder="Enter farm name" value="DairyCare Farm">
										</div>

										<div class="col-md-6">
											<label class="form-label"> Farm Type </label> <select
												name="farmType" class="form-select">
												<option selected>Dairy Farm</option>
												<option>Mixed Farm</option>
												<option>Livestock Farm</option>
											</select>
										</div>

										<div class="col-md-6">
											<label class="form-label"> Total Cattle </label> <input
												type="number" name="totalCattle" class="form-control"
												value="128">
										</div>

										<div class="col-md-6">
											<label class="form-label"> Feed Stock Bags </label> <input
												type="number" name="feed_stock_bags" class="form-control"
												value="12">
										</div>
										<div class="col-md-6">
											<label class="form-label"> Location </label> <input
												type="text" name="location" class="form-control"
												placeholder="Farm location">
										</div>

										<div class="col-12">
											<label class="form-label"> Farm Address </label>
											<textarea name="address" class="form-control" rows="3"
												placeholder="Enter complete farm address"></textarea>
										</div>

									</div>

									<div class="d-flex justify-content-end mt-4">
										<button type="submit" class="save-btn">
											<i class="bi bi-check-lg"></i> Save Farm Details
										</button>
									</div>

								</form>

							</div>

						</div>



						<!-- =====================================================
     											CHANGE PASSWORD
						 ===================================================== -->

						<div class="settings-card">


							<div class="settings-header">

								<div class="icon">

									<i class="bi bi-shield-lock-fill"></i>

								</div>

								<div>

									<h5>Security</h5>

									<p>Change your account password</p>

								</div>

							</div>


							<div class="settings-body">

								<form action="updatePassword" method="post">
									<div class="row g-3">
										<c:if test="${not empty passwordMessage}">
											<div
												class="alert ${passwordMessage eq 'Password updated successfully.' ? 'alert-success' : 'alert-danger'}"
												role="alert">
												<c:out value="${passwordMessage}" />
											</div>
										</c:if>
										<div class="col-12">
											<label class="form-label"> Current Password </label> <input
												type="password" name="currentPassword" class="form-control"
												placeholder="Enter current password">
										</div>

										<div class="col-md-6">
											<label class="form-label"> New Password </label> <input
												type="password" name="newPassword" class="form-control"
												placeholder="Enter new password">
										</div>

										<div class="col-md-6">
											<label class="form-label"> Confirm Password </label> <input
												type="password" name="confirmPassword" class="form-control"
												placeholder="Confirm new password">
										</div>

									</div>

									<div class="d-flex justify-content-end mt-4">
										<button type="submit" class="save-btn">
											<i class="bi bi-lock-fill"></i> Update Password
										</button>
									</div>

								</form>

							</div>

						</div>


					</div>



					<!-- =====================================================
    										RIGHT COLUMN
					===================================================== -->

					<div class="col-lg-4">


						<!-- =====================================================
     										NOTIFICATIONS
						 ===================================================== -->

						<div class="settings-card">


							<div class="settings-header">

								<div class="icon">

									<i class="bi bi-bell-fill"></i>

								</div>

								<div>

									<h5>Notifications</h5>

									<p>Manage alerts and notifications</p>

								</div>

							</div>


							<div class="settings-body">

								<form action="updateNotifications" method="post">
									<div class="notification-item">
										<p>${notificationMessage }</p>
										<div class="notification-info">
											<div class="notification-icon">
												<i class="bi bi-heart-pulse"></i>
											</div>
											<div>
												<h6>Health Alerts</h6>
												<p>Livestock health notifications</p>
											</div>
										</div>
										<div class="form-check form-switch">
											<input class="form-check-input" type="checkbox"
												name="healthAlerts" checked>
										</div>
									</div>

									<div class="notification-item">
										<div class="notification-info">
											<div class="notification-icon">
												<i class="bi bi-droplet-fill"></i>
											</div>
											<div>
												<h6>Milk Production</h6>
												<p>Daily production updates</p>
											</div>
										</div>
										<div class="form-check form-switch">
											<input class="form-check-input" type="checkbox"
												name="milkProduction" checked>
										</div>
									</div>

									<div class="notification-item">
										<div class="notification-info">
											<div class="notification-icon">
												<i class="bi bi-basket2-fill"></i>
											</div>
											<div>
												<h6>Feed Stock</h6>
												<p>Low stock notifications</p>
											</div>
										</div>
										<div class="form-check form-switch">
											<input class="form-check-input" type="checkbox"
												name="feedStock" checked>
										</div>
									</div>

									<div class="notification-item">
										<div class="notification-info">
											<div class="notification-icon">
												<i class="bi bi-file-earmark-bar-graph"></i>
											</div>
											<div>
												<h6>Reports</h6>
												<p>Weekly report updates</p>
											</div>
										</div>
										<div class="form-check form-switch">
											<input class="form-check-input" type="checkbox"
												name="reports">
										</div>
									</div>

									<div class="d-grid mt-4">
										<button type="submit" class="save-btn">
											<i class="bi bi-check-lg"></i> Save Notifications
										</button>
									</div>

								</form>

							</div>

						</div>



						<!-- =====================================================
										     SYSTEM PREFERENCES
						===================================================== -->

						<div class="settings-card">


							<div class="settings-header">

								<div class="icon">

									<i class="bi bi-sliders"></i>

								</div>

								<div>

									<h5>Preferences</h5>

									<p>Application preferences</p>

								</div>

							</div>


							<div class="settings-body">

								<form action="updatePreferences" method="post">
									<div class="mb-3">
										<p>${prefsMessage }</p>
										<label class="form-label"> Language </label> <select
											name="language" class="form-select">
											<option selected>English</option>
											<option>Marathi</option>
											<option>Hindi</option>
										</select>
									</div>

									<div class="mb-3">
										<label class="form-label"> Date Format </label> <select
											name="dateFormat" class="form-select">
											<option selected>DD/MM/YYYY</option>
											<option>MM/DD/YYYY</option>
											<option>YYYY-MM-DD</option>
										</select>
									</div>

									<div>
										<label class="form-label"> Milk Measurement </label> <select
											name="milkUnit" class="form-select">
											<option selected>Litres (L)</option>
											<option>Gallons</option>
										</select>
									</div>

									<div class="d-grid mt-4">
										<button type="submit" class="save-btn">
											<i class="bi bi-check-lg"></i> Save Preferences
										</button>
									</div>

								</form>

							</div>

						</div>



						<!-- =====================================================
										     DANGER ZONE
						===================================================== -->

						<div class="danger-card">
							<h6>
								<i class="bi bi-exclamation-triangle-fill"></i> Danger Zone
							</h6>

							<p>Account deletion is permanent and cannot be undone.</p>

							<form action="deleteAccount" method="post"
								onsubmit="return confirm('Are you sure you want to permanently delete your account?');">
								<button type="submit" class="delete-btn">
									<i class="bi bi-trash3"></i> Delete Account
								</button>
							</form>
						</div>

					</div>


				</div>


			</div>


		</div>


	</div>


	<!-- Bootstrap JS -->

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>


</body>
</html>