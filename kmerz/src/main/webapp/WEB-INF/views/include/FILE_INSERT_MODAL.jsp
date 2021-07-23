<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div id="myModal" class="modal">
	<div class="modal-content">
		<div class="modal-topbar">
			<span>INSERT IMAGE</span>
			<span onclick="closeModal()">X</span>
		</div>
		<div class="modal-postContent">
			<input id="url" type="text">
			<button id="insertLink" onclick="insertLink()">추가</button>
		</div>
	</div>
</div>