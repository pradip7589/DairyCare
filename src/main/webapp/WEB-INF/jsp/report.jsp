<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="javax.servlet.http.HttpSession"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
    HttpSession sessionObj = request.getSession(false);

    if (sessionObj == null || sessionObj.getAttribute("user") == null) {
        response.sendRedirect("login");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>DairyCare - Report</title>

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet">

<!-- Bootstrap Icons -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"
      rel="stylesheet">

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
      rel="stylesheet">

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

/* ================= SIDEBAR ================= */

.sidebar {
    position: fixed;
    left: 0;
    top: 0;
    width: 250px;
    height: 100vh;

    background: #1f3b2d;

    padding: 25px 18px;

    z-index: 1000;

    transition: 0.3s;
}

.logo {
    display: flex;
    align-items: center;
    gap: 10px;

    color: white;
    font-size: 23px;
    font-weight: 700;

    padding: 0 12px;
    margin-bottom: 35px;
}

.logo i {
    color: #4ade80;
    font-size: 27px;
}

/* Sidebar Menu */

.sidebar-menu {
    list-style: none;
    padding: 0;
    margin: 0;
}

.sidebar-menu li {
    margin-bottom: 8px;
}

.sidebar-menu a {
    display: flex;
    align-items: center;
    gap: 13px;

    padding: 13px 15px;

    color: #d7e4dc;
    text-decoration: none;

    border-radius: 10px;

    font-size: 14px;
    font-weight: 500;

    transition: 0.3s;
}

.sidebar-menu a i {
    font-size: 18px;
}

.sidebar-menu a:hover {
    background: rgba(255,255,255,0.08);
    color: white;
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


/* Active Report */

.sidebar-menu a.active {
    background: #198754;
    color: white;
}

/* ================= MAIN ================= */

.main-content {
    margin-left: 250px;
    min-height: 100vh;
}

/* ================= TOPBAR ================= */

.topbar {
    height: 75px;

    background: white;

    display: flex;
    align-items: center;
    justify-content: space-between;

    padding: 0 30px;

    border-bottom: 1px solid #e5ebe7;

    position: sticky;
    top: 0;

    z-index: 900;
}

.page-title {
    font-size: 21px;
    font-weight: 600;
    color: #1f3b2d;
}

.topbar-right {
    display: flex;
    align-items: center;
    gap: 22px;
}

.notification {
    width: 38px;
    height: 38px;

    display: flex;
    align-items: center;
    justify-content: center;

    border-radius: 50%;

    background: #f1f6f3;
    color: #198754;

    font-size: 18px;
}

.user-info {
    display: flex;
    align-items: center;
    gap: 10px;
}

.user-icon {
    width: 40px;
    height: 40px;

    border-radius: 50%;

    background: #dff5e8;
    color: #198754;

    display: flex;
    align-items: center;
    justify-content: center;

    font-size: 18px;
}

.user-details {
    line-height: 1.2;
}

.user-name {
    font-size: 14px;
    font-weight: 600;
    color: #26352d;
}

.user-role {
    font-size: 11px;
    color: #89958e;
}

/* ================= CONTENT ================= */

.content {
    padding: 35px;
}

/* ================= REPORT CARD ================= */

.report-card {
    background: white;

    border-radius: 18px;

    overflow: hidden;

    box-shadow: 0 5px 20px rgba(31, 59, 45, 0.08);

    border: 1px solid #e8eee9;
}

/* Report Header */

.report-header {
    background: linear-gradient(135deg, #198754, #157347);

    color: white;

    padding: 24px 28px;

    display: flex;
    align-items: center;
    justify-content: space-between;
}

.report-title-area {
    display: flex;
    align-items: center;
    gap: 15px;
}

.report-icon {
    width: 48px;
    height: 48px;

    background: rgba(255,255,255,0.15);

    border-radius: 12px;

    display: flex;
    align-items: center;
    justify-content: center;

    font-size: 23px;
}

.report-title {
    font-size: 20px;
    font-weight: 600;

    margin-bottom: 4px;
}

.report-subtitle {
    font-size: 12px;
    opacity: 0.85;

    margin: 0;
}

.records-badge {
    background: rgba(255,255,255,0.15);

    color: white;

    padding: 7px 14px;

    border-radius: 20px;

    font-size: 12px;
    font-weight: 500;
}

/* ================= TABLE ================= */

.table-container {
    padding: 0;
}

.table {
    margin-bottom: 0;
}

.table thead th {
    background: #f5f8f6;

    color: #52635a;

    font-size: 12px;
    font-weight: 600;

    padding: 15px 20px;

    border-bottom: 1px solid #e3e9e5;

    white-space: nowrap;
}

.table tbody td {
    padding: 16px 20px;

    font-size: 13px;

    color: #435149;

    border-bottom: 1px solid #edf1ee;

    vertical-align: middle;
}

.table tbody tr {
    transition: 0.2s;
}

.table tbody tr:hover {
    background: #f8fbf9;
}

.table tbody tr:last-child td {
    border-bottom: none;
}

/* Amount */

.amount {
    font-weight: 600;
    color: #198754;
}

/* ================= FOOTER ================= */

.report-footer {
    padding: 15px 20px;

    background: #fafcfb;

    border-top: 1px solid #edf1ee;

    color: #7b8881;

    font-size: 12px;
}

/* ================= MOBILE BUTTON ================= */

.mobile-menu {
    display: none;

    border: none;
    background: transparent;

    font-size: 24px;

    color: #1f3b2d;
}

/* ================= RESPONSIVE ================= */

@media (max-width: 900px) {

    .sidebar {
        left: -250px;
    }

    .sidebar.show {
        left: 0;
    }

    .main-content {
        margin-left: 0;
    }

    .mobile-menu {
        display: block;
    }

    .topbar {
        padding: 0 18px;
    }

    .content {
        padding: 20px;
    }

}

@media (max-width: 600px) {

    .topbar {
        height: 65px;
    }

    .page-title {
        font-size: 18px;
    }

    .user-details {
        display: none;
    }

    .notification {
        display: none;
    }

    .report-header {
        padding: 20px;
    }

    .report-title {
        font-size: 17px;
    }

    .report-subtitle {
        font-size: 11px;
    }

    .records-badge {
        display: none;
    }

    .table {
        min-width: 650px;
    }

    .table-container {
        overflow-x: auto;
    }

}

</style>

</head>

<body>


<!-- ================= SIDEBAR ================= -->

<div class="sidebar" id="sidebar">

    <div class="logo">
        <i class="bi bi-cow"></i>
        <span>DairyCare</span>
    </div>

    <ul class="sidebar-menu">

        <li>
            <a href="dashboard">
                <i class="bi bi-grid-1x2-fill"></i>
                <span>Dashboard</span>
            </a>
        </li>

        <li>
            <a href="health">
                <i class="bi bi-heart-pulse-fill"></i>
                <span>Livestock</span>
            </a>
        </li>

        <li>
            <a href="milk">
                <i class="bi bi-droplet-fill"></i>
                <span>Milk Collection</span>
            </a>
        </li>

        <li>
            <a href="report" class="active">
                <i class="bi bi-bar-chart-fill"></i>
                <span>Reports</span>
            </a>
        </li>

        <li>
            <a href="feed">
                <i class="bi bi-basket-fill"></i>
                <span>Feed Management</span>
            </a>
        </li>

        <li>
            <a href="setting">
                <i class="bi bi-gear-fill"></i>
                <span>Settings</span>
            </a>
        </li>
<div class="sidebar-footer">
				<a href="logout" class="logout-btn"> <i class="bi bi-box-arrow-right"></i> Logout
				</a>
			</div>

    </ul>

</div>


<!-- ================= MAIN CONTENT ================= -->

<div class="main-content">


    <!-- ================= TOPBAR ================= -->

    <div class="topbar">

        <div class="d-flex align-items-center gap-3">

            <button class="mobile-menu" onclick="toggleSidebar()">
                <i class="bi bi-list"></i>
            </button>

            <div class="page-title">
                Reports
            </div>

        </div>


        <div class="topbar-right">

            <div class="notification">
                <i class="bi bi-bell"></i>
            </div>

            <div class="user-info">

                <div class="user-icon">
                    <i class="bi bi-person-fill"></i>
                </div>

                <div class="user-details">

                    <div class="user-name">
                        <%= sessionObj.getAttribute("user") %>
                    </div>

                    <div class="user-role">
                        Farm Manager
                    </div>

                </div>

            </div>

        </div>

    </div>


    <!-- ================= PAGE CONTENT ================= -->

    <div class="content">

        <div class="report-card">


            <!-- Report Header -->

            <div class="report-header">

                <div class="report-title-area">

                    <div class="report-icon">
                        <i class="bi bi-bar-chart-line-fill"></i>
                    </div>

                    <div>

                        <div class="report-title">
                            Milk Collection Records
                        </div>

                        <p class="report-subtitle">
                            Daily milk production and payment details
                        </p>

                    </div>

                </div>

                <div class="records-badge">
                    Records
                </div>

            </div>


            <!-- Table -->

            <div class="table-container">

                <table class="table align-middle">

                    <thead>

                        <tr>

                            <th>Date</th>
                            <th>Milk (Ltr)</th>
                            <th>Fat</th>
                            <th>SNF</th>
                            <th>Rate</th>
                            <th>Amount</th>

                        </tr>

                    </thead>

                    <tbody>

                        <c:forEach var="std" items="${stdList}">

                            <tr>

                                <td>
                                    ${std.date}
                                </td>

                                <td>
                                    ${std.milk}
                                </td>

                                <td>
                                    ${std.fat}
                                </td>

                                <td>
                                    ${std.snf}
                                </td>

                                <td>
                                    ${std.rate}
                                </td>

                                <td class="amount">
                                    ${std.amount}
                                </td>

                            </tr>

                        </c:forEach>

                    </tbody>

                </table>

            </div>


            <!-- Footer -->

            <div class="report-footer">

                <i class="bi bi-info-circle me-1"></i>

                Showing milk collection and payment records

            </div>


        </div>

    </div>

</div>


<!-- ================= JAVASCRIPT ================= -->

<script>

function toggleSidebar() {

    document.getElementById("sidebar").classList.toggle("show");

}

</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>