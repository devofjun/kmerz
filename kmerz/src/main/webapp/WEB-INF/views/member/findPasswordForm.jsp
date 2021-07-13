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
<title>findPasswordForm.jsp</title>
</head>
<body>
	<div id="wallpaper" style="height: 100vh; background-color: #dae0e6">
		<div class="container h-100">
			<div class="row h-100 justify-content-center align-items-center">
				<div class="col-3"></div>
				<div class="col-6">
					<div class="card shadow"
						style="max-height: 100vh; overflow-y: auto">
						<div class="card-header">
							<h4 class="card-title">비밀번호 찾기</h4>
						</div>
						<div class="card-body">
							<form>
								<div class="form-group">
									<label for="user_email">이메일</label> <input type="email"
										class="form-control" id="user_email" name="user_email"
										placeholder="이메일을 입력해주세요" required>
								</div>
								<div>
									<button class="btn btn-primary" type="submit">인증코드 발송</button>
								</div>
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