<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
	crossorigin="anonymous"></script>
<!-- <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet"> -->
<!-- <link rel="stylesheet" href="/resources/css/createCommunity.css"> -->
<title>케이머즈 커뮤니티 생성 신청</title>

<script>
	$(document).ready(function() {
		// 이름 입력칸을 벗어 났을때
		$("#community_name").focusout(function() {
			console.log($(this).val());
		});
		
		// 태그 입력칸을 벗어 났을때
		$("#community_tag").focusout(function() {
			console.log($(this).val());
		});
		
		
		$("#btnTest").click(function() {
			console.log("test");
			var url = "/mytest";
			var sendData = {
					"test" : "test"
			};
			$.get(url, sendData, function(){
				console.log("test2");
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
					<div class="card shadow"
						style="max-height: 100vh; overflow-y: auto">
						<div class="card-header">
							<h4 class="card-title">새로운 커뮤니티 설정</h4>
						</div>
						<div class="card-body">
							<form>
								<input type="hidden" id="user_email" name="user_email">
								<!-- is-valid / is-invalid -->
								<div class="form-group">
									<label for="community_name">커뮤니티 이름</label> <input type="text"
										class="form-control" id="community_name" name="community_name"
										placeholder="" required>
									<div class="valid-feedback">사용 가능한 이름입니다!</div>
									<div class="invalid-feedback">사용 할 수 없는 이름입니다.</div>
								</div>
								<div class="form-group">
									<label for="community_tag">커뮤니티 태그 </label> <label
										style="color: gray">http://localhost/c/</label><label
										id="lbl_tag" style="color: gray"></label> <input type="text"
										class="form-control" id="community_tag" name="community_tag"
										placeholder="" required>
									<div class="valid-feedback">사용 할 수 있는 태그입니다.</div>
									<div class="invalid-feedback">사용 할 수 없는 태그입니다.</div>
								</div>
								<div class="form-group">
									<label for="community_topic">주제</label> <input type="text"
										class="form-control" id="community_topic"
										name="community_topic" placeholder="리그오브레전드, 오버워치 등" required>
								</div>
								<div class="form-group">
									<label for="community_description">소개</label>
									<textarea class="form-control" id="exampleFormControlTextarea1" rows="5"
										placeholder="어떤 커뮤니티인지 설명 해주세요." required></textarea>
								</div>

								<button class="btn btn-primary" type="submit">신청</button>
								<button id="btnTest">테스트</button>
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