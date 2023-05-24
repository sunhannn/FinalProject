<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.ggul.zip.escrow.EscrowVO, java.util.*" %><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Date" %>
<%@include file="../queen/adminNavbar.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>꿀TIPer 관리자 - 강의완료 및 취소</title>
<!-- 퀸컨트롤러에있음 -->
<link href="${pageContext.request.contextPath}/front/disputeResolution.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

</head>
<body>
<c:if test="${not empty message}">
   <script type="text/javascript">
       var message = "<c:out value='${message}'/>";
       alert(message);
   </script>
</c:if>
<div class="container">
<h2 style="margin:40px 0px;">강의완료 및 취소</h2>

  <div id="top_bar">
				<div id="search_wrapper">
				<button id="view-all-button" onclick="viewAll()">전체목록보기</button><br>
					<select class="search" id="sel1" name="search_condition"
						style="display: inline-block !important;">
						<option value="escrow_user_id">회원아이디</option>
						<option value="tiper_user_id">강사아이디</option>
					</select> <input class="search" type="text" name="search_keyword" id="sel2"
						placeholder="검색어를 입력하세요.">
					<button class="btn btn-success" type="submit" class="search" id="sel3"style="outline:none; border:none; background:transparent;">
					<i class="fa fa-search" style="font-size:24px; color:#FFD400; pading:0px"></i></button>
						<br><br>
						 <label for="status-0">신청중</label>
						<input type="radio" id="status-0" name="escrow_status" value="0">
						<label for="status-1">진행중</label>
						<input type="radio" id="status-1" name="escrow_status" value="1">
<!-- 						<label for="status-12">전체</label> -->
<!-- 						<input type="radio" id="status-12" name="escrow_status" value="12"> -->
						 <hr class="hrFirst">
						 <br>
				</div>
			</div>
            <span id="displayCount"></span>
            <table class="cont1_table">
	            <thead>
	                <tr class="cont1_th" >
	                     <th class="thCenter1" style="width:15%;">강의시작날짜</th> 
                       <th class="thCenter1" style="width:10%;">수강회원</th> 
                       <th class="thCenter1" style="width:25%;">강의명</th>
                        <th class="thCenter1" style="width:10%;">강사회원</th>
                        <th class="thCenter1" style="width:10%;">금액</th>
                       <th class="thCenter1" style="width:10%;">진행상황</th>
                       <th class="thCenter1" style="width:20%">완료 or 취소</th>
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
		 	  '<tr><td class="tdCenter1">' + (dataList[i].escrow_start ? formatDate(new Date(dataList[i].escrow_start)) : "") + 
		 	  '</td><td class="tdCenter1">' +(dataList[i].escrow_user_id || "")  +
		 	  '</td><td class="tdCenter1">' +(dataList[i].lesson_title || "")  +
		 	  '</td><td class="tdCenter1">' +(dataList[i].tiper_user_id || "") +
		 	  '</td><td class="tdCenter1">' +(dataList[i].escrow_price || "").toLocaleString()+
		 	  '</td><td class="tdCenter1">' +(dataList[i].escrow_status === 0 ? "신청중" :
									dataList[i].escrow_status === 1 ? "진행중" : "" )+
		 	  '</td><td class="tdCenter1">' +
		 	 '<button type="button" class="tdcenter1_btn1" title="강사에게 강의료가 입금됩니다" onclick="location.href=\'/forcedCompletion?escrow_num='+dataList[i].escrow_num+'&escrow_user_id='+dataList[i].escrow_user_id+'&tiper_user_id='+dataList[i].tiper_user_id+'&escrow_price='+dataList[i].escrow_price+'&lesson_title='+dataList[i].lesson_title+'\'">완료</button>'+
		 	 '<button type="button" class="tdcenter1_btn2" title="회원에게 환불처리됩니다" onclick="location.href=\'/cancel?escrow_num='+dataList[i].escrow_num+'&escrow_user_id='+dataList[i].escrow_user_id+'&tiper_user_id='+dataList[i].tiper_user_id+'&escrow_price='+dataList[i].escrow_price+'&lesson_title='+dataList[i].lesson_title+'\'">취소</button></tr>';
			   } 
 }else{ 
  
  for (
    var i = (currentPage - 1) * dataPerPage;
    i < (currentPage - 1) * dataPerPage + dataPerPage;
    i++
  ) {
	  chartHtml +=
		  '<tr><td class="tdCenter1">' + (dataList[i].escrow_start ? formatDate(new Date(dataList[i].escrow_start)) : "") + 
	 	  '</td><td class="tdCenter1">' +(dataList[i].escrow_user_id || "")  +
	 	  '</td><td class="tdCenter1">' +(dataList[i].lesson_title || "")  +
	 	  '</td><td class="tdCenter1">' +(dataList[i].tiper_user_id || "") +
	 	 '</td><td class="tdCenter1">' +(dataList[i].escrow_price || "").toLocaleString()+
	 	  '</td><td class="tdCenter1">' +(dataList[i].escrow_status === 0 ? "신청중" :
	 							dataList[i].escrow_status === 1 ? "진행중" : "" )+
	 	  '</td><td class="tdCenter1">' +
	 	  '<button type="button" class="tdcenter1_btn1" title="강사에게 강의료가 입금됩니다" onclick="location.href=\'/forcedCompletion?escrow_num='+dataList[i].escrow_num+'&escrow_user_id='+dataList[i].escrow_user_id+'&tiper_user_id='+dataList[i].tiper_user_id+'&escrow_price='+dataList[i].escrow_price+'&lesson_title='+dataList[i].lesson_title+'\'">완료</button>'+
	 	  '<button type="button" class="tdcenter1_btn2" title="회원에게 환불처리됩니다" onclick="location.href=\'/cancel?escrow_num='+dataList[i].escrow_num+'&escrow_user_id='+dataList[i].escrow_user_id+'&tiper_user_id='+dataList[i].tiper_user_id+'&escrow_price='+dataList[i].escrow_price+'&lesson_title='+dataList[i].lesson_title+'\'">취소</button></tr>';
  }
  
}
 
 if( typeof chartHtml == "undefined" || chartHtml == ''){ chartHtml +="<tr><td colspan='7' style='text-align:center;' id='if_undefined'>해당정보가 없습니다.</td></tr>"}

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
	  let displayCount = "";
	  displayCount = "현재 1 - " + totalPage + " 페이지 / " + totalData + "건";
	  $("#displayCount").text(displayCount);
	  
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

