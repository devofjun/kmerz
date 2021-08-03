<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head lang="ko">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0 user-scale=no">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>K-Merz The Best Game CommunityList</title>
<link rel="stylesheet" href="/resources/css/MainPage.css?ver<%=System.currentTimeMillis()%>">
<link rel="stylesheet" href="/resources/css/lSidebar.css?v13">
<link rel="stylesheet" href="/resources/css/rSidebar.css?v13">
<link rel="stylesheet" href="/resources/css/header.css?ver6">
<link rel="stylesheet" href="/resources/css/font.css?4">
<link rel="stylesheet" href="/resources/css/margin.css?4">
<link rel="stylesheet" href="/resources/css/slider.css?4">
<link rel="stylesheet" href="/resources/css/icon.css?5">
<link rel="stylesheet" href="/resources/css/transform.css?6">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="/resources/script/MainPage.js?ver<%=System.currentTimeMillis()%>">
	
</script>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div>
					<%@ include file="../include/top_menu_bar.jsp"%>
				</div>
			</div>
		</div>
		<div class="row" style="margin-top: 100px;">
			<div class="col-md-3"></div>
			<div class="col-md-6">
				<div class="row">
					<div class="col-md-11">
						<input type="text" class="form-control" id="communityListSearch" />
					</div>
					<div class="col-md-1">
						<button type="button" class="btn btn-primary">검색</button>
					</div>
				</div>
			</div>
			<div class="col-md-3"></div>
		</div>
		<div class="row" style="margin-top:50px;">
			<div class="col-md-3"></div>
			<div class="col-md-6">
				<table class="table">
					<thead>
						<tr>
							<th>번호</th>
							<th>커뮤니티 목록</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="CommunityVo" items="${CommunityList}">
						<tr>
							<td></td>
							<td><a href="#">${CommunityVo.community_name}</a></td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="col-md-3"></div>
		</div>
	</div>
</body>
</html>