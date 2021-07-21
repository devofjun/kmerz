<%@page import="com.kmerz.app.vo.MemberVo"%>
<%@page import="com.kmerz.app.vo.CommentVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<CommentVo> mentList = (List<CommentVo>) request.getAttribute("mentList");
%>
<%
	List<MemberVo> memList = (List<MemberVo>) request.getAttribute("memList");
%>
<%
	for (int i = 0; i < mentList.size(); i++) {
%>
<div id="<%=mentList.get(i).getComment_no()%>">
	<input type="checkbox" id="reply-toggleBtn" style="display: none">
	<div class="replyContent">
		<div class="reply-user">
			<div class="reply-user-profile">
				<img src="/resources/images/starcraft_small.jpg">
				<div class="reply-user-status">
					<span class="reply-user-name"> <%
 	for (int j = 0; j < memList.size(); j++) {
 	if (mentList.get(i).getUser_id().equals(memList.get(j).getUser_id())) {
 %> <%=memList.get(j).getUser_name()%> <%
 	}
 }
 %>
					</span>
				</div>
			</div>
			<div class="reply-user-content reply-margin-top"
				onclick="replytoggle(<%=mentList.get(i).getComment_no()%>)">
				<span><%=mentList.get(i).getComment_content()%> </span>
			</div>
			<div class="currentTime reply-margin-top">
				<span>3분전</span>
			</div>
		</div>
			<div class="reply-section">
				

			</div>
	</div>
</div>
<%
	}
%>