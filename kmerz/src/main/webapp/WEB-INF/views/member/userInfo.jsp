<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/resources/css/MainPage.css?ver51">
<link rel="stylesheet" href="/resources/css/header.css?">
<%@ include file="../include/top_menu_bar.jsp"%>
<div style="margin-top:60px"> <!-- 높이 조절 -->
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
					<button type="button" class="btn btn-secondary">개인정보 변경</button>
					<button type="button" class="btn btn-secondary">프로필 사진 변경</button>
					<button type="button" class="btn btn-secondary">비밀번호 변경</button>
					<button type="button" class="btn btn-secondary">회원 탈퇴</button>
				</div>
				<div style="margin-top:50px">
					<h3>기본 정보 변경</h3>
				</div>
				<hr>
				
			</div>
		</div>
	</div>
</div>
</body>
</html>