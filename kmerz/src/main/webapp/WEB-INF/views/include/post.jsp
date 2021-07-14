<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!-- 포스트 DEFAULT 시작 -->
				<input type="checkbox" id="post-toggleBtn" style="display:none" checked>
				<div class="post border">
					<div class="leftbar">
						<div class="like">
							<a href="#"><ion-icon size="large" name="caret-up-circle-outline"></ion-icon></a>
						</div>
							<span>0</span> 
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
							<div class="postTitle" onclick="openModal()">홍진호 만난 썰 푼다</div>
							<div class="communityAdress"><a href="#"><img src="/resources/images/starcraft_small.jpg"><span>스타크래프트</span></a><span> - 3분전 / 작성자
								: </span><a href="#"><img src="/resources/images/starcraft_small.jpg">윤수</a>
							</div>
						</div>
						<div class="postContent border" onclick="openModal()">
							<p>람쥐썬더
							람쥐썬더
							람쥐썬더
							람쥐썬더
							람쥐썬더람쥐썬더람쥐썬더람쥐썬더
							람쥐썬더람쥐썬더람쥐썬더람쥐썬더람쥐썬더</p>
						</div>
						
						
						<div class="postDown" onclick="posttoggle()">
							<label for="toggleBtn" class="labelBtn" onclick="">
								<ion-icon name="chevron-up-outline"></ion-icon></label>
						</div>
						
					</div>
				</div>
				<!-- 포스트 DEFAULT 끝 -->