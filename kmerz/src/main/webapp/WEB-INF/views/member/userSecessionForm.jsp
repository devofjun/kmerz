<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/userInfoHeader.jsp"%>
<script>
	$(document).ready(function() {
		$("#btnSecession").click(function() {
			// console.log("click");
			var user_Pw = $("#user_Pw").val();
			var url = "/m/userNowPwCheck"
			var sendData = {
				"nowPw" : user_Pw
			}
			$.get(url, sendData, function(rData) {
				if (rData == "same") {
					console.log("비밀번호 맞음");
					if ($("#check").prop("checked") == true) {
						console.log("여기서 폼을 전송하면 될듯");
						$("#layerpop").modal("show");
						// $("#userSecessionForm").submit();
					} else {
						console.log("동의 체크 안함");
					}
				} else {
					console.log("비밀번호 다름");
				}
			});
		});
		$("#btnYes").click(function() {
			$("#userSecessionForm").submit();
		});
		$("#btnNo").click(function() {
			$('#layerpop').modal("hide");
		});
	});
</script>
<!-- Modal -->
<div class="modal fade" id="layerpop">
	<div class="modal-dialog" style="max-width: 100%; width: auto; display: table;">
		<div class="modal-content">
			<!-- header -->
			<div class="modal-header">
				<!-- header title -->
				<h4 class="modal-title">정말로 회원 탈퇴를 하시겠습니까?</h4>
			</div>
			<!-- body -->
			<div class="modal-body"></div>
			<!-- Footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal" id="btnYes">예</button>
				<button type="button" class="btn btn-primary" data-dismiss="modal" id="btnNo">아니요</button>
			</div>
		</div>
	</div>
</div>
<h3>회원 탈퇴</h3>
</div>
<hr>
<div>
	<!-- 여기가 폼 -->
	<form id="userSecessionForm" action="/m/secession" method="post">
		<div style="color: red">
			<p>K-merz 회원 탈퇴를 하시면, 아이디와 개인정보는 즉시 삭제되고 복구가 불가능합니다.</p>
			<p>회원 탈퇴 시 회원 아이디로 작성된 게시물과 댓글은 자동으로 삭제되지 않습니다.</p>
			<p>회원님이 보유 중인 골드는 [0G]입니다. 탈퇴 후 골드는 자동 소멸됩니다.</p>
			<p>회원 탈퇴 후 7일 이내에는 인증받은 동일 이메일로는 회원 가입이 제한됩니다.</p>
		</div>
		<div style="margin-top: 40px;">
			<h4>탈퇴 사유</h4>
			<hr>
			<input type="text" class="form-control" id="reasonForSecession" name="reasonForSecession">
		</div>
		<div style="margin-top: 40px;">
			<h4>비밀번호 확인</h4>
			<hr>
			<input type="password" class="form-control" id="user_Pw">
		</div>
		<div style="margin-top: 10px;">
			<input type="checkbox" id="check"> 해당 내용을 모두 확인했으며, 회원탈퇴에
			동의합니다.
		</div>
		<div style="margin-top: 40px;">
			<button type="button" class="btn btn-primary" id="btnSecession">회원
				탈퇴</button>
		</div>
	</form>
</div>
</div>
</div>
</div>
</div>
</body>
</html>