<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0 user-scale=no">
<meta charset="UTF-8">
<title>회원정보 페이지</title>
<link rel="stylesheet" href="/resources/css/MainPage.css?ver51">
<link rel="stylesheet" href="/resources/css/lSidebar.css?v11">
<link rel="stylesheet" href="/resources/css/rSidebar.css?v11">
<link rel="stylesheet" href="/resources/css/header.css?">
<link rel="stylesheet" href="/resources/css/font.css?">
<link rel="stylesheet" href="/resources/css/margin.css?">
<link rel="stylesheet" href="/resources/css/slider.css?3">
<link rel="stylesheet" href="/resources/css/icon.css?3">
<link rel="stylesheet" href="/resources/css/transform.css?4">
<link
	href="https://store.akamai.steamstatic.com/public/css/promo/summer2021_sale.css?v=r8ONinfHtGU6&l=koreana"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<style>
#fileDrop {
	width: 20%;
	height: 100px;
	background-color: yellow;
	margin: 20px auto;
	border: 2px dashed blue;
}

.divUploaded {
	width: 150px;
	float: left;
}
</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/resources/script/MainPage.js?ver8"></script>
<script>
$(document).ready(function() {
	$("#fileDrop").on("dragenter dragover", function(e) {
		e.preventDefault();
	});
	
	$("#fileDrop").on("drop", function(e) {
		e.preventDefault();
		console.log(e);
		var file = e.originalEvent.dataTransfer.files[0];
		console.log(file);
		// 이미지파일(바이너리 파일)
		// <form enctype="multipart/form-data">
		// 		<input type="file"/>
		// </form>
		var formData = new FormData(); // <form>
		formData.append("file", file); // <input type="file">
									   // -> 파일을 선택한 상태
		// 파일을 비동기 방식으로 전송
		// enctype="multipart/form-data"
		var url = "/uploadAjax"; // HomeController
		$.ajax({
			"processData" : false,
			"contentType" : false,
			"url" : url,
			"method" : "post",
			"data" : formData,
			"success" : function(receivedData) {
				console.log(receivedData);
				var fileName = receivedData.substring(
						receivedData.lastIndexOf("_") + 1);
				var cloneDiv = $("#uploadedList").prev().clone();
				var img = cloneDiv.find("img");
				// 이미지인 경우
				if (isImage(fileName)) {
					img.attr("src", "http://localhost/displayImage?fileName=" + receivedData);
				}
				cloneDiv.find("span").text(fileName);
				cloneDiv.find(".a_times").attr("href", receivedData);
				$("#uploadedList").append(cloneDiv.show());
			}
		});
	});
	
	// 첨부파일 삭제 링크
	$("#uploadedList").on("click", ".a_times", function(e) {
		e.preventDefault();
		var that = $(this);
		var fileName = $(this).attr("href");
		console.log(fileName);
		var url = "/deleteFile?fileName=" + fileName;
		$.get(url, function(rData) {
			if (rData == "success") {
				that.parent().remove();
			}
		});
	});
	
	// 폼전송
	$("#frmWrite").submit(function() {
		var div = $("#uploadedList .divUploaded");
		$(this).find("[names^=files]").remove();
		div.each(function(index) {
			var fileName = $(this).find(".a_times").attr("href");
			var html = "<input type='hidden' name='files["+index+"]' value='"+fileName+"'/>";
			$("#frmWrite").prepend(html);
		});
		
// 		return false; // 폼전송 막기
	});
});
</script>
</head>

<body>
	<%@ include file="../include/modal.jsp"%>

	<!-- 상단 메뉴바 -->
	<div>
		<%@ include file="../include/top_menu_bar.jsp"%>
	</div>
	<div class="">
		<img src="/resources/images/default_Profile.png">
	</div>
	<div>
		<!-- 첨부파일 -->
		<div>
			<label>첨부할 파일을 드래그 &amp; 드롭하세요.</label>
			<div id="fileDrop"></div>
		</div>

		<!-- // 첨부파일 -->

		<!-- <div style="display: none;" class="divUploaded">
			<img height="100" src="/resources/img/default_image.png"
				class="img-rounded" /><br> <span>default</span> <a href="#"
				class="a_times">&times;</a>
		</div> -->
	</div>

</body>
</html>