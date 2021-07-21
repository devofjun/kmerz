<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="./mngInclude/header.jsp"%>
<style>
.cspointer {
	cursor:pointer;
}
</style>
<script>
$(document).ready(function() {
	$(".sample").mouseenter(function() {
		$(this).removeClass("border-1");
		$(this).addClass("border-1");
		$(this).addClass("border-primary");
	});
	$(".sample").mouseleave(function() {
		$(this).removeClass("border-1");
		$(this).removeClass("border-primary");
		$(this).add("border-1");
	});
	// 영역 선택 클릭
	$(".sample").click(function() {
		$(".sample").removeClass("bg-primary");
		$(".sample").removeClass("text-white");
		$(".sample").addClass("bg-light");
		$(this).removeClass("bg-light");
		$(this).addClass("bg-primary");
		$(this).addClass("text-white");
		
		var title = $(this).children('span').text();
		$("#previewTitle").text(title+" 미리보기");
		
		var setting = $(this).attr("data-sample");
		$("#cardBannerSetting").hide();
		$("#cardLeftSetting").hide();
		$("#cardRightSetting").hide();
		switch(setting){
		case "banner":
			$("#cardBannerSetting").show();
			break;
		case "left":
			$("#cardLeftSetting").show();
			break;
		case "right":
			$("#cardRightSetting").show();
			break;
		}
	});
	
	// 검색 타입 변경
	$("#ulSearchType > li > a").click(function(e) {
		e.preventDefault();
		$("#btnSearchType").attr("data-SearchType",
				$(this).attr("href"));
		$("#btnSearchType").text($(this).text());
	});
});
</script>

<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
<div
	class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
	<h1 class="h2">컨텐츠 관리</h1>
</div>

<div class="container">
	<div class="row">
		<div class="col-lg-4 text-center">
			<div class="card shadow" style="border-color: #ffe69c;">
				<div class="card-header"
					style="background-color: #ffe69c; border-color: #ffe69c">설정
					영역</div>
				<div class="card-body">
					<div class="container">
						<div
							class="sample row h-25 bg-light border border-2 rounded-1 p-3 m-1"
							data-sample="banner">
							<span>Banner</span>
						</div>
						<div class="row">
							<div class="sample col-3 bg-light border border-2 rounded-1 py-5"
								data-sample="left">
								<span>Left</span>
							</div>
							<div class="col-6 py-5">게시물</div>
							<div class="sample col-3 bg-light border border-2 rounded-1 py-5"
								data-sample="right">
								<span>Right</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="col-lg-8">
			<div class="card shadow">
				<div id="previewTitle" class="card-header text-center">배너 미리보기</div>
				<div class="card-body"></div>
			</div>
		</div>
	</div>
</div>

<!-- 배너 설정 카드 -->
<div id="cardBannerSetting" class="container mt-5" style="display:none">
	<div class="row">
		<div class="col">
			
			<div class="card text-white shadow" style="background-color:#495057">
				<div class="card-header text-center">배너에 장식할 게임을 선정하세요.</div>
				<div class="card-body">
					<div class="row">
						<!-- 검색바 -->
						<div class="input-group mb-1 ">
							<button id="btnSearchType"
								class="btn btn-secondary dropdown-toggle" type="button"
								data-bs-toggle="dropdown" aria-expanded="false"
								data-searchType="/admin/searchName">게임 이름</button>
							<ul id="ulSearchType" class="dropdown-menu">
								<li><a class="dropdown-item" href="/steam/searchId">게임
										ID</a></li>
								<li><a class="dropdown-item" href="/steam/searchName">게임
										이름</a></li>
							</ul>
							<input type="text" class="form-control"
								aria-label="Text input with dropdown button">
							<button class="btn btn-secondary" type="button" id="btnSearch">검색</button>
						</div>
						<div class="text-center" style="display:none">
							<div class="spinner-border" role="status">
								<span class="visually-hidden">Loading...</span>
							</div>
						</div>
					</div>
					<!-- 게임 검색 결과 카드 -->
					<div class="row w-100" style="height: auto">
						<div class="col-xl-3 text-center p-4">
							<div class="card cspointer">
								<img src="/resources/images/testImg/test1.jpg" class="card-img-top" alt="appid">
								<div class="card-body">
									<p class="card-text text-dark">Don't Starve Together</p>
								</div>
							</div>
						</div>
						<div class="col-xl-3 text-center p-4">
							<div class="card cspointer">
								<img src="/resources/images/testImg/test1.jpg" class="card-img-top" alt="appid">
								<div class="card-body">
									<p class="card-text text-dark">Don't Starve Together</p>
								</div>
							</div>
						</div>
						<div class="col-xl-3 text-center p-4">
							<div class="card cspointer">
								<img src="/resources/images/testImg/test1.jpg" class="card-img-top" alt="appid">
								<div class="card-body">
									<p class="card-text text-dark">Don't Starve Together</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
		</div>
	</div>
