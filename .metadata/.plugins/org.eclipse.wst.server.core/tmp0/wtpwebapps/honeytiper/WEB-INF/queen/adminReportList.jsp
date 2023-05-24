<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>꿀TIPer 관리자 - 블랙리스트 관리</title>
<link href="${pageContext.request.contextPath}/front/adminReportList.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<%@include file="../queen/adminNavbar.jsp"%>
<body>
	<div class="jumbotron">
	</div>
	<nav id="searchNav" class="navbar navbar-expand-sm navbar-dark">


	</nav>
	<div id="container_top"></div>
	<div id="super_container">
		<div class="table_wrapper">

			<h3 id="h3_title">신고처리</h3>
			<table class="cont1_table">

				<thead class="btn-primary">
					<tr class="cont1_th">
						<th class="thCenter1">신고번호</th>
						<th class="thCenter1">신고자</th>
						<th class="thCenter1">피신고자</th>
						<th class="thCenter1">정지 처리</th>
						<th class="thCenter1">신고사유</th>
					</tr>
				</thead>
				<tbody id="dataTableBody8">

				</tbody>
			</table>
			<ul id="pagingul8">
			</ul>
		</div>
		<div class="table_wrapper">
			<div id="top_bar">
				<h3>블랙리스트 관리</h3>

				<div id="search_wrapper">
					<select class="search002" id="sel1" name="user_condition"
						style="display: inline-block !important; margin-right: 10px;">
						<option value="user_id">아이디</option>
						<option value="user_name">이름</option>
					</select> <input class="search002" type="text" name="user_search" id="sel2"
						placeholder="검색어를 입력하세요.">
					<button class="btn btn-success" type="submit" class="search002"
						id="sel3">검색</button>
				</div>
			</div>


			<table class="cont1_table">
				<thead class="btn-primary">
					<tr class="cont1_th">
						<th class="thCenter1">아이디</th>
						<th class="thCenter1">이름</th>
						<th class="thCenter1">신고 내용</th>
						<th class="thCenter1">신고 날짜</th>
						<th class="thCenter1">정지계정 관리</th>
					</tr>
				</thead>
				<tbody id="data_table_body9">

				</tbody>
			</table>

			<ul id="pagingul9">
			</ul>
		</div>
	<!-- 신고하기 모달창  -->
			<div class="rpt_modal1" id="rpt_modal1Singo">
				<div class="rpt_modal1-window">

					<div class="rpt_modal1-content1" id="rpt_modal1-content2-singo">

						<div id="rpt_modal1-title-singo">
							<div></div>
							<h3 id="rpt_h3_title">신고 사유</h3>
							<div id="rpt_btn_close" style="cursor:pointer;"> ✖ </div>
						</div>

							<div id="rpt_user_singo1">
							<span id="reportCont"></span>
							</div>
					</div>
				</div>
			</div>

		<div id="footer">
			<!--   	<button type="button" id="conWrite" class="btn btn-primary">글쓰기</button> -->
		</div>
	</div>
</body>
<script>

const modal1 = document.querySelector('.rpt_modal1');
const btnmodal1Close = document.querySelector('#rpt_btn_close');

//모달창 함수
function hsh(val1) {
   modal1.style.display='block';
     document.body.style.overflow = 'hidden';
     document.getElementById("reportCont").innerHTML = val1;
}

// 신고창 닫기
btnmodal1Close.addEventListener('click', () => {
	   modal1.style.display='none';
	   document.body.style.removeProperty('overflow');
    });
    
    

</script>

