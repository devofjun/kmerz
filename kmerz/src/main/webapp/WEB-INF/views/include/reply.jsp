<%@page import="com.kmerz.app.vo.MemberVo"%>
<%@page import="com.kmerz.app.vo.CommentVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<CommentVo> mentList = (List<CommentVo>) request.getAttribute("mentList");
	System.out.println("댓글리스트"+mentList);
%>
<%
	for (int i = mentList.size() - 1; i > 0; i--) {
%>
<div>
	<div class="replyContent">
		<div class="reply-user">
			<div class="reply-user-profile">
				<img src="/resources/images/starcraft_small.jpg">
				<div class="reply-user-status">
					<span> <%=mentList.get(i).getUser_no()%>
					</span>
				</div>
			</div>
			<div class="reply-user-content reply-margin-top"
				onclick="appendCommentInput('<%=i%>','<%=mentList.get(i).getUser_no()%>','<%=mentList.get(i).getPost_no()%>')">
				<span><%=mentList.get(i).getComment_content()%> </span>
			</div>
			<div class="currentTime reply-margin-top">
				<span>3분전</span>
			</div>
		</div>
		<div class="reply-section" id="reply-section-<%=i%>"></div>
	</div>
</div>
<%
	}
%>