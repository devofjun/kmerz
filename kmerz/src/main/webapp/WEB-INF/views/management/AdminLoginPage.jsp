<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<!-- JQeury CDN -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>Hello, world!</title>
<script>
	$(document).ready(function() {
		$("#frmLogin").submit(function() {
			
		});
	});
</script>
</head>
<body>
	<div id="wallpaper" style="height: 100vh; background-color: #dae0e6">
		<div class="container h-100 text-center">
			<div class="row h-100 justify-content-center align-items-center">
				<div class="col-4"></div>
				<div class="col-4">
					<div class="card shadow"
						style="max-height: 100vh; overflow-y: auto">
						<div class="card-header">
							<h4 class="card-title h3 mt-2 fw-normal">관리자 로그인</h4>
						</div>
						<div class="card-body">
							<!-- 로그인 폼 -->
							<form id="frmLogin" action="/admin/loginRun" method="post">
								<div class="form-floating mb-1">
									<input type="text" class="form-control" id="admin_id"
										name="admin_id" placeholder="아이디를 입력하세요." required> <label
										for="floatingInput">Admin ID</label>
								</div>
								<div class="form-floating">
									<input type="password" class="form-control" id="admin_pw"
										name="admin_pw" placeholder="비밀번호를 입력해주세요" required> <label
										for="floatingInput">Password</label>
								</div>

								<div class="mt-3 mb-3">
									<button class="w-100 btn btn-lg btn-outline-primary" type="submit">
										<div id="test" class="spinner-border text-primary" role="status"><span class="visually-hidden">Sign in</span></div>
										</button>
								</div>
								<div class="spinner-border text-primary" role="status">
									<span class="visually-hidden">Loading...</span>
								</div>
							</form>
							<!-- //로그인 폼 -->
						</div>
					</div>
				</div>
				<div class="col-4"></div>
			</div>
		</div>
	</div>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>