<script>
    var totalData8; //총 데이터 수
    var dataPerPage8; //한 페이지에 나타낼 글 수
	var pageCount8 = 5; //페이징에 나타낼 페이지 수
    var globalCurrentPage8= 1; //현재 페이지
	var dataList8; //표시하려하는 데이터 리스트
	var strReport = "";
	
	$(document).ready(function () {
 //페이지 당 글 개수 
 dataPerPage8 = 5;
 
 dataList8= ${ReportListJSON};
 totalData8 = dataList8.length;
		
 console.log(JSON.stringify(dataList8) + "가 dataList 즉시실행 시 신고접수");
 
  //글 목록 표시 호출 (테이블 생성)
  displayData8(1, dataPerPage8);

	//페이징 표시 호출
  paging8(totalData8, dataPerPage8, pageCount8, 1);
  });

 //현재 페이지(currentPage)와 페이지당 글 개수(dataPerPage) 반영
 function displayData8(currentPage8, dataPerPage8) {

	let chartHtml8 = "";

  //Number로 변환하지 않으면 아래에서 +를 할 경우 스트링 결합이 되어버림.. 
    currentPage = Number(currentPage8);
	dataPerPage = Number(dataPerPage8);
   
   
   if (totalData8 < (currentPage8 - 1) * dataPerPage8 + dataPerPage8){
	
 	  for (
 		var i = (currentPage8 - 1) * dataPerPage8;
 		    i < totalData8;
 			     i++
 			   ) {
 				   console.log("error : " + dataList8[i].report_user_id);
 			     chartHtml8 +=
 			    	'<tr><td class="tdCenter1">' + dataList8[i].report_num + '</td>'+
 			 	  '<td class="tdCenter1">' + dataList8[i].report_user_id + '</td>' +
 			 	  '<td class="tdCenter1">' + dataList8[i].report_reported_name +'(' +dataList8[i].report_reported_id + ')' +  '</td>' +
 			 	  '<td class="tdCenter1">'+
 			 	  '<button type="button" class="tdcenter1_btn1" onclick="location.href=\'/updateReportUserRole?user_id='+dataList8[i].report_reported_id+'&report_num='+dataList8[i].report_num+'&report_lesson_num='+dataList8[i].report_lesson_num+'\'">계정 정지</button>'+
 			 	  '<button type="button" class="tdcenter1_btn2" onclick="location.href=\'/updateReportReject?report_num='+dataList8[i].report_num+'\'">신고 반려</button></td>'+
 			 	  '<td class="tdCenter1"><button type="button" class="tdcenter1_btn3" onclick="hsh(\'' + dataList8[i].report_cont +'\');">자세히보기</button>'+'</tr><hr>';
			   } 
			
	  
   }else{ 
   
	for (
		var i = (currentPage8 - 1) * dataPerPage8;
      i < (currentPage8 - 1) * dataPerPage8 + dataPerPage8;
      i++
    ) {
		  chartHtml8 +=
			  '<tr><td class="tdCenter1">' + dataList8[i].report_num + '</td>'+
			 	  '<td class="tdCenter1">' + dataList8[i].report_user_id + '</td>' +
			 	  '<td class="tdCenter1">' + dataList8[i].report_reported_name +'(' +dataList8[i].report_reported_id + ')' +  '</td>' +
			 	  '<td class="tdCenter1">'+
			 	  '<button type="button" class="tdcenter1_btn1" onclick="location.href=\'/updateReportUserRole?user_id='+dataList8[i].report_reported_id+'&report_num='+dataList8[i].report_num+'&report_lesson_num='+dataList8[i].report_lesson_num+'\'">계정 정지</button>'+
			 	  '<button type="button" class="tdcenter1_btn2" onclick="location.href=\'/updateReportReject?report_num='+dataList8[i].report_num+'\'">신고 반려</button></td>'+
			 	  '<td class="tdCenter1"><button type="button" class="tdcenter1_btn3" onclick="hsh(\'' + dataList8[i].report_cont +'\');">자세히보기</button>'+'</tr><hr>';
		}    
 	}
   if( typeof chartHtml8 == "undefined" || chartHtml8 == ''){ chartHtml8 +=" <id='if_undefined'><span>처리할 신고가 없습니다.<span></div>"}
   console.log(chartHtml8);
 $("#dataTableBody8").html(chartHtml8);
 }



 function paging8(totalData8, dataPerPage8, pageCount8, currentPage8) {
 	  console.log("currentPage : " + currentPage8);

 	  totalPage8 = Math.ceil(totalData8 / dataPerPage8); //총 페이지 수
	  
 	  if(totalPage8<pageCount8){
	   pageCount8=totalPage8;
	  }
	  
 	  let pageGroup8 = Math.ceil(currentPage8 / pageCount8); // 페이지 그룹
	  let endPage8 = pageGroup8 * pageCount8; //화면에 보여질 마지막 페이지 번호
	  
	  if (endPage8 > totalPage8) {
 	    endPage8 = totalPage8;
	  }

	  let startPage8 = endPage8 - (pageCount8 - 1); //화면에 보여질 첫번째 페이지 번호
	  let next8 = Number(currentPage8)+1;
// 	  let next = endPage +1;
	  let prev8 = Number(currentPage8)-1;
// 	  let prev = startPage - 1;

	  let pageHtml8 = "";

	  if (prev8 > 0) {
	    pageHtml8 += "<li><a href='javascript:void(0)' id='prev8'> 이전 </a></li>";
	  }

 	 //페이징 번호 표시 
	  for (var i = startPage8; i <= endPage8; i++) {
	    if (currentPage8 == i) {
	      pageHtml8 +=
	        '<li class="on"><a href="javascript:void(0)" id="' + i + '">' + i + '</a></li>';
// 	        '<li class="on"><a href="javascript:displayData('+2+',5)" id="' + i + '">' + i + '</a></li>';
	    } else {
	      pageHtml8 += "<li><a href='javascript:void(0)' id='" + i + "'>" + i + "</a></li>";
	    }
	  }
	 
	  if (next8 <= totalPage8) {
	    pageHtml8 += '<li><a href="javascript:void(0);" id="next8"> 다음 </a></li>';
	  }

	  $("#pagingul8").html(pageHtml8);
	  

	  //페이징 번호 클릭 이벤트 
 	  $("#pagingul8 li a").click(function () {
	    let $id8 = $(this).attr("id");
	    selectedPage8 = $(this).text();

	    if ($id8 == "next8") selectedPage8 = next8;
	    if ($id8 == "prev8") selectedPage8 = prev8;
	    
	    
	    //전역변수에 선택한 페이지 번호를 담는다...
	    globalCurrentPage8 = selectedPage8;
	 
	    console.log("클릭시 글로벌 "+globalCurrentPage8);
	    
	    //글 목록 표시 재호출
	    displayData8(globalCurrentPage8, dataPerPage8);
	    //페이징 표시 재호출
	    paging8(totalData8, dataPerPage8, pageCount8, globalCurrentPage8);
	  });
	  
	}
