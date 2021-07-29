<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/userInfoHeader.jsp"%>
<script>
	$(document).ready(function() {
		$("#newPwCheck").keyup(function() {
			
			var url = "/m/userNewPwCheck"
			
			var newPw = $("#newPw").val();
			var newPwCheck = $("#newPwCheck").val();
			
			var sendData = {
					"newPw" : newPw,
					"newPwCheck" : newPwCheck
			}
			
			$.get(url, sendData, function(rData) {
				console.log(rData);
				if(rData == "nullNewPw") {
					$("#span").css("color","greay");
					$("#span").text("새 비밀번호를 입력해 주세요.");
				} else if(rData == "nullNewPwCheck") {
					$("#span").css("color","greay");
					$("#span").text("새 비밀번호를 확인을 입력해 주세요.");
				} else if(rData == "different") {
					$("#span").css("color","red");
					$("#span").text("비밀번호가일치하지 않습니다.");
				} else if(rData == "same") {
					$("#span").text("");
				}
			});
		});
		
		$("#btnChangePw").click(function() {
			if($("span").text() == "비밀번호를 다시 입력해 주세요.") {
				
			} else if($("#span").text() == "새 비밀번호를 입력해 주세요.") {
				
			} else if($("#span").text() == "새 비밀번호를 확인을 입력해 주세요.") {
				
			} else if($("#span").text() == "비밀번호가일치하지 않습니다.") {
				
			} else if($("#span").text() == "") {
				var nowPw = $("#nowPw").val();
				var url = "/m/userNowPwCheck"
				var sendData = {
						"nowPw" : nowPw
				}
				$.get(url, sendData, function(rData) {
					if(rData == "same") {
						$("#changeUserPwForm").submit();
					} else {
						
					}
				});
			}
		});
	});
</script>
<h3>비밀번호 변경</h3>
</div>
<hr>
<div>
	<!-- 여기가 폼 -->
	<form id="changeUserPwForm" action="/m/changeUserPw" method="post">
		<div class="mb-3">
			<label for="exampleInputEmail1" class="form-label">Email </label> <input
				type="email" class="form-control" id="exampleInputEmail1"
				aria-describedby="emailHelp" value="${loginVo.user_id}" disabled>
			<div id="emailHelp" class="form-text">We'll never share your
				email with anyone else.</div>
		</div>
		<div class="mb-3">
			<label for="exampleInputPassword1" class="form-label">현재
				비밀번호</label> <input type="password" class="form-control"
				id="nowPw" name="nowPw">
		</div>
		<div class="mb-3">
			<label for="exampleInputPassword1" class="form-label">새
				비밀번호</label> <input type="password" class="form-control"
				id="newPw" name="newPw">
		</div>
		<div class="mb-3">
			<label for="exampleInputPassword1" class="form-label">새 비밀번호 확인</label>
			<input type="password" class="form-control"
				id="newPwCheck" name="newPwCheck">
		</div>
		<button type="button" class="btn btn-primary btn-sm" id="btnChangePw"
				style="float:left; margin-top:5px; margin-right:5px;">비밀번호 변경</button>
		<span style="float:left; margin-top:5px; color:greay;" id="span">비밀번호를 다시 입력해 주세요.</span>
	</form>
</div>
</div>
</div>
</div>
</div>
</body>
</html>