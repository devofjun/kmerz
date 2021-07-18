<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./mngInclude/header.jsp"%>
<style>
.liUserInfo {
	cursor:pointer;
}
</style>

<script>
$(document).ready(function() {
	$("#btnUser").click(function() {
	});
	
	// 검색 타입 변경
	$("#ulSearchType > li > a").click(function(e){
		e.preventDefault();
		$("#btnSearchType").attr("data-SearchType",$(this).attr("href"));
		$("#btnSearchType").text($(this).text());
		
	});
	
	// 테이블 유저 tr 클릭시 카드 보이기
	$(".trUserInfo").click(function() {
		$("#cardUserInfo").show();
	});
	
	
	// 유저 정보 카드 목록 하이라이트
	$(".liUserInfo").mouseenter(function(){
		//bg-primary text-white
		$(this).addClass("bg-primary text-white");
	});
	$(".liUserInfo").mouseleave(function() {
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
<!-- 			<button id="btnNEW" type="button" -->
<!-- 				class="btn btn-sm btn-outline-secondary">NEW</button> -->
		</div>
	</div>
</div>

<div id="userManagement" class="row">
	<div class="col-8">
	
		<!-- 검색바 -->
		<div class="input-group mb-1 ">
			<button id="btnSearchType"
				class="btn btn-outline-secondary dropdown-toggle" type="button"
				data-bs-toggle="dropdown" aria-expanded="false"
				data-searchType="/admin/searchName">이름</button>
			<ul id="ulSearchType" class="dropdown-menu">
				<li><a class="dropdown-item" href="/admin/searchId">ID</a></li>
				<li><a class="dropdown-item" href="/admin/searchName">이름</a></li>
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
					<th>최근 접속</th>
					<th>유저ID</th>
					<th>유저이름</th>
					<th>누적 포인트</th>
					<th>현재 포인트</th>
					<th>상태</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="i" begin="0" end="15" >
				<tr class="trUserInfo">
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
	<div id="cardUserInfo" class="col-4" style="display:none">
		<div class="container sticky-top">
			<div class="card text-center h-auto shadow">
				<img src="/resources/images/default_Profile.png" class="card-img-top" alt="프로필 사진">
				<div class="card-body">
					<h5 class="card-title">테스터</h5>
					<p class="card-text">test@naver.com</p>
				</div>
				<ul class="list-group list-group-flush">
					<li class="liUserInfo list-group-item" data-bs-toggle="modal" data-bs-target="#modalUserPoint">현재 포인트: 10</li>
					<li class="liUserInfo list-group-item" data-bs-toggle="modal" data-bs-target="#modalUserPosts">작성글: 5</li>
					<li class="liUserInfo list-group-item" data-bs-toggle="modal" data-bs-target="#modalUserPoint">즐겨찾기 리스트</li>
					<li class="liUserInfo list-group-item" data-bs-toggle="modal" data-bs-target="#modalUserPoint">신고 내역</li>
				</ul>
				<div class="card-body">
					<a href="#" class="card-link text-decoration-none">메시지 보내기</a>
					<a href="#" class="card-link text-decoration-none">포인트 변경</a>
					<a href="#" class="card-link text-decoration-none">정보 변경</a>
				</div>
			</div>
		</div>
	</div>
</div>

</main>

<!-- 포인트 내역 모달 -->
<div id="modalUserPoint" class="modal fade" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-scrollable modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">포인트 내역</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <table class="table table-striped table-sm">
        	<thead>
        		<tr>
        			<th>시간</th>
        			<th>누적</th>
        			<th>현재</th>
        			<th>+/-</th>
        			<th>내용</th>
        		</tr>
        	</thead>
        	<tbody>
        		<tr>
        			<td>2021/07/18/10:12:33</td>
        			<td>110</td>
        			<td>10</td>
        			<td>-100</td>
        			<td>이모티콘 구입</td>
        		</tr>
        		<c:forEach var="i" begin="10" end="310" step="10">
        		<tr>
        			<td>2021/07/18/10:12:33</td>
        			<td>${320-i}</td>
        			<td>${320-i}</td>
        			<td>+10</td>
        			<td>출석포인트 지급</td>
        		</tr>
        		</c:forEach>
        	</tbody>
        </table>
      </div>
    </div>
  </div>
</div>

<!-- 작성글 내역 모달 -->
<div id="modalUserPosts" data-bs-backdrop="static" data-bs-keyboard="false" class="modal fade" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-scrollable modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">작성글 내역</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <table class="table table-striped table-sm">
        	<thead>
        		<tr>
        			<th>시간</th>
        			<th>글제목</th>
        			<th>조회수</th>
        			<th>추천수</th>
        			<th>현재 상태</th>
        			<th><input type="checkbox"/></th>
        		</tr>
        	</thead>
        	<tbody>
        	<c:forEach var="i" begin="1" end="5" step="1">
        		<tr>
        			<td>2021/07/18/10:12:33</td>
        			<td><a class="text-decoration-none" href="#">안녕하세요.</a></td>
        			<td>47</td>
        			<td>12</td>
        			<td>open</td>
        			<td><input type="checkbox"/></td>
        		</tr>
        	</c:forEach>
        	</tbody>
        </table>
      </div>
      <div class="modal-footer">
      	<button class="btn btn-primary">선택 열람 가능</button>
        <button class="btn btn-danger">선택 열람 불가능</button>
      </div>
    </div>
  </div>
</div>


<%@ include file="./mngInclude/footer.jsp"%>