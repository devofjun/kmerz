<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./mngInclude/header.jsp"%>
<script src="/resources/script/TimeFormat.js"></script>
<style>

</style>

<script>
function submitPaging() {
	var url = "/admin/customers/list";
	var sData = {
			"page" : $("#frmPaging > input[name='page']").val(),
			"perPage" : $("#frmPaging > input[name='perPage']").val(),
			"searchType" : $("#frmPaging > input[name='searchType']").val(),
			"keyword" : $("#frmPaging > input[name='keyword']").val()
	};
	$.get(url, sData, function(rData){
		// 리스트
		$("#tbodyCustomer > tr:gt(0)").remove();
		$.each(rData.memberList, function(){
			var cloneTr = $("#tbodyCustomer > tr:eq(0)").clone();
			cloneTr.find(".userno").text(this.user_no);
			cloneTr.find(".currentLogin").text(timeForToday(this.user_currentlogin));
			cloneTr.find(".userid").text(this.user_id);
			cloneTr.find(".userName").text(this.user_name);
			cloneTr.find(".totalPoint").text(this.user_totalpoint);
			cloneTr.find(".userPoint").text(this.user_point);
			cloneTr.find(".declaredCount").text(this.user_declared_count);
			cloneTr.find(".userStatus").text(this.str_user_status);
			$("#tbodyCustomer").append(cloneTr);
			cloneTr.show();
		});
		// 페이지버튼
		var pagingDto = rData.memberPagingDto;
		$(".pagination").empty();
		console.log(pagingDto);
		if(pagingDto.startPage != 1){
			var clone = $("#clonePageLeft").clone();
			clone.children().attr("href", pagingDto.startPage-1);
			$(".pagination").append(clone);
		}
		for(var p = pagingDto.startPage; p <= pagingDto.endPage; p++){
			var clone = $("#clonePageNum").clone();
			clone.find("a").attr("href", p).text(p);
			clone.removeClass("active");
			console.log("p: "+p);
			if(p == pagingDto.page){
				console.log("pagingDto.page: "+pagingDto.page);
				clone.addClass("active");
			}
			$(".pagination").append(clone);
		}
		if(pagingDto.endPage < pagingDto.totalPage){
			var clone = $("#clonePageRight").clone();
			clone.children().attr("href", pagingDto.endPage+1);
			$(".pagination").append(clone);
		}
	});
}