</script>
<script>

var totalData9; //총 데이터 수
var dataPerPage9=5; //한 페이지에 나타낼 글 수
var pageCount9 = 5; //한 번에 나타낼 페이지 수 ([이전] 1 2 3 4 5 [다음])
var globalCurrentPage9= 1; //현재 페이지
var dataList9; //데이터 리스트
 
$(document).ready(function () {

     //totalData(총 데이터 수) 구하기
	 dataList9 = ${BlackListJSON};		
     
     //totalData(총 데이터 수) 구하기
	 totalData9 = dataList9.length;
     
     displayData9(1, dataPerPage9);
     paging9(totalData9, dataPerPage9, pageCount9, 1);
});
 
//현재 페이지(currentPage)와 페이지당 글 개수(dataPerPage) 반영
function displayData9(currentPage9, dataPerPage9) {

  let chartHtml9 = "";

//Number로 변환하지 않으면 아래에서 +를 할 경우 스트링 결합이 되어버림.. 
  currentPage9 = Number(currentPage9);
  dataPerPage9 = Number(dataPerPage9);
  
  
 if (totalData9 < (currentPage9 - 1) * dataPerPage9 + dataPerPage9){
	
	  for (
		var i = (currentPage9 - 1) * dataPerPage9;
		    i < totalData9;
			     i++
			   ) {
		  chartHtml9 +=
		 	  '<tr><td class="tdCenter1">' + dataList9[i].user_id + '</td>' +
			  '<td class="tdCenter1">' + dataList9[i].user_name + '</td>'+
		 	  '<td class="tdCenter1">' + dataList9[i].report_cont + '</td>' +
		 	  '<td class="tdCenter1">' + dataList9[i].report_date + '</td>' +
		 	  '<td class="tdCenter1">'+ 
		 	  '<button type="button" class="tdcenter1_btn1" onclick="location.href=\'/resetUserRole?report_num='+ dataList9[i].report_num+'&user_id='+dataList9[i].user_id+'\'">계정복구</button></tr>';
			   } 
 }else{ 
  
  for (
    var i = (currentPage9 - 1) * dataPerPage9;
    i < (currentPage9 - 1) * dataPerPage9 + dataPerPage9;
    i++
  ) {
	  chartHtml9 +=
		  '<tr><td class="tdCenter1">' + dataList9[i].user_id + '</td>' +
		  '<td class="tdCenter1">' + dataList9[i].user_name + '</td>'+
	 	  '<td class="tdCenter1">' + dataList9[i].report_cont + '</td>' +
	 	  '<td class="tdCenter1">' + dataList9[i].report_date + '</td>' +
	 	  '<td class="tdCenter1">'+ 
	 	  '<button type="button" class="tdcenter1_btn1" onclick="location.href=\'/resetUserRole?report_num='+ dataList9[i].report_num+'&user_id='+dataList9[i].user_id+'\'">계정복구</button></tr>';
  } //dataList는 임의의 데이터임.. 각 소스에 맞게 변수를 넣어주면 됨...
  
}
 
 if( typeof chartHtml9 == "undefined" || chartHtml9 == ''){ chartHtml9 +="<div id='if_undefined'>블랙리스트에 등록된 회원이 없습니다.</div>"}

$("#data_table_body9").html(chartHtml9);
}
 
