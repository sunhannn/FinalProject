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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />
<style>
.container{
	width: 65%;
	padding: 0;
}
#salesTableBody{
	margin-top: 20px;
	width:100%;
}
.chartBtn{
	text-align: right;
	margin:0 auto;
	background-color: #fff8e3;
}
button{
	border-style: none;
    background: #FFD400;
    color: #5c3b0c;
    margin: 5px;
    padding: 5px 18px;
    cursor: pointer;
    font-size: 12pt;
    font-weight: bolder;
    border-radius: 5px;
    display: inline-block;
}

th, td{
	padding:5px 15px;
	height:38px;
	border-bottom: 1px solid #efefef;
}

th{
	background-color: #efefef;
	text-align: center;
}
canvas{
	width: 450px;
	height: 300px;
}
.h2title{
    display: block;
    font-size: 24px;
    margin-block-start: 0.83em;
    margin-block-end: 0.83em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bolder;
}
</style>
<script src="${pageContext.request.contextPath}/front/jquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script src="${pageContext.request.contextPath}/front/adminLineChart.js"></script>
<%-- <script src="${pageContext.request.contextPath}/front/adminBarChart.js"></script> --%>
<script>

//이번주 최고매출
//전주 평균매출 
//오늘 매출
//어제 매출
//전달 평균 매출
function chart2(val){
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
// 		         			'white',
	         			],
	                    borderColor: [
// 	                    	'rgba(105, 80, 226, 1)'
	                    ],
	                    pointStyle: 'circle',
	                    borderWidth: 2,
	         			data : valueList
	         		} ],
	         	};
	         	
	         	var ctx1 = document.getElementById('myChart2').getContext('2d');
	         	new Chart(ctx1, {
	         		type : 'bar',
	         		data : chartData
	         		
	         		 ,options: {
	         	    	legend: {
	         	        	display: false
	         	        }
	         		 }
	         	});
	        }	//success 닫는중괄호
	        
	    });
}

		$(function(){
			chart2('week');
		});
</script>
<body>
<div class="container">
	<h2 class="h2title" style="margin:40px 0;">매출내역</h2>
	<br><br>
		<h4 style="text-align: center;  font-weight: bolder;">매출내역 - 차트</h4>
		<br>
		<div id="lineChart" style="float:left; width:49%; text-align: center;">
			<canvas id="myChart"></canvas>
			<button type="button" onclick="chart(this.value)" value="week" class="chartBtn">Week</button>
			<button type="button" onclick="chart(this.value)" value="month" class="chartBtn">Month</button>
		</div>
		<div id="barChart" style="float:right;  width:49%;text-align: center;">
			<canvas id="myChart2"></canvas>
			<button type="button" onclick="chart2(this.value)" value="week" class="chartBtn">Week</button>
			<button type="button" onclick="chart2(this.value)" value="month" class="chartBtn">Month</button>
		</div>
		<div style="margin-top:40px; float:left; width: 100%;">
		<hr style="border:1px solid #efefef;">
		<br>
			<h4 style="text-align: center; font-weight: bolder;">매출내역 - 표</h4>
				<table id="salesTableBody" >
					<tr>
						<th colspan="3" class="thTitle" style="background-color: #fff8e3;">주간</th>
					</tr>
					<tr>
						<td>주간최고매출</td><td>일평균매출</td><td>주간총매출</td>
					</tr>
					<tr>
						<td>${sales.weektop_sales}원</td>
						<td>${sales.weekavg_sales}원</td>
						<td>${sales.weektotal_sales}원</td>
					</tr>
					<tr>
						<th colspan="3" class="thTitle" style="background-color: #fff8e3;">월간</th>
					</tr>
					<tr>
						<td>월간최고매출</td><td>일평균매출</tD><td>월간총매출</td>
					</tr>
					<tr>
						<td>${sales.monthtop_sales}원</td>
						<td>${sales.monthavg_sales}원</td>
						<td>${sales.monthtotal_sales}원</td>
					</tr>
				</table>
		</div>
	</div>
</body>
</html>