$(document).ready(function() {
	$("input[name='searchType']").val("user_name");
	for(var i=0; i<$(".currentLogin").length; i++){
		var tdDate = $(".currentLogin").eq(i); 
		tdDate.text(timeForToday(tdDate.text()));
	};

	// 메세지 모달 스크립트
	var modalSendMessage = document.getElementById('modalSendMessage')
	modalSendMessage.addEventListener('show.bs.modal', function(event) {

		var button = event.relatedTarget

		var recipient = button.getAttribute('data-bs-whatever')

		var modalTitle = modalSendMessage.querySelector('.modal-title')
		var modalBodyInput = modalSendMessage
				.querySelector('.modal-body input')

		modalTitle.textContent = 'New message to ' + recipient
		modalBodyInput.value = recipient
	})
	
	// 포인트 변경 모달 스크립트
	var modalUpdatePoint = document.getElementById('modalUpdatePoint')
	modalUpdatePoint.addEventListener('show.bs.modal', function(event) {

		var button = event.relatedTarget

		var recipient = button.getAttribute('data-bs-whatever')

		var modalTitle = modalUpdatePoint.querySelector('.modal-title')
		var modalBodyInput = modalUpdatePoint
				.querySelector('.modal-body input')

		modalTitle.textContent = recipient + '포인트 변경'
		modalBodyInput.value = recipient
	})

	$("#btnUser").click(function() {
	});

	// 검색 타입 변경
	$(".searchType").click(function(e) {
		
	});
	
	
	// 페이지 번호 클릭시
	$(".pagination").on("click", "li > a", function(e){
	//$(".pagination > li > a").click(function(e) {
		e.preventDefault();
		$(".pagination > li").removeClass("active");
		$(this).parent().addClass("active");
		var page = $(this).attr("href");
		$("#frmPaging > input[name='page']").val(page);
		submitPaging();
	});
	
	
	// 유저 목록 클릭시 카드 보이기
	$(".trUserInfo").click(function() {
		var userno = $(this).find(".userno").text();
		
		
		
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
				<li><span class="searchType dropdown-item" data-searchType="user_id">아이디</span></li>
				<li><span class="searchType dropdown-item" data-searchType="user_name">이름</span></li>
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
					<th style="display:none">유저번호</th>
					<th>최근 접속</th>
					<th>유저ID</th>
					<th>유저이름</th>
					<th>누적 포인트</th>
					<th>현재 포인트</th>
					<th>신고수</th>
					<th>상태</th>
				</tr>
			</thead>
			<tbody id="tbodyCustomer">
				<tr class="trUserInfo" style="display:none">
					<td style="display:none" class="userno"></td>
					<td class="currentLogin"></td>
					<td class="userid"></td>
					<td class="userName"></td>
					<td class="totalPoint"></td>
					<td class="userPoint"></td>
					<td class="declaredCount"></td>
					<td class="userStatus"></td>
				</tr>
				<c:forEach var="memberVo" items="${memberList }">
				<tr class="trUserInfo">
					<td style="display:none" class="userno">${memberVo.user_no }</td>
					<td class="currentLogin">${memberVo.user_currentlogin}</td>
					<td class="userid">${memberVo.user_id }</td>
					<td class="userName">${memberVo.user_name}</td>
					<td class="totalPoint">${memberVo.user_totalpoint }</td>
					<td class="userPoint">${memberVo.user_point }</td>
					<td class="declaredCount">${memberVo.user_declared_count }</td>
					<td class="userStatus">${memberVo.str_user_status }</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<!-- 페이징dto -->
			<form id="frmPaging" style="display:none">
				<input type="hidden" name="page" value="${memberPagingDto.page}" />
				<input type="hidden" name="perPage" value="${memberPagingDto.perPage}" />
				<input type="hidden" name="searchType" value="${memberPagingDto.searchType}"/>
				<input type="hidden" name="keyword" value="${memberPagingDto.keyword}" />
			</form>
			<!-- 페이징 네비 -->
			<nav>
				<ul class="pagination justify-content-center">
					<c:if test="${memberPagingDto.startPage != 1 }">
						<li class="page-item"><a class="page-link"
							href="${memberPagingDto.startPage-1}">&laquo;</a></li>
					</c:if>
					<c:forEach var="p" begin="${memberPagingDto.startPage}"
						end="${memberPagingDto.endPage}">
						<c:choose>
							<c:when test="${memberPagingDto.page == p}">
								<li class="page-item active"><a class="page-link"
									href="${p}">${p}</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link" href="${p}">${p}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${memberPagingDto.endPage < memberPagingDto.totalPage }">
						<li class="page-item"><a class="page-link"
							href="${memberPagingDto.endPage+1}">&raquo;</a></li>
					</c:if>
				</ul>
			</nav>
			<div style="display:none">
				<ul>
					<li id="clonePageLeft" class="page-item"><a class="page-link"
						href="${postPagingDto.startPage-1}">&laquo;</a></li>
					<li id="clonePageNum" class="page-item"><a class="page-link" href="${p}">${p}</a></li>
					<li id="clonePageRight" class="page-item"><a class="page-link"
						href="${postPagingDto.endPage+1}">&raquo;</a></li>
				</ul>
			</div>
	</div>
	
	<!-- 유저 정보 카드 -->
	<div id="cardUserInfo" class="col-4" style="display:none">
		<div class="container sticky-top">
			<div class="card text-center h-auto shadow">
				<img src="/resources/images/default_Profile.png" class="card-img-top" alt="프로필 사진">
				<div class="card-body">
					<p id="cardUserNo" style="display:none">유저번호</p>
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
            <label for="message-content" class="col-form-label">메시지 내용:</label>
            <textarea class="form-control" id="message-content"></textarea>
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
            <input type="hidden" class="form-control" id="point-user-name">
          </div>
          <div class="mb-3">
          	<label for="recipient-name" class="col-form-label">변경할 포인트:</label>
          	<input type="number" class="form-control">
          </div>
          <div class="mb-3">
            <label for="point-content" class="col-form-label">내용:</label>
            <textarea class="form-control" id="point-content"></textarea>
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

</main>




<%@ include file="./mngInclude/footer.jsp"%>