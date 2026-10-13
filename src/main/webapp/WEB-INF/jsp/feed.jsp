<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="java.util.List, java.util.ArrayList, com.nt.entity.FeedStock"%>

<%!
    private String esc(String s) {
        if (s == null) return "";
        return s.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;")
                .replace("\"", "&quot;").replace("'", "&#39;");
    }

    private String fmt(double d) {
        if (d == Math.rint(d)) return String.valueOf((long) d);
        return String.format("%.1f", d);
    }

    private String barClass(String status) {
        if ("Critical".equals(status)) return "danger";
        if ("Low".equals(status)) return "warning";
        return "";
    }

    private String badgeClass(String status) {
        if ("Critical".equals(status)) return "stock-critical";
        if ("Low".equals(status)) return "stock-low";
        return "stock-good";
    }
%>

<%
    HttpSession sessionObj = request.getSession(false);

    if (sessionObj == null || sessionObj.getAttribute("user") == null) {
        response.sendRedirect("login");
        return;
    }

    String user = (String) sessionObj.getAttribute("user");

    // ---------- data supplied by FeedController ----------
    List<FeedStock> feedList = (List<FeedStock>) request.getAttribute("feedList");
    if (feedList == null) feedList = new ArrayList<FeedStock>();

    double totalStock = request.getAttribute("totalStock") != null
            ? ((Number) request.getAttribute("totalStock")).doubleValue() : 0;
    double dailyConsumption = request.getAttribute("dailyConsumption") != null
            ? ((Number) request.getAttribute("dailyConsumption")).doubleValue() : 0;
    double dailyRequirement = request.getAttribute("dailyRequirement") != null
            ? ((Number) request.getAttribute("dailyRequirement")).doubleValue() : 0;
    int feedTypesCount = request.getAttribute("feedTypesCount") != null
            ? ((Number) request.getAttribute("feedTypesCount")).intValue() : 0;
    int lowStockCount = request.getAttribute("lowStockCount") != null
            ? ((Number) request.getAttribute("lowStockCount")).intValue() : 0;
    int estimatedDays = request.getAttribute("estimatedDays") != null
            ? ((Number) request.getAttribute("estimatedDays")).intValue() : 0;

    int usagePercent = dailyRequirement > 0
            ? (int) Math.min(100, Math.round((dailyConsumption / dailyRequirement) * 100)) : 0;
%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>DairyCare - Feed Management</title>

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet">

<!-- Bootstrap Icons -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"
      rel="stylesheet">

<!-- Poppins -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
      rel="stylesheet">

<style>

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
    padding: 24px 16px;
    z-index: 1000;
    transition: 0.3s;
}

.logo {
    display: flex;
    align-items: center;
    gap: 12px;
    color: white;
    font-size: 23px;
    font-weight: 700;
    padding: 0 12px 30px;
}

.logo i {
    font-size: 30px;
    color: #4ade80;
}

.sidebar-menu {
    list-style: none;
    padding: 0;
    margin: 0;
}

.sidebar-menu li {
    margin-bottom: 7px;
}

