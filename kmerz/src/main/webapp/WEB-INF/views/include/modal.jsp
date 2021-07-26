<%@page import="com.kmerz.app.util.ContentReadAndWrite"%>
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
				<div class="modal-content-left-top">
					<div class="recommandation scale-8">
						<div class="like">
							<a href="#"><img class="icon-color rotate-180 "
								src="resources/images/icons/arrow_drop_down_circle_black_36dp.svg"></a>
						</div>
						<span><%=postVo.getPost_recommand()%></span>
						<div class="like">
							<a href="#"><img class="icon-color"
								src="resources/images/icons/arrow_drop_down_circle_black_36dp.svg"></a>
						</div>
					</div>
					<div class="modal-background border">
						<div class="modal-postTitle"><%=postVo.getPost_title()%></div>
						<div class="modal-body">
							<p class="icon-color post-content"><%=ContentReadAndWrite.ReadContent("G:\\workspace\\springmvc\\kmerz\\kmerz\\src\\main\\webapp\\resources\\post\\" + postList.get(i).getPost_content_file())%></p>
						</div>
					</div>
				</div>
				<div class="button-nav">
					<div class="button-nav-btn">
						<a href="#"><img class="icon-color"
							src="resources/images/icons/chat_bubble_outline_black_36dp.svg">Comments</a>
					</div>
					<div class="button-nav-btn">
						<a href="#"><img class="icon-color"
							src="resources/images/icons/bookmark_border_black_36dp.svg">BookMark</a>
					</div>
					<div class="button-nav-btn">
						<a href="#"><img class="icon-color"
							src="resources/images/icons/ios_share_black_36dp.svg">Share</a>
					</div>
					<div class="button-nav-btn">
						<a href="#"><img class="icon-color"
							src="resources/images/icons/outlined_flag_black_36dp.svg">Report</a>
					</div>
				</div>
				<div class="replySection">
					<div class="reply_input">
						<span>Comment This Post</span>
						<%@ include file="reply_input.jsp"%>
					</div>
					<div class="replyNav">
						<span>sort by</span> <select><option>best</option></select>
						<div class="totalReply">
							<span>reply : 2개</span>
						</div>
					</div>
				</div>
				<div class="reply-panel">
					<%@ include file="reply.jsp"%>
				</div>
			</div>
			<div>
				<%@ include file="modal_right.jsp"%>
			</div>
		</div>
	</div>
</div>
