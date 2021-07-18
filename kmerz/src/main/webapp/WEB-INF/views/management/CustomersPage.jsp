<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./mngInclude/header.jsp"%>
<script>
$(document).ready(function() {
	$("#btnUser").click(function() {

	});
	$(".userInfo").mouseenter(function(){
		//bg-primary text-white
		$(this).addClass("bg-primary text-white");
	});
	$(".userInfo").mouseleave(function() {
		$(this).removeClass("bg-primary text-white");
	})
});
</script>
<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
<div
	class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
	<h1 class="h2">고객 관리</h1>
	<div class="btn-toolbar mb-2 mb-md-0">
		<div class="btn-group me-2">
			<button id="btnUser" type="button"
				class="btn btn-sm btn-outline-secondary">Users</button>
			<button id="btnNEW" type="button"
				class="btn btn-sm btn-outline-secondary">NEW</button>
		</div>
	</div>
</div>

<div id="userManagement" class="row">
	<div class="col-8">
		<div class="input-group mb-1 ">
			<button class="btn btn-outline-secondary dropdown-toggle"
				type="button" data-bs-toggle="dropdown" aria-expanded="false">이름</button>
			<ul class="dropdown-menu">
				<li><a class="dropdown-item" href="#">ID</a></li>
				<li><a class="dropdown-item" href="#">이름</a></li>
			</ul>
			<input type="text" class="form-control"
				aria-label="Text input with dropdown button">
		</div>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>최근 접속</th>
					<th>유저ID</th>
					<th>유저이름</th>
					<th>누적 포인트</th>
					<th>현재 포인트</th>
					<th>상태</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="i" begin="0" end="15">
				<tr>
					<td>21/07/18/19:20</td>
					<td><a class="text-decoration-none" href="#">test@naver.com</a></td>
					<td>테스터</td>
					<td>110</td>
					<td>10</td>
					<td>승인</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>

		<nav aria-label="Page navigation example">
			<ul class="pagination">
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
	
	<div class="col-4">
		<div class="container sticky-top">
			<div class="card text-center h-auto shadow">
				<img src="/resources/images/default_Profile.png" class="card-img-top" alt="프로필 사진">
				<div class="card-body">
					<h5 class="card-title">테스터</h5>
					<p class="card-text">test@naver.com</p>
				</div>
				<ul class="list-group list-group-flush">
					<li class="userInfo list-group-item">현재 포인트: 10</li>
					<li class="userInfo list-group-item">작성글: 5</li>
					<li class="userInfo list-group-item">즐겨찾기 리스트</li>
					<li class="userInfo list-group-item">신고 내역</li>
				</ul>
				<div class="card-body">
					<a href="#" class="card-link text-decoration-none">메시지 보내기</a> <a href="#"
						class="card-link text-decoration-none">변경</a>
				</div>
			</div>
		</div>
	</div>
</div>

<div id="NewUser" style="display: none"></div>
</main>
<%@ include file="./mngInclude/footer.jsp"%>