<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/resources/css/MainPage.css?ver58">
<link rel="stylesheet" href="/resources/css/lSidebar.css?v11">
<link rel="stylesheet" href="/resources/css/rSidebar.css?v11">
<link rel="stylesheet" href="/resources/css/header.css?ver4">
<link rel="stylesheet" href="/resources/css/font.css?">
<link rel="stylesheet" href="/resources/css/margin.css?">
<link rel="stylesheet" href="/resources/css/slider.css?3">
<link rel="stylesheet" href="/resources/css/icon.css?3">
<link rel="stylesheet" href="/resources/css/transform.css?5">
	<!doctype html>
	<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<title>회원정보 페이지</title>
</head>
<body>
<div>
	<%@ include file="../include/top_menu_bar.jsp"%>
</div>
<!-- 높이 조절 -->
<div style="margin-top: 40px">
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
	<div class="container-fluid">
		<div class="row flex-nowrap">
			<div class="col-md-4"></div>
			<!-- 유저 정보 폼 -->
			<div class="col-md-4" style="margin-top: 50px">
				<div>
					<a href="/m/userInfo" class="btn btn-secondary">개인정보 변경</a> <a
						href="/m/userProfileImagesChangeForm" class="btn btn-secondary">프로필
						사진 변경</a> <a href="/m/userPasswordChangeForm"
						class="btn btn-secondary">비밀번호 변경</a> <a href="/m/userSecessionForm"
						class="btn btn-secondary">회원 탈퇴</a>
				</div>
				<div style="margin-top: 50px">