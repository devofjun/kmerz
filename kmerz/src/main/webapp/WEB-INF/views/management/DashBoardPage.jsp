<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./mngInclude/header.jsp"%>
<script src="/resources/script/TimeFormat.js"></script>
<script>
	$(document).ready(function() {
		$.get("/admin/dashBoardData",function(rData){
			$("#loginCount").text(rData.loginList.length);
			$("#newPostCount").text(rData.postList.length);
			$("#newCommCount").text(rData.commList.length);
			$("#signupCount").text(rData.signupList.length);
			
			// 일일 접속자
			$("#loginTr:gt(0)").remove();
			$.each(rData.loginList, function() {
				var clone = $("#loginTr:eq(0)").clone();
				clone.find("td:eq(0)").text(timePattern(this.user_log_time));
				clone.find("td:eq(1)").text(this.user_id);
				clone.find("td:eq(2)").text(this.user_name);
				clone.find("td:eq(3)").text(this.request_ip);
				clone.show();
				$("#loginTr").parent().append(clone);
			});
			
			// 새로운 글
			$("#newPostTr:gt(0)").remove();
			$.each(rData.postList, function() {
				var clone = $("#newPostTr:eq(0)").clone();
				clone.find("td:eq(0)").text(timePattern(this.post_createtime));
				clone.find("td:eq(1)").text(this.post_no);
				clone.find("td:eq(2)").text(this.post_title);
				clone.find("td:eq(3)").text(this.user_name);
				clone.find("td:eq(4)").text(this.post_readcount);
				clone.find("td:eq(5)").text(this.str_post_status);
				clone.show();
				$("#newPostTr").parent().append(clone);
			});
			
			// 커뮤니티 신청
			$("#newCommTr")
			$.each(rData.commList, function() {
				var clone = $("#newCommTr:eq(0)").clone();
				clone.find("td:eq(0)").text(timePattern(this.community_createtime));
				clone.find("td:eq(1)").text(this.community_id);
				clone.find("td:eq(2)").text(this.user_id);
				clone.find("td:eq(3)").text(this.community_name);
				clone.find("td:eq(4)").text(this.community_topic);
				clone.find("td:eq(5)").text(this.str_community_status);
				clone.show();
				$("#newCommTr").parent().append(clone);
			});
			
			// 신규 회원가입
			$("#signupTr")
			$.each(rData.signupList, function() {
				var clone = $("#signupTr:eq(0)").clone();
				clone.find("td:eq(0)").text(timePattern(this.user_log_time));
				clone.find("td:eq(1)").text(this.user_id);
				clone.find("td:eq(2)").text(this.user_name);
				clone.find("td:eq(3)").text(this.request_ip);
				clone.show();
				$("#signupTr").parent().append(clone);
			});
			
		});
		
		
		
		// 카드 테두리 색 변환
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
					<a id="loginCount" class="card-title fs-1 text-decoration-none" href="#">0</a>
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
					<a id="newPostCount" class="card-title fs-1 text-decoration-none" href="#">0</a>
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
					<a id="newCommCount" class="card-title fs-1 text-decoration-none" href="#">0</a>
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
					<a id="signupCount" class="card-title fs-1 text-decoration-none" href="#">0</a>
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
	<!-- 일일 로그인 -->
	<div class="boardTables col-12" >
		<a class="fs-1 text-decoration-none" href="#">일일 접속자</a>
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
					<tr id="loginTr" style="display:none">
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	
	<!-- 새로운 글 -->
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
					<tr id="newPostTr" style="display:none">
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					
				</tbody>
			</table>
		</div>
	</div>

	<!-- 새로운 커뮤니티 생성 -->
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
					<tr id="newCommTr" style="display:none">
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					
				</tbody>
			</table>
		</div>
	</div>
	
	<!-- 신규 회원가입 -->
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
					<tr id="signupTr" style="display:none">
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>

</main>

<script>
//차트
var ctx = document.getElementById('myChartOne');
var config = {
	type : 'bar',
	data : {
		labels : ['21/7/12', '21/7/13', '21/7/14', '21/7/15', '21/7/16', '21/7/17', '21/7/18'],
		datasets : [{
			label : '일일 접속자',
			backgroundColor: '#FF6666',
		    borderColor: '#FF6666',
			data : [
				50, 55, 50, 45, 65, 43, 42
			]
		}, {
			label : '새로운 글',
			backgroundColor: '#FFFF66',
		    borderColor: '#FFFF66',
			data : [
				14, 21, 12, 18, 27, 14, 20
			]
		}, {
			label : '커뮤니티 신청',
			backgroundColor: '#66FF66',
		    borderColor: '#66FF66',
			data : [
				1, 0, 4, 2, 3, 4, 6
			]
		}, {
			label : '신규 회원가입',
			backgroundColor: '#6666FF',
		    borderColor: '#6666FF',
			data : [
				12, 3, 5, 8, 20, 1, 10
			]
		}
		
		]
	}
};

var ctx2 = document.getElementById('myChartTwo');
var config2 = {
	type : 'line',
	data : {
		labels : ['21/7/12', '21/7/13', '21/7/14', '21/7/15', '21/7/16', '21/7/17', '21/7/18'],
		datasets : [{
			label : '케이머즈 매출액',
			backgroundColor: '#66B2FF',
		    borderColor: '#66B2FF',
			data : [
				50000, 60000, 40000, 30000, 110000, 80000, 90000
			]
		}]
	}
};

//차트 그리기
var myChart = new Chart(ctx, config);
var myChart2 = new Chart(ctx2, config2);
</script>


<%@ include file="./mngInclude/footer.jsp"%>