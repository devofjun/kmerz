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
<script>
$(document).ready(function() {
	$("#test").click(function(){
		// json 테스트용임
		$.getJSON("/m/listAll",function(rData){
			console.log(rData);
		});
	});
});
</script>
</head>
<body>
	<div id="wallpaper" style="height: 100vh; background-color: #dae0e6">
		<div class="container h-100">
			<div class="row h-100 justify-content-center align-items-center">
				<div class="col-3"></div>
				<div class="col-6">
					<div class="card shadow" style="max-height:100vh;overflow-y:auto">
						<div class="card-header">
							<h4 class="card-title">회원가입</h4>
						</div>
						<div class="card-body">
							<form action="/m/joinRun" method="post">
								<div class="form-group">
									<label for="user_email">이메일</label> <label
										style="color: gray"> ex)K-Merz@example.com</label> <input type="email"
										class="form-control" id="user_email"
										name="user_email" placeholder="이메일" required>
								</div>
								<div class="form-group">

									<label for="user_name"> 닉네임 </label><input
										type="text" class="form-control" id="user_name"
										name="user_name" placeholder="닉네임" required>
								</div>
								<div class="form-group">
									<label for="user_pw">비밀번호</label> <input type="password"
										class="form-control" id="user_pw"
										name="user_pw" placeholder="비밀번호" required>
								</div>
								<div class="form-group">
									<label for="check_pw">비밀번호 확인</label> <input
										type="password" class="form-control" id="check_pw"
										name="check_pw" placeholder="비밀번호 확인">
								</div>
								
								<button class="btn btn-primary" type="submit">가입완료</button>
							</form>
						</div>
					</div>
				</div>
				<div class="col-3"></div>
			</div>
		</div>
	</div>
</body>
</html>