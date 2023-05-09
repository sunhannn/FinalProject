<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.ggul.zip.queen.QueenVO, java.util.*"%>
<%@include file="adminNavbar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
#salesTableBody{
	width:100%;
	text-align: center;
}
#chartDiv{
	width: 600px;
	height: 400px;
	margin: 0 auto;
}
.thTitle{
	padding-top: 55px;
}
.chartBtn{
	text-align: right;
	margin:0 auto;
}
</style>
<script src="${pageContext.request.contextPath}/front/jquery.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script>

// 이번주 최고매출
// 전주 평균매출 
// 오늘 매출
// 어제 매출
// 전달 평균 매출

function chart(val){
	   $.ajax({
	        url: "chartAjax",
	        type: "POST",
	        data:{'chart_select':val},
	        cache:false,
	        success:function(res){
	         	var jsonObject = JSON.stringify(res);
	         	var jData = JSON.parse(jsonObject);
	         	var valueList = new Array();
	         	var dateList = new Array();
	         	
	         	for (var i = 0; i < jData.length; i++) {
	         		var d = jData[i];
	         		valueList.push(d.sales_value);
	         		dateList.push(d.sales_date);
	         	}

	         	var chartData = {
	         		labels : dateList,
	         		datasets : [ {
        			label:val,
		         		backgroundColor: [
			         			'white'
// 			         			,
// 			         			'rgba(255, 99, 132, 0.2)',
// 		                        'rgba(54, 162, 235, 0.2)',
// 		                        'rgba(255, 206, 86, 0.2)',
// 		                        'rgba(75, 192, 192, 0.2)',
// 		                        'rgba(153, 102, 255, 0.2)',
// 		                        'rgba(255, 159, 64, 0.2)'
		         			],
		                    borderColor: [
// 		                    	'rgba(255, 247, 206, 1)',
		                    	'rgba(255, 0, 0, 1)',
		                        'rgba(0, 0, 0, 1)',
		                        'rgba(0, 0, 0, 1)',
		                        'rgba(0, 0, 0, 1)',
		                        'rgba(0, 0, 0, 1)',
		                        'rgba(0, 0, 0, 1)',
		                        'rgba(0, 0, 0, 1)',
		                        'rgba(0, 0, 0, 1)',
		                        'rgba(0, 0, 0, 1)',
		                        'rgba(0, 0, 0, 1)',
		                        'rgba(0, 0, 0, 1)',
		                        'rgba(0, 0, 0, 1)',
		                        'rgba(0, 0, 0, 1)',
		                        'rgba(0, 0, 0, 1)',
		                        'rgba(0, 0, 0, 1)',
		                        'rgba(0, 0, 0, 1)',
		                        'rgba(0, 0, 0, 1)',
		                        'rgba(0, 0, 0, 1)',
		                        'rgba(0, 0, 0, 1)',
		                        'rgba(0, 0, 0, 1)',
		                        'rgba(0, 0, 0, 1)',
		                        'rgba(0, 0, 0, 1)',
		                        'rgba(0, 0, 0, 1)',
// 		                        'rgba(54, 162, 235, 1)',
// 		                        'rgba(255, 206, 86, 1)',
// 		                        'rgba(75, 192, 192, 1)',
// 		                        'rgba(153, 102, 255, 1)',
// 		                        'rgba(255, 159, 64, 1)'
		                    ],
		                    //아래채우기 삭제
// 		                    fill:false,
		                    pointStyle: 'circle',
// 		                    borderColor: 'lightblue',
		                    borderWidth: 5,
		         			data : valueList
	         		} ],
	         	};
	         	
	         	var ctx1 = document.getElementById('myChart').getContext('2d');
	         	new Chart(ctx1, {
	         		type : 'line',
	         		data : chartData
	         	});

// 	         	let tableHtml ="";
// 	         	let weekTop = weekTop;
// 	         	tableHtml += "<tr><td>${weekTop}</td></tr>";
// 	         	$("#salesTableBody").html(tableHtml);
	         	
	         	
	        }	//success 닫는중괄호
	        
	    });
}

		$(function(){
			chart('week');
		});
		
</script>
<body>
	<h5 style="text-align: center;">금액별 그래프</h5>
<!-- 	<button type="button" onclick="chart(this.value)" value="week" class="chartBtn">주간차트보기</button> -->
<!-- 	<button type="button" onclick="chart(this.value)" value="month" class="chartBtn">월간차트보기</button> -->
	<div id="chartDiv">
		<canvas id="myChart"></canvas>
		<br>
		<br>
		<table id="salesTableBody" >
			<tr>
				<th colspan="4" class="thTitle">주간</th>
			</tr>
			<tr>
				<th>주간최고매출</th><th>주간평균매출</th><th>주간총매출</th>
			</tr>
			<tr>
				<td>${sales.weektop_sales}</td>
				<td>${sales.weekavg_sales}</td>
				<td>${sales.weektotal_sales}</td>
				<td><button type="button" onclick="chart(this.value)" value="week" class="chartBtn">주간차트보기</button></td>
			</tr>
			<tr>
				<th colspan="4" class="thTitle">월간</th>
			</tr>
			<tr>
				<th>월간최고매출</th><th>월간평균매출</th><th>월간총매출</th>
			</tr>
			<tr>
				<td>${sales.monthtop_sales}</td>
				<td>${sales.monthavg_sales}</td>
				<td>${sales.monthtotal_sales}</td>
				<td><button type="button" onclick="chart(this.value)" value="month" class="chartBtn">월간차트보기</button></td>
			</tr>
		</table>
	</div>
</body>
</html>