<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Dashboard | Dairy Farm Management</title>

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

<!-- Chart.js -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.4/dist/chart.umd.min.js"></script>

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

.topbar h4 {
	font-weight: 600;
	margin: 0;
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
	margin-bottom: 24px;
}

.page-heading h2 {
	font-weight: 700;
	color: #1f3b2d;
}

.page-heading p {
	color: #718078;
	font-size: 14px;
}

/* ================= STAT CARDS ================= */
.stat-card {
	background: #ffffff;
	border-radius: 15px;
	padding: 24px;
	box-shadow: 0 8px 25px rgba(0, 0, 0, 0.05);
	height: 100%;
	display: flex;
	align-items: center;
	gap: 18px;
}

.stat-icon {
	width: 56px;
	height: 56px;
	border-radius: 12px;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 26px;
	flex-shrink: 0;
}

.stat-icon.green {
	background: #e1f3e9;
	color: #198754;
}

.stat-icon.blue {
	background: #e3f0fc;
	color: #0d6efd;
}

.stat-icon.orange {
	background: #fdecdc;
	color: #fd7e14;
}

.stat-icon.red {
	background: #fbe3e5;
	color: #dc3545;
}

.stat-info h3 {
	font-size: 24px;
	font-weight: 700;
	margin-bottom: 2px;
}

.stat-info p {
	color: #718078;
	font-size: 13px;
	margin-bottom: 4px;
}

.stat-trend {
	font-size: 12px;
	font-weight: 600;
}

.stat-trend.up {
	color: #198754;
}

.stat-trend.down {
	color: #dc3545;
}

/* ================= PANELS ================= */
.panel {
	background: #ffffff;
	border-radius: 15px;
	padding: 24px;
	box-shadow: 0 8px 25px rgba(0, 0, 0, 0.05);
	height: 100%;
}

.panel-header {
	display: flex;
	align-items: center;
	justify-content: space-between;
	margin-bottom: 20px;
}

.panel-header h5 {
	font-weight: 600;
	margin: 0;
}

.panel-header a {
	font-size: 13px;
	color: #198754;
	text-decoration: none;
	font-weight: 500;
}

/* ================= TABLE ================= */
.table-custom thead th {
	color: #718078;
	font-size: 12px;
	text-transform: uppercase;
	border-bottom: 1px solid #eef2ef;
	font-weight: 600;
	padding-bottom: 12px;
}

.table-custom tbody td {
	padding: 14px 10px;
	border-bottom: 1px solid #f2f5f3;
	font-size: 14px;
	vertical-align: middle;
}

.status-pill {
	padding: 5px 12px;
	border-radius: 20px;
	font-size: 12px;
	font-weight: 600;
}

.status-pill.healthy {
	background: #e1f3e9;
	color: #198754;
}

.status-pill.watch {
	background: #fdecdc;
	color: #fd7e14;
}

.status-pill.alert {
	background: #fbe3e5;
	color: #dc3545;
}

/* ================= QUICK ACTIONS ================= */
.quick-action {
	background: #f8fbf9;
	border: 1px solid #e5eee8;
	border-radius: 12px;
	padding: 16px;
	text-align: center;
	text-decoration: none;
	color: #26352d;
	display: block;
	transition: 0.25s;
}

.quick-action:hover {
	background: #e1f3e9;
	color: #198754;
	transform: translateY(-3px);
}

.quick-action i {
	font-size: 24px;
	color: #198754;
	margin-bottom: 8px;
	display: block;
}

.quick-action span {
	font-size: 13px;
	font-weight: 500;
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
}
#aiChatToggle {
	position: fixed;
	bottom: 25px;
	right: 25px;
	width: 58px;
	height: 58px;
	background: #198754;
	color: white;
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 24px;
	cursor: pointer;
	box-shadow: 0 8px 20px rgba(0,0,0,0.2);
	z-index: 1050;
}

#aiChatBox {
	position: fixed;
	bottom: 95px;
	right: 25px;
	width: 320px;
	height: 420px;
	background: white;
	border-radius: 16px;
	box-shadow: 0 15px 40px rgba(0,0,0,0.15);
	display: none;
	flex-direction: column;
	overflow: hidden;
	z-index: 1050;
}

.ai-chat-header {
	background: #198754;
	color: white;
	padding: 14px 16px;
	font-weight: 600;
}

.ai-chat-messages {
	flex: 1;
	padding: 14px;
	overflow-y: auto;
	font-size: 13.5px;
}

.ai-chat-messages .msg {
	margin-bottom: 10px;
	padding: 8px 12px;
	border-radius: 10px;
	max-width: 85%;
}

.ai-chat-messages .user {
	background: #e1f3e9;
	margin-left: auto;
}

.ai-chat-messages .bot {
	background: #f6f9f7;
}

.ai-chat-input {
	display: flex;
	border-top: 1px solid #eef2ef;
}

.ai-chat-input input {
	flex: 1;
	border: none;
	padding: 12px;
	outline: none;
	font-size: 13.5px;
}

