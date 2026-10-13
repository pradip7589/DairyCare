<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="javax.servlet.http.HttpSession"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
	content="width=device-width, initial-scale=1.0">

<title>DairyCare - Login</title>


<!-- Bootstrap 5.3.3 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">


<!-- Bootstrap Icons -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"
	rel="stylesheet">


<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">


<style>

/* =========================================================
   GENERAL
========================================================= */

* {
	box-sizing: border-box;
}

body {
	margin: 0;
	min-height: 100vh;
	font-family: 'Poppins', sans-serif;
	background: #f6f9f7;
	color: #26352d;
}


/* =========================================================
   LOGIN PAGE WRAPPER
========================================================= */

.login-wrapper {
	min-height: 100vh;
	display: flex;
	align-items: center;
	justify-content: center;
	padding: 30px 20px;
	position: relative;
	overflow: hidden;
}


/* Background decorative circles */

.login-wrapper::before {
	content: "";
	position: absolute;
	width: 420px;
	height: 420px;
	border-radius: 50%;
	background: rgba(25, 135, 84, 0.07);
	top: -180px;
	left: -150px;
}

.login-wrapper::after {
	content: "";
	position: absolute;
	width: 350px;
	height: 350px;
	border-radius: 50%;
	background: rgba(74, 222, 128, 0.07);
	bottom: -150px;
	right: -100px;
}


/* =========================================================
   LOGIN CONTAINER
========================================================= */

.login-container {
	width: 100%;
	max-width: 1000px;
	min-height: 600px;
	background: #ffffff;
	border-radius: 24px;
	box-shadow: 0 20px 55px rgba(31, 59, 45, 0.12);
	overflow: hidden;
	display: grid;
	grid-template-columns: 45% 55%;
	position: relative;
	z-index: 2;
}


/* =========================================================
   LEFT BRAND PANEL
========================================================= */

.brand-panel {
	background: linear-gradient(
		145deg,
		#1f3b2d,
		#198754
	);
	color: white;
	padding: 50px 45px;
	display: flex;
	flex-direction: column;
	justify-content: center;
	position: relative;
	overflow: hidden;
}


/* Decorative circle */

.brand-panel::before {
	content: "";
	position: absolute;
	width: 280px;
	height: 280px;
	border-radius: 50%;
	background: rgba(255, 255, 255, 0.06);
	top: -100px;
	right: -100px;
}

.brand-panel::after {
	content: "";
	position: absolute;
	width: 220px;
	height: 220px;
	border-radius: 50%;
	background: rgba(255, 255, 255, 0.05);
	bottom: -100px;
	left: -80px;
}


/* Logo */

.brand-logo {
	display: flex;
	align-items: center;
	gap: 10px;
	font-size: 25px;
	font-weight: 700;
	margin-bottom: 45px;
	position: relative;
	z-index: 2;
}

.brand-logo i {
	font-size: 30px;
	color: #4ade80;
}


/* Brand icon */

.brand-icon {
	width: 85px;
	height: 85px;
	border-radius: 22px;
	background: rgba(255, 255, 255, 0.12);
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 43px;
	margin-bottom: 25px;
	position: relative;
	z-index: 2;
}


/* Brand heading */

.brand-panel h1 {
	font-size: 31px;
	font-weight: 700;
	line-height: 1.3;
	margin-bottom: 15px;
	position: relative;
	z-index: 2;
}

.brand-panel p {
	font-size: 14px;
	line-height: 1.8;
	color: #dcefe4;
	margin-bottom: 25px;
	position: relative;
	z-index: 2;
}


/* Features */

.brand-features {
	list-style: none;
	padding: 0;
	margin: 10px 0 0;
	position: relative;
	z-index: 2;
}

.brand-features li {
	display: flex;
	align-items: center;
	gap: 10px;
	font-size: 13px;
	margin-bottom: 13px;
	color: #e7f5ec;
}

.brand-features i {
	width: 24px;
	height: 24px;
	border-radius: 50%;
	background: rgba(255, 255, 255, 0.12);
	display: flex;
	align-items: center;
	justify-content: center;
	color: #4ade80;
	font-size: 13px;
}


