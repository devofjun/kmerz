<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="./mngInclude/header.jsp"%>
<script>
	$(document).ready(function() {
		// 카드 색 변환
		$(".card").mouseenter(function() {
			$(this).removeClass("border-light");
			$(this).addClass("border-secondary");
			// 테이블 변환
			// 몇번째 클래스인지 index 구하기
			var index = $(".card").index(this);
			$(".boardTables").siblings().hide();
			$(".boardTables").eq(index).show();
		});
		$(".card").mouseleave(function() {
			$(this).removeClass("border-secondary");
			$(this).addClass("border-light");
		});

		
	});
</script>
<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">

<div id="cardItem" class="row text-center">
	<div class="col-12 col-md-6 col-lg-4 col-xl-3">
		<div class="container">
			<div class="card border-light my-2 shadow" style="max-width: 14rem;">
				<div class="card-header">
					<h5>일일 접속자</h5>
				</div>
				<div class="card-body">
					<a class="card-title fs-1 text-decoration-none" href="#">123</a>
				</div>
			</div>
		</div>
	</div>
	<div class="col-12 col-md-6 col-lg-4 col-xl-3">
		<div class="container">
			<div class="card border-light my-2 shadow" style="max-width: 14rem;">
				<div class="card-header">
					<h5>새로운 글</h5>
				</div>
				<div class="card-body">
					<a class="card-title fs-1 text-decoration-none" href="#">83</a>
				</div>
			</div>
		</div>
	</div>
	<div class="col-12 col-md-6 col-lg-4 col-xl-3">
		<div class="container">
			<div class="card border-light my-2 shadow" style="max-width: 14rem;">
				<div class="card-header">
					<h5>커뮤니티 신청</h5>
				</div>
				<div class="card-body">
					<a class="card-title fs-1 text-decoration-none" href="#">7</a>
				</div>
			</div>
		</div>
	</div>
	<div class="col-12 col-md-6 col-lg-4 col-xl-3">
		<div class="container">
			<div class="card border-light my-2 shadow" style="max-width: 14rem;">
				<div class="card-header">
					<h5>신규 회원가입</h5>
				</div>
				<div class="card-body">
					<a class="card-title fs-1 text-decoration-none" href="#">5</a>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 차트 -->
<div class="row my-4">
	<div class="col-xl-6">
		<canvas id="myChartOne" class="my-2 w-100" width="900" height="350"></canvas>
	</div>
	<div class="col-xl-6">
		<canvas id="myChartTwo" class="my-2 w-100" width="900" height="350"></canvas>
	</div>
</div>

<!-- <div> -->
<!-- <button type="button" id="reData">데이터 변경</button> -->
<!-- <button type="button" id="addData">데이터 추가</button> -->
<!-- <button type="button" id="addDataSet">데이터셋 추가</button> -->
<!-- <button type="button" id="delData">데이터 삭제</button> -->
<!-- <button type="button" id="delDataset">데이터셋 삭제</button> -->
<!-- </div> -->
<!-- 테이블 -->
<div class="row">
	<div class="boardTables col-12" >
		<a class="fs-1 text-decoration-none" href="#">일일 접속자</a>
		<div class="table-responsive">
			<table class="table table-striped table-sm">
				<thead>
					<tr>
						<th scope="col">접속 시간</th>
						<th scope="col">접속 ID</th>
						<th scope="col">IP</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>2021-7-15-12:10:49</td>
						<td>test@naevr.com</td>
						<td>192.168.1.1</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="boardTables col-12" style="display: none">
		<a class="fs-1 text-decoration-none" href="#">새로운 글</a>
		<div class="table-responsive">
			<table class="table table-striped table-sm">
				<thead>
					<tr>
						<th scope="col">작성시간</th>
						<th scope="col">글번호</th>
						<th scope="col">글 제목</th>
						<th scope="col">작성자</th>
						<th scope="col">조회수</th>
						<th scope="col">상태</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>2021-7-15-12:10:49</td>
						<td>10</td>
						<td>안녕하세요</td>
						<td>정병준</td>
						<td>12</td>
						<td>ok</td>
					</tr>
					
				</tbody>
			</table>
		</div>
	</div>

	<div class="boardTables col-12" style="display: none">
		<a class="fs-1 text-decoration-none" href="#">커뮤니티 신청</a>
		<div class="table-responsive">
			<table class="table table-striped table-sm">
				<thead>
					<tr>
						<th scope="col">신청시간</th>
						<th scope="col">커뮤니티 ID</th>
						<th scope="col">신청유저</th>
						<th scope="col">커뮤니티 이름</th>
						<th scope="col">주제</th>
						<th scope="col">처리</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>2021-7-15-12:10:49</td>
						<td>lol</td>
						<td>test1234@naver.com</td>
						<td>롤 정보 공유</td>
						<td>리그오브레전드</td>
						<td><a class="text-decoration-none" href="#">신청됨</a></td>
					</tr>
					
				</tbody>
			</table>
		</div>
	</div>
	<div class="boardTables col-12" style="display: none">
		<a class="fs-1 text-decoration-none" href="#">신규 회원가입</a>
		<div class="table-responsive">
			<table class="table table-striped table-sm">
				<thead>
					<tr>
						<th scope="col">시간</th>
						<th scope="col">ID</th>
						<th scope="col">이름</th>
						<th scope="col">IP</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>2021-7-15-12:10:49</td>
						<td>test1234@naver.com</td>
						<td>테스터</td>
						<td>127.0.0.1</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>

</main>



<%@ include file="./mngInclude/footer.jsp"%>