.ai-chat-input button {
	background: #198754;
	color: white;
	border: none;
	padding: 0 16px;
}
</style>

</head>

<body>

	<%
	// Dashboard is a protected page - send guests to login
	if (session.getAttribute("user") == null) {
		response.sendRedirect("login");
		return;
	}
	String userName = (String) session.getAttribute("user");
	%>

	<div class="dashboard-wrapper">

		<!-- ================= SIDEBAR ================= -->
		<aside class="sidebar" id="sidebar">

			<a href="index" class="logo"> <i class="bi bi-cow"></i> DairyCare
			</a>

			<nav class="sidebar-nav nav flex-column">
				<a href="dashboard" class="nav-link active"> <i class="bi bi-grid-1x2-fill"></i> Dashboard
				</a>
				<a href="health" class="nav-link"> <i class="bi bi-heart-pulse"></i> Livestock
				</a>
				<a href="milk" class="nav-link"> <i class="bi bi-droplet"></i> Milk Production
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
					<h2>Welcome back, <%= userName %> 👋</h2>
					<p>Here's what's happening on your farm today.</p>
				</div>

				<!-- STAT CARDS -->
<div class="row g-4 mb-4">
	    <div class="col-12 col-md-4">
        <div class="stat-card">
            <div class="stat-icon green"><i class="bi bi-cow"></i></div>
            <div class="stat-info">
                <h3><%= request.getAttribute("totalCattle") %></h3>
                <p>Total Cattle</p>
                <span class="stat-trend up">
                    <i class="bi bi-arrow-up-short"></i>Live count
                </span>
            </div>
        </div>
    </div>

    <div class="col-12 col-md-4">
        <div class="stat-card">
            <div class="stat-icon blue"><i class="bi bi-droplet-fill"></i></div>
            <div class="stat-info">
                <h3><%= request.getAttribute("todaysMilk") %> L</h3>
                <p>Today's Milk Yield</p>
                <span class="stat-trend up">
                    <i class="bi bi-arrow-up-short"></i>Live data
                </span>
            </div>
        </div>
    </div>

    <div class="col-12 col-md-4">
        <div class="stat-card">
            <div class="stat-icon orange"><i class="bi bi-basket2-fill"></i></div>
            <div class="stat-info">
                <h3><%= request.getAttribute("feedStock") %></h3>
                <p>Feed Stock (bags)</p>
                <span class="stat-trend up">
                    <i class="bi bi-arrow-up-short"></i>Live data
                </span>
            </div>
        </div>
    </div>
	<!--<div class="col-md-6 col-xl-3">
		<div class="stat-card">
			<div class="stat-icon red"><i class="bi bi-heart-pulse-fill"></i></div>
			<div class="stat-info">
				<h3><%= request.getAttribute("healthAlerts") %></h3>
				<p>Health Alerts</p>
				<span class="stat-trend down"><i class="bi bi-exclamation-circle"></i>Needs attention</span>
			</div>
		</div>
	</div>-->
</div>

				<!-- CHART + QUICK ACTIONS -->
				<div class="row g-4 mb-4">
					<div class="col-lg-8">
						<div class="panel">
							<div class="panel-header">
								<h5>Milk Production (Last 7 Days)</h5>
								<a href="report">View Reports</a>
							</div>
							<canvas id="milkChart" height="110"></canvas>
						</div>
					</div>
					<div class="col-lg-4">
						<div class="panel">
							<div class="panel-header">
								<h5>Quick Actions</h5>
							</div>
							<div class="row g-3">
								<div class="col-6">
									<a href="milk" class="quick-action"> <i class="bi bi-plus-circle"></i> <span>Add Milk Entry</span>
									</a>
								</div>
								<div class="col-6">
									<a href="health" class="quick-action"> <i class="bi bi-clipboard2-pulse"></i> <span>Health Check</span>
									</a>
								</div>
								<div class="col-6">
									<a href="feed" class="quick-action"> <i class="bi bi-basket3"></i> <span>Order Feed</span>
									</a>
								</div>
								<div class="col-6">
									<a href="report" class="quick-action"> <i class="bi bi-file-earmark-bar-graph"></i> <span>Generate Report</span>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- LIVESTOCK TABLE -->
				<!--<div class="row g-4">
					<div class="col-12">
						<div class="panel">
							<div class="panel-header">
								<h5>Livestock Health Overview</h5>
								<a href="health">View All</a>
							</div>
							<div class="table-responsive">
								<table class="table table-custom mb-0">
									<thead>
										<tr>
											<th>Tag ID</th>
											<th>Name</th>
											<th>Breed</th>
											<th>Last Checkup</th>
											<th>Milk Yield (L/day)</th>
											<th>Status</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>#C-102</td>
											<td>Ganga</td>
											<td>Gir</td>
											<td>18 Sep 2026</td>
											<td>14.2</td>
											<td><span class="status-pill healthy">Healthy</span></td>
										</tr>
										<tr>
											<td>#C-115</td>
											<td>Laxmi</td>
											<td>Sahiwal</td>
											<td>15 Sep 2026</td>
											<td>11.8</td>
											<td><span class="status-pill watch">Watch</span></td>
										</tr>
										<tr>
											<td>#C-098</td>
											<td>Kaveri</td>
											<td>HF Cross</td>
											<td>10 Sep 2026</td>
											<td>9.4</td>
											<td><span class="status-pill alert">Needs Attention</span></td>
										</tr>
										<tr>
											<td>#C-121</td>
											<td>Radha</td>
											<td>Jersey</td>
											<td>20 Sep 2026</td>
											<td>13.6</td>
											<td><span class="status-pill healthy">Healthy</span></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>-->

			</div>

		</div>

	</div>
	<!-- ================= AI ASSISTANT WIDGET ================= -->
