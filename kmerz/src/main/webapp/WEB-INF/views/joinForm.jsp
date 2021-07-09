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
<title>joinForm.jsp</title>
</head>

	<style>
		.wrapper {
		  display: flex;
		  justify-content: center;
		  align-items: center;
		  min-height: 100vh;
		}

		.content {
		  font-family: system-ui, serif;
		  font-size: 2rem;
		  padding: 3rem;
		  border-radius: 1rem;
		  background: #f8f9fa;
		}
/* 		BODY { */
/* 		    min-height: 100%; */
/* 		    background-image: url("https://i.imgur.com/fu3Rgc7.jpg"); */
/* 		    background-position: center center; */
/* 		    background-repeat: no-repeat; */
/* 		    background-size: cover; */
/* 		} */
		body {
			background-color:#dae0e6;
		}
		css* {
			position:fixed;
		}
	</style>
	
<body>
	<main class="wrapper text-center"> <!-- bg-dark text-white -->
		<div class="border content col-md-4">
			<h1 class="display-8">회원가입</h1>
			<form>
				<div class="col-md-12">
					<div class="row">
						<div class="col-md-12 mb-3">
							<input type="text" id="user_email" class="form-control" placeholder="이메일 ex)K-Merz@example.com" required autofocus>
						</div>
						<!-- <div class="col-md-5 mb-3">
							<div>
								<select class="form-control" name="emailType">
		    						<option value="none" selected>== 선택 ==</option>
		    						<option value="@gmail.com">@gmail.com</option>
									<option value="@naver.com">@naver.com</option>
									<option value="@daum.net">@daum.net</option>
		  						</select>
							</div>
						</div> -->
						<div class="col-md-12 mb-3">
							<input type="text" id="user_name" class="form-control" placeholder="닉네임" required>
						</div>
						<div class="col-md-12 mb-3">
							<input type="password" id="user_pw" class="form-control" placeholder="비밀번호" required>
						</div>
						<div class="col-md-12 mb-3">
							<input type="password" id="user_pwChack" class="form-control" placeholder="비밀번호 확인" required>
						</div>
					</div>
				</div>
				<button class="w-50 btn btn-lg" type="submit" style="background-color:#0079d3;color:white">가입</button>
			</form>
		</div>
	</main>
</body>
</html>