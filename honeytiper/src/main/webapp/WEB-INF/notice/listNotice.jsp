<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.ggul.zip.notice.NoticeVO, java.util.*" %>
<%@ include file="../main/header.jsp"%>

<!DOCTYPE html>
<html>
    <head>
        <title>부트스트랩 이용했음</title>
        <link rel="shortcut icon" href="data:image/x-icon" type="image/x-icon">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/front/notice.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>

<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.2/jquery.min.js"></script> -->
<script src="${pageContext.request.contextPath}/front/jquery.js"></script>
<%-- <jsp:include page="../main/header.jsp" /> --%>
<style>

.hrFirst{
        background:#efefef;
}
#btnSearch{
	border:0;
	border-radius: 10px;
	background-color: #FFD400;
	font-size: 14px; 
}

ul {
    text-align: center;
    display: inline-block;
    border: none;
    border-right: 0;
	padding-left :0;
}
ul li {
    text-align: center;
    float: left;
	list-style:none;

}

ul li a {
    display: block;
    font-size: 14px;
	color: black;
    padding: 9px 12px;
    border-right: none;
    box-sizing: border-box;
	text-decoration-line:none;
}

ul li.on {
    background: #FFD400;
}

ul li.on a {
    color: #fff;
}

th, td{
	padding: 10px 0px;
	text-align: center;
	border-bottom: 3px solid white;
}

#iptSearch{
	padding: 5px;
	font-size: 14px;
}

#selCondition{
	height: 34px;
	padding: 5px;
	font-size: 14px;
}
#tlqkffha{
	border-style: none;
    background: #FFD400;
    color: #5c3b0c;
    margin: 5px;
    padding: 5px 18px;
    cursor: pointer;
    font-size: 12pt;
    font-weight: bolder;
    border-radius: 5px;
}
.noticeTitle{
	text-align: left;
}
</style>

<%--         <link rel="stylesheet" href="${pageContext.request.contextPath}/front/bootstrap.css"> --%>




<script>

function selTr(val){
	location.href="getnotice?notice_num="+val;
}


function btnSFnc(){
		ajaxFnc(); 
}
    
var totalData; //총 데이터 수
var dataPerPage= 15; //한 페이지에 나타낼 글 수
var pageCount = 5; //페이징에 나타낼 페이지 수
var globalCurrentPage= 1; //현재 페이지
    
function ajaxFnc(){
	
 	var condition = document.getElementById('selCondition').value;
 	var search = $('#iptSearch').val();
	
	$.ajax({ // ajax로 데이터 가져오기
		method: "POST",
		url : 'listnotice',
		data:{'notice_search':search,'notice_condition':condition},
		cache:false,
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
	ajaxFnc();
	
	
	frm.addEventListener('submit', e =>{
	 e.preventDefault();
	});
});
    
//현재 페이지(currentPage)와 페이지당 글 개수(dataPerPage) 반영
function displayData(currentPage, dataPerPage, dataList) {
	let chartHtml = "";	
	
	//Number로 변환하지 않으면 아래에서 +를 할 경우 스트링 결합이 되어버림.. 
	currentPage = Number(currentPage);
	dataPerPage = Number(dataPerPage);
	let startPage = (currentPage - 1) * dataPerPage; //15
	let endPage = (currentPage - 1) * dataPerPage + dataPerPage;
	if(endPage > (dataList.length)) endPage = dataList.length;
	
	 for (var i = startPage ;i < endPage; i++){
		 chartHtml += "<tr onclick='selTr("+dataList[i].notice_num +")' style='";
			 if(dataList[i].notice_pin > 0){
				 chartHtml += "background-color:#fff8e3; ";
			 }
		 chartHtml += "cursor: pointer'><td>" + dataList[i].notice_num + "</td><td  class='noticeTitle'>" + dataList[i].notice_title + "</td><td>"+dataList[i].notice_date+"</tr>";
	 }
	 
	$("#dataTableBody").html(chartHtml);
	
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
		ajaxFnc();
	});
	  
}
 

</script>
<body>

        <div class="container">
        <br>
            <div class="divLeft" style="width:150px; text-align: left;">
                <span id="spnNotice" style="text-align: left;">공지사항</span>
            </div>
            
            <div style="float:right;">
	            <form name="frm">
		            <select name="notice_condition" id="selCondition">
						<option value="title">제목</option>
						<option value="content">내용</option>
	    			</select>
	                <input type="text" name="notice_search" id="iptSearch" placeholder="검색할 제목을 입력해주세요.">
	                <button id="btnSearch" type="button" onclick="btnSFnc()" style="background:white;"><i class="fa fa-search" style="font-size:24px; color:#FFD400;"></i></button>
	                <button type="button" onclick="location.href='listnotice'" id='tlqkffha'>전체보기</button>
	             </form>
            </div>
				<br><br>
            <hr class="hrFirst">
            <span id="displayCount" style="text-align: left; display: block;"></span>
            <table style="width:100%; font-size:14px;">
	            <thead>
	                <tr>
	                    <th style="width:10% ">글번호</th>
	                    <th style="width:75%">제목</th>
						<th style="width:15%">등록일</th>
	                </tr>
	            </thead>
	            <tbody id="dataTableBody"></tbody>
            </table>
            

	<ul id="pagingul"></ul>
            
	</div>
	<%@include file="../main/footer.jsp"%>
    </body>
</html>