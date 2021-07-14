<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<input type="checkbox" id="reply-toggleBtn" style="display:none">
					<div class="replyContent">
						<div class="reply-user">
							<div class="reply-user-profile">
								<img src="/resources/images/starcraft_small.jpg">
								<div class="reply-user-status">
									<span>윤수</span>
								</div>
							</div>
							<div class="reply-user-content reply-margin-top" onclick="replytoggle()">
								<span>훠훠훠 </span>
							</div>
							<div class="currentTime reply-margin-top">
								<span>3분전</span>
							</div>
						</div>
						
						<div class="reply-form border">
							<div class="reply-form-userinfo">
								<a href="#"><img src="/resources/images/starcraft_small.jpg"><span>윤수</span></a>
							</div>
							<div class="reply-content">
								<div class="reply-form-input">
									<textarea cols="120" rows="10"></textarea>
								</div>
								<div class="reply-submit">
									<button class="btn">CON</button>
									<button class="btn">REPLY</button>
								</div>
							</div>
						</div>
					</div>