/* =========================================================
   RIGHT LOGIN PANEL
========================================================= */

.login-panel {
	padding: 50px 55px;
	display: flex;
	flex-direction: column;
	justify-content: center;
}


/* Login heading */

.login-heading {
	margin-bottom: 28px;
}

.login-heading h2 {
	font-size: 27px;
	font-weight: 700;
	color: #1f3b2d;
	margin-bottom: 7px;
}

.login-heading p {
	font-size: 13px;
	color: #718078;
	margin: 0;
}


/* =========================================================
   MESSAGE
========================================================= */

.message-box {
	background: #fff1f1;
	border: 1px solid #f5c2c7;
	color: #b02a37;
	border-radius: 9px;
	padding: 10px 13px;
	font-size: 13px;
	margin-bottom: 20px;
}

.message-box:empty {
	display: none;
}


/* =========================================================
   FORM
========================================================= */

.form-label {
	font-size: 13px;
	font-weight: 600;
	color: #37443d;
	margin-bottom: 8px;
}


/* Input group */

.input-group {
	border-radius: 10px;
	overflow: hidden;
}

.input-group-text {
	height: 49px;
	background: #f8faf9;
	border: 1px solid #dfe8e2;
	border-right: none;
	color: #198754;
	padding: 0 14px;
}

.form-control {
	height: 49px;
	border: 1px solid #dfe8e2;
	border-left: none;
	background: #f8faf9;
	font-size: 13px;
	box-shadow: none !important;
}

.form-control::placeholder {
	color: #9aa59f;
}

.form-control:focus {
	background: #ffffff;
	border-color: #198754;
}

.input-group:focus-within .input-group-text {
	background: #ffffff;
	border-color: #198754;
}


/* Password eye button */

.password-toggle {
	cursor: pointer;
	border-left: 1px solid #dfe8e2 !important;
	border-right: 1px solid #dfe8e2 !important;
	background: #f8faf9;
}

.password-toggle:hover {
	color: #146c43;
	background: #ffffff;
}


/* =========================================================
   LOGIN BUTTON
========================================================= */

.login-submit {
	width: 100%;
	height: 50px;
	border: none;
	border-radius: 10px;
	background: linear-gradient(
		135deg,
		#198754,
		#157347
	);
	color: white;
	font-size: 14px;
	font-weight: 600;
	margin-top: 8px;
	transition: 0.25s;
	box-shadow: 0 7px 18px rgba(25, 135, 84, 0.20);
}

.login-submit:hover {
	background: linear-gradient(
		135deg,
		#157347,
		#146c43
	);
	transform: translateY(-2px);
	box-shadow: 0 10px 22px rgba(25, 135, 84, 0.25);
}


/* =========================================================
   REGISTER
========================================================= */

.register-text {
	text-align: center;
	margin-top: 25px;
	padding-top: 20px;
	border-top: 1px solid #edf1ee;
	font-size: 13px;
	color: #718078;
}

.register-text a {
	color: #198754;
	font-weight: 600;
	text-decoration: none;
}

.register-text a:hover {
	color: #146c43;
	text-decoration: underline;
}


/* =========================================================
   BACK TO HOME
========================================================= */

.back-home {
	text-align: center;
	margin-top: 18px;
}

.back-home a {
	color: #718078;
	font-size: 12px;
	text-decoration: none;
}

.back-home a:hover {
	color: #198754;
}

.back-home i {
	margin-right: 5px;
}


/* =========================================================
   RESPONSIVE
========================================================= */

@media (max-width: 850px) {

	.login-container {
		grid-template-columns: 1fr;
		max-width: 500px;
	}

	.brand-panel {
		display: none;
	}

	.login-panel {
		padding: 45px 40px;
	}

}


@media (max-width: 576px) {

	.login-wrapper {
		padding: 15px;
	}

	.login-container {
		border-radius: 18px;
	}

	.login-panel {
		padding: 35px 25px;
	}

	.login-heading h2 {
		font-size: 24px;
	}

}

