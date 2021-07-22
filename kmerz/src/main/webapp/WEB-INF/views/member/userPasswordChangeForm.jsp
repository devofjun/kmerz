<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/userInfoHeader.jsp"%>
<h3>비밀번호 변경</h3>
</div>
<hr>
<div>
	<!-- 여기가 폼 -->
	<form>
		<div class="mb-3">
			<label for="exampleInputEmail1" class="form-label">Email </label> <input
				type="email" class="form-control" id="exampleInputEmail1"
				aria-describedby="emailHelp" value="${loginVo.user_id}" disabled>
			<div id="emailHelp" class="form-text">We'll never share your
				email with anyone else.</div>
		</div>
		<div class="mb-3">
			<label for="exampleInputPassword1" class="form-label">변경할
				비밀번호</label> <input type="password" class="form-control"
				id="exampleInputPassword1">
		</div>
		<div class="mb-3">
			<label for="exampleInputPassword1" class="form-label">비밀번호 확인</label>
			<input type="password" class="form-control"
				id="exampleInputPassword1">
		</div>
		<button type="submit" class="btn btn-primary">Submit</button>
	</form>
</div>
</div>
</div>
</div>
</div>
</body>
</html>