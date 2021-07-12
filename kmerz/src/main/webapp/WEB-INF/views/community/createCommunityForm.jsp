<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.6.0/js/bootstrap.min.js"></script>
<!-- <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet"> -->
<!-- <link rel="stylesheet" href="/resources/css/createCommunity.css"> -->
<title>케이머즈 커뮤니티 생성 신청</title>

</head>
<body>
	<div id="wallpaper" style="height: 100vh; background-color: #dae0e6">
		<div class="container h-100">
			<div class="row h-100 justify-content-center align-items-center">
				<div class="col-3"></div>
				<div class="col-6">
					<div class="card shadow" style="max-height:100vh;overflow-y:auto">
						<div class="card-header">
							<h4 class="card-title">새로운 커뮤니티 설정</h4>
						</div>
						<div class="card-body">
							<form>
								<div class="form-group">
									<label for="community_name">커뮤니티 이름</label> <input type="text"
										class="form-control is-invalid" id="community_name"
										name="community_name" placeholder="" required>
									<div class="invalid-feedback">사용 할 수 없는 이름입니다.</div>
								</div>
								<div class="form-group">

									<label for="community_tag">커뮤니티 태그 </label> <label
										style="color: gray">http://localhost/c/</label><label
										id="lbl_tag" style="color: gray">test</label> <input
										type="text" class="form-control is-valid" id="community_tag"
										name="community_tag" placeholder="" required>
									<div class="valid-feedback">사용 할 수 있는 태그입니다.</div>
								</div>
								<div class="form-group">
									<label for="community_topic">주제</label> <input type="text"
										class="form-control" id="community_topic"
										name="community_topic" placeholder="Example input" required>
								</div>
								<div class="form-group">
									<label for="community_description">설명</label> <input
										type="text" class="form-control" id="community_description"
										name="community_description" placeholder="Example input">
								</div>
								
								<button class="btn btn-primary" type="submit">Submit
									form</button>
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