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
	// json 파일 받아오기
	var steamJson
	$("#settingCardLoading").show();
	//$.getJSON('http://api.steampowered.com/ISteamApps/GetAppList/v0002/?key=STEAMKEY&format=json', function(json) {
	//$.getJSON('http://api.steampowered.com/IStoreService/GetAppList/v0001/?key=E7C4563CA09F3BB39360ECCEA67F68F8&include_dlc=false',function(json){
	$.getJSON('https://store.steampowered.com/api/appdetails?l=koreana&appids=322330',function(json){
		steamJson = json;
		console.log(steamJson);
		$("#settingCardLoading").hide();
		$("#cardBannerSetting").show();
	});

	// 배너/사이드바 설정 버튼
	$("#btnSelectBS").click(function() {
		if($(this).is(".active")){
			// 이미 클릭 되었다면 함수 종료
			return;
		} else {
			$("#btnSelectPost").removeClass("active");
			$(this).addClass("active");
		}
	});
	
	// 게시글 설정 버튼
	$("#btnSelectPost").click(function() {
		if($(this).is(".active")){
			// 이미 클릭 되었다면 함수 종료
			return;
		} else {
			$("#btnSelectBS").removeClass("active");
			$(this).addClass("active");
		}
	});
	
	// 컨텐츠 관리 영역 마우스 오버
	$(".mouse-border-primary").mouseenter(function() {
		$(this).addClass("border-primary");
	});
	$(".mouse-border-primary").mouseleave(function() {
		$(this).removeClass("border-primary");
	});
	// 컨텐츠 관리 영역 선택 클릭
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
			// 배너설정 영역 클릭시
			$("#cardBannerSetting").show();
			break;
		case "left":
			// 왼쪽 사이드바 설정 영역 클릭시 
			$("#cardLeftSetting").show();
			break;
		case "right":
			// 오른쪽 사이드바 설정 영역 클릭시
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
	
	// 게임 검색 버튼 클릭
	$("#btnAppSearch").click(function(){
		// 게임id 검색
		var searchText = $(this).prev().val();
		var searchType = $("#btnSearchType").attr("data-searchType");
		var resultApps = [];
		if(searchType == "/admin/searchId"){
			// id로 검색
			for(key in steamJson.applist.apps){
				var appid = steamJson.applist.apps[key].appid;
				console.log(appid);
				if(appid.indexOf(searchText) != -1){
					//console.log(appid);
					resultApps.push(appid);
				}
			}
		} else {
			// 게임이룸으로 검색
			for(key in steamJson.applist.apps){
				var appname = steamJson.applist.apps[key].name;
				if(appname.indexOf(searchText) != -1){
					//console.log(steamJson.applist.apps[key].appid);
					resultApps.push(steamJson.applist.apps[key].appid);
				}
			}
		}
		
		// 검색 결과 id
		console.log(resultApps);
		var resultCount = resultApps.length;
		//for(var i=0; i<resultCount; i++){
			$.getJSON('https://store.steampowered.com/api/appdetails?l=koreana&appids=322330', function(json) {
				appdetailsJson = json;
				console.log(appdetailsJson.resultApps[0].data.type);
			});
		//}
	});
	
	
	// 배너 스팀 게임 선택
	$(".steamApps").click(function() {
		var isSelected = $(this).attr("data-selected");
		var cardAppid = $(this).attr("data-appid");
		var cardAppname = $(this).find(".appname").text();
		
		
		if(isSelected == "false"){
			// 카드가 선택된적 없을때
			$(this).attr("data-selected", "true");
			
			var cloneBadge = $("#selectApps > .selectApp:first").clone();
			var cloneSpan = cloneBadge.find("span:first");
			
			cloneBadge.css("display", "inline");
			cloneSpan.attr("data-appid", cardAppid);
			cloneSpan.text(cardAppname);
			
			$("#selectApps").append(cloneBadge);
		} else if(isSelected == "true"){
			// 카드가 선택된적 있을때
			$(this).attr("data-selected", "false");
			// 선택된 카드의 동일한 appid를 가지고 있는 badge를 탐색하여 remove한다.
			var count = $(".selectApp").length;
			for(var i=0; i<count; i++){
				var appid = $(".selectApp").eq(i).find("span:first").attr("data-appid");
				if(appid == cardAppid){
					$(".selectApp").eq(i).remove();
					break;
				}
			}
		}
	});
	
	// 배너 게임 선택취소("X")버튼 눌렀을때
	$("#selectApps").on("click", ".selectAppCancel", function() {
		var appid = $(this).prev().attr("data-appid");
		$(this).parent().remove();
		
		var count = $(".steamApps").length;
		for(var i=0; i<count; i++){
			var cardAppid = $(".steamApps").eq(i).attr("data-appid");
			if(appid == cardAppid){
				$(".steamApps").eq(i).attr("data-selected","false");
				break;
			}
		}
	});
	
	// 선택 취소 하면 db banner 에서 삭제함
	function bannerSelectCancel(appid){
		var url = "";
		var sendData = {
				"appid" : appid
		};
		$.get();
	}
});
</script>

