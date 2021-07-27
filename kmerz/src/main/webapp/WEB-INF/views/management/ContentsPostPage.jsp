<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="./mngInclude/header.jsp"%>
<script src="/resources/script/TimeFormat.js"></script>
<script>

	$(document).ready(function() {
		// 날짜 수정
		//console.log($(".trPost:first").children().eq(1).text());
		
		for(var i=0; i<$(".trPost").length; i++){
			var tdDate = $(".trPost").eq(i).children().eq(1); 
			tdDate.text(timeForToday(tdDate.text()));
			console.log(timeForToday(tdDate.text()));
		};
		
		// 게시글 선택했을때
		$(".trPost").click(function(){
			// 게시글 정보 가져오기
			var post_no = $(this).children().first().text();
			var urlInfo = "/admin/contents/getPostInfo";
			var dataInfo = {
					"post_no" : post_no
			};
			$.get(urlInfo, dataInfo, function(rData) {
				console.log(rData);
				var postInfo = rData;
				$("#cardPostTitle").text(postInfo.post_title);
				$("#cardPostCommName").text(postInfo.community_name);
				$("#cardPostCateName").text(postInfo.category_name);
				$("#cardPostReadCount").text(postInfo.post_readcount);
				$("#cardPostRecommand").text(postInfo.post_recommand);
				// 신고수?
				
				var lastupdate = timePattern(postInfo.post_lastupdate);
				$("#cardPostLastupdate").text(lastupdate);
			});
			// 게시글 내용 가져오기
			var post_content_file = $(this).find("input[name='post_content_file']").val();
			var urlContent = "/admin/contents/getPostContent";
			var dataContent = {
					"post_content_file" : post_content_file
			};
			$.get(urlContent, dataContent, function(rData){
				console.log(rData);
				$("#cardPostContent").html(rData);
			});
		});
	});
</script>


<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
<div
	class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
	<h1 class="h2">컨텐츠 관리</h1>
	<div class="btn-toolbar mb-2 mb-md-0">
		<div class="btn-group me-2">
			<a href="/admin/contents/bsSettingPage" type="button"
				class="btn btn-sm btn-outline-secondary">배너/사이드바</a>
			<a href="/admin/contents/postSettingPage" id="btnPostSetting" type="button"
				class="btn btn-sm btn-outline-secondary active">게시글</a>
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
				<tbody id="tbdPost">
					<c:forEach var="postsVo"  items="${postList }">
					<tr class="trPost cspointer"> 
						<td>${postsVo.post_no }</td>
						<td>${postsVo.post_lastupdate }</td>
						<td><span>${postsVo.community_name }/${postsVo.category_name }</span></td>
						<td>${postsVo.post_title }</td>
						<td>${postsVo.user_name }</td>
						<td>${postsVo.post_readcount }</td>
						<td>${postsVo.post_recommand }</td>
						<td style="display:none"><input type="hidden" name="post_content_file" value="${postsVo.post_content_file }"/></td>
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

		<!-- 게시글 정보 카드 -->
		<div id="cardUserInfo" class="col-5" style="display: inline">
			<div class="card text-center">
				<div class="card-header">
					<h5 id="cardPostTitle" class="card-title">글제목</h5>
				</div>
				<ul class="list-group list-group-flush">
					<li class="list-group-item">
						<div>
							<span id="cardPostCommName">커뮤니티</span>
							<span>/</span>
							<span id="cardPostCateName">카테고리</span>
						</div>
					</li>
				</ul>
				<div class="card-body">
					<div style="height:400px;overflow-y: scroll;">
						<p id="cardPostContent" class="card-text">글내용</p>
					</div>
				</div>
				<ul class="list-group list-group-flush">
					<li class="list-group-item">
						<div>
							<span id="cardPostReadCount">조회수: 1</span>
							<span id="cardPostRecommand">추천수: 1</span>
							<span id="cardPostReport">신고수: 1</span>
						</div>
					</li>
				</ul>
				
				<div id="cardPostLastupdate" class="card-footer text-muted">2021-07-27 10:26:22.0</div>
			</div>
		</div>
	</div>


</div>

</main>
<%@ include file="./mngInclude/footer.jsp"%>