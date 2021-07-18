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
		labels : ['학원', '연구원', '출판사', '미디어사', '위니브'],
		datasets : [{
			label : '바울랩 매출액',
			data : [
				10, 20, 30, 40, 50
			]
		}]
	}
};
//차트 그리기
var myChart = new Chart(ctx, config);
</script>
</body>
</html>