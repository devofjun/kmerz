<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="./mngInclude/header.jsp"%>
<script>
	$(document).ready(function() {
		$(".card").mouseenter(function() {
			$(this).removeClass("border-light");
			$(this).addClass("border-primary");

			// 몇번째 클래스인지 index 구하기
			var index = $(".card").index(this);
			$(".boardTables").siblings().hide();
			$(".boardTables").eq(index).show();

		});
		$(".card").mouseleave(function() {
			$(this).removeClass("border-primary");
			$(this).addClass("border-light");
			// 차트 변환하기

		});

		//데이터 변경
		document.getElementById('reData').onclick = function() {

			//데이터셋 수 만큼 반복
			var dataset = config.data.datasets;
			for (var i = 0; i < dataset.length; i++) {
				console.log(dataset);
				//데이터 갯수 만큼 반복
				var data = dataset[i].data;
				for (var j = 0; j < data.length; j++) {
					data[j] = Math.floor(Math.random() * 50);
				}
			}

			myChart.update(); //차트 업데이트
		}
		//데이터 추가
		document.getElementById('addData').onclick = function(){
			
			//라벨추가
			config.data.labels.push('data'+config.data.labels.length)
			
			//데이터셋 수 만큼 반복
			var dataset = config.data.datasets;
			for(var i=0; i<dataset.length; i++){
				//데이터셋의 데이터 추가
				dataset[i].data.push(Math.floor(Math.random() * 50));
			}
			myChart.update();	//차트 업데이트
		}
		//데이터셋 추가
		document.getElementById('addDataSet').onclick = function(){
			var color1 = Math.floor(Math.random() * 256);
			var color2 = Math.floor(Math.random() * 256);
			var color3 = Math.floor(Math.random() * 256);
			
			console.log(color1 + " " + color2 + " " + color3)
			
			var newDataset = {
				label: 'new Dataset'+config.data.datasets.length,
				borderColor : 'rgba('+color1+', '+color2+', '+color3+', 1)',
				backgroundColor : 'rgba('+color1+', '+color2+', '+color3+', 1)',
				data: [],
				fill: false
			}
			
			// newDataset에 데이터 삽입
			for (var i=0; i< config.data.labels.length; i++){
				var num = Math.floor(Math.random() * 50);
				newDataset.data.push(num);
			}
			
			// chart에 newDataset 푸쉬
			config.data.datasets.push(newDataset);
			
			myChart.update();	//차트 업데이트
		}
		//데이터 삭제
		document.getElementById('delData').onclick = function(){
			
			config.data.labels.splice(-1,1);//라벨 삭제
			
			//데이터 삭제
			config.data.datasets.forEach(function(dataset) {
				dataset.data.pop();
			});
			
			myChart.update();	//차트 업데이트
		}
		//데이터셋 삭제
		document.getElementById('delDataset').onclick = function(){
			config.data.datasets.splice(-1,1);
			myChart.update();	//차트 업데이트
		}
	});
</script>
<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">

<div id="cardItem" class="row text-center">
	<div class="col-12 col-md-6 col-lg-4 col-xl-3">
		<div class="container">
			<div class="card border-light my-3 shadow" style="max-width: 18rem;">
				<div class="card-header">
					<h5>일일 접속자</h5>
				</div>
				<div class="card-body">
					<a class="card-title fs-1 text-decoration-none" href="#">123</a>
					<p class="card-text text-muted">전일대비: +13</p>
				</div>
			</div>
		</div>
	</div>
	<div class="col-12 col-md-6 col-lg-4 col-xl-3">
		<div class="container">
			<div class="card border-light my-3 shadow" style="max-width: 18rem;">
				<div class="card-header">
					<h5>새로운 글</h5>
				</div>
				<div class="card-body">
					<a class="card-title fs-1 text-decoration-none" href="#">83</a>
					<p class="card-text text-muted">전일대비: +21</p>
				</div>
			</div>
		</div>
	</div>
	<div class="col-12 col-md-6 col-lg-4 col-xl-3">
		<div class="container">
			<div class="card border-light my-3 shadow" style="max-width: 18rem;">
				<div class="card-header">
					<h5>커뮤니티 신청</h5>
				</div>
				<div class="card-body">
					<a class="card-title fs-1 text-decoration-none" href="#">7</a>
					<p class="card-text text-muted">전일대비: +2</p>
				</div>
			</div>
		</div>
	</div>
	<div class="col-12 col-md-6 col-lg-4 col-xl-3">
		<div class="container">
			<div class="card border-light my-3 shadow" style="max-width: 18rem;">
				<div class="card-header">
					<h5>신규 회원가입</h5>
				</div>
				<div class="card-body">
					<a class="card-title fs-1 text-decoration-none" href="#">5</a>
					<p class="card-text text-muted">전일대비: -4</p>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 차트 -->
