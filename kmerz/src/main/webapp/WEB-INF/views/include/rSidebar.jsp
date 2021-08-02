<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function() {
	var maxLength = 4;
	var user_name = "${loginVo.user_name}"
	if(user_name.length > maxLength) {
		var fName = user_name.substr(0,3) + ".님";
		$("#user_name").text(fName);
	}
});
</script>
<link rel="stylesheet" href="/resources/css/rSidebar.css?v8">
<div class="rSidebar sticky">
	<div class="userinfo border sticky">
		<div class="hr">
			<span class="font-18">USER INFO</span>
		</div>
		<c:choose>
			<c:when test="${empty sessionScope.loginVo}">
				<div>
					<button onclick="location.href='/m/loginForm';" id="btnLogin"
						class="btn btn-stretch btn-border">Sign in</button>
					<button onclick="location.href='/m/joinForm';"
						class="btn btn-stretch btn-border">Sign up</button>
				</div>
			</c:when>
			<c:otherwise>
				<div>
					<div>
						<div style="float: left; width: 40%;">
						<c:choose>
							<c:when test="${empty loginVo.user_profileImage}">
								<img style="margin-top:10px" src="/resources/images/default_Profile3.png"
								class="img-thumbnail" alt="...">
							</c:when>
							<c:otherwise>
								<img style="margin-top:10px" src="http://localhost/media/displayImage?fileName=${loginVo.user_profileImage}"
								class="img-thumbnail" alt="...">
							</c:otherwise>
						</c:choose>
						</div>
						<div style="float: left; width: 60%;">
							<div style="float: left; width: 100%;">
								<div style="float: left; width: 50%;">
								<%-- <c:choose>
									<c:when test="${loginVo.user_name.length < 5}"> --%>
										<strong id="user_name">${loginVo.user_name}님</strong>
									<%-- </c:when>
									<c:otherwise> --%>
										<%-- <strong>${loginVo.user_name}님</strong>
									</c:otherwise>
								</c:choose> --%>
								</div>
								<!-- 메시지가 있을때 black 이미지 사용 -->
								<div style="float: left; width: 25%;">
									<a href="#"><img
										src="/resources/images/icons/notifications_black_24dp.svg"></a>
								</div>
								<!-- 메시지가 있을때 active 이미지 사용 -->
								<div style="float: left; width: 25%;">
									<a href="#"><img
										src="/resources/images/icons/notifications_active_black_24dp.svg"></a>
								</div>
							</div>
							<div style="float: left; width: 100%;">
								<div style="float: left; width: 50%;">개시글:</div>
								<div style="float: left; width: 50%;">
									<a href="#">${userPostCount}개</a>
								</div>
							</div>
							<div style="float: left; width: 100%;">
								<div style="float: left; width: 50%;">댓글:</div>
								<div style="float: left; width: 50%;">
									<a href="#">${userCommentCount}개</a>
								</div>
							</div>
							<div style="float: left; width: 100%;">
								<div style="float: left; width: 50%;">골드:</div>
								<div style="float: left; width: 50%;">
									<a href="#">0G</a>
								</div>
							</div>
						</div>
					</div>
					<div style="float: left; width: 50%;">
						<a href="/m/logoutRun" class="btn btn-primary btn-sm">로그아웃</a>
					</div>
					<div style="float: left; width: 50%;">
						<a href="/m/userInfo" class="btn btn-primary btn-sm">회원정보</a>
					</div>
					<!-- <a class="btn btn-stretch btn-border" href="/m/logoutRun">LOGOUT</a> -->
				</div>
			</c:otherwise>
		</c:choose>
	</div>
	<div class="hotList border stickyUnderInfo">
		<div class="relatedPost hr">
			<span class="font-18">인기글</span>
		</div>
		<ol>
			<li><a href="#">인기글1</a></li>
			<li><a href="#">인기글2</a></li>
			<li><a href="#">인기글3</a></li>
			<li><a href="#">인기글4</a></li>
			<li><a href="#">인기글5</a></li>
			<li><a href="#">인기글6</a></li>
			<li><a href="#">인기글7</a></li>
			<li><a href="#">인기글8</a></li>
			<li><a href="#">인기글9</a></li>
			<li><a href="#">인기글10</a></li>
		</ol>
	</div>
</div>