$('input[name="escrow_status"]').on('click', function () {
    var escrow_status = $('input[name="escrow_status"]:checked').val();
    var search_condition=$('#sel1').val() || null;
	var search_keyword=$('#sel2').val() || null;
    searchAndStatus(escrow_status, search_condition, search_keyword);
  });
  
function searchAndStatus(escrow_status, search_condition, search_keyword) {
	globalCurrentPage = 1;
	$.ajax({
		method: "POST",
		url: 'searchAndStatus',
		data: {
			escrow_status: escrow_status,
			search_condition: search_condition,
			search_keyword: search_keyword
		},
		success: function (data) {
			console.log("Selected Data:", {
				escrow_status: escrow_status,
				search_condition: search_condition,
				search_keyword: search_keyword
			});
			totalData = data.length;
			dataList = data;

			//글 목록 표시 재호출
			displayData(globalCurrentPage, dataPerPage);
			//페이징 표시 재호출
			paging(totalData, dataPerPage, pageCount, globalCurrentPage);
		}
	}); // success 함수의 닫는 괄호 이동
}
function viewAll() {
	 location.reload();
}

$("#sel3").click(function(){
	console.log("여기오니");
	var search_condition=$('#sel1').val();
	var search_keyword=$('#sel2').val();
    fetchData(search_condition, search_keyword);
});

function fetchData(search_condition, search_keyword) {
	$.ajax({ // ajax로 데이터 가져오기
		method: "POST",
		url: "searchDispute",
	 	data: {search_condition:search_condition, search_keyword:search_keyword},
		dataType: "json",
		async:false,
		success: function (data) {
		   //totalData(총 데이터 수) 구하기
		   totalData = data.length;
	       //데이터 대입
	       dataList=data;
		
	 //글 목록 표시 재호출
	 displayData(globalCurrentPage, dataPerPage);
	 //페이징 표시 재호출
	 paging(totalData, dataPerPage, pageCount, globalCurrentPage);
		}
	 });
}
</script>
</html>