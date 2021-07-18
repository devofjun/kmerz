<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
</div>
</div>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js"></script>

<script src="/resources/bootstrap/dashboard.js"></script>
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
</body>
</html>