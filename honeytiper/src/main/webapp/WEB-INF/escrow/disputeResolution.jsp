<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.ggul.zip.escrow.EscrowVO, java.util.*" %>
<%@ page import="java.util.Date" %>
<%@include file="../queen/adminNavbar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 퀸컨트롤러에있음 -->

<style>

.container {
  width: 65%;
  margin: 0 auto;
}
/* 나머지 요소들은 기본값인 z-index: 1로 설정 */
table {
  border-collapse: collapse;
  width: 100%;
  z-index: 1;
}

th, td {
  text-align: center;
  vertical-align: middle;
  border: 1px solid #ddd;
  padding: 12px;
  z-index: 1;
 
}

th {
  background-color: #f2f2f2;
  font-weight: bold;
}

#view-all-button, .btn-success {
  border: 0;
  border-radius: 4px;
  background-color: #FFD400;
  font-size: 12pt;
  padding: 5px;
  cursor: pointer;
  color: white;
  font-weight: bold;
}

#view-all-button:hover, .btn-success:hover {
  background-color: #E6B800;

}
.pagination-row {
  background-color: #e8f0fe;
}

.pagination-row th {
  font-size: 12pt;
}

#pagingul {
  margin-top: 20px;
  list-style: none;
  display: flex;
  justify-content: center;
}

#pagingul li {
  margin-right: 5px;
}

#pagingul li a {
  display: block;
  padding: 5px 10px;
  border: 1px solid #ddd;
  background-color: #fff;
  color: #333;
  text-decoration: none;
}

#pagingul li.on a {
  background-color: #FFD400;
  color: #fff;
}
 input[type=text]{
    width: 170px;
   height: 25px;
  }
  select{
      width: 110px;
    height: 30px;
  }
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<body>
<div class="container">
<h2 style="margin:40px 0px;">티퍼-회원 분쟁조정</h2>
<button id="view-all-button" >전체목록보기</button>
<br><br>
 
  <div id="top_bar">
				<div id="search_wrapper">
					<select class="search" id="sel1" name="search_condition"
						style="display: inline-block !important;">
						<option value="escrow_user_id">회원아이디</option>
						<option value="tiper_user_id">강사아이디</option>
					</select> <input class="search" type="text" name="search_keyword" id="sel2"
						placeholder="검색어를 입력하세요.">
					<button class="btn btn-success" type="submit" class="search" id="sel3"><i style='font-size:19px; color:white;' class='fas'>&#xf002;</i></button>
						 <br><br><br>
						 <label for="status-0">신청중</label>
						<input type="radio" id="status-0" name="escrow_status" value="0">
						<label for="status-1">진행중</label>
						<input type="radio" id="status-1" name="escrow_status" value="1"><br>
						 <hr class="hrFirst">
						 <br>
				</div>
			</div>
            <span id="displayCount"></span>
            <table class="table table-bordered">
	            <thead>
	                <tr class="pagination-row" >
	                    <th style="width:15%">강의수락날짜</th> 
	                    <th style="width:10%">수강자</th> 
	                    <th style="width:25%">강의이름</th>
	                     <th style="width:10%">강사</th>
	                     <th style="width:10%">금액</th>
	                    <th style="width:10%">진행상황</th><!--상태가 0또는 1만 불러와야함 -->
	                    <th style="width:25%">강제완료 or 취소</th><!-- 버튼이 자동으로 생성되야하네 낄낄 -->
	                </tr>
	            </thead>
	            <tbody id="data_table_body"></tbody>
            </table>
	<ul id="pagingul"></ul>
	</div>
</body>
<script>
var totalData; //총 데이터 수
var dataPerPage=10; //한 페이지에 나타낼 글 수
var pageCount = 5; //한 번에 나타낼 페이지 수 ([이전] 1 2 3 4 5 [다음])
var globalCurrentPage= 1; //현재 페이지
var dataList; //데이터 리스트

