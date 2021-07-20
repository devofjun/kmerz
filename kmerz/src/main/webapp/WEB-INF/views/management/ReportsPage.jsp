<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./mngInclude/header.jsp"%>
<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
<div
	class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
	<h1 class="h2">차트</h1>
	<div class="btn-toolbar mb-2 mb-md-0">
		<div class="btn-group me-2">
			<button type="button" class="btn btn-sm btn-outline-secondary">Share</button>
			<button type="button" class="btn btn-sm btn-outline-secondary">Export</button>
		</div>
		<button type="button"
			class="btn btn-sm btn-outline-secondary dropdown-toggle">
			<span data-feather="calendar"></span> This week
		</button>
	</div>
</div>

<div id="imgUploadBox">
	<h3 id="uploadTitle">배너 이미지 업로드</h3>
	<div class="w-100 border bg-light" style="height: 150px">
		<span class="ms-2"></span>
	</div>
	<div class="input-group">
		<input type="file" class="form-control" id="inputGroupFile04"
			aria-describedby="inputGroupFileAddon04" aria-label="Upload"
			multiple="multiple">
		<button class="btn btn-outline-secondary" type="button"
			id="inputGroupFileAddon04">업로드</button>
	</div>
</div>
</main>
<%@ include file="./mngInclude/footer.jsp"%>