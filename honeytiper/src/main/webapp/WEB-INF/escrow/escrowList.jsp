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
<title>안전결제 내역</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- <link rel="stylesheet" -->
<!-- 	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
<%
Date today = new Date();
String formattedDate = String.format("%tF", today);
%>
<style>
.container {
  width: 70%;
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
  padding: 8px;
  z-index: 1;
}

th {
  background-color: #f2f2f2;
  font-weight: bold;
}

#view-all-button, #search-button {
  border: 0;
  border-radius: 4px;
  background-color: #FFD400;
  font-size: 12pt;
  padding: 5px;
  margin: 5px;
  cursor: pointer;
  color: white;
}

#view-all-button:hover, #search-button:hover {
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
</style>
</head>
<body>
<script>
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
</script>
<script>

//전역변수정의
var totalData; //총 데이터 수
var dataPerPage=10; //한 페이지에 나타낼 글 수
var pageCount = 5; //페이징에 나타낼 페이지 수
var globalCurrentPage= 1; //현재 페이지


// 아약스로 하는 함수
// 검색 버튼 클릭 이벤트
function btnSFnc() {
    var startDate = $("#start-date").val();
    var endDate = $("#end-date").val();
    ajaxFnc(startDate, endDate);
}

// 전체보기 버튼 클릭 이벤트
function viewAllFnc() {
    $("#start-date").val("");
    $("#end-date").val("");
    ajaxFnc();
}

// 아약스 함수
function ajaxFnc(startDate = null, endDate = null) {
    startDate = startDate || $("#start-date").val();
    endDate = endDate || $("#end-date").val();

    $.ajax({
        method: "POST",
        url: 'callEscrowList',
        data:  {
            startDate: startDate,
            endDate: endDate
        },
        success: function (res) {
            totalData = res.length;
            //글 목록 표시 재호출
            displayData(globalCurrentPage, dataPerPage, res);
            //페이징 표시 재호출
            paging(totalData, dataPerPage, pageCount, globalCurrentPage);
        }
    });
}
//필터링된 데이터를 가져오는 아약스 함수
function filterDataByStatus(startDate, endDate, escrow_status) {
	console.log(escrow_status);
  $.ajax({
    method: "POST",
    url: 'callEscrowListByStatus',
    data: {
      startDate: startDate,
      endDate: endDate,
     escrow_status: escrow_status
    },
    success: function (res) {
      totalData = res.length;
      //글 목록 표시 재호출
      displayData(globalCurrentPage, dataPerPage, res);
      //페이징 표시 재호출
      paging(totalData, dataPerPage, pageCount, globalCurrentPage);
    }
  });
}

$(document).ready(function () {
  // 페이지 로드 시 전체 데이터를 불러옵니다.
  ajaxFnc();

  $('input[name="escrow_status"]').on('click', function () {
    var startDate = $("#start-date").val();
    var endDate = $("#end-date").val();
    var escrow_status = $('input[name="escrow_status"]:checked').val();
    filterDataByStatus(startDate, endDate, escrow_status);
  });
});
//displayData를 부르면 실행되는 함수
//현재 페이지(currentPage)와 페이지당 글 개수(dataPerPage) 반영
function displayData(currentPage, dataPerPage, dataList) {
// console.log('currentPage', currentPage);
// console.log('dataPerPage', dataPerPage);
// console.log('dataList', dataList);
// console.log('dataList.length', dataList.length);

let chartHtml = "";	

//Number로 변환하지 않으면 아래에서 +를 할 경우 스트링 결합이 되어버림.. 
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
	
    var formattedEscrowStart = formatDate(dataList[i].escrow_start) || "";
    var formattedEscrowEnd = formatDate(dataList[i].escrow_end) || "";
    
	 chartHtml += "<tr><td>" +(dataList[i].escrow_start ? formatDate(new Date(dataList[i].escrow_start)) : "") + 
	 "</td><td>" + (dataList[i].escrow_user_id || "") +
	 "</td><td>" + (dataList[i].tiper_user_id || "") +
	    "</td><td>" + (dataList[i].lesson_title || "") +
	 "</td><td>" + (dataList[i].escrow_status === 0 ? "신청중" :
         						dataList[i].escrow_status === 1 ? "진행중" :
             					dataList[i].escrow_status === 2 ? "완료" : "") +
	 "</td><td>" + (dataList[i].escrow_end ? formatDate(new Date(dataList[i].escrow_end)) : "") +
	 "</td><td>" + (dataList[i].escrow_price || "").toLocaleString()+ "</td></tr>";
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
<div class="container">
<h2 style="margin:40px 0px;">안전결제내역</h2>

		
<button id="view-all-button" onclick="viewAllFnc()">전체목록보기</button>
<br>
<label for="start-date">기간선택</label>
<input type="date" id="start-date" name="startDate" >

<label for="end-date">~</label>
<input type="date" id="end-date" name="endDate" >
<button id="search-button"  onclick="btnSFnc()">검색</button>

<label for="status-0">신청중</label>
<input type="radio" id="status-0" name="escrow_status" value="0">
<label for="status-1">진행중</label>
<input type="radio" id="status-1" name="escrow_status" value="1">
<label for="status-2">완료</label>
<input type="radio" id="status-2" name="escrow_status" value="2">
				<br>
            <hr class="hrFirst">
            <span id="displayCount"></span>
            <table class="table table-bordered">
	            <thead>
	                <tr class="pagination-row" >
	                    <th style="width:15%">강의수락날짜</th> 
	                    <th style="width:15%">수강자</th> 
	                    <th style="width:10%">강사</th>
	                    <th style="width:15%">강의이름</th>
	                    <th style="width:15%">진행상황</th>
	                    <th style="width:15%">완료날짜</th>
	                    <th style="width:15%">금액</th>
	                </tr>
	            </thead>
	            <tbody id="dataTableBody"></tbody>
            </table>
	<ul id="pagingul"></ul>
	</div>
</body>
</html>