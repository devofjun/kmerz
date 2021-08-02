<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./mngInclude/header.jsp"%>
<style>

</style>

<script>
$(document).ready(function() {

	// 메세지 모달 스크립트
	var modalSendMessage = document.getElementById('modalSendMessage')
	modalSendMessage.addEventListener('show.bs.modal', function(event) {
		// Button that triggered the modal
		var button = event.relatedTarget
		// Extract info from data-bs-* attributes
		var recipient = button.getAttribute('data-bs-whatever')
		// If necessary, you could initiate an AJAX request here
		// and then do the updating in a callback.
		//
		// Update the modal's content.
		var modalTitle = modalSendMessage.querySelector('.modal-title')
		var modalBodyInput = modalSendMessage
				.querySelector('.modal-body input')

		modalTitle.textContent = 'New message to ' + recipient
		modalBodyInput.value = recipient
	})
	
	// 포인트 변경 모달 스크립트
	var modalUpdatePoint = document.getElementById('modalUpdatePoint')
	modalUpdatePoint.addEventListener('show.bs.modal', function(event) {
		// Button that triggered the modal
		var button = event.relatedTarget
		// Extract info from data-bs-* attributes
		var recipient = button.getAttribute('data-bs-whatever')
		// If necessary, you could initiate an AJAX request here
		// and then do the updating in a callback.
		//
		// Update the modal's content.
		var modalTitle = modalUpdatePoint.querySelector('.modal-title')
		var modalBodyInput = modalUpdatePoint
				.querySelector('.modal-body input')

		modalTitle.textContent = recipient + '포인트 변경'
		modalBodyInput.value = recipient
	})

	$("#btnUser").click(function() {
	});

	// 검색 타입 변경
	$("#ulSearchType > li > a").click(
			function(e) {
				e.preventDefault();
				$("#btnSearchType").attr("data-SearchType",
						$(this).attr("href"));
				$("#btnSearchType").text($(this).text());

			});

	// 테이블 유저 tr 클릭시 카드 보이기
	$(".trUserInfo").click(function() {
		$("#cardUserInfo").show();
	});

	// 유저 정보 카드 목록 하이라이트
	$(".liUserInfo").mouseenter(function() {
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
					<p id="cardUserEmail" class="card-text">test@naver.com</p>
				</div>
				<ul class="list-group list-group-flush">
					<li class="liUserInfo cspointer list-group-item" data-bs-toggle="modal" data-bs-target="#modalUserPoint">현재 포인트: 10</li>
					<li class="liUserInfo cspointer list-group-item" data-bs-toggle="modal" data-bs-target="#modalUserPosts">작성글: 5</li>
					<li class="liUserInfo cspointer list-group-item" data-bs-toggle="modal" data-bs-target="#modalUserFavorite">즐겨찾기 리스트</li>
					<li class="liUserInfo cspointer list-group-item" data-bs-toggle="modal" data-bs-target="#modalUserReport">신고 내역 / 차단</li>
				</ul>
				<div class="card-body">
					<span id="spSendMessage" class="mx-1 text-primary cspointer" 
					data-bs-toggle="modal" data-bs-target="#modalSendMessage" data-bs-whatever="test@naver.com"
					>메시지 보내기</span>
					<span id="spUpdatePoint" class="mx-1 text-primary cspointer"
					data-bs-toggle="modal" data-bs-target="#modalUpdatePoint" data-bs-whatever="test@naver.com"
					>포인트 변경</span>
<!-- 					<span id="spUpdateInfo" class="mx-1 text-primary cspointer" -->
<!-- 					data-bs-toggle="modal" data-bs-target="#modalUpdateInfo" data-bs-whatever="test@naver.com" -->
<!-- 					>상태 변경</span> -->
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
        			<td class="text-danger">-100</td>
        			<td>이모티콘 구입</td>
        		</tr>
        		<c:forEach var="i" begin="10" end="110" step="10">
        		<tr>
        			<td>2021/07/18/10:12:33</td>
        			<td>${120-i}</td>
        			<td>${120-i}</td>
        			<td class="text-success">+10</td>
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
        			<th>신고수</th>
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
        			<td>0</td>
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

<!-- 즐겨찾기 리스트 모달 -->
<div id="modalUserFavorite" class="modal fade" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm modal-dialog-scrollable modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">즐겨찾기 리스트</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <table class="table table-striped table-sm text-center">
        	<thead>
        		<tr>
        			<th>커뮤니티 이름</th>
        		</tr>
        	</thead>
        	<tbody>
        		<tr>
        			<td>스타크래프트</td>
        		</tr>
        		<tr>
        			<td>리그오브레전드</td>
        		</tr>
        		<tr>
        			<td>오버워치</td>
        		</tr>
        		
        	</tbody>
        </table>
      </div>
    </div>
  </div>
</div>

<!-- 신고 내역 모달 -->
<div id="modalUserReport" data-bs-backdrop="static" data-bs-keyboard="false" class="modal fade" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-scrollable modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">신고 내역</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      	<h5>누적 신고수: 5</h5>
        <table class="table table-striped table-sm">
        	<thead>
        		<tr>
        			<th>신고 시간</th>
        			<th>글 제목</th>
        			<th>신고자</th>
        			<th>신고 내용</th>
        		</tr>
        	</thead>
        	<tbody>
        	<c:forEach var="i" begin="1" end="5" step="1">
        		<tr>
        			<td>2021/07/18/10:12:33</td>
        			<td><a class="text-decoration-none" href="#">안녕하세요.</a></td>
        			<td>tester2</td>
        			<td>게시물 신고</td>
        		</tr>
        	</c:forEach>
        	</tbody>
        </table>
      </div>
      <div class="modal-footer">
        <button class="btn btn-danger">사용자 차단</button>
      </div>
    </div>
  </div>
</div>

<!-- 메시지 보내기 모달 -->
<div id="modalSendMessage" class="modal fade" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">New message</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form>
          <div class="mb-3">
            <label for="recipient-name" class="col-form-label">받는 사람:</label>
            <input type="text" class="form-control" id="recipient-name">
          </div>
          <div class="mb-3">
            <label for="message-text" class="col-form-label">메시지 내용:</label>
            <textarea class="form-control" id="message-text"></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary">보내기</button>
      </div>
    </div>
  </div>
</div>

<!-- 포인트 변경 모달 -->
<div id="modalUpdatePoint" class="modal fade" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">포인트 변경</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form>
          <div class="mb-3">
            <input type="hidden" class="form-control" id="recipient-name">
          </div>
          <div class="mb-3">
          	<label for="recipient-name" class="col-form-label">변경할 포인트:</label>
          	<input type="number" class="form-control">
          </div>
          <div class="mb-3">
            <label for="message-text" class="col-form-label">내용:</label>
            <textarea class="form-control" id="message-text"></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary">보내기</button>
      </div>
    </div>
  </div>
</div>


<%@ include file="./mngInclude/footer.jsp"%>