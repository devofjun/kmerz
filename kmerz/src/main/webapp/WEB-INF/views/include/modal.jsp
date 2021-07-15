<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div id="myModal" class="modal">
	<div class="modal-content">
		<div class="modal-topbar">
			<span class="modal-close" onclick="closeModal()"><ion-icon size="large" name="close-sharp"></ion-icon></span>
		</div>
		<div class="modal-postContent">
			<div class="modal-content-left">
				<div class="modal-background border">
					<div class="modal-postTitle">홍진호 만난 썰 푼다</div>
					<!-- Modal Body -->
					<div class="modal-body">
						<img src="/resources/images/squirrel.png">
						<p>람쥐썬더</p>
					</div>
				</div>
				<div class="replySection">
					<div class="replyNav border">
						<span>sort by</span> <select><option>best</option></select>
						<div class="totalReply">
							<span>reply : 2개</span>
						</div>
					</div>
				</div>
				<script>
					function replytoggle(){
						var replyBtn = document.getElementById("reply-toggleBtn");
						
						replyBtn.click();
						console.log(replyBtn.checked);
					};
					</script>
					<!-- 모달 댓글 양식 -->
					<%@ include file="../include/reply.jsp"%>
			</div>
			<!-- 모달 오른쪽 메뉴 -->
			<div class="modal-content-right margin-8">
				<%@ include file="../include/modal_right.jsp"%>
			</div>
		</div>
	</div>
</div>
