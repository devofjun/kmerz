<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/userInfoHeader.jsp"%>
<h3>회원 탈퇴</h3>
</div>
<hr>
<div>
	<!-- 여기가 폼 -->
	<form action="/m/secession" method="post">
		<div style="color:red">
			<p>K-merz 회원 탈퇴를 하시면, 아이디와 개인정보는 즉시 삭제되고 복구가 불가능합니다.</p>
			<p>회원 탈퇴 시 회원 아이디로 작성된 게시물과 댓글은 자동으로 삭제되지 않습니다.</p>
			<p>회원님이 보유 중인 골드는 [0G]입니다. 탈퇴 후 골드는 자동 소멸됩니다.</p>
			<p>회원 탈퇴 후 7일 이내에는 인증받은 동일 이메일로는 회원 가입이 제한됩니다.</p>
		</div>
		<div style="margin-top:40px;">
			<h4>탈퇴 사유</h4>
			<hr>
			<input type = "text" class="form-control">
		</div>
		<div style="margin-top:40px;">
			<h4>비밀번호 확인</h4>
			<hr>
			<input type = "password" class="form-control">
		</div>
		<div style="margin-top:10px;">
			<input type="checkbox">
			해당 내용을 모두 확인했으며, 회원탈퇴에 동의합니다.
		</div>
		<div style="margin-top:40px;">
			<button type="submit" class="btn btn-primary">회원 탈퇴	</button>
		</div>
	</form>
</div>
</div>
</div>
</div>
</div>
</body>
</html>