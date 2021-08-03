<%@page import="com.kmerz.app.vo.CategoryVo"%>
<%@page import="java.util.List"%>
<%@page import="com.kmerz.app.vo.CommunityVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0 user-scale=no">
<link rel="stylesheet" href="/resources/css/PostingPage.css?ver<%=System.currentTimeMillis()%>">
<link rel="stylesheet" href="/resources/css/header.css?ver5">
<script src="/resources/script/PostingPage.js?ver<%=System.currentTimeMillis()%>"></script>

<title>Posting to KMerz</title>
</head>
<body>
	<div class="modal-section"></div>
	<div>
		<%@ include file="./include/top_menu_bar.jsp"%>
	</div>
	<div class="section">
		<div class="posting-section">
			<div class="posting-input">
				<div class="page-title">
					<span>Create Post</span>
				</div>
				<div id="editfield">
						<%@ include file="./include/editor.jsp"%>
				</div>
				<button class="posting" onclick="posting()">Post</button>
			</div>
			<div class="right-menu">
				<div class="post-rule">
					POSTING - RULE
					<div class="rule-list">
						<ol>
							<li>첫번째</li>
							<li>두번째</li>
							<li>세번째</li>
							<li>네번째</li>
						</ol>
					</div>
				</div>
				<div class="policy">POLICY</div>
			</div>
		</div>
	</div>
</body>
</html>