<div id="aiChatToggle" onclick="toggleChat()">
	<i class="bi bi-robot"></i>
</div>

<div id="aiChatBox">
	<div class="ai-chat-header">
		<i class="bi bi-robot me-2"></i> Farm Assistant
		<i class="bi bi-x-lg" style="float:right; cursor:pointer;" onclick="toggleChat()"></i>
	</div>
	<div id="aiChatMessages" class="ai-chat-messages"></div>
	<div class="ai-chat-input">
		<input type="text" id="aiUserInput" placeholder="Ask about your farm..." onkeypress="if(event.key==='Enter') sendAiMessage()">
		<button onclick="sendAiMessage()"><i class="bi bi-send-fill"></i></button>
	</div>
</div>

	<!-- Bootstrap JS -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

	<script>
	 const chartUrl = '${pageContext.request.contextPath}/milkChartData';
	    const chartCanvas = document.getElementById('milkChart');

	    const milkChart = new Chart(chartCanvas, {
	        type: 'bar',
	        data: {
	            labels: [],
	            datasets: [{
	                label: 'Milk Yield (L)',
	                data: [],
	                backgroundColor: '#198754',
	                borderRadius: 6,
	                maxBarThickness: 36
	            }]
	        },
	        options: {
	            responsive: true,
	            plugins: {
	                legend: { display: false }
	            },
	            scales: {
	                y: { beginAtZero: true, grid: { color: '#f0f3f1' } },
	                x: { grid: { display: false } }
	            }
	        }
	    });

	    async function refreshMilkChart() {
	        try {
	            const response = await fetch(chartUrl);

	            if (!response.ok) {
	                throw new Error(`Request failed: ${response.status}`);
	            }

	            const result = await response.json();
	            milkChart.data.labels = result.labels;
	            milkChart.data.datasets[0].data = result.data;
	            milkChart.update();
	        } catch (error) {
	            console.error('Could not refresh milk chart:', error);
	        }
	    }

	    refreshMilkChart();                    // Load when the page opens
	    setInterval(refreshMilkChart, 30000); // Refresh every 30 seconds
	    
	    
		function toggleChat() {
			const box = document.getElementById('aiChatBox');
			box.style.display = box.style.display === 'flex' ? 'none' : 'flex';
		}

		function sendAiMessage() {

		    const input = document.getElementById('aiUserInput');
		    const question = input.value.trim();

		    if (!question) {
		        return;
		    }

		    const messages = document.getElementById('aiChatMessages');

		    // Show user question
		    messages.innerHTML +=
		        '<div class="msg user">' + question + '</div>';

		    input.value = '';

		    // Show thinking message
		    const loadingId = 'ai-loading-' + Date.now();

		    messages.innerHTML +=
		        '<div class="msg bot" id="' + loadingId + '">Thinking...</div>';

		    messages.scrollTop = messages.scrollHeight;

		    const url = '${pageContext.request.contextPath}/AiAssistant';

		    console.log("Calling:", url);
		    console.log("Question:", question);

		    fetch(url, {
		        method: 'POST',
		        headers: {
		            'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'
		        },
		        body: 'question=' + encodeURIComponent(question)
		    })
		    .then(function(response) {

		        console.log("HTTP STATUS:", response.status);
		        console.log("CONTENT TYPE:", response.headers.get('content-type'));

		        if (!response.ok) {
		            throw new Error("HTTP error: " + response.status);
		        }

		        return response.text();
		    })
		    .then(function(text) {

		        console.log("RAW SERVER RESPONSE:", text);

		        let data;

		        try {
		            data = JSON.parse(text);
		        } catch (error) {
		            throw new Error("Server did not return valid JSON: " + text);
		        }

		        console.log("PARSED RESPONSE:", data);

		        const loadingMessage =
		            document.getElementById(loadingId);

		        if (data.reply) {
		            loadingMessage.innerText = data.reply;
		        } else {
		            loadingMessage.innerText =
		                "No reply received from server.";
		        }

		        messages.scrollTop = messages.scrollHeight;
		    })
		    .catch(function(error) {

		        console.error("AI ASSISTANT ERROR:", error);

		        const loadingMessage =
		            document.getElementById(loadingId);

		        loadingMessage.innerText =
		            "Error: " + error.message;

		        messages.scrollTop = messages.scrollHeight;
		    });
		}
	</script>

</body>
</html>