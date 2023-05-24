<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>꿀TIPer 관리자 - 회원 리스트</title>
<link href="${pageContext.request.contextPath}/front/adminUserList.css" rel="stylesheet">
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script>
 var totalData; //총 데이터 수
 var dataPerPage = 10; //한 페이지에 나타낼 글 수
 var pageCount = 5; //페이징에 나타낼 페이지 수
 var globalCurrentPage= 1; //현재 페이지
 var dataList; //표시하려하는 데이터 리스트
 var search = $("#user-search").val();
 var condition = $("#user-condition").val();

	function selTr(val){
	location.href="updateMoveUser?user_id="+val;
	}
 
 
	// 검색 버튼 클릭 이벤트
	function btnSFnc() {
	search = $("#user-search").val();
	condition = $("#user-condition").val();
	    ajaxFnc();
	}

	// 전체보기 버튼 클릭 이벤트
	function viewAllFnc() {
	    location.reload();
	}

//아약스 함수
 function ajaxFnc() {
     $.ajax({
         method: "POST",
         url: 'listuser',
         data:{
        	 'user_search' : search,
        	 'user_condition' : condition	 
         },
         success: function (res) {
         
             totalData = res.length;
             displayData(globalCurrentPage, dataPerPage, res);
             paging(totalData, dataPerPage, pageCount, globalCurrentPage);
         }
     });
 }

 $(document).ready(function () {
	 ajaxFnc();
 });


 function displayData(currentPage, dataPerPage, dataList) {

	 let chartHtml = "";	

	 currentPage = Number(currentPage);
	 dataPerPage = Number(dataPerPage);
	 let startPage = (currentPage - 1) * dataPerPage; //15
	 let endPage = (currentPage - 1) * dataPerPage + dataPerPage;
	 if(endPage > (dataList.length)) endPage = dataList.length;

	 function formatDate(date) {
	     var d = new Date(date); 
	     var month = '' + (d.getMonth() + 1);
	     var day = '' + d.getDate();
	     var year = d.getFullYear();

	     if (month.length < 2) month = '0' + month;
	     if (day.length < 2) day = '0' + day;

	     return [year, month, day].join('-');
	 }

	 for (var i = startPage; i < endPage; i++) {
	 	
	     var formattedEscrowStart = formatDate(dataList[i].notice_start) || "";
	     var formattedEscrowEnd = formatDate(dataList[i].notice_end) || "";
     
 	 chartHtml +=
 	 "<tr onclick=\"selTr(  \'"+dataList[i].user_id +"\'  )\" style='cursor: pointer'><td  style='text-overflow:ellipsis; overflow:hidden; white-space:nowrap;'>"+ dataList[i].user_id +
 	 "</td><td  style='text-overflow:ellipsis; overflow:hidden; white-space:nowrap;'>" + dataList[i].user_name +
 	 "</td><td style='text-overflow:ellipsis; overflow:hidden; white-space:nowrap;'>" + (dataList[i].user_addr2 +  dataList[i].user_addr3 + dataList[i].user_addr4)+
 	 "</td><td  style='text-overflow:ellipsis; overflow:hidden; white-space:nowrap;'>" + (dataList[i].user_tel || "")+
 	 "</td><td  style='text-overflow:ellipsis; overflow:hidden; white-space:nowrap;'>" + (dataList[i].user_email || "")+
 	 "</td><td  style='text-overflow:ellipsis; overflow:hidden; white-space:nowrap;'>" + (dataList[i].user_cate || "");
 	 
  }
  
 $("#dataTableBody").html(chartHtml);

 }

 //페이징함수
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
 	ajaxFnc();
 });
   
 }
 
 


</script>
<%@include file="../queen/adminNavbar.jsp"%>

<body>
	<div class="container">
		<h2 style="margin: 40px 0px;">회원 리스트</h2>
		<button id="view-all-button"
			onclick="viewAllFnc()">전체목록보기</button>
		<br>
		<br>
		<div id="search_wrapper">
			<select class="search002" id="user-condition" name="user_condition"
				style="display: inline-block !important; margin-right: 10px;">

				<option value="user_id">회원아이디</option>
				<option value="user_name">회원명</option>
			</select> <input class="search002" type="text" name="user_search"
				id="user-search" placeholder="검색어를 입력해주세요.">
			<button class="btn btn-success" type="button"
				class="search002"  onclick="btnSFnc()"
				style="outline: none; border: none; background: transparent;">
				<i class="fa fa-search" style="font-size: 24px; color: #FFD400; cursor: pointer;"></i>
			</button>
		</div>
		<hr class="hrFirst">
		<br>
		<span id="displayCount"></span>
		<table class="cont1_table" style="table-layout: fixed;">
			<thead class="btn-primary">
				<tr class="pagination-row">
					<th style="width: 14%">아이디</th>
					<th style="width: 9%">이름</th>
					<th style="width: 40%">주소</th>
					<th style="width: 12%">전화번호</th>
					<th style="width: 18%">이메일</th>
					<th style="width: 11%">관심TIP</th>
				</tr>
			</thead>
			<tbody id="dataTableBody">

			</tbody>
		</table>

		<ul id="pagingul">
		</ul>
	</div>
</body>




</html>