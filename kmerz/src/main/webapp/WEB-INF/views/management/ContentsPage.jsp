<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="./mngInclude/header.jsp"%>
<style>
.cspointer {
	cursor:pointer;
}
.v-m-parent {
	display:table;
}
.v-m-child {
	display:table-cell;
	vertical-align:middle;
}
</style>
<script>
$(document).ready(function() {
	// steam app list 담을 변수
	var steamJson
	
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
		var setting = $(this).attr("data-sample");
		
		// 미리보기 영역 셋팅
		var title = $(this).children('span').text();
		$("#previewTitle").text(title+" 미리보기");
		$("#previewContent").empty();
		
		// 설정 선택 영역 셋팅
		$("#cardBannerSetting").hide();
		$("#cardLeftSetting").hide();
		$("#cardRightSetting").hide();
		switch(setting){
		case "banner":
			// 배너설정 영역 클릭시
			// 미리보기 영역
			
			// 설정 선택 영역
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
		$("#btnSearchType").attr("data-SearchType", $(this).attr("href"));
		$("#btnSearchType").text($(this).text());
	});
	
	// 검색창 엔터
	$("#textAppSearch").keypress(function(e){
		if(e.keyCode==13){
			$("#btnAppSearch").trigger("click");
		}
	})
	
	// 게임 검색 버튼 클릭
	$("#btnAppSearch").click(function(){
		$("#searchingSpinner").show();
		// 게임id 검색
		var searchWord = $(this).prev().val();
		var searchType = $("#btnSearchType").attr("data-searchType");
		
		var url = "/media/steam/searchApp";
		
		// traditional => 배열로 넘겨 주고 싶다면 true
		$.ajax({
			url				:url,
			type			:"POST",
			traditional		:true,
			data			:"json",
			data:{
				"searchType":searchType,
				"searchWord":searchWord
			},
			error:function(){
				console.log("fail");
				$("#searchingSpinner").hide();
			},
			success:function(rData){
				//console.log(rData);
				// 검색 결과였던 카드들을 지워줘야함.
				//console.log($(".appCard").length);
				var appCardFirst = $(".appCard:first").clone();
				$(".appCards").empty();
				$(".appCards").append(appCardFirst);
				$.each(rData, function(){
					var cloneDivCard = $(".appCard:first").clone();
					var card = cloneDivCard.find(".card");
					var cardInfo = card.find(".appInfo");
					
					card.find("img").attr("src",this.imgPath);
					card.find(".card-body > p").text(this.name);
					
					cardInfo.find("form > input[name='appid']").val(this.appid);
					cardInfo.find("form > input[name='name']").val(this.name);
					cardInfo.find("form > input[name='description']").val(this.description);
					cardInfo.find("form > input[name='imgPath']").val(this.imgPath);
					cardInfo.find("form > input[name='appPrice']").val(this.appPrice);
					cardInfo.find("form > input[name='appMovie']").val(this.appMovie);
					
					$(".appCards").append(cloneDivCard);
					cloneDivCard.show();
				});
				$("#searchingSpinner").hide();
			}
		});
		
		
	});
	
	
	// 배너 스팀 게임 선택
	$(".appCards").on("click", ".card", function(){
		var cardAppid = $(this).find(".appInfo > form > input[name='appid']").val();
		var cardAppInfo = $(this).find(".appInfo").clone();
		//console.log(cardAppInfo.find("input[name='appid']").val());
		
		var count = 0;
		var length = $(".selectApp").length;
		for(var i=0; i<length; i++){
			if(cardAppid == $(".selectApp").eq(i).find("input[name='appid']").val()){
				count++;
				$(".selectApp").eq(i).remove();
			}
		}
		if(count <= 0){
			var cloneBadge = $("#selectApps > .selectApp:first").clone();
			cloneBadge.find(".appInfo").remove();
			cloneBadge.append(cardAppInfo);
			
			var cardAppName = cloneBadge.find("input[name='name']").val();
			cloneBadge.find("span:first").text(cardAppName);
			
			$("#selectApps").append(cloneBadge);
			cloneBadge.show();
		}
	});
	
	// 배너 게임 선택취소("X")버튼 눌렀을때
	$("#selectApps").on("click", ".selectAppCancel", function() {
		var appid = $(this).prev().attr("data-appid");
		$(this).parent().remove();
		
		var count = $(".appCard").length;
		for(var i=0; i<count; i++){
			var cardAppid = $(".appInfo > form > input[name='appid']").val();
			if(appid == cardAppid){
				$(".appCard").eq(i).find(".card").attr("data-selected","false");
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
		<div class="col-xl-4 text-center">
			<div class="card shadow h-100" style="border-color: #ffe69c;">
				<div class="card-header"
					style="background-color: #ffe69c; border-color: #ffe69c">설정
					영역</div>
				<div class="card-body">
					<div class="container h-100">
						<div class="row">
							<div
								class="sample mouse-border-primary row bg-light border border-1 rounded-1 p-3 m-1 v-m-parent"
								data-sample="banner">
								<span class="v-m-child">Banner</span>
							</div>
						</div>
						<div class="row h-75">
							<div class="sample mouse-border-primary col-3 bg-light border border-1 rounded-1 v-m-parent"
								data-sample="left">
								<span class="v-m-child">Left</span>
							</div>
							<div class="col-6 v-m-parent">
								<span class="v-m-child">게시물</span>
							</div>
							<div class="sample mouse-border-primary col-3 bg-light border border-1 rounded-1 v-m-parent"
								data-sample="right">
								<span class="v-m-child">Right</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="col-xl-8">
			<div class="card shadow">
				<div id="previewTitle" class="card-header text-center">배너 미리보기</div>
					<div style="background-color:red; height:300px">
					</div>
				<div id="previewContent" class="card-body"></div>
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
								data-searchType="searchName">게임 이름</button>
							<ul id="ulSearchType" class="dropdown-menu">
								<li><a class="dropdown-item" href="searchId">게임ID</a></li>
								<li><a class="dropdown-item" href="searchName">게임이름</a></li>
							</ul>
							
							<input id="textAppSearch" type="text" class="form-control"
								aria-label="Text input with dropdown button">
							<button id="btnAppSearch" class="btn btn-secondary" type="button">검색</button>
							
						</div>
						
					</div>
					
					<!-- 선택한 게임 목록 -->
					<div id="selectApps" class="row w-100" style="height: auto">
						<div class="selectApp w-auto ms-3 my-1 badge rounded-pill bg-dark border border-1 border-dark" style="display:none">
							<span></span>
							<span class="selectAppCancel cspointer ms-1">&#10005;</span>
							<div class="appInfo"style="display:none">
								<form>
									<input type="hidden" name="appid" value=""/>
									<input type="hidden" name="name" value=""/>
									<input type="hidden" name="description" value=""/>
									<input type="hidden" name="imgPath" value=""/>
									<input type="hidden" name="appPrice" value=""/>
									<input type="hidden" name="appMovie" value=""/>
								</form>
							</div>
						</div>	
					</div>
					
					<!-- 검색 로딩바 -->
					<div id="searchingSpinner" class="row w-100 h-auto" style="display:none">
						<div class="text-center mt-3">
							<div class="spinner-border" role="status">
								<span class="visually-hidden">Loading...</span>
							</div>
						</div>
					</div>
					
					<div class="appCards row w-100" style="height: auto">
						<!-- 게임 검색 결과 카드 -->
						<div class="appCard col-xl-3 col-lg-4 col-sm-6  text-center p-4" style="display:none">
							<div class="card cspointer mouse-border-primary">
								<img src="https://cdn.akamai.steamstatic.com/steam/apps/322330/header_alt_assets_23.jpg?t=1624553984" class="card-img-top" alt="">
								<div class="card-body">
									<p class="appname card-text text-dark">Don't Starve Together</p>
								</div>
								<div class="appInfo"style="display:none">
									<form>
										<input type="hidden" name="appid" value=""/>
										<input type="hidden" name="name" value=""/>
										<input type="hidden" name="description" value=""/>
										<input type="hidden" name="imgPath" value=""/>
										<input type="hidden" name="appPrice" value=""/>
										<input type="hidden" name="appMovie" value=""/>
									</form>
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