//날짜형식맞춰야해서 넣은것
function formatDate(date) {
	  var year = date.getFullYear();
	  var month = date.getMonth() + 1;
	  var day = date.getDate();
	  var formattedDate = year + '-' + month + '-' + day;
	  return formattedDate;
	}
	
 
$(document).ready(function () {
	 
     //totalData(총 데이터 수) 구하기 항상실행이여서 컨트롤러에서 걍가져옴아약스X
	 dataList = ${DisputeListtJSON};		
     
     //totalData(총 데이터 수) 구하기
	 totalData = dataList.length;
     
	 //글 목록 표시 호출 (테이블 생성)
     displayData(1, dataPerPage);
	 
   //페이징 표시 호출
     paging(totalData, dataPerPage, pageCount, 1);
});

//현재 페이지(currentPage)와 페이지당 글 개수(dataPerPage) 반영
function displayData(currentPage, dataPerPage) {

  let chartHtml = "";

//Number로 변환하지 않으면 아래에서 +를 할 경우 스트링 결합이 되어버림.. 
  currentPage = Number(currentPage);
  dataPerPage = Number(dataPerPage);
  
  
 if (totalData < (currentPage - 1) * dataPerPage + dataPerPage){
	
	  for (
		var i = (currentPage - 1) * dataPerPage;
		    i < totalData;
			     i++
			   ) {
		  chartHtml +=
		 	  '<tr><td>' + (dataList[i].escrow_start ? formatDate(new Date(dataList[i].escrow_start)) : "") + 
		 	  '</td><td>' +(dataList[i].escrow_user_id || "")  +
		 	  '</td><td>' +(dataList[i].lesson_title || "")  +
		 	  '</td><td>' +(dataList[i].tiper_user_id || "") +
		 	  '</td><td>' +(dataList[i].escrow_price || "").toLocaleString()+
		 	  '</td><td>' +(dataList[i].escrow_status === 0 ? "신청중" :
									dataList[i].escrow_status === 1 ? "진행중" : "" )+
		 	  '</td><td>' +
		 	 '<button type="button" class="tdcenter1_btn1" onclick="location.href=\'/forcedCompletion?escrow_price='+dataList[i].escrow_price+'&escrow_start='+dataList[i].escrow_start+'&user_id='+dataList[i].escrow_user_id+'&tiper_user_id='+dataList[i].tiper_user_id+'&report_lesson_num='+dataList[i].report_lesson_num+'\'">강제완료하기</button>'+
		 	 '<button type="button" class="tdcenter1_btn2" onclick="location.href=\'/cancel?escrow_price='+dataList[i].escrow_price+'&escrow_start='+dataList[i].escrow_start+'&user_id='+dataList[i].escrow_user_id+'&tiper_user_id='+dataList[i].tiper_user_id+'&report_lesson_num='+dataList[i].report_lesson_num+'\'">취소하기</button></tr>';
			   } 
 }else{ 
  
  for (
    var i = (currentPage - 1) * dataPerPage;
    i < (currentPage - 1) * dataPerPage + dataPerPage;
    i++
  ) {
	  chartHtml +=
		  '<tr><td>' + (dataList[i].escrow_start ? formatDate(new Date(dataList[i].escrow_start)) : "") + 
	 	  '</td><td>' +(dataList[i].escrow_user_id || "")  +
	 	  '</td><td>' +(dataList[i].lesson_title || "")  +
	 	  '</td><td>' +(dataList[i].tiper_user_id || "") +
	 	 '</td><td>' +(dataList[i].escrow_price || "").toLocaleString()+
	 	  '</td><td>' +(dataList[i].escrow_status === 0 ? "신청중" :
	 							dataList[i].escrow_status === 1 ? "진행중" : "" )+
	 	  '</td><td>' +
	 	 '<button type="button" class="tdcenter1_btn1" onclick="location.href=\'/forcedCompletion?escrow_price='+dataList[i].escrow_price+'&escrow_start='+dataList[i].escrow_start+'&user_id='+dataList[i].escrow_user_id+'&tiper_user_id='+dataList[i].tiper_user_id+'&report_lesson_num='+dataList[i].report_lesson_num+'\'">강제완료하기</button>'+
	 	  '<button type="button" class="tdcenter1_btn2" onclick="location.href=\'/cancel?escrow_price='+dataList[i].escrow_price+'&escrow_start='+dataList[i].escrow_start+'&user_id='+dataList[i].escrow_user_id+'&tiper_user_id='+dataList[i].tiper_user_id+'&report_lesson_num='+dataList[i].report_lesson_num+'\'">취소하기</button></tr>';
  }
  
}
 
 if( typeof chartHtml == "undefined" || chartHtml == ''){ chartHtml +="<div id='if_undefined'>해당정보가 없습니다.</div>"}

$("#data_table_body").html(chartHtml);
}
 