</style>

</head>


<body>


<!-- =========================================================
     LOGIN WRAPPER
========================================================= -->

<div class="login-wrapper">


	<div class="login-container">


		<!-- =====================================================
		     LEFT BRAND PANEL
		===================================================== -->

		<div class="brand-panel">


			<div class="brand-logo">

				<i class="bi bi-cow"></i>

				<span>DairyCare</span>

			</div>


			<div class="brand-icon">

				<i class="bi bi-heart-pulse-fill"></i>

			</div>


			<h1>
				Smart Dairy<br>
				Farm Management
			</h1>


			<p>
				Manage your livestock, milk production,
				feed resources and farm records from
				one simple platform.
			</p>


			<ul class="brand-features">

				<li>
					<i class="bi bi-check-lg"></i>
					<span>Livestock Health Monitoring</span>
				</li>

				<li>
					<i class="bi bi-check-lg"></i>
					<span>Milk Production Management</span>
				</li>

				<li>
					<i class="bi bi-check-lg"></i>
					<span>Farm Reports & Records</span>
				</li>

				<li>
					<i class="bi bi-check-lg"></i>
					<span>Feed & Resource Management</span>
				</li>

			</ul>


		</div>



		<!-- =====================================================
		     RIGHT LOGIN PANEL
		===================================================== -->

		<div class="login-panel">


			<!-- Heading -->

			<div class="login-heading">

				<h2>
					Welcome Back 👋
				</h2>

				<p>
					Login to your DairyCare account
				</p>

			</div>



			<!-- =================================================
			     MESSAGE
			================================================= -->

			<%
				String message = (String) request.getAttribute("msg");

				if (message != null && !message.trim().isEmpty()) {
			%>

				<div class="message-box">
					<i class="bi bi-exclamation-circle me-2"></i>
					<%= message %>
				</div>

			<%
				}
			%>



			<!-- =================================================
			     LOGIN FORM
			================================================= -->

			<form action="loginForm" method="post">


				<!-- Username -->

				<div class="mb-4">

					<label class="form-label">
						User Name
					</label>

					<div class="input-group">

						<span class="input-group-text">
							<i class="bi bi-person"></i>
						</span>

						<input
							type="text"
							name="user_name"
							class="form-control"
							placeholder="Enter user name"
							required>

					</div>

				</div>



				<!-- Password -->

				<div class="mb-4">

					<label class="form-label">
						Password
					</label>

					<div class="input-group">

						<span class="input-group-text">
							<i class="bi bi-lock"></i>
						</span>

						<input
							type="password"
							name="password"
							id="password"
							class="form-control"
							placeholder="Enter password"
							required>


						<button
							type="button"
							class="input-group-text password-toggle"
							onclick="togglePassword()">

							<i
								class="bi bi-eye"
								id="eyeIcon">
							</i>

						</button>

					</div>

				</div>



				<!-- Login Button -->

				<button
					type="submit"
					class="login-submit">

					<i class="bi bi-box-arrow-in-right me-2"></i>

					Login

				</button>


			</form>



			<!-- Register -->

			<div class="register-text">

				Don't have an account?

				<a href="register">
					Create an account
				</a>

			</div>



			<!-- Back Home -->

			<div class="back-home">

				<a href="index">

					<i class="bi bi-arrow-left"></i>

					Back to Home

				</a>

			</div>


		</div>

	</div>

</div>



<!-- =========================================================
     PASSWORD TOGGLE
========================================================= -->

<script>

function togglePassword() {

	const password =
		document.getElementById("password");

	const eyeIcon =
		document.getElementById("eyeIcon");


	if (password.type === "password") {

		password.type = "text";

		eyeIcon.classList.remove("bi-eye");

		eyeIcon.classList.add("bi-eye-slash");

	} else {

		password.type = "password";

		eyeIcon.classList.remove("bi-eye-slash");

		eyeIcon.classList.add("bi-eye");

	}

}

</script>



<!-- Bootstrap JS -->

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
</script>


</body>

</html>