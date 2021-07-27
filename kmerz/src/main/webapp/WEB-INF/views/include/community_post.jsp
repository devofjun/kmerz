<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- post시작 -->
<c:forEach var="PostVo" items="${postList}">
<div id="${PostVo.post_no}">
	<input type="checkbox" id="post-toggleBtn" style="display: none">
	<div class="post border">
		<div class="leftbar bar-color scale-8">
			<div class="like">
				<a href="#"><img class="icon-color rotate-180 " src="/resources/images/icons/arrow_drop_down_circle_black_36dp.svg"></a>
			</div>
			<span>${PostVo.post_recommand}</span>
			<div class="like">
				<a href="#"><img class="icon-color" src="/resources/images/icons/arrow_drop_down_circle_black_36dp.svg"></a>
			</div>
			<div class="BottmNavBar">
				<div class="toggleNav">
					<a href="#"><img class="icon-color" src="/resources/images/icons/chat_bubble_outline_black_36dp.svg"></a>
				</div>
				<div class="toggleNav">
					<a href="#"><img class="icon-color" src="/resources/images/icons/bookmark_border_black_36dp.svg"></a>
				</div>
				<div class="toggleNav">
					<a href="#"><img class="icon-color" src="/resources/images/icons/ios_share_black_36dp.svg"></a>
				</div>
				<div>
					<a href="#"><img class="icon-color" src="/resources/images/icons/more_black_36dp.svg"></a>
				</div>
			</div>
		</div>
		<div class="rightbar">
			<div class="contentTop">
				<div class="postTitle" onclick="openModal(${PostVo.post_no})"><h4 class="icon-color">${PostVo.post_title}</h4></div>
				<div class="communityAdress">
					<a href="#"><img src="/resources/images/starcraft_small.jpg"><span>
					<%-- ${PostVo.category_no} --%>
					<c:forEach var="CategoryVo" items="${categoryList}">
						<c:choose>
							<c:when test="${CategoryVo.category_no == PostVo.category_no}">
								${CategoryVo.category_name}
							</c:when>
						</c:choose>
						
					</c:forEach>
					</span></a> <span>  </span>
					<img src="/resources/images/starcraft_small.jpg">
					<span>${PostVo.user_no}</span><a href="#"></a>

				</div>
			</div>
			<div class="postContent border" onclick="openModal(${PostVo.post_no})">
				<p class="icon-color post-content">
					${PostVo.post_content_file}
				</p>
			</div>



			<div class="postDown" onclick="posttoggle(${PostVo.post_no})">
				<label for="toggleBtn" class="labelBtn" onclick=""> <img src="/resources/images/expand_more_black_24dp.svg"/></label>
			</div>

		</div>
	</div>
</div>
</c:forEach>