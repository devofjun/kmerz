<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/css/rSidebar.css?v5">
<div class="rSidebar sticky">
	<div class="userinfo border sticky">
	<c:choose>
		<c:when test="${empty sessionScope.loginVo}">
			<div class="hr">
			USER INFO
		</div>
		<div>
			<button onclick="location.href='/m/loginForm';" id="btnLogin" class="btn btn-stretch btn-border">Sign in</button>
			<button onclick="location.href='/m/joinForm';" class="btn btn-stretch btn-border">Sign up</button>
		</div>
		</c:when>
		<c:otherwise>
			
			<button onclick="location.href='/m/loginForm';" id="btnLogin" class="btn btn-stretch btn-border">Logout</button>
		</c:otherwise>
	</c:choose>
	</div>
	<div class="hotList border stickyUnderInfo">
		<div class="relatedPost hr">
			인기글
		</div>
		<ul>
			<li><a href="#">홍진호 만난 썰 푼다</a></li>
		</ul>
	</div>
</div>
