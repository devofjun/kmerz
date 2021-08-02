<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/userInfoHeader.jsp"%>

<script>
	$(document).ready(function() {

		/* $("#btnUpload").click(function(e) {
			var file = e.originalEvent.dataTransfer.file;
			console.log(file);
			var formData = new FormData();
			formData.append("file", file);
			var url = "/media/uploadProfileImage";
			$.ajax({
				"processData" : false,
				"contentType" : false,
				"url" : url,
				"method" : "post",
				"data" : formData,
				"success" : function(receivedData) {
					
				}
			});
		}); */
	});
</script>
<h3>프로필 사진변경</h3>
</div>
<hr>
<div>
	<!-- 여기가 폼 -->
	<form action="/media/uploadProfileImage" method="post"
		enctype="multipart/form-data">
		<div>
			<p>프로필 이미지</p>
		</div>
		<div>
			<c:choose>
				<c:when test="${empty loginVo.user_profileImage}">
					<img style="margin-top: 10px"
						src="/resources/images/default_Profile3.png" class="img-thumbnail"
						alt="...">
				</c:when>
				<c:otherwise>
					<img style="margin-top: 10px"
						src="http://localhost/media/displayImage?fileName=${loginVo.user_profileImage}"
						class="img-thumbnail" alt="...">
				</c:otherwise>
			</c:choose>
		</div>
		<input type="file" id="file" name="file" accept=".jpg, .png, .gif">
		<br>
		<button type="submit" class="btn btn-primary" id="btnUpload">업로드</button>
	</form>
</div>
</div>
</div>
</div>
</div>
</body>
</html>