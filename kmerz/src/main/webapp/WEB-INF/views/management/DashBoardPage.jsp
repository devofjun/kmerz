<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="./mngInclude/header.jsp"%>
<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
<div class="row">
	<div class="container" style="background-color:blue">
		<canvas class="my-4 w-100 chartjs-render-monitor" id="myChart" width="1538" height="649" style="display: block; width: 1538px; height: 649px;"></canvas>
	</div>
</div>
<div class="row">
	<div class="col" style="background-color:yellow">
		<div class="container">
		<h2>새로운 글</h2>
		<div class="table-responsive">
			<table class="table table-striped table-sm">
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">글 제목</th>
						<th scope="col">작성자</th>
						<th scope="col">조회수</th>
						<th scope="col">상태</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>안녕하세요</td>
						<td>정병준</td>
						<td>12</td>
						<td>ok</td>
					</tr>
					<tr>
						<td>1</td>
						<td>안녕하세요</td>
						<td>정병준</td>
						<td>12</td>
						<td>ok</td>
					</tr>
					<tr>
						<td>1</td>
						<td>안녕하세요</td>
						<td>정병준</td>
						<td>12</td>
						<td>ok</td>
					</tr>
				</tbody>
			</table>
		</div>
		</div>
	</div>
	<div class="col" style="background-color:cyan">
		<h2>새로운 글</h2>
		<div class="table-responsive">
			<table class="table table-striped table-sm">
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">Header</th>
						<th scope="col">Header</th>
						<th scope="col">Header</th>
						<th scope="col">Header</th>
					</tr>
				</thead>
				<tbody>
					
				</tbody>
			</table>
		</div>
	</div>
	<div class="col" style="background-color:red">
		<h2>새로운 글</h2>
		<div class="table-responsive">
			<table class="table table-striped table-sm">
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">Header</th>
						<th scope="col">Header</th>
						<th scope="col">Header</th>
						<th scope="col">Header</th>
					</tr>
				</thead>
				<tbody>
					
				</tbody>
			</table>
		</div>
	</div>
</div>

</main>



<%@ include file="./mngInclude/footer.jsp"%>