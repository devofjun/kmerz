<%@page import="com.kmerz.app.vo.CommunityVo"%>
<%@page import="com.kmerz.app.vo.PostsVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	PostsVo postVo = (PostsVo) request.getAttribute("postVo");
%>
<div id="myModal" class="modal">
	<div class="modal-content">
		<div class="modal-topbar">
			<span class="modal-close" onclick="closeModal()"><ion-icon
					size="large" name="close-sharp"></ion-icon></span>
		</div>
		<div class="modal-postContent">
			<div class="modal-content-left">
				<div class="modal-background border">
					<div class="modal-postTitle"><%=postVo.getPost_title() %></div>
					<div class="modal-body">
						<img src="/resources/images/squirrel.png">
						<p><%=postVo.getPost_content_file() %></p>
					</div>
				</div>
				<div class="replySection">
					<div class="replyNav border">
						<span>sort by</span> <select><option>best</option></select>
						<div class="totalReply">
							<span>reply : 2개</span>
						</div>
					</div>
				</div>
				<div>
				<%@ include file="reply.jsp" %>
				</div>
			</div>
			<div>
			<%@ include file="modal_right.jsp" %>
			</div>
		</div>
	</div>
</div>
