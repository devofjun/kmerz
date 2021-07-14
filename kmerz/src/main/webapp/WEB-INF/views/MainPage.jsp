<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=0.8 user-scale=no">
<meta charset="UTF-8">
<title>K-Merz The Best Game Community</title>
<link rel="stylesheet" href="/resources/css/MainPage.css?ver40">
<link rel="stylesheet" href="/resources/css/lSidebar.css?v10">
<link rel="stylesheet" href="/resources/css/rSidebar.css?v10">
<link rel="stylesheet" href="/resources/css/header.css?">
<link rel="stylesheet" href="/resources/css/font.css?">
<link rel="stylesheet" href="/resources/css/margin.css?">
<link rel="stylesheet" href="/resources/css/slider.css?2">
<link
	href="https://store.akamai.steamstatic.com/public/css/promo/summer2021_sale.css?v=r8ONinfHtGU6&l=koreana"
	rel="stylesheet" type="text/css">
<script type="module"
	src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule
	src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</head>

<body>
	<%@ include file="./include/modal.jsp"%>
	<script>
var modal = document.getElementById("myModal");
console.log(modal);
function openModal() {
  modal.style.display = "block";
}
function closeModal() {
  modal.style.display = "none";
}
window.onclick = function(event) {
	  if (event.target == modal) {
	    modal.style.display = "none";
	  }
}
</script>

	<header>
		<a href="#" class="logo">LOGO</a>
		<div class="toggle"></div>
		<ul>
			<li><a href="#">Home</a></li>
			<li><a href="#">About</a></li>
			<li><a href="#">Product</a></li>
			<li><a href="#">Contact</a></li>
			<li><a href="/c/createForm">Community</a></li>
		</ul>
	</header>
	<section class="banner">
		<!-- <div class="tenor-gif-embed" data-postid="18605633" data-share-method="host" data-width="100%" data-aspect-ratio="1.810909090909091"><a href="https://tenor.com/view/%eb%ac%b8%ec%9e%ac%ec%9d%b8-%eb%aa%85%ec%99%95-moon-%ec%9e%ac%ec%9d%b8-%ec%a3%84%ec%9d%b8-gif-18605633">문재인 명왕 GIF</a> from <a href="https://tenor.com/search/%EB%AC%B8%EC%9E%AC%EC%9D%B8-gifs">문재인 GIFs</a></div><script type="text/javascript" async src="https://tenor.com/embed.js"></script> -->
		<div class="slider" id="slider">
			<figure>
				<div class="align-center"><img src="/resources/images/background_Setting.png"></div>
				<div class="align-center"><img src="/resources/images/default_image.jpg"></div>
				<div class="align-center"><img src="/resources/images/IMG_0013.jpg"></div>
				<div class="align-center"><img src="/resources/images/squirrel.png"></div>
			</figure>
		</div>
	</section>
	<section class="postSection">
		<div class="posts">
			<%@ include file="./include/lSidebar.jsp"%>
			<div class="postList">
				<div class="sticky">
					<div class="stickyHeader">
						<ul>
							<li class="bd"><a href="#"><ion-icon size="large"
										name="rocket-outline"></ion-icon><span> BEST</span></a></li>
							<li class="bd"><a href="#"><ion-icon size="large"
										name="flame-outline"></ion-icon><span> HOT</span></a></li>
							<li class="bd"><a href="#"><ion-icon size="large"
										name="flag-outline"></ion-icon><span> NEW</span></a></li>
							<li class="bd"><a href="#"><ion-icon size="large"
										name="podium-outline"></ion-icon><span> TOP</span></a></li>
							<li class="bd"><a href="#"><ion-icon size="large"
										name="trending-up-outline"></ion-icon><span> RISING</span></a></li>
							<li class="bd"><a href="#"><ion-icon size="large"
										name="ellipsis-horizontal-outline"></ion-icon></a></li>
						</ul>
					</div>
					<div class="searchBar border">
						<div class="inputSection">
							<div class="PostingTitleDiv">
								<input class="PostingTitle" type="text" placeholder="Title...">
							</div>
							<input class="PostingContent" type="text"
								placeholder="Post Content...">
						</div>
						<div class="inputSelection">
							<ul class="border">
								<li class="bd"><ion-icon size="large"
										name="caret-down-outline"></ion-icon><span>COMMUNITY</span></li>
								<li class="bd"><ion-icon size="large"
										name="caret-down-outline"></ion-icon><span>CATEGORY</span></li>
								<li class="bd"><ion-icon size="large"
										name="caret-down-outline"></ion-icon><span>POST TYPE</span></li>
								<li class="bd"><ion-icon size="large"
										name="add-circle-outline"></ion-icon><span>POSTING
										DETAIL</span></li>
								<li class="bd"><ion-icon size="large"
										name="checkmark-circle-outline"></ion-icon><span>POST</span></li>
							</ul>
						</div>
					</div>
				</div>
				<%
					session = request.getSession();
				%>
				<script>
					var session = '<%out.print(session.getAttribute("test"));%>	';
					console.log(session);
					function posttoggle() {
						var postBtn = document.getElementById("post-toggleBtn");

						postBtn.click();
					};
				</script>
				<%@ include file="./include/post.jsp"%>
				<%@ include file="./include/post.jsp"%>
				<%@ include file="./include/post.jsp"%>
				<%@ include file="./include/post.jsp"%>
				<%@ include file="./include/post.jsp"%>
				<%@ include file="./include/post.jsp"%>
				<%@ include file="./include/post.jsp"%>
			</div>
			<%@ include file="./include/rSidebar.jsp"%>
		</div>
	</section>
</body>
</html>
