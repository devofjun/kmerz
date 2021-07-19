<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="/resources/css/rSidebar.css?v5">
<div class="rSidebar sticky">
	<div class="userinfo border sticky">
		<div class="hr">
			<span class="font-24">USER INFO</span>
		</div>
	<c:choose>
		<c:when test="${empty sessionScope.loginVo}">
		<div>
			<button onclick="location.href='/m/loginForm';" id="btnLogin" class="btn btn-stretch btn-border">Sign in</button>
			<button onclick="location.href='/m/joinForm';" class="btn btn-stretch btn-border">Sign up</button>
		</div>
		</c:when>
		<c:otherwise>
			<span>${loginVo.user_name}님 환영합니다.</span>
			<button id="btnLogout" class="btn btn-stretch btn-border">Logout</button>
		</c:otherwise>
	</c:choose>
	</div>
	<div class="hotList border stickyUnderInfo">
		<div class="relatedPost hr">
			<span class="font-24">인기글</span>
		</div>
		<ul>
			<li><a href="#">홍진호 만난 썰 푼다</a></li>
		</ul>
	</div>
</div>
