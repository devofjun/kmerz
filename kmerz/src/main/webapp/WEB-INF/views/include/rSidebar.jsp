<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="/resources/css/rSidebar.css?v8">
<div class="rSidebar sticky">
	<div class="userinfo border sticky">
		<div class="hr">
			<span class="font-24">USER INFO</span>
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
						<div style="float: left; width: 50%;">
							<img style="margin-top:10px" src="/resources/images/default_Profile3.png"
								class="img-thumbnail" alt="...">
						</div>
						<div style="float: left; width: 50%;">
							<div style="float: left; width: 100%;">
								<div style="float: left; width: 50%;">
									<strong>${loginVo.user_name}님</strong>
								</div>
								<div style="float: left; width: 50%;">
									<a href="#"><img
										src="/resources/images/icons/notifications_black_24dp.svg"></a>
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
			<span class="font-24">인기글</span>
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
