<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
		<div class="mb-3" style="margin-top:50px">
			<h2>회원정보 수정</h2>
		</div>
	<form>
		<div class="mb-3">
			<label for="exampleInputEmail1" class="form-label">이메일
				</label> <input type="email" class="form-control"
				id="exampleInputEmail1" aria-describedby="emailHelp" value="${loginVo.user_id}">
			<div id="emailHelp" class="form-text">We'll never share your
				email with anyone else.</div>
		</div>
		<div class="mb-3">
			<label for="exampleInputPassword1" class="form-label">닉네임</label>
			<input type="text" class="form-control"
				id="exampleInputPassword1" value="${loginVo.user_name}">
		</div>
		<button type="submit" class="btn btn-primary">Submit</button>
	</form>