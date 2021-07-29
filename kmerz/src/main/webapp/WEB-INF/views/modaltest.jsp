<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/MainPage.css?ver24">
<link rel="stylesheet" href="/resources/css/lSidebar.css?v8">
<link rel="stylesheet" href="/resources/css/rSidebar.css?v8">
<link rel="stylesheet" href="/resources/css/header.css?">
<link
	href="https://store.akamai.steamstatic.com/public/css/promo/summer2021_sale.css?v=r8ONinfHtGU6&l=koreana"
	rel="stylesheet" type="text/css">

	
	<style type="text/css">
		/* 모달창의 배경을 만든다 */
		.modal__background{
		  	position: fixed;
		  	top:0;
		  	left: 0;
		  	width:100%;
			height:100%;
		  	background:#000;
		  	opacity:.5;
			filter:alpha(opacity=50);
			z-index:10;
		}
		 
		/* 모달창 영역을 꾸민다 */
		.modal__box{
			position: absolute;
		  	top: calc(50vh - 100px);
		  	left: calc(50vw - 200px);
		  	background-color: white;
		  	display: flex;
		  	justify-content: center;
		  	align-items: center;
		  	border-radius: 10px;
		  	width: 400px;
		  	height: 200px;
		}
	</style>
<title>모달 미리 틀 잡아놓기</title>
</head>
<body>
	<div class="modal__background">
  		<div class="modal__box">
    		모달 테스트
  		</div>
	</div>
	<!-- 포스트 DEFAULT 시작 -->
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
							<a href="#"><ion-icon size="large" name="chatbox-outline"></ion-icon></a> <a
								href="#"><ion-icon size="large" name="bookmark-outline"></ion-icon></a> <a
								href="#"><ion-icon size="large" name="open-outline"></ion-icon></a> <a
								href="#"><ion-icon size="large" name="ellipsis-horizontal-circle-outline"></ion-icon></a>
						</div>
					</div>
					<div class="rightbar">
						<div class="contentTop">
							<div class="postTitle">홍진호 만난 썰 푼다</div>
							<div class="communityAdress">COMMUNITY : 스타크래프트 - 3분전 / 작성자
								: 윤수</div>
						</div>
						<div class="postContent border">
							<p>람쥐썬더</p>
						</div>
					</div>
				</div>
				<!-- 포스트 DEFAULT 끝 -->
</body>
</html>