function paging9(totalData9, dataPerPage9, pageCount9, currentPage9) {

	  totalPage9 = Math.ceil(totalData9 / dataPerPage9); //총 페이지 수
	  
	  if(totalPage9<pageCount9){
	    pageCount9=totalPage9;
	  }
	  
	  let pageGroup9 = Math.ceil(currentPage9 / pageCount9); // 페이지 그룹
	  let endPage9 = pageGroup9 * pageCount9; //화면에 보여질 마지막 페이지 번호
	  
	  if (endPage9 > totalPage9) {
	    endPage9 = totalPage9;
	  }

	  let startPage9 = endPage9 - (pageCount9 - 1); //화면에 보여질 첫번째 페이지 번호
	  let next9 = Number(currentPage9)+1;
//	  let next = endPage +1;
	  let prev9 = Number(currentPage9)-1;
//	  let prev = startPage - 1;

	  let pageHtml9 = "";

	  if (prev9 > 0) {
	    pageHtml9 += "<li><a href='javascript:void(0)' id='prev9'> 이전 </a></li>";
	  }

	 //페이징 번호 표시 
	  for (var i = startPage9; i <= endPage9; i++) {
	    if (currentPage9 == i) {
	      pageHtml9 +=
	        '<li class="on"><a href="javascript:void(0)" id="' + i + '">' + i + '</a></li>';
//	        '<li class="on"><a href="javascript:displayData('+2+',5)" id="' + i + '">' + i + '</a></li>';
	    } else {
	      pageHtml9 += "<li><a href='javascript:void(0)' id='" + i + "'>" + i + "</a></li>";
	    }
	  }
	 
	 
	  if (next9 <= totalPage9) {
	    pageHtml9 += '<li><a href="javascript:void(0);" id="next9"> 다음 </a></li>';
	  }

	  $("#pagingul9").html(pageHtml9);

	  //페이징 번호 클릭 이벤트 
	  $("#pagingul9 li a").click(function () {
	    let $id9 = $(this).attr("id");
	    selectedPage9 = $(this).text();

	    if ($id9 == "next9") selectedPage9 = next9;
	    if ($id9 == "prev9") selectedPage9 = prev9;
	    
	    
	    //전역변수에 선택한 페이지 번호를 담는다...
	    globalCurrentPage9 = selectedPage9;
	 
	    console.log("클릭시 글로벌 "+globalCurrentPage9);
	    
	    //글 목록 표시 재호출
	    displayData9(globalCurrentPage9, dataPerPage9);
	    //페이징 표시 재호출
	    paging9(totalData9, dataPerPage9, pageCount9, globalCurrentPage9);
	  });
	}
	
$("#sel3").click(function(){
	
	var search_condition=$('#sel1').val();
	var search_keyword=$('#sel2').val();
	
	$.ajax({ // ajax로 데이터 가져오기
		method: "POST",
		url: "/searchBlackList",
	 	data: {search_condition:search_condition, search_keyword:search_keyword},
		dataType: "json",
		async:false,
		success: function (data) {
//		 		alert("data: " + JSON.stringify(data));
		   //totalData(총 데이터 수) 구하기
		   totalData9 = data.length;
	       //데이터 대입
	       dataList9=data;
	
	       if(typeof totalData9 == "undefined" || totalData9 == null || totalData9 == ""){ alert("검색결과가 없습니다.");}	
			 }
	 });		
	
	 //글 목록 표시 재호출
    displayData9(1, 5);
    //페이징 표시 재호출
    paging9(totalData9, 5, pageCount9, 1);
    
});

</script>

</html>
