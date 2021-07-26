<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="./mngInclude/header.jsp"%>
<script>
	$(document).ready(function() {
		//배너/사이드바 설정 버튼
		$("#btnBSSetting").click(function() {

			location.href = "/admin/bsSetting.do";
		});

		// 게시글 설정 버튼
		$("#btnPostSetting").click(function() {

			location.href = "/admin/postSetting.do";
		});
	});
</script>


<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
<div
	class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
	<h1 class="h2">컨텐츠 관리</h1>
	<div class="btn-toolbar mb-2 mb-md-0">
		<div class="btn-group me-2">
			<button id="btnBSSetting" type="button"
				class="btn btn-sm btn-outline-secondary">배너/사이드바</button>
			<button id="btnPostSetting" type="button"
				class="btn btn-sm btn-outline-secondary active">게시글</button>
		</div>
		<button id="btnSave" type="button"
			class="btn btn-sm btn-outline-success"
			data-url="/admin/contents/setBanner">적용하기</button>
	</div>
</div>

<div>


	<div id="userManagement" class="row">
		<div class="col-7">

			<!-- 검색바 -->
			<div class="input-group mb-1 ">
				<button id="btnSearchType"
					class="btn btn-outline-secondary dropdown-toggle" type="button"
					data-bs-toggle="dropdown" aria-expanded="false"
					data-searchType="/admin/searchName">제목</button>
				<ul id="ulSearchType" class="dropdown-menu">
					<li><a class="dropdown-item" href="/admin/searchId">제목</a></li>
					<li><a class="dropdown-item" href="/admin/searchName">작성자</a></li>
				</ul>
				<input type="text" class="form-control"
					aria-label="Text input with dropdown button">
				<button class="btn btn-outline-secondary" type="button"
					id="btnSearch">검색</button>
			</div>

			<!-- 유저 테이블 -->
			<table class="table table-hover">
				<thead>
					<tr>
						<th>글번호</th>
						<th>작성일</th>
						<th>커뮤니티/카테고리</th>
						<th>제목</th>
						<th>작성자</th>
						<th>조회수</th>
						<th>추천수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="postsVo"  items="${postList }">
					<tr> 
						<td>${postsVo.post_no }</td>
						<td>${postsVo.post_lastupdate }</td>
						<td>${postsVo.community_id }/${postVo.category_no }</td>
						<td>${postsVo.post_title }</td>
						<td>${postsVo.user_no }</td>
						<td>${postsVo.post_readcount }</td>
						<td>${postsVo.post_recommand }</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>

			<!-- 페이징 -->
			<nav>
				<ul class="pagination justify-content-center">
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
					</a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Next"> <span aria-hidden="true">&raquo;</span>
					</a></li>
				</ul>
			</nav>
		</div>

		<!-- 유저 정보 카드 -->
		<div id="cardUserInfo" class="col-5" style="display: inline">
			<div class="card text-center">
				<div class="card-header">
					<span>글번호</span>
				</div>
				<ul class="list-group list-group-flush">
					<li class="list-group-item">An item</li>
					<li class="list-group-item">A second item</li>
					<li class="list-group-item">A third item</li>
				</ul>
				<div class="card-body">
					<h5 class="card-title">글제목</h5>
					<p class="card-text">글내용~~~</p>
					<a href="#" class="btn btn-primary">Go somewhere</a>
				</div>
				<div class="card-footer text-muted">2 days ago</div>
			</div>
		</div>
	</div>


</div>

</main>
<%@ include file="./mngInclude/footer.jsp"%>