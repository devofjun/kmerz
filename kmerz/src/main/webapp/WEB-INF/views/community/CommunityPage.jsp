<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <%@ page session="false"%> --%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>K-Merz The Best Game Community</title>
<link rel="stylesheet" href="/resources/css/MainPage.css?ver49">
<link rel="stylesheet" href="/resources/css/lSidebar.css?v11">
<link rel="stylesheet" href="/resources/css/rSidebar.css?v11">
<link rel="stylesheet" href="/resources/css/header.css?">
<link rel="stylesheet" href="/resources/css/font.css?">
<link rel="stylesheet" href="/resources/css/margin.css?">
<link rel="stylesheet" href="/resources/css/slider.css?3">
<link rel="stylesheet" href="/resources/css/icon.css?3">
<link rel="stylesheet" href="/resources/css/transform.css?4">
<link
	href="https://store.akamai.steamstatic.com/public/css/promo/summer2021_sale.css?v=r8ONinfHtGU6&l=koreana"
	rel="stylesheet" type="text/css">
<script type="module"
	src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule
	src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
<script src="/resources/script/MainPage.js?ver4"></script>
</head>

<body>
<div class="modal-section">

</div>
	<!-- 커뮤니티 상단 메뉴바 -->
	<%@ include file="../include/community_top_menu_bar.jsp"%>
	<div class="communitybanner">
		<img src="/resources/images/background_Setting.png" />
	</div>
	<section class="postSection">
		<div class="posts">
			<!-- 왼쪽 사이드 바 -->
			<%@ include file="../include/community_lSidebar.jsp"%>
			<div class="postList">
				<div class="sticky border">
					<!-- 게시글 정렬 sticky bar -->
					<div>
						<%@ include file="../include/sort_bar.jsp"%>
					</div>
					<!-- 게시글 작성 sticky bar  -->
					<div>
						<%@ include file="../include/posting_bar.jsp"%>
					</div>
				</div>


				<!-- 게시글 양식 -->
				<%@ include file="../include/community_post.jsp"%>
			</div>
			<!-- 오른쪽 사이드 바 -->
			<%@ include file="../include/rSidebar.jsp"%>
		</div>
	</section>
</body>
</html>
