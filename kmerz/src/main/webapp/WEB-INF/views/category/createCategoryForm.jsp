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

<title>카테고리 생성폼</title>

</head>

<body>
	<div id="wallpaper" style="height: 100vh; background-color: #dae0e6">
		<div class="container h-100">
			<div class="row h-100 justify-content-center align-items-center">
				<div class="col-3"></div>
				<div class="col-6">
					<div class="card shadow" style="max-height:100vh;overflow-y:auto">
						<div class="card-header">
							<h4 class="card-title">카테고리 생성</h4>
						</div>
						<div class="card-body">
							<form action="/m/loginRun" method="post">
								<div class="form-group">
									<label for="category_name">카테고리 이름</label> <input type="text"
										class="form-control" id="category_name"
										name="category_name" placeholder="카테고리 이름을 정해주세요" required>
								</div>
								<div class="form-group">
									<label for="category_description">카테고리 설명</label> <input type="text"
										class="form-control" id="category_description"
										name="category_description" placeholder="카테고리 설명을 작성해주세요" required>
								</div>
								<div>
									<button class="btn btn-primary" type="submit">신청</button>
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