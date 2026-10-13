<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>DairyCare - Contact Us</title>

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

/* ================= CONTACT HERO ================= */

.contact-hero {
    background: linear-gradient(135deg, #e8f5ee, #ffffff);
    padding: 65px 0;
    text-align: center;
}

.contact-hero h1 {
    font-size: 44px;
    font-weight: 700;
    color: #198754;
    margin-bottom: 15px;
}

.contact-hero p {
    max-width: 700px;
    margin: auto;
    font-size: 18px;
    line-height: 1.8;
    color: #6c757d;
}


/* ================= CONTACT SECTION ================= */

.contact-section {
    padding: 70px 0;
}


/* ================= INFO CARD ================= */

.contact-info {
    background: #198754;
    color: white;
    border-radius: 18px;
    padding: 40px;
    height: 100%;
    box-shadow: 0 10px 30px rgba(25, 135, 84, 0.18);
}

.contact-info h2 {
    font-weight: 700;
    margin-bottom: 15px;
}

.contact-info > p {
    line-height: 1.7;
    opacity: 0.95;
    margin-bottom: 35px;
}


/* ================= CONTACT ITEMS ================= */

.contact-item {
    display: flex;
    align-items: flex-start;
    margin-bottom: 28px;
}

.contact-item-icon {
    width: 48px;
    height: 48px;
    min-width: 48px;
    background: rgba(255, 255, 255, 0.15);
    border-radius: 10px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 21px;
    margin-right: 15px;
}

.contact-item h6 {
    margin: 0 0 5px;
    font-weight: 600;
}

.contact-item p {
    margin: 0;
    opacity: 0.9;
}


/* ================= FORM CARD ================= */

.contact-form-card {
    background: #ffffff;
    border-radius: 18px;
    padding: 40px;
    height: 100%;
    border: 1px solid #e5ece7;
    box-shadow: 0 8px 30px rgba(0, 0, 0, 0.06);
}

.contact-form-card h2 {
    font-weight: 700;
    color: #212529;
    margin-bottom: 8px;
}

.form-subtitle {
    color: #6c757d;
    margin-bottom: 28px;
}


/* ================= FORM ================= */

.form-label {
    font-weight: 600;
    color: #37443d;
    margin-bottom: 8px;
}

.input-group-text {
    background: #f8faf9;
    border-right: none;
    color: #198754;
}

.form-control {
    border-left: none;
    box-shadow: none !important;
}

.form-control:focus {
    border-color: #198754;
}

.input-group:focus-within .input-group-text {
    border-color: #198754;
}

textarea.form-control {
    min-height: 130px;
    resize: vertical;
}


/* ================= SEND BUTTON ================= */

.send-btn {
    background: #198754;
    color: white;
    border: none;
    border-radius: 8px;
    padding: 12px 25px;
    font-weight: 600;
    transition: 0.3s;
}

.send-btn:hover {
    background: #146c43;
    color: white;
    transform: translateY(-1px);
}


/* ================= QUICK HELP ================= */

.help-section {
    padding: 0 0 70px;
}

.help-card {
    background: #ffffff;
    border-radius: 16px;
    padding: 30px;
    text-align: center;
    border: 1px solid #e5ece7;
    height: 100%;
    transition: 0.3s;
}

.help-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 10px 25px rgba(0, 0, 0, 0.08);
}

.help-icon {
    width: 60px;
    height: 60px;
    margin: 0 auto 18px;
    border-radius: 50%;
    background: #e8f5ee;
    color: #198754;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 27px;
}

.help-card h5 {
    font-weight: 700;
    color: #212529;
}

