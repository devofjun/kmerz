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
<script>
$(document).ready(function() {
	$("#btnSearch").click(function() {
		var keyword = $("#txtSearch").val().trim();
		if (keyword == "") {
			alert("검색어를 입력해 주세요");
			return;
		}
		$("#frmPaging > input[name=keyword]").val(keyword);
		$("#frmPaging > input[name=page]").val("1");
		$("#frmPaging").submit();
	});
});
</script>
</head>
<body>

	<form id="frmPaging" action="/c/communityList" method="get">
		<input type="hidden" name="page" value="${pagingDto.page}"/>
		<input type="hidden" name="perPage" value="${pagingDto.perPage}"/>
		<input type="hidden" name="searchType" value="t"/>
		<input type="hidden" name="keyword" value="${pagingDto.keyword}"/>
		<!-- <input type="hidden" name="b_no"/> -->
	</form>

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
					<div class="col-md-12">
						<form class="form-inline" action="#">
							<input class="form-control" type="text"
								id="txtSearch" placeholder="커뮤니티 이름">
							<button class="btn btn-success" type="button" id="btnSearch">찾기</button>
							<a class="btn btn-primary" href="/c/createForm">Community 생성</a>
						</form>
					</div>
				</div>
			</div>
			<div class="col-md-3"></div>
		</div>
		<div class="row" style="margin-top:50px;">
			<div class="col-md-3"></div>
			<div class="col-md-6">
				<table class="table table-striped">
					<thead>
						<tr  style="text-align: center;">
							<th>커뮤니티 목록</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="CommunityVo" items="${CommunityList}">
						<tr>
							<td>
								<a href="/c/${CommunityVo.community_id}">
									${CommunityVo.community_name} 커뮤니티
								</a>
							</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="col-md-3"></div>
		</div>
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6">
				<nav>
					<ul class="pagination justify-content-center">
						<c:if test="${pagingDto.startPage != 1}">
							<li class="page-item"><a class="page-link"
								href="${pagingDto.startPage - 1}">&laquo;</a></li>
						</c:if>
						<c:forEach var="v" begin="${pagingDto.startPage}"
							end="${pagingDto.endPage}">
							<li
								<c:choose>
							<c:when test="${pagingDto.page == v}">
								class="page-item active"
							</c:when>
							<c:otherwise>
								class="page-item"
							</c:otherwise>
						</c:choose>>
								<a class="page-link" href="${v}">${v}</a>
							</li>
						</c:forEach>
						<c:if test="${pagingDto.endPage < pagingDto.totalPage}">
							<li class="page-item"><a class="page-link"
								href="${pagingDto.endPage + 1}">&raquo;</a></li>
						</c:if>
					</ul>
				</nav>
			</div>
			<div class="col-md-3"></div>
		</div>
	</div>
</body>
</html>