<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <%@ page session="false"%> --%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>K-Merz The Best Game Community</title>
<link rel="stylesheet" href="/resources/css/MainPage.css?ver36">
<link rel="stylesheet" href="/resources/css/lSidebar.css?v8">
<link rel="stylesheet" href="/resources/css/rSidebar.css?v8">
<link rel="stylesheet" href="/resources/css/header.css?">
<link
	href="https://store.akamai.steamstatic.com/public/css/promo/summer2021_sale.css?v=r8ONinfHtGU6&l=koreana"
	rel="stylesheet" type="text/css">
<script type="module"
	src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule
	src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</head>

<body>
<%@ include file="../include/modal.jsp"%>
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
$(document).ready(function(){
	console.log("test:${loginVo}");
});
</script>
	<header>
		<a href="/" class="logo">LOGO</a>
		<div class="toggle"></div>
		<ul>
			<li><a href="/">Home</a></li>
			<li><a href="#">About</a></li>
			<li><a href="#">Product</a></li>
			<li><a href="#">Contact</a></li>
			<li><a href="/c/createForm">Community</a></li>
			<li><a href="/c/createCategoryForm">Category</a></li>
		</ul>
	</header>
	<div class="communitybanner">
		<img src="/resources/images/background_Setting.png" />
	</div>
	<section class="postSection">
		<div class="posts">
			<div class="lSidebar">
				<div class="communityList border sticky">
					<div class="commHeader hr">
					<a><img src="/resources/images/starcraft_small.jpg"><span>카테고리 리스트</span></a></div>
					<ul>
					<c:forEach var="CategoryVo" items="${categoryList}">
						<li><a href="#"><span>${CategoryVo.category_name}</span></a></li>
					</c:forEach>
					</ul>
				</div>
			</div>
			<div class="postList">
				<div class="sticky">
					<div class="stickyHeader">
						<ul>
							<li class="bd"><a href="#"><ion-icon size="large" name="rocket-outline" ></ion-icon><span> BEST</span></a></li>
							<li class="bd"><a href="#"><ion-icon size="large" name="flame-outline"></ion-icon><span> HOT</span></a></li>
							<li class="bd"><a href="#"><ion-icon size="large" name="flag-outline"></ion-icon><span> NEW</span></a></li>
							<li class="bd"><a href="#"><ion-icon size="large" name="podium-outline"></ion-icon><span> TOP</span></a></li>
							<li class="bd"><a href="#"><ion-icon size="large" name="trending-up-outline"></ion-icon><span> RISING</span></a></li>
							<li class="bd"><a href="#"><ion-icon size="large" name="ellipsis-horizontal-outline"></ion-icon></a></li>
						</ul>
					</div>
					<div class="newPostBar border">
						<div class="inputSection">
							<div class="PostingTitleDiv">
								<input class="PostingTitle" type="text" placeholder="Title...">
							</div> 
							<input class="PostingContent" type="text" placeholder="Post Content...">
						</div>
						<div class="inputSelection">
							<ul class="border">
								<li class="bd"><ion-icon size="large" name="caret-down-outline"></ion-icon><span>COMMUNITY</span></li>
								<li class="bd"><ion-icon size="large" name="caret-down-outline"></ion-icon><span>CATEGORY</span></li>
								<li class="bd"><ion-icon size="large" name="caret-down-outline"></ion-icon><span>POST TYPE</span></li>
								<li class="bd"><ion-icon size="large" name="add-circle-outline"></ion-icon><span>POSTING DETAIL</span></li>
								<li class="bd"><ion-icon size="large" name="checkmark-circle-outline"></ion-icon><span>POST</span></li>
							</ul>
						</div>
					</div>
				</div>
				
				<!-- 포스트 DEFAULT 시작 -->
				<c:forEach var="PostsVo" items="${postList}">
					<input type="checkbox" id="toggleBtn" style="display:none">
				<div class="post border">
					<div class="leftbar">
						<div class="like">
							<a href="#"><ion-icon size="large" name="caret-up-circle-outline"></ion-icon></a>
						</div>
							<span>0</span> 
						<div class="like">
							<a href="#"><ion-icon size="large" name="caret-down-circle-outline"></ion-icon></a>
						</div>
						<div class="BottmNavBar">
							<div class="toggleNav">
								<a href="#"><ion-icon size="large" name="chatbox-outline"></ion-icon></a> 
							</div>
							<div class="toggleNav">
								<a	href="#"><ion-icon size="large" name="bookmark-outline"></ion-icon></a>
							</div>
							<div class="toggleNav">
								 <a href="#"><ion-icon size="large" name="open-outline"></ion-icon></a> 
							 </div>
							 <div>
							 	<a href="#"><ion-icon size="large" name="ellipsis-horizontal-circle-outline"></ion-icon></a>
							</div>
						</div>
					</div>
					<div class="rightbar">
						<div class="contentTop">
							<div class="postTitle" onclick="openModal()">${PostsVo.post_title}</div>
							<div class="communityAdress"><a href="#"><img src="/resources/images/starcraft_small.jpg"><span>${PostsVo.community_name}</span></a><span> - 3분전 / 작성자
								: </span><a href="#"><img src="/resources/images/starcraft_small.jpg">${PostsVo.user_id}</a>
							</div>
						</div>
						<div class="postContent border" onclick="openModal()">
							<p>${PostsVo.post_content}</p>
						</div>
						
						
						<div class="postDown">
							<label for="toggleBtn" class="labelBtn" onclick="">
								<ion-icon name="chevron-up-outline"></ion-icon></label>
						</div>
						
					</div>
				</div>
				</c:forEach>
				<!-- 포스트 DEFAULT 끝 -->
			</div>
			<%@ include file="../include/rSidebar.jsp"%>
		</div>
	</section>
</body>
</html>