<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
<div
	class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
	<h1 class="h2">컨텐츠 관리</h1>
	<div class="btn-toolbar mb-2 mb-md-0">
		<div class="btn-group me-2">
			<button id="btnSelectBS" type="button" class="btn btn-sm btn-outline-secondary active">배너 / 사이드바</button>
			<button id="btnSelectPost"type="button" class="btn btn-sm btn-outline-secondary">게시글</button>
		</div>
		<button type="button"
			class="btn btn-sm btn-outline-danger">
			적용하기
		</button>
	</div>
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
							class="sample mouse-border-primary row h-25 bg-primary text-white border border-1 rounded-1 p-3 m-1"
							data-sample="banner">
							<span>Banner</span>
						</div>
						<div class="row">
							<div class="sample mouse-border-primary col-3 bg-light border border-1 rounded-1 py-5"
								data-sample="left">
								<span>Left</span>
							</div>
							<div class="col-6 py-5">게시물</div>
							<div class="sample mouse-border-primary col-3 bg-light border border-1 rounded-1 py-5"
								data-sample="right">
								<span>Right</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="col-lg-8">
			<div class="card h-100 shadow">
				<div id="previewTitle" class="card-header text-center">배너 미리보기</div>
				<div class="card-body"></div>
			</div>
		</div>
	</div>
</div>
<div id="settingCardLoading" class="container my-5" style="display:none">
	<div class="row">
		<!-- 검색 로딩바 -->
		<div class="row w-100">
			<div class="text-center mt-3">
				<div class="spinner-border" role="status">
					<span class="visually-hidden">Loading...</span>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 배너 게임 설정 카드 -->
<div id="cardBannerSetting" class="container my-5" style="display:none">
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
								<li><a class="dropdown-item" href="/steam/searchId">게임ID</a></li>
								<li><a class="dropdown-item" href="/steam/searchName">게임이름</a></li>
							</ul>
							<input type="text" class="form-control"
								aria-label="Text input with dropdown button">
							<button id="btnAppSearch" class="btn btn-secondary" type="button">검색</button>
						</div>
						
					</div>
					<!-- 검색 로딩바 -->
					<div class="row w-100">
						<div class="text-center mt-3" style="display:none">
							<div class="spinner-border" role="status">
								<span class="visually-hidden">Loading...</span>
							</div>
						</div>
					</div>
					<!-- 선택한 게임 목록 -->
					<div id="selectApps" class="row w-100" style="height: auto">
						<div class="selectApp w-auto ms-3 my-1 badge rounded-pill bg-dark border border-1 border-dark" style="display:none">
							<span data-appid=""></span>
							<span class="selectAppCancel cspointer ms-1">&#10005;</span>
						</div>
						
					</div>
					<div class="row w-100" style="height: auto">
						<!-- 게임 검색 결과 카드 -->
						<div class="col-xl-3 col-lg-4 col-sm-6  text-center p-4" style="display:none">
							<div class="card steamApps cspointer mouse-border-primary" data-selected="false" data-appid="322330">
								<img src="https://cdn.akamai.steamstatic.com/steam/apps/322330/header_alt_assets_23.jpg?t=1624553984" class="card-img-top" alt="">
								<div class="card-body">
									<p class="appname card-text text-dark">Don't Starve Together</p>
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
<div id="cardLeftSetting" class="container mt-5" style="display:none">
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
							<input id="rSidebarMenu4" type="checkbox">
							<label for="rSidebarMenu4"><img class="img-thumbnail" src="/resources/images/testImg/commbar.jpg"></label>
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
			
			<div class="card shadow">
				<div class="card-header text-center">오른쪽 사이드바 설정</div>
				<div class="card-body">
					<div class="row">
						<div class="col-xl-3 col-lg-4 col-md-6">
							<input id="lSidebarMenu1" type="checkbox">
							<label for="lSidebarMenu1"><img class="img-thumbnail" src="/resources/images/testImg/listSample.jpg"></label>
						</div>
						<div class="col-xl-3 col-lg-4 col-md-6">
							<input id="lSidebarMenu2" type="checkbox">
							<label for="lSidebarMenu2"><img class="img-thumbnail" src="/resources/images/testImg/listSample.jpg"></label>
						</div>
						<div class="col-xl-3 col-lg-4 col-md-6">
							<input id="lSidebarMenu3" type="checkbox">
							<label for="lSidebarMenu3"><img class="img-thumbnail" src="/resources/images/testImg/listSample.jpg"></label>
						</div>
						<div class="col-xl-3 col-lg-4 col-md-6">
							<input id="lSidebarMenu4" type="checkbox">
							<label for="lSidebarMenu4"><img class="img-thumbnail" src="/resources/images/testImg/listSample.jpg"></label>
						</div>
						
					</div>
				</div>
			</div>
			
		</div>
	</div>
</div>

</main>


<%@ include file="./mngInclude/footer.jsp"%>