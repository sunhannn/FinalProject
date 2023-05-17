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
<title>Insert title here</title>

<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
.container {
position: relative; /*이만큼이 전체사이즈이다 알려주려고 넣은것*/ */
}
<style>

.container {
  margin: 0 auto;
}

tr {
	height: 24px;
	padding: 18px 0px;
}
.allSize{
	 width: 90%;
	 margin: 0 auto;
}
.cont1_table {
	width: 100%;
	margin: 0 auto;
	border-spacing: 0px !important;
}

.cont1_th {
	background-color: #F0F0F0;
}

.thCenter1 {
	margin: 10px 5px;
	text-align: center;
	padding: 12px 0;
	border-bottom: 1px solid lightgray;
	font-size: 14px;
}
.tdCenter1 {
	margin: 10px 5px;
	text-align: center;
	padding: 12px 0;
	border-bottom: 1px solid lightgray;
	font-size: 13px;
}

.tdcenter1_btn1 {
	border-style: none;
	background: #FFD400;
	color: #5c3b0c;
	margin: 5px;
	padding: 5px 18px;
	cursor: pointer;
}

.tdcenter1_btn2 {
	border-style: none;
	background: #E9E9E9;
	color: #5c3b0c;
	margin: 5px;
	padding: 5px 18px;
	cursor: pointer;
}

.btn {
   background-color: #c8c8c8;
   display: block;
   left: 15px;
   border: none;
   color: white;
   padding: 12px 15px;
   cursor: pointer;
}

.warning {
   border-radius: 4px;
   background-color: #ffd400;
   display: block;
   right: 15px;
   border: none;
   color: #5c3b0c;
   padding: 12px 15px;
   cursor: pointer;
   font-size:17px;
   font-weight:bold;
}

.warning:hover {
   background: #e7c310;
   color:black;
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
 input[type=date]{
    width: 160px;
   height: 30px;
   margin-bottom:10px;
   text-align:center;
  }
  select{
   	width: 104px;
    height: 30px;
  }
  .totalPay {

   left: 15px;
   color: #333333;
   display: block;
   font-size: 22px;
	font-weight:bold;
   magin: 0;
}
input.search{
 width: 260px;
 height: 30px;
 margin-bottom:10px;
}
@media (max-width: 768px) {
input[type=date]{
    width: 35%;
   height: 30px;
   margin-bottom:10px;
   text-align:center;
  }
  select{
   	width: 20%;
    height: 30px;
  }
  input.search{
 width: 55%;
 height: 30px;
 margin-bottom:10px;
}
  #sel1{
  width:30%
  }
}

</style>
</head>
<body>
<%@include file="../main/header.jsp" %>

<input type="hidden" id="point_id" value="${point_id}">
   <div class="container">
   <div class="allSize">
   <p style="font-size:27px; margin:40px 0px 20px 0px; font-weight:bold;">허니페이</p>
      
      <br>
     
      <p class="totalPay">잔여허니페이: <fmt:formatNumber value="${totalPoint.user_point}" groupingUsed="true" /> point</p>
      <button class="warning" type="button"
         onclick="location.href='goPointCharge'">허니페이 충전하러가기 ></button>
      <br><br>
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
		    <input type="radio" name="price_type" value="negative">포인트사용내역
		</label>
		<label>
		    <input type="radio" name="price_type" value="non-negative">포인트충전내역
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