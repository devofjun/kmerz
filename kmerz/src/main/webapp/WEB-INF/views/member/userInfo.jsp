<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0 user-scale=no">
<meta charset="UTF-8">
<title>회원정보 페이지</title>
<link rel="stylesheet" href="/resources/css/MainPage.css?ver51">
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
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/resources/script/MainPage.js?ver8">
	
</script>
</head>

<body>
	<%@ include file="../include/modal.jsp"%>

	<!-- 상단 메뉴바 -->
	<div>
		<%@ include file="../include/top_menu_bar.jsp"%>
	</div>
	<div class="">
		<img src="/resources/images/default_Profile.png">
	</div>
	<div>
		<input type="file" name="fileName">
	</div>
	
</body>
</html>