<div>
	<canvas id="myChartOne" class="my-4 w-100" id="myChart" width="900" height="350"></canvas>
</div>
<button type="button" id="reData">데이터 변경</button>
<button type="button" id="addData">데이터 추가</button>
<button type="button" id="addDataSet">데이터셋 추가</button>
<button type="button" id="delData">데이터 삭제</button>
<button type="button" id="addDataSet">데이터셋 삭제</button>


<div class="row">
	<div class="boardTables col-12" style="display: none">
		<a class="fs-1 text-decoration-none" href="#">일일 접속자</a>
		<div class="table-responsive">
			<table class="table table-striped table-sm">
				<thead>
					<tr>
						<th scope="col">IP</th>
						<th scope="col">접속 시간</th>
						<th scope="col">접속 경로</th>
						<th scope="col">접속 ID</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>192.168.1.1</td>
						<td>2021-7-15-12:10:49</td>
						<td>/localhost/main</td>
						<td>test@naevr.com</td>
					</tr>
					<tr>
						<td>192.168.1.1</td>
						<td>2021-7-15-12:10:49</td>
						<td>/localhost/main</td>
						<td>test@naevr.com</td>
					</tr>
					<tr>
						<td>192.168.1.1</td>
						<td>2021-7-15-12:10:49</td>
						<td>/localhost/main</td>
						<td>test@naevr.com</td>
					</tr>
					<tr>
						<td>192.168.1.1</td>
						<td>2021-7-15-12:10:49</td>
						<td>/localhost/main</td>
						<td>test@naevr.com</td>
					</tr>
					<tr>
						<td>192.168.1.1</td>
						<td>2021-7-15-12:10:49</td>
						<td>/localhost/main</td>
						<td>test@naevr.com</td>
					</tr>
					<tr>
						<td>192.168.1.1</td>
						<td>2021-7-15-12:10:49</td>
						<td>/localhost/main</td>
						<td>test@naevr.com</td>
					</tr>
					<tr>
						<td>192.168.1.1</td>
						<td>2021-7-15-12:10:49</td>
						<td>/localhost/main</td>
						<td>test@naevr.com</td>
					</tr>
					<tr>
						<td>192.168.1.1</td>
						<td>2021-7-15-12:10:49</td>
						<td>/localhost/main</td>
						<td>test@naevr.com</td>
					</tr>
					<tr>
						<td>192.168.1.1</td>
						<td>2021-7-15-12:10:49</td>
						<td>/localhost/main</td>
						<td>test@naevr.com</td>
					</tr>
					<tr>
						<td>192.168.1.1</td>
						<td>2021-7-15-12:10:49</td>
						<td>/localhost/main</td>
						<td>test@naevr.com</td>
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
						<th scope="col">#</th>
						<th scope="col">글 제목</th>
						<th scope="col">작성자</th>
						<th scope="col">조회수</th>
						<th scope="col">작성시간</th>
						<th scope="col">상태</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>10</td>
						<td>안녕하세요</td>
						<td>정병준</td>
						<td>12</td>
						<td>2021-7-15-12:10:49</td>
						<td>ok</td>
					</tr>
					<tr>
						<td>9</td>
						<td>안녕하세요</td>
						<td>정병준</td>
						<td>12</td>
						<td>2021-7-15-12:10:49</td>
						<td>ok</td>
					</tr>
					<tr>
						<td>8</td>
						<td>안녕하세요</td>
						<td>정병준</td>
						<td>12</td>
						<td>2021-7-15-12:10:49</td>
						<td>ok</td>
					</tr>
					<tr>
						<td>7</td>
						<td>안녕하세요</td>
						<td>정병준</td>
						<td>12</td>
						<td>2021-7-15-12:10:49</td>
						<td>ok</td>
					</tr>
					<tr>
						<td>6</td>
						<td>안녕하세요</td>
						<td>정병준</td>
						<td>12</td>
						<td>2021-7-15-12:10:49</td>
						<td>ok</td>
					</tr>
					<tr>
						<td>5</td>
						<td>안녕하세요</td>
						<td>정병준</td>
						<td>12</td>
						<td>2021-7-15-12:10:49</td>
						<td>ok</td>
					</tr>
					<tr>
						<td>4</td>
						<td>안녕하세요</td>
						<td>정병준</td>
						<td>12</td>
						<td>2021-7-15-12:10:49</td>
						<td>ok</td>
					</tr>
					<tr>
						<td>3</td>
						<td>안녕하세요</td>
						<td>정병준</td>
						<td>12</td>
						<td>2021-7-15-12:10:49</td>
						<td>ok</td>
					</tr>
					<tr>
						<td>2</td>
						<td>안녕하세요</td>
						<td>정병준</td>
						<td>12</td>
						<td>2021-7-15-12:10:49</td>
						<td>ok</td>
					</tr>
					<tr>
						<td>1</td>
						<td>안녕하세요</td>
						<td>정병준</td>
						<td>12</td>
						<td>2021-7-15-12:10:49</td>
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
						<th scope="col">커뮤니티 ID</th>
						<th scope="col">신청유저</th>
						<th scope="col">커뮤니티 이름</th>
						<th scope="col">주제</th>
						<th scope="col">처리</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>lol</td>
						<td>test1234@naver.com</td>
						<td>롤 정보 공유</td>
						<td>리그오브레전드</td>
						<td><a class="text-decoration-none" href="#">신청됨</a></td>
					</tr>
					<tr>
						<td>lol</td>
						<td>test1234@naver.com</td>
						<td>롤 정보 공유</td>
						<td>리그오브레전드</td>
						<td><a class="text-decoration-none" href="#">신청됨</a></td>
					</tr>
					<tr>
						<td>lol</td>
						<td>test1234@naver.com</td>
						<td>롤 정보 공유</td>
						<td>리그오브레전드</td>
						<td><a class="text-decoration-none" href="#">신청됨</a></td>
					</tr>
					<tr>
						<td>lol</td>
						<td>test1234@naver.com</td>
						<td>롤 정보 공유</td>
						<td>리그오브레전드</td>
						<td><a class="text-decoration-none" href="#">신청됨</a></td>
					</tr>
					<tr>
						<td>lol</td>
						<td>test1234@naver.com</td>
						<td>롤 정보 공유</td>
						<td>리그오브레전드</td>
						<td><a class="text-decoration-none" href="#">신청됨</a></td>
					</tr>
					<tr>
						<td>lol</td>
						<td>test1234@naver.com</td>
						<td>롤 정보 공유</td>
						<td>리그오브레전드</td>
						<td><a class="text-decoration-none" href="#">신청됨</a></td>
					</tr>
					<tr>
						<td>lol</td>
						<td>test1234@naver.com</td>
						<td>롤 정보 공유</td>
						<td>리그오브레전드</td>
						<td><a class="text-decoration-none" href="#">신청됨</a></td>
					</tr>
					<tr>
						<td>lol</td>
						<td>test1234@naver.com</td>
						<td>롤 정보 공유</td>
						<td>리그오브레전드</td>
						<td><a class="text-decoration-none" href="#">신청됨</a></td>
					</tr>
					<tr>
						<td>lol</td>
						<td>test1234@naver.com</td>
						<td>롤 정보 공유</td>
						<td>리그오브레전드</td>
						<td><a class="text-decoration-none" href="#">신청됨</a></td>
					</tr>
					<tr>
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
						<th scope="col">ID</th>
						<th scope="col">이름</th>
						<th scope="col">IP</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>test1234@naver.com</td>
						<td>테스터</td>
						<td>127.0.0.1</td>
					</tr>
					<tr>
						<td>test1234@naver.com</td>
						<td>테스터</td>
						<td>127.0.0.1</td>
					</tr>
					<tr>
						<td>test1234@naver.com</td>
						<td>테스터</td>
						<td>127.0.0.1</td>
					</tr>
					<tr>
						<td>test1234@naver.com</td>
						<td>테스터</td>
						<td>127.0.0.1</td>
					</tr>
					<tr>
						<td>test1234@naver.com</td>
						<td>테스터</td>
						<td>127.0.0.1</td>
					</tr>
					<tr>
						<td>test1234@naver.com</td>
						<td>테스터</td>
						<td>127.0.0.1</td>
					</tr>
					<tr>
						<td>test1234@naver.com</td>
						<td>테스터</td>
						<td>127.0.0.1</td>
					</tr>
					<tr>
						<td>test1234@naver.com</td>
						<td>테스터</td>
						<td>127.0.0.1</td>
					</tr>
					<tr>
						<td>test1234@naver.com</td>
						<td>테스터</td>
						<td>127.0.0.1</td>
					</tr>
					<tr>
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