.sidebar-menu a {
    display: flex;
    align-items: center;
    gap: 14px;
    padding: 13px 15px;
    border-radius: 10px;
    color: #c8d6ce;
    text-decoration: none;
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

.sidebar-menu a.active {
    background: #198754;
    color: white;
    box-shadow: 0 5px 15px rgba(25,135,84,0.25);
}

.sidebar-bottom {
    position: absolute;
    bottom: 25px;
    left: 16px;
    right: 16px;
}

.sidebar-bottom a {
    display: flex;
    align-items: center;
    gap: 12px;
    color: #c8d6ce;
    text-decoration: none;
    padding: 12px 15px;
    border-radius: 10px;
    font-size: 14px;
}

.sidebar-bottom a:hover {
    background: rgba(255,255,255,0.08);
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
    border-bottom: 1px solid #e7ece9;
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 0 30px;
}

.page-title {
    font-size: 20px;
    font-weight: 600;
    color: #1f3b2d;
}

.topbar-right {
    display: flex;
    align-items: center;
    gap: 22px;
}

.search-box {
    width: 230px;
    position: relative;
}

.search-box input {
    width: 100%;
    border: 1px solid #e1e8e4;
    border-radius: 25px;
    padding: 9px 15px 9px 40px;
    font-size: 13px;
    outline: none;
    background: #f8faf9;
}

.search-box i {
    position: absolute;
    left: 15px;
    top: 10px;
    color: #7b8b82;
}

.notification {
    position: relative;
    font-size: 21px;
    color: #5e6d65;
    cursor: pointer;
}

.notification .dot {
    position: absolute;
    width: 7px;
    height: 7px;
    background: #dc3545;
    border-radius: 50%;
    right: 0;
    top: 1px;
}

.profile {
    display: flex;
    align-items: center;
    gap: 10px;
}

.profile-icon {
    width: 38px;
    height: 38px;
    border-radius: 50%;
    background: #e7f5ed;
    display: flex;
    align-items: center;
    justify-content: center;
    color: #198754;
    font-size: 18px;
}

.profile-info {
    line-height: 1.2;
}

.profile-name {
    font-size: 13px;
    font-weight: 600;
    color: #26352d;
}

.profile-role {
    font-size: 11px;
    color: #8a968f;
}

/* ================= PAGE ================= */

.page-container {
    padding: 30px;
}

.page-heading {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 25px;
}

.heading-text h2 {
    font-size: 25px;
    font-weight: 600;
    color: #1f3b2d;
    margin-bottom: 5px;
}

.heading-text p {
    margin: 0;
    color: #7b8981;
    font-size: 13px;
}

.action-buttons {
    display: flex;
    gap: 10px;
}

.btn-green {
    background: #198754;
    color: white;
    border: none;
    border-radius: 8px;
    padding: 10px 17px;
    font-size: 13px;
    font-weight: 500;
}

.btn-green:hover {
    background: #157347;
    color: white;
}

.btn-light-green {
    background: #e8f5ed;
    color: #198754;
    border: none;
    border-radius: 8px;
    padding: 10px 17px;
    font-size: 13px;
    font-weight: 500;
}

.btn-light-green:hover {
    background: #d8eddf;
    color: #198754;
}

/* ================= STAT CARDS ================= */

.stats-row {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 18px;
    margin-bottom: 25px;
}

.stat-card {
    background: white;
    border: 1px solid #e8eeea;
    border-radius: 13px;
    padding: 20px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    transition: 0.3s;
}

.stat-card:hover {
    transform: translateY(-3px);
    box-shadow: 0 8px 22px rgba(31,59,45,0.08);
}

.stat-title {
    color: #7d8b83;
    font-size: 12px;
    margin-bottom: 7px;
}

.stat-value {
    font-size: 24px;
    font-weight: 600;
    color: #26352d;
}

.stat-sub {
    font-size: 11px;
    color: #198754;
    margin-top: 5px;
}

.stat-icon {
    width: 50px;
    height: 50px;
    border-radius: 12px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 23px;
}

.icon-green {
    background: #e7f5ed;
    color: #198754;
}

.icon-orange {
    background: #fff4df;
    color: #e59a18;
}

.icon-blue {
    background: #e9f3ff;
    color: #3685d5;
}

.icon-red {
    background: #fdeaea;
    color: #dc3545;
}

/* ================= CONTENT GRID ================= */

.content-grid {
    display: grid;
    grid-template-columns: 2fr 1fr;
    gap: 20px;
    margin-bottom: 25px;
}

.card-box {
    background: white;
    border: 1px solid #e8eeea;
    border-radius: 13px;
    padding: 22px;
}

.card-header-custom {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 20px;
}

.card-header-custom h5 {
    font-size: 16px;
    font-weight: 600;
    margin: 0;
    color: #26352d;
}

.card-header-custom a {
    font-size: 12px;
    color: #198754;
    text-decoration: none;
    font-weight: 500;
}

/* ================= STOCK ================= */

.stock-item {
    margin-bottom: 19px;
}

.stock-item:last-child {
    margin-bottom: 0;
}

.stock-top {
    display: flex;
    justify-content: space-between;
    margin-bottom: 7px;
}

.stock-name {
    font-size: 13px;
    font-weight: 500;
}

.stock-amount {
    font-size: 12px;
    color: #748078;
}

.progress {
    height: 8px;
    border-radius: 10px;
    background: #edf1ee;
}

.progress-bar {
    border-radius: 10px;
    background: #198754;
}

.progress-bar.warning {
    background: #e5a11b;
}

.progress-bar.danger {
    background: #dc3545;
}

/* ================= ALERT ================= */

.alert-box {
    background: #fff8e8;
    border: 1px solid #f7dfaa;
    border-radius: 11px;
    padding: 15px;
    display: flex;
    gap: 12px;
    margin-bottom: 15px;
}

.alert-box.critical {
    background: #fdeeee;
    border-color: #f5c6cb;
}

.alert-box.critical .alert-icon {
    color: #dc3545;
}

.alert-box.critical .alert-title {
    color: #842029;
}

.alert-box.critical .alert-text {
    color: #a05058;
}

.alert-box.ok {
    background: #effaf3;
    border-color: #cdebd8;
}

.alert-box.ok .alert-icon {
    color: #198754;
}

.alert-box.ok .alert-title {
    color: #14532d;
}

.alert-box.ok .alert-text {
    color: #4d7a60;
}

.alert-icon {
    color: #e39b13;
    font-size: 21px;
}

.alert-title {
    font-size: 13px;
    font-weight: 600;
    color: #70520d;
}

.alert-text {
    font-size: 11px;
    color: #8b6b22;
    margin-top: 3px;
}

/* ================= CONSUMPTION ================= */

.consumption {
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 15px 0;
    border-bottom: 1px solid #edf1ee;
}

.consumption:last-child {
    border-bottom: none;
}

.consumption-left {
    display: flex;
    align-items: center;
    gap: 12px;
}

.consumption-icon {
    width: 38px;
    height: 38px;
    background: #e8f5ed;
    color: #198754;
    border-radius: 9px;
    display: flex;
    align-items: center;
    justify-content: center;
}

.consumption-name {
    font-size: 12px;
    font-weight: 500;
}

.consumption-type {
    font-size: 10px;
    color: #929c96;
}

.consumption-value {
    font-size: 13px;
    font-weight: 600;
    color: #26352d;
}

/* ================= TABLE ================= */

.table-card {
    background: white;
    border: 1px solid #e8eeea;
    border-radius: 13px;
    padding: 22px;
    margin-bottom: 25px;
    scroll-margin-top: 20px;
}

.table-responsive {
    overflow-x: auto;
}

.feed-table {
    width: 100%;
    border-collapse: collapse;
}

.feed-table th {
    background: #f7faf8;
    color: #718078;
    font-size: 11px;
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: .3px;
    padding: 13px;
    border-bottom: 1px solid #e5ebe7;
    white-space: nowrap;
}

.feed-table td {
    padding: 15px 13px;
    font-size: 12px;
    color: #47564e;
    border-bottom: 1px solid #edf1ee;
    white-space: nowrap;
    vertical-align: middle;
}

.feed-table tr:last-child td {
    border-bottom: none;
}

.feed-name {
    display: flex;
    align-items: center;
    gap: 10px;
    font-weight: 500;
    color: #26352d;
}

.feed-icon {
    width: 34px;
    height: 34px;
    border-radius: 8px;
    background: #e8f5ed;
    color: #198754;
    display: flex;
    align-items: center;
    justify-content: center;
}

.badge-stock {
    padding: 5px 9px;
    border-radius: 20px;
    font-size: 10px;
    font-weight: 500;
}

.stock-good {
    background: #e4f6eb;
    color: #198754;
}

.stock-low {
    background: #fff2d8;
    color: #b77900;
}

.stock-critical {
    background: #fde8e8;
    color: #dc3545;
}

.update-form {
    display: flex;
    gap: 8px;
    align-items: center;
}

.update-form input {
    width: 110px;
}

/* ================= FORMS ================= */

.form-label {
    font-size: 13px;
    font-weight: 600;
    color: #37443d;
}

.form-control, .form-select {
    border: 1px solid #dfe8e2;
    border-radius: 9px;
    font-size: 13px;
}

.form-control:focus, .form-select:focus {
    border-color: #4ade80;
    box-shadow: 0 0 0 0.2rem rgba(74, 222, 128, 0.12);
}

/* ================= MOBILE ================= */

.mobile-menu {
    display: none;
    font-size: 23px;
    color: #1f3b2d;
    cursor: pointer;
}

@media (max-width: 1100px) {

    .stats-row {
        grid-template-columns: repeat(2, 1fr);
    }

    .content-grid {
        grid-template-columns: 1fr;
    }
}

@media (max-width: 768px) {

    .sidebar {
        transform: translateX(-100%);
    }

    .sidebar.show {
        transform: translateX(0);
    }

    .main-content {
        margin-left: 0;
    }

    .topbar {
        padding: 0 18px;
    }

    .mobile-menu {
        display: block;
    }

    .page-title {
        display: none;
    }

    .search-box {
        display: none;
    }

    .profile-info {
        display: none;
    }

    .page-container {
        padding: 20px 15px;
    }

    .page-heading {
        align-items: flex-start;
        gap: 15px;
        flex-direction: column;
    }

    .stats-row {
        grid-template-columns: 1fr;
    }

    .action-buttons {
        width: 100%;
    }

    .action-buttons button {
        flex: 1;
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
                Dashboard
            </a>
        </li>

        <li>
            <a href="health">
                <i class="bi bi-heart-pulse-fill"></i>
                Livestock
            </a>
        </li>

        <li>
            <a href="milk">
                <i class="bi bi-droplet-fill"></i>
                Milk Production
            </a>
        </li>

        <li>
            <a href="report">
                <i class="bi bi-bar-chart-fill"></i>
                Reports
            </a>
        </li>

        <li>
            <a href="feed" class="active">
                <i class="bi bi-basket-fill"></i>
                Feed & Resources
            </a>
        </li>

        <li>
            <a href="setting">
                <i class="bi bi-gear-fill"></i>
                Settings
            </a>
        </li>

    </ul>

    <div class="sidebar-bottom">
        <a href="logout">
            <i class="bi bi-box-arrow-right"></i>
            Logout
        </a>
    </div>

</div>


<!-- ================= MAIN ================= -->

<div class="main-content">

    <!-- TOPBAR -->

    <div class="topbar">

        <div class="d-flex align-items-center gap-3">

            <i class="bi bi-list mobile-menu"
               onclick="toggleSidebar()"></i>

            <div class="page-title">
                Feed Management
            </div>

        </div>

        <div class="topbar-right">

            <div class="search-box">
                <i class="bi bi-search"></i>
                <input type="text" placeholder="Search feed...">
            </div>

            <div class="notification">
                <i class="bi bi-bell"></i>
                <% if (lowStockCount > 0) { %><span class="dot"></span><% } %>
            </div>

            <div class="profile">

                <div class="profile-icon">
                    <i class="bi bi-person-fill"></i>
                </div>

                <div class="profile-info">
                    <div class="profile-name">
                        <%= esc(user) %>
                    </div>

                    <div class="profile-role">
                        Farm Manager
                    </div>
                </div>

            </div>

        </div>

    </div>


    <!-- PAGE -->

    <div class="page-container">

        <!-- HEADING -->

        <div class="page-heading">

            <div class="heading-text">
                <h2>Feed Management</h2>
                <p>Monitor feed inventory, stock levels and daily consumption.</p>
            </div>

            <div class="action-buttons">

                <button type="button" class="btn-light-green"
                        onclick="goTo('feedInventory', null)">
                    <i class="bi bi-arrow-repeat me-1"></i> Update Stock
                </button>

                <button type="button" class="btn-green"
                        onclick="goTo('addFeedForm', 'feedName')">
                    <i class="bi bi-plus-lg me-1"></i> Add Feed
                </button>

            </div>

        </div>


        <!-- STAT CARDS -->

        <div class="stats-row">

            <div class="stat-card">
                <div>
                    <div class="stat-title">Total Feed Stock</div>
                    <div class="stat-value"><%= fmt(totalStock) %> kg</div>
                    <div class="stat-sub">Current inventory</div>
                </div>
                <div class="stat-icon icon-green"><i class="bi bi-box-seam-fill"></i></div>
            </div>

            <div class="stat-card">
                <div>
                    <div class="stat-title">Daily Consumption</div>
                    <div class="stat-value"><%= fmt(dailyConsumption) %> kg</div>
                    <div class="stat-sub">Total per day</div>
                </div>
                <div class="stat-icon icon-blue"><i class="bi bi-speedometer2"></i></div>
            </div>

            <div class="stat-card">
                <div>
                    <div class="stat-title">Feed Types</div>
                    <div class="stat-value"><%= feedTypesCount %></div>
                    <div class="stat-sub">Active inventory items</div>
                </div>
                <div class="stat-icon icon-orange"><i class="bi bi-basket-fill"></i></div>
            </div>

            <div class="stat-card">
                <div>
                    <div class="stat-title">Low Stock Items</div>
                    <div class="stat-value"><%= lowStockCount %></div>
                    <% if (lowStockCount > 0) { %>
                        <div class="stat-sub" style="color:#dc3545;">Requires attention</div>
                    <% } else { %>
                        <div class="stat-sub">All stock levels healthy</div>
                    <% } %>
                </div>
                <div class="stat-icon icon-red"><i class="bi bi-exclamation-triangle-fill"></i></div>
            </div>

        </div>


        <!-- STOCK OVERVIEW + ALERTS -->

        <div class="content-grid">

            <div class="card-box">

                <div class="card-header-custom">
                    <h5>Feed Stock Overview</h5>
                    <a href="#feedInventory">View Inventory</a>
                </div>

                <% if (feedList.isEmpty()) { %>

                    <p class="text-muted mb-0" style="font-size:13px;">
                        No feed items added yet. Click <strong>Add Feed</strong> to create your first item.
                    </p>

                <% } else {
                       for (FeedStock f : feedList) {
                           int pct = Math.min(100, f.getPercentFull());
                %>

                    <div class="stock-item">
                        <div class="stock-top">
                            <span class="stock-name"><%= esc(f.getFeedName()) %></span>
                            <span class="stock-amount">
                                <%= fmt(f.getAvailableQty()) %> / <%= fmt(f.getCapacityQty()) %> <%= esc(f.getUnit()) %>
                            </span>
                        </div>
                        <div class="progress">
                            <div class="progress-bar <%= barClass(f.getStatus()) %>"
                                 style="width:<%= pct %>%"></div>
                        </div>
                    </div>

                <%     }
                   } %>

            </div>


            <div class="card-box">

                <div class="card-header-custom">
                    <h5>Stock Alerts</h5>
                    <i class="bi bi-bell text-muted"></i>
                </div>

                <%
                    boolean anyAlert = false;
                    for (FeedStock f : feedList) {
                        String st = f.getStatus();
                        if (!"Good".equals(st)) {
                            anyAlert = true;
                            boolean critical = "Critical".equals(st);
                %>

                    <div class="alert-box <%= critical ? "critical" : "" %>">
                        <div class="alert-icon">
                            <i class="bi bi-exclamation-triangle-fill"></i>
                        </div>
                        <div>
                            <div class="alert-title">
                                <%= esc(f.getFeedName()) %> is <%= critical ? "critically low" : "running low" %>
                            </div>
                            <div class="alert-text">
                                Only <%= fmt(f.getAvailableQty()) %> <%= esc(f.getUnit()) %> remaining
                                (<%= f.getPercentFull() %>% of capacity). Consider restocking soon.
                            </div>
                        </div>
                    </div>

                <%
                        }
                    }
                    if (!anyAlert) {
                %>

                    <div class="alert-box ok">
                        <div class="alert-icon">
                            <i class="bi bi-check-circle-fill"></i>
                        </div>
                        <div>
                            <div class="alert-title">No low-stock alerts</div>
                            <div class="alert-text">All feed items are at healthy levels.</div>
                        </div>
                    </div>

                <% } %>

            </div>

        </div>


        <!-- CONSUMPTION + SUMMARY -->

        <div class="content-grid">

            <div class="card-box">

                <div class="card-header-custom">
                    <h5>Daily Feed Consumption</h5>
                    <span style="font-size:11px;color:#89958e;">By feed type</span>
                </div>

                <% if (feedList.isEmpty()) { %>

                    <p class="text-muted mb-0" style="font-size:13px;">No consumption records available.</p>

                <% } else {
                       for (FeedStock f : feedList) {
                           String icon = (f.getIconClass() == null || f.getIconClass().trim().isEmpty())
                                   ? "bi-leaf-fill" : f.getIconClass();
                %>

                    <div class="consumption">
                        <div class="consumption-left">
                            <div class="consumption-icon"><i class="bi <%= esc(icon) %>"></i></div>
                            <div>
                                <div class="consumption-name"><%= esc(f.getFeedName()) %></div>
                                <div class="consumption-type">Daily usage</div>
                            </div>
                        </div>
                        <div class="consumption-value"><%= fmt(f.getDailyUsage()) %> <%= esc(f.getUnit()) %></div>
                    </div>

                <%     }
                   } %>

            </div>


            <div class="card-box">

                <div class="card-header-custom">
                    <h5>Feed Summary</h5>
                    <i class="bi bi-info-circle text-muted"></i>
                </div>

                <div class="mb-4">
                    <div class="d-flex justify-content-between mb-2">
                        <span style="font-size:12px;">Daily requirement</span>
                        <strong style="font-size:12px;">
                            <%= dailyRequirement > 0 ? fmt(dailyRequirement) + " kg" : "Not set" %>
                        </strong>
                    </div>
                    <div class="progress">
                        <div class="progress-bar" style="width:<%= dailyRequirement > 0 ? 100 : 0 %>%"></div>
                    </div>
                </div>

                <div class="mb-4">
                    <div class="d-flex justify-content-between mb-2">
                        <span style="font-size:12px;">Daily usage</span>
                        <strong style="font-size:12px;"><%= fmt(dailyConsumption) %> kg</strong>
                    </div>
                    <div class="progress">
                        <div class="progress-bar" style="width:<%= usagePercent %>%"></div>
                    </div>
                </div>

                <div style="background:#f3f8f5;border-radius:10px;padding:15px;">
                    <div style="font-size:11px;color:#77847d;">Estimated remaining stock</div>
                    <div style="font-size:22px;font-weight:600;color:#198754;margin-top:3px;">
                        ~<%= estimatedDays %> Days
                    </div>
                </div>

            </div>

        </div>


        <!-- FEED INVENTORY (update stock) -->

        <div class="table-card" id="feedInventory">

            <div class="card-header-custom">
                <div>
                    <h5>Feed Inventory</h5>
                    <div style="font-size:11px;color:#89958e;margin-top:3px;">
                        Update the available quantity of any feed item
                    </div>
                </div>
            </div>

            <div class="table-responsive">

                <table class="feed-table">

                    <thead>
                        <tr>
                            <th>Feed Type</th>
                            <th>Available</th>
                            <th>Capacity</th>
                            <th>Daily Usage</th>
                            <th>Status</th>
                            <th>Last Updated</th>
                            <th>Update Stock</th>
                        </tr>
                    </thead>

                    <tbody>

                        <% if (feedList.isEmpty()) { %>

                            <tr>
                                <td colspan="7" class="text-center text-muted">
                                    No feed records yet. Use the Add Feed form below.
                                </td>
                            </tr>

                        <% } else {
                               for (FeedStock f : feedList) {
                                   String icon = (f.getIconClass() == null || f.getIconClass().trim().isEmpty())
                                           ? "bi-leaf-fill" : f.getIconClass();
                        %>

                            <tr>
                                <td>
                                    <div class="feed-name">
                                        <div class="feed-icon"><i class="bi <%= esc(icon) %>"></i></div>
                                        <%= esc(f.getFeedName()) %>
                                    </div>
                                </td>
                                <td><%= fmt(f.getAvailableQty()) %> <%= esc(f.getUnit()) %></td>
                                <td><%= fmt(f.getCapacityQty()) %> <%= esc(f.getUnit()) %></td>
                                <td><%= fmt(f.getDailyUsage()) %> <%= esc(f.getUnit()) %></td>
                                <td>
                                    <span class="badge-stock <%= badgeClass(f.getStatus()) %>">
                                        <%= f.getStatus() %>
                                    </span>
                                </td>
                                <td><%= f.getLastUpdated() == null ? "-" : esc(f.getLastUpdated()) %></td>
                                <td>
                                    <form action="<%=request.getContextPath()%>/updateFeedStock"
                                          method="post" class="update-form">
                                        <input type="hidden" name="feedId" value="<%= f.getFeedId() %>">
                                        <input type="number" name="availableQty"
                                               class="form-control form-control-sm"
                                               min="0" step="0.01"
                                               value="<%= f.getAvailableQty() %>" required>
                                        <button type="submit" class="btn-green">Save</button>
                                    </form>
                                </td>
                            </tr>

                        <%     }
                           } %>

                    </tbody>

                </table>

            </div>

        </div>


        <!-- ADD FEED -->

        <div class="table-card" id="addFeedForm">

            <div class="card-header-custom">
                <h5>Add Feed Item</h5>
            </div>

            <form action="<%=request.getContextPath()%>/addFeed" method="post" class="row g-3">

                <div class="col-md-4">
                    <label for="feedName" class="form-label">Feed name</label>
                    <input type="text" id="feedName" name="feedName" class="form-control"
                           placeholder="e.g. Green Fodder" required>
                </div>

                <div class="col-md-4">
                    <label for="iconClass" class="form-label">Feed type</label>
                    <select id="iconClass" name="iconClass" class="form-select">
                        <option value="bi-leaf-fill">Fresh feed</option>
                        <option value="bi-box-fill">Hay / Straw</option>
                        <option value="bi-basket-fill">Concentrate</option>
                        <option value="bi-capsule">Supplement</option>
                        <option value="bi-flower1">Silage</option>
                    </select>
                </div>

                <div class="col-md-4">
                    <label for="unit" class="form-label">Unit</label>
                    <select id="unit" name="unit" class="form-select">
                        <option value="kg" selected>kg</option>
                        <option value="bags">bags</option>
                        <option value="L">litres</option>
                    </select>
                </div>

                <div class="col-md-4">
                    <label for="availableQty" class="form-label">Available quantity</label>
                    <input type="number" id="availableQty" name="availableQty" class="form-control"
                           min="0" step="0.01" required>
                </div>

                <div class="col-md-4">
                    <label for="capacityQty" class="form-label">Storage capacity</label>
                    <input type="number" id="capacityQty" name="capacityQty" class="form-control"
                           min="1" step="0.01" required>
                </div>

                <div class="col-md-4">
                    <label for="dailyUsage" class="form-label">Daily usage</label>
                    <input type="number" id="dailyUsage" name="dailyUsage" class="form-control"
                           min="0" step="0.01" required>
                </div>

                <div class="col-12">
                    <button type="submit" class="btn-green">
                        <i class="bi bi-plus-lg me-1"></i> Add Feed
                    </button>
                </div>

            </form>

        </div>

    </div>

</div>


<!-- ================= SCRIPT ================= -->

<script>

function toggleSidebar() {
    document.getElementById("sidebar").classList.toggle("show");
}

function goTo(sectionId, focusId) {
    var section = document.getElementById(sectionId);
    if (!section) return;

    section.scrollIntoView({ behavior: "smooth", block: "start" });

    if (focusId) {
        setTimeout(function () {
            var field = document.getElementById(focusId);
            if (field) field.focus();
        }, 500);
    }
}

</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>