</div>

<!-- 왼쪽 사이드 설정 카드 -->
<div id="cardLeftSetting" class="container mt-5">
	<div class="row">
		<div class="col">
			
			<div class="card shadow">
				<div class="card-header text-center">왼쪽 사이드바 설정</div>
				<div class="card-body">
					<div class="row">
						<div class="col-xl-3 col-lg-4 col-md-6">
							<input id="rSidebarMenu1" type="checkbox">
							<label for="rSidebarMenu1"><img class="img-thumbnail" src="/resources/images/testImg/commbar.jpg"></label>
						</div>
						<div class="col-xl-3 col-lg-4 col-md-6">
							<input id="rSidebarMenu2" type="checkbox">
							<label for="rSidebarMenu2"><img class="img-thumbnail" src="/resources/images/testImg/commbar.jpg"></label>
						</div>
						<div class="col-xl-3 col-lg-4 col-md-6">
							<input id="rSidebarMenu3" type="checkbox">
							<label for="rSidebarMenu3"><img class="img-thumbnail" src="/resources/images/testImg/commbar.jpg"></label>
						</div>
						<div class="col-xl-3 col-lg-4 col-md-6">
							<input id="rSidebarMenu3" type="checkbox">
							<label for="rSidebarMenu3"><img class="img-thumbnail" src="/resources/images/testImg/commbar.jpg"></label>
						</div>
						
					</div>
				</div>
			</div>
			
		</div>
	</div>
</div>

<!-- 오른쪽 사이드바 설정 카드 -->
<div id="cardRightSetting" class="container mt-5" style="display:none">
	<div class="row">
		<div class="col">
			
			<div class="card text-white shadow" style="background-color:#495057">
				<div class="card-header text-center">오른쪽 사이드바 설정</div>
				<div class="card-body">
					<div class="row">
						<!-- 검색바 -->
						<div class="input-group mb-1 ">
							<button id="btnSearchType"
								class="btn btn-secondary dropdown-toggle" type="button"
								data-bs-toggle="dropdown" aria-expanded="false"
								data-searchType="/admin/searchName">게임 이름</button>
							<ul id="ulSearchType" class="dropdown-menu">
								<li><a class="dropdown-item" href="/steam/searchId">게임
										ID</a></li>
								<li><a class="dropdown-item" href="/steam/searchName">게임
										이름</a></li>
							</ul>
							<input type="text" class="form-control"
								aria-label="Text input with dropdown button">
							<button class="btn btn-secondary" type="button" id="btnSearch">검색</button>
						</div>
						<div class="text-center" style="display:none">
							<div class="spinner-border" role="status">
								<span class="visually-hidden">Loading...</span>
							</div>
						</div>
					</div>
					<!-- 게임 검색 결과 카드 -->
					<div class="row w-100" style="height: auto">
						<div class="col-xl-3 text-center p-4" style="display:none">
							<div class="card cspointer">
								<img src="/resources/images/testImg/test1.jpg" class="card-img-top" alt="appid">
								<div class="card-body">
									<p class="card-text text-dark">Don't Starve Together</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
		</div>
	</div>
</div>

</main>


<%@ include file="./mngInclude/footer.jsp"%>