<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.ggul.zip.payment.PointVO, java.util.*" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>꿀TIPer - 허니페이</title>

<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
   
<link href="${pageContext.request.contextPath}/front/pointInfo.css" rel="stylesheet">
</head>
<body>
<%@include file="../main/header.jsp" %>

<input type="hidden" id="point_id" value="${point_id}">
   <div class="container">
   <div class="allSize">
   <p style="font-size:27px; margin:40px 0px 20px 0px; font-weight:bold;">허니페이</p>
      
      <br>
     
      <p class="totalPay">잔여 허니페이: <fmt:formatNumber value="${totalPoint.user_point}" groupingUsed="true" /> point</p>
      <button class="warning" type="button"
         onclick="location.href='goPointCharge'">허니페이 충전하러가기 ></button>
      <br><br>
      <button id="view-all-button" onclick="viewAllFnc()">전체목록보기</button><br>
      <div class="search-box">
      <label for="start-date">날짜</label>
		<input type="date" id="start-date" name="startDate" >
		<label for="end-date">~</label>
		<input type="date" id="end-date" name="endDate" >
		
    <select class="search" id="sel1" name="search_condition" style="display: inline-block !important;">
    <option value="">선택하세요</option>
    <option value="point_history">내용</option>
	</select>
	<input class="search" type="text" name="search_keyword" id="sel2" placeholder="검색어를 입력하세요.">
	<button id="search-button" type="button"style="border: 0;background: none;"><i class="fa fa-search" style="font-size:24px; color:#FFD400;"></i></button>
				</div>
				
		<label>
		    <input type="radio" name="price_type" value="all" checked> 전체
		</label>
		<label>
		    <input type="radio" name="price_type" value="negative">허니페이 사용내역
		</label>
		<label>
		    <input type="radio" name="price_type" value="non-negative">허니페이 충전내역
		</label><br><hr style="margin-top:7px;">
		 <span id="displayCount"></span>			
	<table class="cont1_table">
   <thead>
      <tr class="cont1_th">
         <th class="thCenter1" style="width: 25%; text-align: center;">날짜</th>
         <th class="thCenter1" style="width: 55%; text-align: center;">내용</th>
         <th class="thCenter1" style="width: 20%; text-align: center;">허니페이</th>
      </tr>
   </thead>
   <tbody id="dataTableBody"></tbody>
</table>
<ul id="pagingul"></ul>
</div>
</div>
<div style="padding:100px 0px"></div>
   <%@include file="../main/footer.jsp" %>
</body>

<script>
function formatDate(date) {
    var year = date.getFullYear();
    var month = ("0" + (date.getMonth() + 1)).slice(-2); // Months are zero based. Add leading 0, slice last 2 chars
    var day = ("0" + date.getDate()).slice(-2);
    var hour = ("0" + date.getHours()).slice(-2);
    var minute = ("0" + date.getMinutes()).slice(-2);
    var second = ("0" + date.getSeconds()).slice(-2);

    return year + "-" + month + "-" + day + " " + hour + ":" + minute + ":" + second;
}
   // 오늘이후 날짜선택막기, 선택이전날짜막기
   window.onload = function() {
      var startDateInput = document.getElementById("start-date");
      var endDateInput = document.getElementById("end-date");

      var today = new Date();
      var formattedDate = today.toISOString().substr(0, 10);
      startDateInput.setAttribute("max", formattedDate);
      endDateInput.setAttribute("max", formattedDate);

      startDateInput.onchange = function() {
         endDateInput.setAttribute("min", startDateInput.value);
      };

   };

   // 전역변수정의
var totalData; //총 데이터 수
var dataPerPage=10; //한 페이지에 나타낼 글 수
var pageCount = 5; //한 번에 나타낼 페이지 수 ([이전] 1 2 3 4 5 [다음])
var globalCurrentPage= 1; //현재 페이지
var dataList; //데이터 리스트

   
   $(document).ready(function () {
	   ajaxFnc();
   });
function displayData(currentPage, dataPerPage) {
	    let tableHtml = "";
	    currentPage = Number(currentPage);
	    dataPerPage = Number(dataPerPage);
    
	    
	    if (totalData < (currentPage - 1) * dataPerPage + dataPerPage){

    	for (
    		var i = (currentPage - 1) * dataPerPage;
    		    i < totalData;
    			     i++
    		) {
        tableHtml += '<tr><td class="tdCenter1">' + (dataList[i].point_time ? formatDate(new Date(dataList[i].point_time)) : "") 
                     + '</td><td class="tdCenter1">' + (dataList[i].point_history) 
                     + '</td><td class="tdCenter1">' + (dataList[i].point_price).toLocaleString() + "</td></tr>";
    					}
	}else{ 
	  
	  for (
	    var i = (currentPage - 1) * dataPerPage;
	    i < (currentPage - 1) * dataPerPage + dataPerPage;
	    i++
	  ) {
		  tableHtml += '<tr><td class="tdCenter1">' + (dataList[i].point_time ? formatDate(new Date(dataList[i].point_time)) : "") 
          + '</td><td class="tdCenter1">' + (dataList[i].point_history) 
          + '</td><td class="tdCenter1">' + (dataList[i].point_price).toLocaleString() + "</td></tr>";
		}
	  }
	    if( typeof tableHtml == "undefined" || tableHtml == ''){ tableHtml +="<tr><td colspan='3' style='text-align:center;' id='if_undefined'>해당정보가 없습니다.</td></tr>"}
    
    $("#dataTableBody").html(tableHtml);
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
	 console.log("클릭시 글로벌 "+globalCurrentPage);
	    
   //글 목록 표시 재호출
   displayData(globalCurrentPage, dataPerPage);
   //페이징 표시 재호출
   paging(totalData, dataPerPage, pageCount, globalCurrentPage);
});
}

//전체보기 버튼 클릭 이벤트
function viewAllFnc() {
    location.reload();
}

$('#search-button').click(function() {
    var startDate = $('#start-date').val();
    var endDate = $('#end-date').val();
    var searchCondition = $('#sel1').val();
    var searchKeyword = $('#sel2').val();

    // 검색 조건을 파라미터로 ajaxFnc 함수 호출
    ajaxFnc(startDate, endDate, searchCondition, searchKeyword);
  });

$('input[name="price_type"]').on('click', function() {
	  var priceType = $(this).val();
	  ajaxFnc(priceType);
	});
function ajaxFnc(startDate = null, endDate = null,search_condition = "", search_keyword = "", priceType = "all") {
    var search_condition = $('#sel1').val() || "";
    var search_keyword = $('#sel2').val() || "";
    startDate = startDate || $("#start-date").val();
    endDate = endDate || $("#end-date").val();

    var priceType = $("input[name='price_type']:checked").val() || "all";

    $.ajax({
       method: "POST",
       url: '/callHoneypayList',
       data: {
          startDate: startDate,
          endDate: endDate,
          search_condition: search_condition,
          search_keyword: search_keyword,
          price_type: priceType,
          point_id: $("#point_id").val()
       },
       dataType: "json",
		 async:false,
       success: function (data) {
          dataList = data;
          totalData = data.length;
       },
       error: function (xhr, status, error) {
           console.error(error);
       }
    });
    displayData(globalCurrentPage, dataPerPage);
    //페이징 표시 재호출
    paging(totalData, dataPerPage, pageCount, globalCurrentPage);
}
</script>

</html>