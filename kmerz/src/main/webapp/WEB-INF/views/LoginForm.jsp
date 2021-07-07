<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>LoginForm.jsp</title>
</head>
<body>
	
	<style>
		body,html {
    		height: 100%;
		}
	</style>

	
</head>
<body class="d-flex align-items-center flex-column justify-content-center h-100 text-center "> <!-- bg-dark text-white -->
	<main class="col-md-3">
	<h1 class="display-4">로고이미지</h1>
	<form>
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-1">
					<label for="user_id" class="visually-hidden">ID:</label>
				</div>
				<div class="col-md-11">
					<input type="text" id="user_id" class="form-control" placeholder="아이디를 입력해주세요" required autofocus>
				</div>
				<div class="col-md-1">
					<label for="user_pw" class="visually-hidden">PW:</label>
				</div>
				<div class="col-md-11">
					<input type="password" id="user_pw" class="form-control" placeholder="비밀번호를 입력해주세요" required>
				</div>
			</div>
		</div>
		<div class="checkbox mb-3">
		<label>
			<input type="checkbox" value="saveUser_id">
				아이디 저장
			<a href="#">아이디 또는 비밀번호를 잊으셨나요?</a>
		</label>
		</div>
		<button class="w-100 btn btn-lg btn-primary" type="submit">로그인</button>
		<label>
				Kmerz가 처음이신가요?
			<a href="#">회원가입</a>
		</label>
	</form>
	</main>
</body>
</html>