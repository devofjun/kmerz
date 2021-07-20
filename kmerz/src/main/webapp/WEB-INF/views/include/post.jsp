<%@page import="com.kmerz.app.vo.CommunityVo"%>
<%@page import="com.kmerz.app.vo.PostsVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<PostsVo> postList = (List<PostsVo>) request.getAttribute("postList");
	List<CommunityVo> commList = (List<CommunityVo>) request.getAttribute("commList");
%>

<!-- 포스트 DEFAULT 시작 -->

<%
	for (int i = 0; i < postList.size(); i++) {
%>

<div id="<%=postList.get(i).getPost_no()%>">
	<input type="checkbox" id="post-toggleBtn" style="display: none">
	<div class="post border">
		<div class="leftbar bar-color">
			<div class="like scale-8">
				<a href="#"><img class="icon-color rotate-180 " src="resources/images/icons/arrow_drop_down_circle_black_36dp.svg"></a>
			</div>
			<span class="scale-8"><%=postList.get(i).getPost_recommand()%></span>
			<div class="like scale-8">
				<a href="#"><img class="icon-color" src="resources/images/icons/arrow_drop_down_circle_black_36dp.svg"></a>
			</div>
			<div class="BottmNavBar scale-8">
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
				<div class="postTitle" onclick="openModal(<%=postList.get(i).getPost_no()%>)"><h4 class="icon-color"><%=postList.get(i).getPost_title()%></h4></div>
				<div class="communityAdress">

					<a href="#"><img src="/resources/images/starcraft_small.jpg"><span class="font-14"><%for(int j = 0; j < commList.size(); j++){
					if(postList.get(i).getCommunity_id().equals(commList.get(j).getCommunity_id())){%>
						<%=commList.get(j).getCommunity_name()%>
					<%}
					}%></span></a><span>  </span><a href="#"><img
						src="/resources/images/starcraft_small.jpg"><%=postList.get(i).getUser_name()%></a>
				</div>
			</div>
			<div class="postContent border" onclick="openModal(<%=postList.get(i).getPost_no()%>)">
				<p class="icon-color"><%=postList.get(i).getPost_content()%></p>
			</div>



			<div class="postDown" onclick="posttoggle(<%=postList.get(i).getPost_no()%>)">
				<label for="toggleBtn" class="labelBtn" onclick=""> <img src="/resources/images/expand_more_black_24dp.svg"/></label>
			</div>

		</div>
	</div>
</div>
<%
	}
%>

<!-- 포스트 DEFAULT 끝 -->