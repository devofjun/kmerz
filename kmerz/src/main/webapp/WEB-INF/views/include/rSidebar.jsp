<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" href="/resources/css/rSidebar.css?v4">
<div class="rSidebar sticky">
	<div class="userinfo border sticky">
	<div class="border">
		USER INFO
	</div>
		<button onclick="location.href='/loginForm';" id="btnLogin" class="btn btn-stretch btn-border">Sign in</button>
		<button onclick="location.href='/joinForm';" id="btnjoin" class="btn btn-stretch btn-border">Sign up</button>
	</div>
	<div class="hotList border stickyUnderInfo">
		<div class="relatedPost border">
			인기글
		</div>
		<ul>
			<li><a href="#">홍진호 만난 썰 푼다</a></li>
		</ul>
	</div>
</div>
