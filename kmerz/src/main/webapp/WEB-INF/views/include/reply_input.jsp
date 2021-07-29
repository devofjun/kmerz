<%@page import="com.kmerz.app.vo.PostsVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="reply-content">
	<div class="reply-form-input">
		<textarea id="comment_content_<%=request.getAttribute("comment_retag")%>" cols="120" rows="10"></textarea>
	</div>
	<div class="reply-submit">
		<button class="btn">CON</button>
		<button class="btn" onclick="addComment('<%=request.getAttribute("post_no") %>','<%=request.getAttribute("comment_retag")%>')">REPLY</button>
	</div>
</div>