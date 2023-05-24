<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.ggul.zip.faq.FaqVO, java.util.*" %>
<%@ page import="java.util.Date" %>
<%@include file="../queen/adminNavbar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>꿀TIPer 관리자 - FAQ 관리</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- <link rel="stylesheet" -->
<!-- 	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
<%
Date today = new Date();
String formattedDate = String.format("%tF", today);

if(request.getParameter("update")!=null){
	out.print("<script>");
	out.print("alert('수정이 완료되었습니다.');");
	out.print("</script>");
}



%>
<link href="${pageContext.request.contextPath}/front/adminFaqList.css" rel="stylesheet">

</head>
<body>
<script>

//전역변수정의
var totalData; //총 데이터 수
var dataPerPage=10; //한 페이지에 나타낼 글 수
var pageCount = 5; //페이징에 나타낼 페이지 수
var globalCurrentPage= 1; //현재 페이지


// ID(name) start-date(notice_start) end-date(notice_end) notice-search(notice_search)
var search = $("#faq-search").val();


function selTdUpdate(val){
updateBtn = window.open('adminFaqUpdate?faq_question_num='+val, "_blank", "width=850px, height=800px, resizeable");

}

function selTdDelete(val){
	
	if(confirm("정말 삭제하시겠습니까?")){
		location.href="deleteFaq?faq_question_num="+val
	}else{
		alert("삭제 취소하였습니다.");
	}
	
	
	
}


// 검색 버튼 클릭 이벤트
function btnSFnc() {
	search = $("#faq-search").val();
    ajaxFnc();
};

// 전체보기 버튼 클릭 이벤트
function viewAllFnc() {
	$("#faq-search").val("");
    btnSFnc();
}

// 아약스 함수
function ajaxFnc() {
	search;
    $.ajax({
        method: "POST",
        url: 'adminFaqList',
        data:{
        	'faq_search' : search
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
})


function displayData(currentPage, dataPerPage, dataList) {

let chartHtml = "";	

currentPage = Number(currentPage);
dataPerPage = Number(dataPerPage);
let startPage = (currentPage - 1) * dataPerPage; //15
let endPage = (currentPage - 1) * dataPerPage + dataPerPage;
if(endPage > (dataList.length)) endPage = dataList.length;


for (var i = startPage; i < endPage; i++) {
	
	 chartHtml += "<tr><td style='text-align:center;'>"+(dataList[i].faq_question_num || "")+
	 "</td><td title='"+dataList[i].faq_question+"' style='text-overflow:ellipsis; overflow:hidden; white-space:nowrap;'>" +(dataList[i].faq_question || "") + 
	 "</td><td style='text-align:center;'><button id='updateBtn' type='button' onclick='selTdUpdate("+dataList[i].faq_question_num +")'>수정</button>&nbsp;&nbsp;"+
	 "<button id='deleteBtn' type='button' onclick='selTdDelete("+dataList[i].faq_question_num +")'> 삭제</button></td></tr>";
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

	function addFaq(){
 		location.href="insertMoveFaq";
 	}

</script>
<div class="container">
<h2 style="margin:40px 0px;">F A Q 관리</h2>
<button id="view-all-button" onclick="viewAllFnc()">전체목록보기</button>
		<br>
<label for="faq-search">제목검색</label>
<input type="text" id="faq-search" name="faq_search" placeholder="검색하실 제목을 입력하세요.">
<button id="search-button"  style="outline:none; border:none; background:transparent;" onclick="btnSFnc()"><i class="fa fa-search" style="font-size:24px; color:#FFD400;"></i></button>
<button type="button" onclick="addFaq()" id="addFaq">자주묻는질문등록하기</button>
				<br>
            <hr class="hrFirst">
            <br>
            <span id="displayCount"></span>
            <br>
            <table class="table table-bordered" style="table-layout: fixed;">
	            <thead>
	                <tr class="pagination-row" >
	                    <th style="width:10%">번호</th> 
	                    <th style="width:60%">질문</th>
	                    <th style="width:17%" style="padding:5px;">관리</th>
	                </tr>
	            </thead>
	            <tbody id="dataTableBody" style="table-layout: fixed;"></tbody>
            </table>
	<ul id="pagingul"></ul>
	</div>
</body>
</html>