.help-card p {
    color: #6c757d;
    margin-bottom: 0;
    line-height: 1.6;
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

    .contact-hero {
        padding: 55px 20px;
    }

    .contact-hero h1 {
        font-size: 36px;
    }

    .contact-info,
    .contact-form-card {
        padding: 30px 25px;
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

                
					<li class="nav-item"><a class="nav-link" href="services">service</a></li>

                <li class="nav-item">
                    <a class="nav-link active" href="contact">
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


<!-- ================= CONTACT HERO ================= -->

<section class="contact-hero">

    <div class="container">

        <span class="badge text-bg-success mb-3">
            Get In Touch
        </span>

        <h1>
            Contact DairyCare
        </h1>

        <p>
            Have a question, suggestion or need assistance?
            Get in touch with us and we will be happy to help.
        </p>

    </div>

</section>


<!-- ================= CONTACT SECTION ================= -->

<section class="contact-section">

    <div class="container">

        <div class="row g-4">


            <!-- ================= CONTACT INFORMATION ================= -->

            <div class="col-lg-5">

                <div class="contact-info">

                    <h2>
                        Let's Talk
                    </h2>

                    <p>
                        We are here to help you with your DairyCare
                        experience. Feel free to contact us through
                        any of the following options.
                    </p>


                    <!-- Email -->

                    <div class="contact-item">

                        <div class="contact-item-icon">
                            <i class="bi bi-envelope"></i>
                        </div>

                        <div>

                            <h6>Email</h6>

                            <p>
                                support@dairycare.com
                            </p>

                        </div>

                    </div>


                    <!-- Phone -->

                    <div class="contact-item">

                        <div class="contact-item-icon">
                            <i class="bi bi-telephone"></i>
                        </div>

                        <div>

                            <h6>Phone</h6>

                            <p>
                                +91 98765 43210
                            </p>

                        </div>

                    </div>


                    <!-- Address -->

                    <div class="contact-item">

                        <div class="contact-item-icon">
                            <i class="bi bi-geo-alt"></i>
                        </div>

                        <div>

                            <h6>Location</h6>

                            <p>
                                Maharashtra, India
                            </p>

                        </div>

                    </div>


                    <!-- Working Hours -->

                    <div class="contact-item mb-0">

                        <div class="contact-item-icon">
                            <i class="bi bi-clock"></i>
                        </div>

                        <div>

                            <h6>Working Hours</h6>

                            <p>
                                Monday - Saturday
                                <br>
                                9:00 AM - 6:00 PM
                            </p>

                        </div>

                    </div>

                </div>

            </div>


            <!-- ================= CONTACT FORM ================= -->

            <div class="col-lg-7">

                <div class="contact-form-card">

                    <h2>
                        Send Us a Message
                    </h2>

                    <p class="form-subtitle">
                        Fill out the form below and we'll get back
                        to you as soon as possible.
                    </p>


                    <form action="contactForm" method="post">


                        <!-- Name -->

                        <div class="mb-4">

                            <label class="form-label">
                                Your Name
                            </label>

                            <div class="input-group">

                                <span class="input-group-text">
                                    <i class="bi bi-person"></i>
                                </span>

                                <input
                                    type="text"
                                    name="name"
                                    class="form-control"
                                    placeholder="Enter your name"
                                    required>

                            </div>

                        </div>


                        <!-- Email -->

                        <div class="mb-4">

                            <label class="form-label">
                                Email Address
                            </label>

                            <div class="input-group">

                                <span class="input-group-text">
                                    <i class="bi bi-envelope"></i>
                                </span>

                                <input
                                    type="email"
                                    name="email"
                                    class="form-control"
                                    placeholder="Enter your email"
                                    required>

                            </div>

                        </div>


                        <!-- Subject -->

                        <div class="mb-4">

                            <label class="form-label">
                                Subject
                            </label>

                            <div class="input-group">

                                <span class="input-group-text">
                                    <i class="bi bi-chat-left-text"></i>
                                </span>

                                <input
                                    type="text"
                                    name="subject"
                                    class="form-control"
                                    placeholder="Enter subject"
                                    required>

                            </div>

                        </div>


                        <!-- Message -->

                        <div class="mb-4">

                            <label class="form-label">
                                Message
                            </label>

                            <div class="input-group">

                                <span class="input-group-text align-items-start pt-3">
                                    <i class="bi bi-pencil-square"></i>
                                </span>

                                <textarea
                                    name="message"
                                    class="form-control"
                                    placeholder="Write your message here..."
                                    required></textarea>

                            </div>

                        </div>


                        <!-- Submit -->

                        <button type="submit" class="send-btn">

                            <i class="bi bi-send me-2"></i>

                            Send Message

                        </button>

                    </form>

                </div>

            </div>

        </div>

    </div>

</section>


<!-- ================= QUICK HELP ================= -->

<section class="help-section">

    <div class="container">

        <div class="row g-4">


            <!-- Help 1 -->

            <div class="col-md-4">

                <div class="help-card">

                    <div class="help-icon">
                        <i class="bi bi-question-circle"></i>
                    </div>

                    <h5>
                        Need Help?
                    </h5>

                    <p>
                        Contact our support team for assistance
                        with your DairyCare account.
                    </p>

                </div>

            </div>


            <!-- Help 2 -->

            <div class="col-md-4">

                <div class="help-card">

                    <div class="help-icon">
                        <i class="bi bi-lightbulb"></i>
                    </div>

                    <h5>
                        Have a Suggestion?
                    </h5>

                    <p>
                        Share your ideas with us and help improve
                        the DairyCare system.
                    </p>

                </div>

            </div>


            <!-- Help 3 -->

            <div class="col-md-4">

                <div class="help-card">

                    <div class="help-icon">
                        <i class="bi bi-headset"></i>
                    </div>

                    <h5>
                        Customer Support
                    </h5>

                    <p>
                        We are ready to assist you with your
                        questions and feedback.
                    </p>

                </div>

            </div>

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
