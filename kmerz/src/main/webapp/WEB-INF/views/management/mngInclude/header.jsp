<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.84.0">

<link rel="canonical"
	href="https://getbootstrap.com/docs/5.0/examples/dashboard/">
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- JQeury CDN -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- chart.js CDN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.4.1/chart.min.js"></script>

<title>케이머즈 대쉬보드</title>


<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>
<!-- Custom styles for this template -->
<link href="/resources/bootstrap/dashboard.css" rel="stylesheet">

<script>
	$(document).ready(function() {
		// uri 구하기
		// 		console.log("${pageContext.request.requestURI}")
		// 		var uri = "${pageContext.request.requestURI}";
		// 		var uriArray = uri.split("/");
		// uri 구하기 다른 방법
		// 		console.log("${requestScope['javax.servlet.forward.servlet_path']}");
		
		var path = "${requestScope['javax.servlet.forward.servlet_path']}";
		var ulSize = $("#ulMenus > li > a").length;
		console.log("${requestScope['javax.servlet.forward.servlet_path']}");
		console.log($("#ulMenus > li > a").eq(0).attr("href"));
		for (var i = 0; i < ulSize; i++) {
			var href = $("#ulMenus > li > a").eq(i).attr("href");
			if(path == "/admin"){
				$("#ulMenus > li > a").eq(0).addClass("active");
			}
			if(path == href) {
				$("#ulMenus > li > a").eq(i).addClass("active");
			}
		}
	});
</script>

</head>
<body>

	<header
		class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
		<a class="navbar-brand col-md-3 col-lg-2 me-0 px-3" href="/admin">Kmerz</a>
		<button class="navbar-toggler position-absolute d-md-none collapsed"
			type="button" data-bs-toggle="collapse" data-bs-target="#sidebarMenu"
			aria-controls="sidebarMenu" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<!-- 검색 -->
		<input class="form-control form-control-dark w-100" type="text"
			placeholder="Search" aria-label="Search">
		<!-- 프로필 -->
		<div class="ms-auto">
			<div class="ms-4 me-1 flex-shrink-0 dropdown">
				<a href="#"
					class="d-block link-dark text-decoration-none dropdown-toggle"
					id="dropdownUser2" data-bs-toggle="dropdown" aria-expanded="false">
					<img src="https://github.com/mdo.png" alt="mdo" width="32"
					height="32" class="rounded-circle">
				</a>
				<ul class="dropdown-menu text-small shadow"
					aria-labelledby="dropdownUser2"
					style="position: absolute; inset: 0px auto auto 0px; margin: 0px; transform: translate(-109px, 34px);"
					data-popper-placement="bottom-end">
					<li><a class="dropdown-item" href="#">New project...</a></li>
					<li><a class="dropdown-item" href="#">Settings</a></li>
					<li><a class="dropdown-item" href="#">Profile</a></li>
					<li><hr class="dropdown-divider"></li>
					<li><a class="dropdown-item" href="/admin/logoutRun">Sign
							out</a></li>
				</ul>
			</div>
		</div>

	</header>

	<div class="container-fluid">
		<div class="row">
			<nav id="sidebarMenu"
				class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
				<div class="position-sticky pt-3">
					<ul id="ulMenus" class="nav flex-column">
						<li class="nav-item"><a class="nav-link"
							href="/admin/dashBoard"> <span data-feather="home"></span>
								Dashboard
						</a></li>
						<li class="nav-item"><a class="nav-link" title="고객 관리"
							href="/admin/customers"> <span data-feather="users"></span>
								Customers
						</a></li>
						<li class="nav-item"><a class="nav-link" title="컨텐츠 관리"
							href="/admin/contents"> <span data-feather="layers"></span>
								Contents
						</a></li>
						<li class="nav-item"><a class="nav-link" title="고객 주문"
							href="/admin/orders"> <span data-feather="file"></span>
								Orders
						</a></li>
						<li class="nav-item"><a class="nav-link" title="상품 관리"
							href="/admin/products"> <span data-feather="shopping-cart"></span>
								Products
						</a></li>
						<li class="nav-item"><a class="nav-link" title="보고서?"
							href="/admin/reports"> <span data-feather="bar-chart-2"></span>
								Reports
						</a></li>
					</ul>

					<h6
						class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
						<span>Saved Memo</span> <a class="link-secondary" href="#"
							aria-label="Add a new report"> <span
							data-feather="plus-circle"></span>
						</a>
					</h6>
					<ul class="nav flex-column mb-2">
						<li class="nav-item"><a class="nav-link" href="#"> <span
								data-feather="file-text"></span> Current month
						</a></li>
						<li class="nav-item"><a class="nav-link" href="#"> <span
								data-feather="file-text"></span> Last quarter
						</a></li>
						<li class="nav-item"><a class="nav-link" href="#"> <span
								data-feather="file-text"></span> Social engagement
						</a></li>
						<li class="nav-item"><a class="nav-link" href="#"> <span
								data-feather="file-text"></span> Year-end sale
						</a></li>
					</ul>
				</div>
			</nav>