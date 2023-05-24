<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.ggul.zip.notice.NoticeVO, java.util.*" %>
<%@ page import="java.util.Date" %>
<%@include file="../queen/adminNavbar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>꿀TIPer 관리자 - 공지사항</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- <link rel="stylesheet" -->
<!-- 	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
<%
Date today = new Date();
String formattedDate = String.format("%tF", today);

if(request.getParameter("suc")!=null){
	out.print("<script>");
	out.print("alert('수정이 완료되었습니다.');");
	out.print("</script>");
}

if(request.getParameter("del")!=null){
	out.print("<script>");
	out.print("alert('삭제가 완료되었습니다.');");
	out.print("</script>");
}



%>
<link href="${pageContext.request.contextPath}/front/adminNoticeList.css" rel="stylesheet">
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
	
	function selTr(val){
		location.href="updateMoveNotice?notice_num="+val;
	}
	
	
//전역변수정의
var totalData; //총 데이터 수
var dataPerPage=10; //한 페이지에 나타낼 글 수
var pageCount = 5; //페이징에 나타낼 페이지 수
var globalCurrentPage= 1; //현재 페이지


// ID(name) start-date(notice_start) end-date(notice_end) notice-search(notice_search)
var startDate = $("#start-date").val();
var endDate = $("#end-date").val();
var search = $("#notice-search").val();

// 검색 버튼 클릭 이벤트
function btnSFnc() {
startDate = $("#start-date").val();
endDate = $("#end-date").val();
search = $("#notice-search").val();
console.log(startDate);
console.log(endDate);
console.log(search);
    ajaxFnc();
}

// 전체보기 버튼 클릭 이벤트
function viewAllFnc() {
    $("#start-date").val("");
    $("#end-date").val("");
    $("#notice-search").val("");
    
    btnSFnc();
}

// 아약스 함수
function ajaxFnc() {
	startDate;
	endDate;
	search;
    $.ajax({
        method: "POST",
        url: 'adminNoticeList',
        data:  {
        	'notice_start': startDate,
        	'notice_end': endDate,
            'notice_search' : search
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
    
	 chartHtml += "<tr onclick='selTr("+dataList[i].notice_num +")' style='cursor: pointer'><td>"+(dataList[i].notice_num || "")+
	 "</td><td  class='titleTd' title='"+dataList[i].notice_title+"' style='width:50%; text-overflow:ellipsis; overflow:hidden; white-space:nowrap;'>" +(dataList[i].notice_title || "") + "</td><td>" + (dataList[i].notice_date || "") +
	    "</td><td>" + (dataList[i].notice_readcount || "") + "</td><td>" + (dataList[i].notice_pin || "");
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

function addNotice(){
	location.href = "insertMovenotice";
}
</script>
<div class="container">
<h2 style="margin:40px 0px;">공지사항 관리</h2>

		
<button id="view-all-button" onclick="viewAllFnc()">전체목록보기</button>
<br>
<label for="start-date">기간선택</label>
<input type="date" id="start-date" name="notice_start" >
<label for="end-date">~</label>
<input type="date" id="end-date" name="notice_end" >
<input type="text" id="notice-search" name="notice_search" placeholder="검색할 제목을 입력해주세요">
<button id="search-button"  style="outline:none; border:none; background:transparent;" onclick="btnSFnc()"><i class="fa fa-search" style="font-size:24px; color:#FFD400;"></i></button>
<button type="button" onclick="addNotice()" id="addNotice">공지사항 등록</button>

				<br>
            <hr class="hrFirst">
            <br>
            <span id="displayCount"></span>
            <table class="table table-bordered" style="table-layout: fixed;">
	            <thead>
	                <tr class="pagination-row" >
	                    <th style="width:10%">글번호</th> 
	                    <th style="width:50%">제목</th> 
	                    <th style="width:15%">날짜</th>
	                    <th style="width:10%">조회수</th>
	                    <th style="width:10%">고정여부</th>
	                </tr>
	            </thead>
	            <tbody id="dataTableBody" style="table-layout: fixed;"></tbody>
            </table>
	<ul id="pagingul"></ul>
	</div>
</body>
</html>