<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="./mngInclude/header.jsp"%>
<script src="/resources/script/TimeFormat.js"></script>
<style>
img[draggable='false']{
	width:350px;
	object-fit: cover;
}
</style>

<script>
	function submitPaging() {
		var url = "/admin/contents/postPaging";
		var sData = {
				"page" : $("#frmPaging > input[name='page']").val(),
				"perPage" : $("#frmPaging > input[name='perPage']").val(),
				"searchType" : $("#frmPaging > input[name='searchType']").val(),
				"keyword" : $("#frmPaging > input[name='keyword']").val()
		};
		$.get(url, sData, function(rData){
			$("#tbodyPost > tr:gt(0)").remove();
			$.each(rData.postList, function(){
				var cloneTr = $("#tbodyPost > tr:eq(0)").clone();
				cloneTr.find(".postno").text(this.post_no);
				cloneTr.find(".lastupdate").text(timeForToday(this.post_createtime));
				cloneTr.find(".cname > span").text(this.community_name + "/" + this.category_name);
				cloneTr.find(".title").text(this.post_title);
				cloneTr.find(".userName").text(this.user_name);
				cloneTr.find(".declared").text(this.declared_count);
				cloneTr.find(".status").text(this.str_post_status);
				cloneTr.find("input[name='post_content_file']").val(this.post_content_file);
				$("#tbodyPost").append(cloneTr);
				cloneTr.show();
			});
			// 페이지버튼 다시그리기
			var pagingDto = rData.postPagingDto;
			$(".pagination").empty();
			console.log(pagingDto);
			if(pagingDto.startPage != 1){
				var clone = $("#clonePageLeft").clone();
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
				$(".pagination").append(clone);
			}
		});
	}

	$(document).ready(function() {
		for(var i=0; i<$(".trPost").length; i++){
			var tdDate = $(".trPost").eq(i).children().eq(1); 
			tdDate.text(timeForToday(tdDate.text()));
		};
		
		// 검색 타입 변경
		$(".searchType").click(function() {
			$("#btnSearchType").text($(this).text());
			//$("#btnSearchType").attr("data-searchType", $(this).attr("data-searchType"));
			$("#frmPaging").find("input[name='searchType']").val($(this).attr("data-searchType"));
		});
		
		// 검색 버튼
		$("#btnSearch").click(function() {
			$("#frmPaging").find("input[name='keyword']").val($(this).prev().val());
			$("#frmPaging").find("input[name='page']").val(1);
			submitPaging();
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
		
		// 글 목록을 클릭했을때
		$("#tbodyPost").on("click", ".trPost", function() {
			// 게시글 카드 그리기
			var post_no = $(this).children().first().text();
			var urlInfo = "/admin/contents/getPostInfo";
			var dataInfo = {
					"post_no" : post_no
			};
			$.get(urlInfo, dataInfo, function(rData) {
				//console.log(rData);
				var postInfo = rData;
				$("#cardPostTitle").text(postInfo.post_title);
				$("#cardPostCommName").text(postInfo.community_name);
				$("#cardPostCateName").text(postInfo.category_name);
				$("#cardPostReadCount").text(postInfo.post_readcount);
				$("#cardPostRecommand").text(postInfo.post_recommand);
				$("#cardPostDeclared").text(postInfo.declared_count);
				console.log(postInfo.post_status);
				if(postInfo.post_status == -2){
					$("#cardPostTitle").addClass("text-decoration-line-through");
					$("#btnChangeStatus").text("글 잠금해제");
					$("#cardUserInfo").children().removeClass("shadow");
				} else if(postInfo.post_status >= 0){
					$("#cardPostTitle").removeClass("text-decoration-line-through");
					$("#btnChangeStatus").text("글 잠그기");
					$("#cardUserInfo").children().addClass("shadow");
				}
				$("#btnChangeStatus").attr("data-postno", postInfo.post_no);
				
				var lastupdate
				if(postInfo.post_updatetime == null){
					lastupdate = timePattern(postInfo.post_createtime);
				} else {
					lastupdate = timePattern(postInfo.post_updatetime);
				}
				$("#cardPostLastupdate").text(lastupdate);
			});
			// 게시글 내용 가져오기
			var post_content_file = $(this).find("input[name='post_content_file']").val();
			//console.log(post_content_file);
			$.ajax({
				url				:"/admin/contents/getPostContent",
				type			:"GET",
				data:{
					"post_content_file" : post_content_file
				},
				success:function(rData){
					//console.log(rData);
					var content = rData;
					$("#cardPostContent").html(content);
				}
			});
			
		});
		
		// 글 상태 바꾸기 버튼 눌렀을때
		$("#btnChangeStatus").click(function(e){
			e.preventDefault();
			var that = this;
			var card = $("#cardUserInfo").children();
			var post_no = $(this).attr("data-postno");
			var url = "/admin/contents/setPostDeny";
			if($(this).text() == "글 잠금해제"){
				url = "/admin/contents/setPostAdmit";
			}
			var data = { 
					"post_no" : post_no
					};
			$.get(url, data, function(rData){
				// 버튼 바꾸기
				console.log(rData);
				if(rData == "success") {
					console.log(url);
					if(url == "/admin/contents/setPostDeny"){
						console.log($(that).text());
						$(that).text("글 잠금해제");
						$("#cardPostTitle").addClass("text-decoration-line-through");
						card.removeClass("shadow");
					} else {
						console.log($(that).text());
						$(that).text("글 잠그기");
						$("#cardPostTitle").removeClass("text-decoration-line-through");
						card.addClass("shadow");
					}
				}
				submitPaging();
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
<!-- 		<button id="btnSave" type="button" -->
<!-- 			class="btn btn-sm btn-outline-success" -->
<!-- 			data-url="/admin/contents/setBanner">적용하기</button> -->
	</div>
</div>

<div>


	<div id="userManagement" class="row">
		<div class="col-8">

			<!-- 검색바 -->
			<div class="input-group mb-1 ">
				<button id="btnSearchType"
					class="btn btn-outline-secondary dropdown-toggle" type="button"
					data-bs-toggle="dropdown" aria-expanded="false">제목</button>
				<ul id="ulSearchType" class="dropdown-menu">
					<li><span class="searchType dropdown-item" data-searchType="post_title">제목</span></li>
					<li><span class="searchType dropdown-item" data-searchType="user_name">작성자</span></li>
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
						<th>신고수</th>
						<th>상태</th>
					</tr>
				</thead>
				<tbody id="tbodyPost">
					<tr class="trPost cspointer" style="display:none">
						<td class="postno"></td>
						<td class="lastupdate"></td>
						<td class="cname"><span></span></td>
						<td class="title"></td>
						<td class="userName"></td>
						<td class="declared"></td>
						<td class="status"></td>
						<td style="display:none"><input type="hidden" name="post_content_file" value=""/></td>
					</tr>
					<c:forEach var="postsVo"  items="${postList }">
					<tr class="trPost cspointer"> 
						<td class="postno">${postsVo.post_no }</td>
						<td class="lastupdate">${postsVo.post_createtime }</td>
						<td class="cname"><span>${postsVo.community_name }/${postsVo.category_name }</span></td>
						<td class="title">${postsVo.post_title }</td>
						<td class="userName">${postsVo.user_name }</td>
						<td class="declared">${postsVo.declared_count }</td>
						<td class="status">${postsVo.str_post_status }</td>
						<td style="display:none"><input type="hidden" name="post_content_file" value="${postsVo.post_content_file }"/></td>
					</tr>
					</c:forEach>
				</tbody>
			</table>

			<!-- 페이징dto -->
			<form id="frmPaging" style="display:none">
				<input type="hidden" name="page" value="${postPagingDto.page}" />
				<input type="hidden" name="perPage" value="${postPagingDto.perPage}" />
				<input type="hidden" name="searchType" value="${postPagingDto.searchType}"/>
				<input type="hidden" name="keyword" value="${postPagingDto.keyword}" />
			</form>
			<!-- 페이징 네비 -->
			<nav>
				<ul class="pagination justify-content-center">
					<c:if test="${postPagingDto.startPage != 1 }">
						<li class="page-item"><a class="page-link"
							href="${postPagingDto.startPage-1}">&laquo;</a></li>
					</c:if>
					<c:forEach var="p" begin="${postPagingDto.startPage}"
						end="${postPagingDto.endPage}">
						<c:choose>
							<c:when test="${postPagingDto.page == p}">
								<li class="page-item active"><a class="page-link"
									href="${p}">${p}</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link" href="${p}">${p}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${postPagingDto.endPage < pagingDto.totalPage }">
						<li class="page-item"><a class="page-link"
							href="${postPagingDto.endPage+1}">&raquo;</a></li>
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

		<!-- 게시글 정보 카드 -->
		<div id="cardUserInfo" class="col-4">
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
					<div style="height:550px;overflow-y: scroll;">
						<p id="cardPostContent" class="card-text">글내용</p>
					</div>
				</div>
				<ul class="list-group list-group-flush">
					<li class="list-group-item">
						<div>
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
  								<path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z"/>
  								<path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z"/>
							</svg> <span id="cardPostReadCount">조회수</span>
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-hand-thumbs-up" viewBox="0 0 16 16">
								<path d="M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2.144 2.144 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a9.84 9.84 0 0 0-.443.05 9.365 9.365 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111L8.864.046zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a8.908 8.908 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.224 2.224 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.866.866 0 0 1-.121.416c-.165.288-.503.56-1.066.56z"/>
							</svg> <span id="cardPostRecommand">추천수</span>
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-exclamation-triangle" viewBox="0 0 16 16">
								<path d="M7.938 2.016A.13.13 0 0 1 8.002 2a.13.13 0 0 1 .063.016.146.146 0 0 1 .054.057l6.857 11.667c.036.06.035.124.002.183a.163.163 0 0 1-.054.06.116.116 0 0 1-.066.017H1.146a.115.115 0 0 1-.066-.017.163.163 0 0 1-.054-.06.176.176 0 0 1 .002-.183L7.884 2.073a.147.147 0 0 1 .054-.057zm1.044-.45a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566z"/>
								<path d="M7.002 12a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 5.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995z"/>
							</svg> <a id="cardPostDeclared">신고수</a>
							<i class="bi bi-exclamation-triangle"></i>
						</div>
					</li>
					<li class="list-group-item">
						<button 
						class="btn btn-sm btn-outline-secondary"></button>
						<button id="btnChangeStatus" data-postno="" 
						class="btn btn-sm btn-outline-secondary">글 잠그기</button>
					</li>
				</ul>
				<div id="cardPostLastupdate" class="card-footer text-muted">2021-07-27 10:26:22.0</div>
			</div>
		</div>
	</div>


</div>

</main>
<%@ include file="./mngInclude/footer.jsp"%>