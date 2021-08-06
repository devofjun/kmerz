<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>joinForm.jsp</title>
<script>
	$(document).ready(function() {
		var user_name = "";
		var user_id = "";
		var user_pw = "";
		var check_pw = "";
		$("#user_pw").keyup(function() {
			
			var url = "/m/userNewPwCheck"
			
			var newPw = $("#user_pw").val();
			var newPwCheck = $("#check_pw").val();
			
			var sendData = {
					"newPw" : newPw,
					"newPwCheck" : newPwCheck
			}
			
			$.get(url, sendData, function(rData) {
				console.log(rData);
				if(rData == "nullNewPw") {
					$("#spanPw").text("새 비밀번호를 입력해 주세요.");
				} else {
					$("#spanPw").text("");
				}
			});
		});
		$("#check_pw").keyup(function() {
			
			var url = "/m/userNewPwCheck"
			
			var newPw = $("#user_pw").val();
			var newPwCheck = $("#check_pw").val();
			
			var sendData = {
					"newPw" : newPw,
					"newPwCheck" : newPwCheck
			}
			
			$.get(url, sendData, function(rData) {
				console.log(rData);
				if(rData == "nullNewPw") {
					$("#spanPw").text("새 비밀번호를 입력해 주세요.");
				} else if(rData == "nullNewPwCheck") {
					$("#spanPwCheck").text("새 비밀번호를 확인을 입력해 주세요.");
				} else if(rData == "different") {
					$("#spanPwCheck").text("비밀번호가일치하지 않습니다.");
				} else if(rData == "same") {
					$("#spanPwCheck").text("비밀번호 일치");
				}
			});
		});
		$("#user_name").keyup(function() {
			user_name = $("#user_name").val();
			var sendData = {
					"user_name" : user_name
			}
			var url = "/m/userNameCheck";
			$.get(url, sendData, function(rData) {
				if(rData == "Available") {
					$("#spanName").text("사용가능한 닉네임 입니다.");
				} else if(rData == "unAvailable") {
					$("#spanName").text("이미 사용중인 닉네임 입니다.");
				}
			});
		});
		
		$("#user_id").keyup(function() {
			user_id = $("#user_id").val();
			var sendData = {
					"user_id" : user_id
			}
			var url = "/m/userIdCheck";
			$.get(url, sendData, function(rData) {
				if(rData == "Available") {
					$("#spanId").text("사용가능한 아이디 입니다.");
				} else if(rData == "unAvailable") {
					$("#spanId").text("이미 사용중인 아이디 입니다.");
				}
			});
		});
		$("#btnJoin").click(function() {
			if($("#spanId").text() == "") {
				$("#spanResult").text("아이디 작성해주세요");
			} else if($("#spanId").text() == "이미 사용중인 아이디 입니다.") {
				console.log("사용할 수 없는 아이디 입니다.");
			} else if(user_name != $("#user_name").val()) {
				console.log("중복체크를 다시 해주세요.");
			} else if($("#spanName").text() == "") {
				$("#spanResult").text("닉네임을 작성해주세요");
			} else if($("#spanName").text() == "이미 사용중인 닉네임 입니다.") {
				console.log("사용할 수 없는 닉네임 입니다.");
			} else if(user_name != $("#user_name").val()) {
				console.log("중복체크를 다시 해주세요.");
			} else if($("#spanPw").text() == "새 비밀번호를 입력해 주세요.") {
				console.log("비밀번호 입력할 수 있게 하기.");
			} else if($("#spanPwCheck").text() == "새 비밀번호를 확인을 입력해 주세요.") {
				console.log("새 비밀번호 확인 입력할 수 있게 하기.");
			} else if($("#spanPwCheck").text() == "비밀번호가일치하지 않습니다.") {
				console.log("비밀번호 불일치");
			} else if ($("#spanName").text() == "사용가능한 닉네임 입니다." && $("#spanId").text() == "사용가능한 아이디 입니다." && $("#spanPw").text() == "" && $("#spanPwCheck").text() == "비밀번호 일치") {
				$("#JoinForm").attr("onSubmit", "return true");
				$("#JoinForm").submit();
			}
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
							<h4 class="card-title">회원가입</h4>
						</div>
						<div class="card-body">
							<form id="JoinForm" action="/m/joinRun" method="post" onSubmit="return false;">
								<div class="form-group">
									<label for="user_id">이메일</label> <span style="color:red;" id="spanId"></span>
									<input type="email" class="form-control" id="user_id" name="user_id" placeholder="이메일을 입력해주세요" required>
								</div>
								<div class="form-group">
									<label for="user_name"> 닉네임 </label>
									<span style="color:red;" id="spanName"></span>
									<input type="text"
										class="form-control" id="user_name" name="user_name"
										placeholder="닉네임" required>
								</div>
								<div class="form-group">
									<label for="user_pw">비밀번호</label> <span style="color:red;" id="spanPw"></span>
									<input type="password"
										class="form-control" id="user_pw" name="user_pw"
										placeholder="비밀번호" required>
								</div>
								<div class="form-group">
									<label for="check_pw">비밀번호 확인</label> <span style="color:red;" id="spanPwCheck"></span>
									<input type="password"
										class="form-control" id="check_pw" name="check_pw"
										placeholder="비밀번호 확인" required>
								</div>

								<button class="btn btn-primary" type="submit" id="btnJoin">가입완료</button>
								<span id="spanResult" style = "color:red;"></span>
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