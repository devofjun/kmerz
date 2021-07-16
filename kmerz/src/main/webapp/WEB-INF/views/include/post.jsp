<%@page import="com.kmerz.app.vo.PostsVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%List<PostsVo> postList = (List<PostsVo>)request.getAttribute("postList"); %>

<!-- 포스트 DEFAULT 시작 -->
<div>
			<%for(int i = 0; i < postList.size(); i++){ %>
				<input type="checkbox" id="post-toggleBtn" style="display:none" checked>
				<div class="post border">
					<div class="leftbar">
						<div class="like">
							<a href="#"><ion-icon size="large" name="caret-up-circle-outline"></ion-icon></a>
						</div>
							<span><%=postList.get(i).getPost_recommandation() %></span> 
						<div class="like">
							<a href="#"><ion-icon size="large" name="caret-down-circle-outline"></ion-icon></a>
						</div>
						<div class="BottmNavBar">
							<div class="toggleNav">
								<a href="#"><ion-icon size="large" name="chatbox-outline"></ion-icon></a> 
							</div>
							<div class="toggleNav">
								<a	href="#"><ion-icon size="large" name="bookmark-outline"></ion-icon></a>
							</div>
							<div class="toggleNav">
								 <a href="#"><ion-icon size="large" name="open-outline"></ion-icon></a> 
							 </div>
							 <div>
							 	<a href="#"><ion-icon size="large" name="ellipsis-horizontal-circle-outline"></ion-icon></a>
							</div>
						</div>
					</div>
					<div class="rightbar">
						<div class="contentTop">
							<div class="postTitle" onclick="openModal()"><%=postList.get(i).getPost_title() %></div>
							<div class="communityAdress"><a href="#"><img src="/resources/images/starcraft_small.jpg"><span><%=postList.get(i).getCategory_id() %></span></a><span> - 3분전 / 작성자
								: </span><a href="#"><img src="/resources/images/starcraft_small.jpg"><%=postList.get(i).getUser_id() %></a>
							</div>
						</div>
						<div class="postContent border" onclick="openModal()">
							<p><%=postList.get(i).getPost_content() %></p>
						</div>
						
						
						<div class="postDown" onclick="posttoggle()">
							<label for="toggleBtn" class="labelBtn" onclick="">
								<ion-icon name="chevron-up-outline"></ion-icon></label>
						</div>
						
					</div>
				</div>
				<%} %>
				</div>
				<!-- 포스트 DEFAULT 끝 -->