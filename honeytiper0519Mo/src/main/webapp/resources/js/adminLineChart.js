
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
		         			],
		                    borderColor: [
		                    	'rgba(105, 80, 226, 1)',
		                    	'rgba(52, 43, 165, 1)',
		                    	'rgba(52, 43, 165, 1)',
		                    	'rgba(52, 43, 165, 1)',
		                    	'rgba(52, 43, 165, 1)',
		                    	'rgba(52, 43, 165, 1)',
		                    	'rgba(52, 43, 165, 1)',
		                    	'rgba(52, 43, 165, 1)',
		                    	'rgba(52, 43, 165, 1)',
		                    	'rgba(52, 43, 165, 1)',
		                    	'rgba(52, 43, 165, 1)',
		                    	'rgba(52, 43, 165, 1)',
		                    	'rgba(52, 43, 165, 1)',
		                    	'rgba(52, 43, 165, 1)',
		                    	'rgba(52, 43, 165, 1)',
		                    	'rgba(52, 43, 165, 1)',
		                    	'rgba(52, 43, 165, 1)',
		                    	'rgba(52, 43, 165, 1)',
		                    	'rgba(52, 43, 165, 1)',
		                    	'rgba(52, 43, 165, 1)',
		                    	'rgba(52, 43, 165, 1)',
		                    	'rgba(52, 43, 165, 1)',
		                    	'rgba(52, 43, 165, 1)',
		                    	'rgba(52, 43, 165, 1)',
		                    	'rgba(52, 43, 165, 1)',
		                    ],
		                    pointStyle: 'circle',
		                    borderWidth: 1,
		         			data : valueList
	         		} ],
	         	};
	         	
	         	var ctx1 = document.getElementById('myChart').getContext('2d');
	         	new Chart(ctx1, {
	         		type : 'line',
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
			chart('week');
		});