function paging(totalData, dataPerPage, pageCount, currentPage) {

	  totalPage = Math.ceil(totalData / dataPerPage); //총 페이지 수
	  
	  if(totalPage<pageCount){
	    pageCount=totalPage;
	  }
	  
	  let pageGroup = Math.ceil(currentPage / pageCount); // 페이지 그룹
	  let endPage = pageGroup * pageCount; //화면에 보여질 마지막 페이지 번호
	  
	  if (endPage > totalPage) {
	    endPage = totalPage;
	  }

	  let startPage = endPage - (pageCount - 1); //화면에 보여질 첫번째 페이지 번호
	  let next = Number(currentPage)+1;
	  let prev = Number(currentPage)-1;

	  let pageHtml = "";

	  if (prev > 0) {
	    pageHtml += "<li><a href='javascript:void(0)' id='prev'> 이전 </a></li>";
	  }

	 //페이징 번호 표시 
	  for (var i = startPage; i <= endPage; i++) {
	    if (currentPage == i) {
	      pageHtml +=
	        '<li class="on"><a href="javascript:void(0)" id="' + i + '">' + i + '</a></li>';
	    } else {
	      pageHtml += "<li><a href='javascript:void(0)' id='" + i + "'>" + i + "</a></li>";
	    }
	  }
	 
	 
	  if (next <= totalPage) {
	    pageHtml += '<li><a href="javascript:void(0);" id="next"> 다음 </a></li>';
	  }

	  $("#pagingul").html(pageHtml);

	  //페이징 번호 클릭 이벤트 
	  $("#pagingul li a").click(function () {
	    let $id = $(this).attr("id");
	    selectedPage = $(this).text();

	    if ($id == "next") selectedPage = next;
	    if ($id == "prev") selectedPage = prev;
	    
	    
	    //전역변수에 선택한 페이지 번호를 담는다...
	    globalCurrentPage = selectedPage;
	 
	    console.log("클릭시 글로벌 "+globalCurrentPage);
	    
	    //글 목록 표시 재호출
	    displayData(globalCurrentPage, dataPerPage);
	    //페이징 표시 재호출
	    paging(totalData, dataPerPage, pageCount, globalCurrentPage);
	  });
	}
$("#sel3").click(function(){
	console.log("여기오니");
	var search_condition=$('#sel1').val();
	var search_keyword=$('#sel2').val();
	
	$.ajax({ // ajax로 데이터 가져오기
		method: "POST",
		url: "/searchDispute",
	 	data: {search_condition:search_condition, search_keyword:search_keyword},
		dataType: "json",
		async:false,
		success: function (data) {
// 		 		alert("data: " + JSON.stringify(data));
		   //totalData(총 데이터 수) 구하기
		   totalData = data.length;
	       //데이터 대입
	       dataList=data;
	
	       if(typeof totalData == "undefined" || totalData == null || totalData == ""){ alert("검색결과가 없습니다.");}	
			 }
	 });		
	
	 //글 목록 표시 재호출
    displayData(1, 5);
    //페이징 표시 재호출
    paging(totalData, 5, pageCount, 1);
    
});


</script>
</html>