<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/userInfoHeader.jsp"%>
<script>
$(document).ready(function() {
	var user_name = "";
	$("#user_name").keyup(function() {
//		console.log("click");
		user_name = $("#user_name").val();
//		console.log("requestName: " + requestName);
		var sendData = {
				"user_name" : user_name
		}
//		console.log("sendData:" + sendData);
		var url = "/m/userNameCheck";
		
		$.get(url, sendData, function(rData) {
			if(rData == "Available") {
				$("#spanMessage").text("사용가능한 닉네임 입니다.");
			} else if(rData == "unAvailable") {
				$("#spanMessage").text("이미 사용중인 닉네임 입니다.");
			}
		});
	});
	$("#btnChangeUserName").click(function() {
		if($("#spanMessage").text() == "") {
			$("#span").text("닉네임을 바꿔주세요");
		} else if($("#spanMessage").text() == "이미 사용중인 닉네임 입니다.") {
			console.log("사용할 수 없는 닉네임 입니다.");
		} else if(user_name != $("#user_name").val()) {
			console.log("중복체크를 다시 해주세요.");
		} else if ($("#spanMessage").text() == "사용가능한 닉네임 입니다.") {
			alert("수정완료");
			$("#changeUserNameForm").submit();
		}
	});
});
</script>
<h3>개인정보 변경</h3>
</div>
<hr>
<div>
	<!-- 여기가 폼 -->
	<form id="changeUserNameForm" action="/m/changeUserName" method="get">
		<div class="mb-3 form-group">
			<label for="exampleInputEmail1" class="form-label">Email </label> <input
				type="email" class="form-control" id="exampleInputEmail1"
				aria-describedby="emailHelp" value="${loginVo.user_id}" disabled>
			<div id="emailHelp" class="form-text">We'll never share your
				email with anyone else.</div>
		</div>
		<div class="mb-3 form-group">
			<label style="float:left; margin-top:5px; margin-right:5px;"
				for="user_name" class="form-label">닉네임</label>
			<!-- <button style="float:left;" type="button" class="btn btn-primary btn-sm"
					id="btnUserNameCheck">중복 확인</button> -->
			<span style="float:left; margin-top:5px; color:red;" id = "spanMessage" value=""></span>
			<input type="text" class="form-control" id="user_name" name="user_name"
				value="${loginVo.user_name}">
		</div>
		<div>
			<button type="button" class="btn btn-primary btn-sm" id="btnChangeUserName"
					style="float:left; margin-top:5px; margin-right:5px;">변경</button>
			<span style="float:left; margin-top:5px; color:red;" id="span" value=""></span>
		</div>
	</form>
</div>
</div>
</div>
</div>
</div>
</body>
</html>