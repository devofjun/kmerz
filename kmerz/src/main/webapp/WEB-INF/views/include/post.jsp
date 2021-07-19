<%@page import="com.kmerz.app.vo.MemberVo"%>
<%@page import="com.kmerz.app.vo.PostsVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<PostsVo> postList = (List<PostsVo>) request.getAttribute("postList");
	List<MemberVo> memList = (List<MemberVo>) request.getAttribute("memList");
%>

<!-- 포스트 DEFAULT 시작 -->

<%
	for (int i = 0; i < postList.size(); i++) {
%>

<div id="<%=i%>">
	<input type="checkbox" id="post-toggleBtn" style="display: none">
	<div class="post border">
		<div class="leftbar bar-color scale-8">
			<div class="like">
				<a href="#"><img class="icon-color rotate-180 " src="resources/images/icons/arrow_drop_down_circle_black_36dp.svg"></a>
			</div>
			<span><%=postList.get(i).getPost_recommand()%></span>
			<div class="like">
				<a href="#"><img class="icon-color" src="resources/images/icons/arrow_drop_down_circle_black_36dp.svg"></a>
			</div>
			<div class="BottmNavBar">
				<div class="toggleNav">
					<a href="#"><img class="icon-color" src="resources/images/icons/chat_bubble_outline_black_36dp.svg"></a>
				</div>
				<div class="toggleNav">
					<a href="#"><img class="icon-color" src="resources/images/icons/bookmark_border_black_36dp.svg"></a>
				</div>
				<div class="toggleNav">
					<a href="#"><img class="icon-color" src="resources/images/icons/ios_share_black_36dp.svg"></a>
				</div>
				<div>
					<a href="#"><img class="icon-color" src="resources/images/icons/more_black_36dp.svg"></a>
				</div>
			</div>
		</div>
		<div class="rightbar">
			<div class="contentTop">
				<div class="postTitle" onclick="openModal()"><h4 class="icon-color"><%=postList.get(i).getPost_title()%></h4></div>
				<div class="communityAdress">
					<a href="#"><img src="/resources/images/starcraft_small.jpg"><span><%=postList.get(i).getCommunity_name()%></span></a><span>
						- 3분전 / 작성자 : </span><a href="#"><img
						src="/resources/images/starcraft_small.jpg"><%for(int j = 0; j < memList.size(); j++){
																									if(postList.get(i).getUser_id().equals(memList.get(j).getUser_id())){%>
																										<%=memList.get(j).getUser_name()%>
																									<%} 
																						}%></a>
				</div>
			</div>
			<div class="postContent border" onclick="openModal()">
				<p class="icon-color"><%=postList.get(i).getPost_content()%></p>
			</div>



			<div class="postDown" onclick="posttoggle(<%=i%>)">
				<label for="toggleBtn" class="labelBtn" onclick=""> <img src="/resources/images/expand_more_black_24dp.svg"/></label>
			</div>

		</div>
	</div>
</div>
<%
	}
%>

<!-- 포스트 DEFAULT 끝 -->