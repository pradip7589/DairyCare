<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>DairyCare - Registration</title>

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
<link
    rel="stylesheet"
    href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<style>

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: 'Poppins', sans-serif;
	background: #f0f4f1;
	min-height: 100vh;
	display: flex;
	align-items: center;
	justify-content: center;
	padding: 30px 15px;
}

/* ================= OUTER CARD ================= */

.auth-card {
	width: 100%;
	max-width: 1140px;
	background: #ffffff;
	border-radius: 26px;
	box-shadow: 0 25px 60px rgba(0, 0, 0, 0.12);
	display: flex;
	overflow: hidden;
}

/* ================= LEFT BRAND PANEL ================= */

.auth-brand {
	flex: 0 0 38%;
	background: linear-gradient(150deg, #1f3b2d, #198754 130%);
	color: #ffffff;
	padding: 55px 42px;
	display: flex;
	flex-direction: column;
	position: relative;
	overflow: hidden;
}

.auth-brand::before {
	content: "";
	position: absolute;
	width: 260px;
	height: 260px;
	background: rgba(255, 255, 255, 0.06);
	border-radius: 50%;
	top: -80px;
	right: -80px;
}

.auth-brand::after {
	content: "";
	position: absolute;
	width: 180px;
	height: 180px;
	background: rgba(255, 255, 255, 0.05);
	border-radius: 50%;
	bottom: -60px;
	left: -40px;
}

.auth-brand .logo {
	font-size: 24px;
	font-weight: 700;
	color: #ffffff;
	display: flex;
	align-items: center;
	gap: 8px;
	position: relative;
	z-index: 1;
}

.auth-brand .brand-icon {
	width: 70px;
	height: 70px;
	background: rgba(255, 255, 255, 0.15);
	border-radius: 16px;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 32px;
	margin: 45px 0 30px;
	position: relative;
	z-index: 1;
}

.auth-brand h1 {
	font-size: 30px;
	font-weight: 700;
	line-height: 1.25;
	position: relative;
	z-index: 1;
}

.auth-brand p.desc {
	margin-top: 18px;
	font-size: 14.5px;
	line-height: 1.8;
	color: #d9e6df;
	max-width: 380px;
	position: relative;
	z-index: 1;
}

.feature-list {
	margin-top: 32px;
	list-style: none;
	position: relative;
	z-index: 1;
}

.feature-list li {
	display: flex;
	align-items: center;
	gap: 12px;
	margin-bottom: 16px;
	font-size: 14px;
	font-weight: 500;
}

.feature-list .check {
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

/* ================= RIGHT FORM PANEL ================= */

.auth-form-panel {
	flex: 1;
	padding: 50px 55px;
	display: flex;
	flex-direction: column;
	justify-content: center;
}

.auth-form-panel h2 {
	font-weight: 700;
	font-size: 28px;
	color: #1f2937;
	margin-bottom: 6px;
}

.auth-form-panel .subtitle {
	color: #718078;
	font-size: 14px;
	margin-bottom: 26px;
}

.form-label {
	font-weight: 600;
	font-size: 13px;
	margin-bottom: 7px;
	display: block;
	color: #37443d;
}

.input-group-text {
	background: #f6f9f7;
	border-right: none;
	color: #198754;
	border-color: #e3e9e5;
}

.form-control, .form-select {
	height: 48px;
	border-color: #e3e9e5;
	background: #f6f9f7;
	box-shadow: none !important;
	font-size: 14.5px;
}

.form-control {
	border-left: none;
}

.form-control:focus, .form-select:focus {
	border-color: #198754;
	background: #ffffff;
}

.input-group:focus-within .input-group-text {
	border-color: #198754;
}

.form-select {
	padding-left: 14px;
}

.section-label {
	font-size: 12px;
	font-weight: 700;
	text-transform: uppercase;
	letter-spacing: 0.4px;
	color: #198754;
	margin: 6px 0 14px;
}

.register-submit {
	width: 100%;
	height: 52px;
	border: none;
	border-radius: 10px;
	background: #198754;
	color: white;
	font-size: 15.5px;
	font-weight: 600;
	transition: 0.3s;
	margin-top: 6px;
}

.register-submit:hover {
	background: #146c43;
	transform: translateY(-1px);
}

hr.divider {
	border-top: 1px solid #eef2ef;
	margin: 22px 0 16px;
}

.login-text {
	text-align: center;
	color: #718078;
	font-size: 14px;
}

.login-text a {
	color: #198754;
	text-decoration: none;
	font-weight: 600;
}

.login-text a:hover {
	text-decoration: underline;
}

.back-home {
	text-align: center;
	margin-top: 16px;
	font-size: 13.5px;
}

.back-home a {
	color: #718078;
	text-decoration: none;
}

.back-home a:hover {
	color: #198754;
}

/* ================= RESPONSIVE ================= */

@media (max-width: 992px) {
	.auth-card {
		flex-direction: column;
		max-width: 560px;
	}
	.auth-brand {
		flex: unset;
		padding: 40px 35px 30px;
	}
	.auth-brand h1 {
		font-size: 24px;
	}
	.feature-list {
		display: none;
	}
	.auth-form-panel {
		padding: 40px 35px;
	}
}

</style>

</head>

<body>

<div class="auth-card">

	<!-- ================= LEFT BRAND PANEL ================= -->

	<div class="auth-brand">

		<a href="index" class="logo">
			<i class="bi bi-cow"></i>
			DairyCare
		</a>

		<div class="brand-icon">
			<i class="bi bi-person-check"></i>
		</div>

		<h1>Join Smart Dairy Farm Management</h1>

		<p class="desc">
			Create your account to manage livestock, milk production,
			feed resources and farm records from one simple platform.
		</p>

		<ul class="feature-list">
			<li><span class="check"><i class="bi bi-check-lg"></i></span> Livestock Health Monitoring</li>
			<li><span class="check"><i class="bi bi-check-lg"></i></span> Milk Production Management</li>
			<li><span class="check"><i class="bi bi-check-lg"></i></span> Farm Reports & Records</li>
			<li><span class="check"><i class="bi bi-check-lg"></i></span> Feed & Resource Management</li>
		</ul>

	</div>

	<!-- ================= RIGHT FORM PANEL ================= -->

	<div class="auth-form-panel">

		<h2>Create Account &#128075;</h2>
		<p class="subtitle">Fill in your details to register a DairyCare account</p>

		<form action="registrationForm" method="post">
<p>${errorMessage }</p>
			<div class="section-label">Personal Details</div>

			<div class="row g-3 mb-1">

				<div class="col-md-6">
					<label class="form-label">Full Name</label>
					<div class="input-group">
						<span class="input-group-text"><i class="bi bi-person"></i></span>
						<input type="text" name="fullName" class="form-control" placeholder="Enter full name" required>
					</div>
				</div>

				<div class="col-md-6">
					<label class="form-label">User Name</label>
					<div class="input-group">
						<span class="input-group-text"><i class="bi bi-at"></i></span>
						<input type="text" name="userName" class="form-control" placeholder="Choose a user name" required>
					</div>
				</div>

				<div class="col-md-6">
					<label class="form-label">Email Address</label>
					<div class="input-group">
						<span class="input-group-text"><i class="bi bi-envelope"></i></span>
						<input type="email" name="email" class="form-control" placeholder="you@example.com" required>
					</div>
				</div>

				<div class="col-md-6">
					<label class="form-label">Phone Number</label>
					<div class="input-group">
						<span class="input-group-text"><i class="bi bi-telephone"></i></span>
						<input type="tel" name="phone" class="form-control" placeholder="+91 00000 00000" required>
					</div>
				</div>

			</div>

			<div class="section-label mt-3">Farm Details</div>

			<div class="row g-3 mb-1">

				<div class="col-md-6">
					<label class="form-label">Farm Name</label>
					<div class="input-group">
						<span class="input-group-text"><i class="bi bi-house-door"></i></span>
						<input type="text" name="farmName" class="form-control" placeholder="e.g. Green Valley Dairy" required>
					</div>
				</div>

				<div class="col-md-6">
					<label class="form-label">Role</label>
					<div class="input-group">
						<span class="input-group-text"><i class="bi bi-person-badge"></i></span>
						<select name="role" class="form-select" required>
							<option value="" selected disabled>Select your role</option>
							<option>Farm Owner</option>
							<option>Farm Manager</option>
						</select>
					</div>
				</div>

				<div class="col-md-6">
					<label class="form-label">Location</label>
					<div class="input-group">
						<span class="input-group-text"><i class="bi bi-geo-alt"></i></span>
						<input type="text" name="location" class="form-control" placeholder="Village / District">
					</div>
				</div>

				<div class="col-md-6">
					<label class="form-label">Herd Size</label>
					<div class="input-group">
						<span class="input-group-text"><i class="bi bi-cow"></i></span>
						<input type="number" name="herdSize" class="form-control" min="0" placeholder="Number of cattle">
					</div>
				</div>

			</div>

			<div class="section-label mt-3">Account Security</div>

			<div class="row g-3 mb-2">

				<div class="col-md-6">
					<label class="form-label">Password</label>
					<div class="input-group">
						<span class="input-group-text"><i class="bi bi-lock"></i></span>
						<input type="password" name="password" id="password" class="form-control" placeholder="Enter password" required>
						<button type="button" class="input-group-text" onclick="togglePassword('password','eyeIcon1')">
							<i class="bi bi-eye" id="eyeIcon1"></i>
						</button>
					</div>
				</div>

				<div class="col-md-6">
					<label class="form-label">Confirm Password</label>
					<div class="input-group">
						<span class="input-group-text"><i class="bi bi-lock-fill"></i></span>
						<input type="password" name="confirmPassword" id="confirmPassword" class="form-control" placeholder="Re-enter password" required>
						<button type="button" class="input-group-text" onclick="togglePassword('confirmPassword','eyeIcon2')">
							<i class="bi bi-eye" id="eyeIcon2"></i>
						</button>
					</div>
				</div>

			</div>

			<div class="form-check mb-3">
				<input class="form-check-input" type="checkbox" id="terms" required>
				<label class="form-check-label" for="terms" style="font-size: 13.5px; color: #718078;">
					I agree to the <a href="termsAndCondition" style="color:#198754; font-weight:600; text-decoration:none;">Terms & Conditions</a>
				</label>
			</div>

			<!-- Register Button -->
			<button type="submit" class="register-submit">
				<i class="bi bi-person-check me-2"></i>
				Register Account
			</button>

		</form>

		<hr class="divider">

		<div class="login-text">
			Already have an account? <a href="login">Login here</a>
		</div>

		<div class="back-home">
			<a href="index"><i class="bi bi-arrow-left me-1"></i> Back to Home</a>
		</div>

	</div>

</div>

<!-- Bootstrap JS -->
<script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
</script>

<!-- Password Toggle -->
<script>

function togglePassword(fieldId, iconId) {

    const field = document.getElementById(fieldId);
    const icon = document.getElementById(iconId);

    if (field.type === "password") {
        field.type = "text";
        icon.classList.remove("bi-eye");
        icon.classList.add("bi-eye-slash");
    } else {
        field.type = "password";
        icon.classList.remove("bi-eye-slash");
        icon.classList.add("bi-eye");
    }

}

</script>

</body>
</html>