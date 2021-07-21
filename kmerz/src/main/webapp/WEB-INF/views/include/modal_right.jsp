<%@page import="com.kmerz.app.vo.CommunityVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%CommunityVo commVo = (CommunityVo)request.getAttribute("commVo"); %>
				<div class="modal-community-info border">
				<div>
					<div id="community-name">
						<a href="#"><img src="/resources/images/starcraft_small.jpg"><span class="font-30"><%=commVo.getCommunity_name() %></span></a>
					</div>
				</div>
					<div class="community-desc">
						<%=commVo.getCommunity_description() %>
					</div>
					<div class="community-count align-center">
						<div class="member-count width-50 align-center align-column" >
							<label>가입된 유저수</label>
							<span>10명</span>
						</div>
						<div class="online-count width-50 align-center align-column">
							<label>온라인 유저수</label>
							<span>5명</span>
						</div>
					</div>
					<div class="community-since align-center align-row">
						<label class="font-26">개설된 날짜</label>
						<span class="font-18">2021년 07월 14일</span>
					</div>
					<div class="btn width-100 align-center">
						<button class="btn">가입</button>
					</div>
				</div>		