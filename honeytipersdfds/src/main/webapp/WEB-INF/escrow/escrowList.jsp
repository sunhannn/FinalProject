<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.ggul.zip.escrow.EscrowVO, java.util.*"%>
<%@ page import="java.util.Date"%>
<%@include file="../queen/adminNavbar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>꿀TIPer 관리자 - 안전결제 내역</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<%
Date today = new Date();
String formattedDate = String.format("%tF", today);
%>

<link href="${pageContext.request.contextPath}/front/escrowList.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
</head>
<body>
	<script>
window.onload = function() {
  var startDateInput = document.getElementById("start-date");
  var endDateInput = document.getElementById("end-date");

  var today = new Date();
  var formattedDate = today.toISOString().substr(0, 10);
  startDateInput.setAttribute("max", formattedDate);
  endDateInput.setAttribute("min", formattedDate);

  startDateInput.onchange = function() {
    endDateInput.setAttribute("min", startDateInput.value);
  };
};

//전역변수정의
var totalData; //총 데이터 수
var dataPerPage = 10; //한 페이지에 나타낼 글 수
var pageCount = 5; //페이징에 나타낼 페이지 수
var globalCurrentPage = 1; //현재 페이지

// 아약스로 하는 함수
// 검색 버튼 클릭 이벤트
function btnSFnc() {
  var startDate = $("#start-date").val();
  var endDate = $("#end-date").val();
  ajaxFnc(startDate, endDate);
}

// 전체보기 버튼 클릭 이벤트
function viewAllFnc() {
	 location.reload();
}

$(document).ready(function () {
  // 페이지 로드 시 전체 데이터를 불러옵니다.
  ajaxFnc();
  //날짜선택후 status를 선택했을때 통합적으로 검색하는 이벤트
  $('#escrow-status-select').on('change', function() {
    var escrow_status = $(this).val();
    var startDate = $("#start-date").val() || '';
    var endDate = $("#end-date").val() || '';
    
    filterDataByStatus(escrow_status, startDate, endDate);
  });
});

// 아약스 함수
function ajaxFnc(startDate = null, endDate = null) {
  startDate = startDate || $("#start-date").val();
  endDate = endDate || $("#end-date").val();

  $.ajax({
    method: "POST",
    url: 'callEscrowList',
    data: {
      startDate: startDate,
      endDate: endDate
    },
    dataType: "json",
	async:false,
    success: function (res) {
    	console.log("Selected Data:", {
            
            startDate: startDate,
            endDate: endDate
          });
    	
//       console.log(res);
      totalData = res.length;
      //글 목록 표시 재호출
      displayData(globalCurrentPage, dataPerPage, res);
      //페이징 표시 재호출
      paging(totalData, dataPerPage, pageCount, globalCurrentPage);
    }
  });
}

//필터링된 데이터를 가져오는 아약스 함수
function filterDataByStatus(escrow_status, startDate, endDate) {
  globalCurrentPage = 1;
  $.ajax({
    method: "POST",
    url: 'callEscrowListByStatus',
    data: {
      startDate: startDate,
      endDate: endDate,
      escrow_status: escrow_status
    },
    dataType: "json",
	async:false,
    success: function (res) {
    	console.log("Selected Data:", {
            escrow_status: escrow_status,
            startDate: startDate,
            endDate: endDate
          });
      totalData = res.length;
      //글 목록 표시 재호출
      displayData(globalCurrentPage, dataPerPage, res);
      //페이징 표시 재호출
      paging(totalData, dataPerPage, pageCount, globalCurrentPage);
    }
  });
}
function displayData(currentPage, dataPerPage, dataList) {
	let chartHtml = "";
	currentPage = Number(currentPage);
	dataPerPage = Number(dataPerPage);
	let startPage = (currentPage - 1) * dataPerPage;
	let endPage = (currentPage - 1) * dataPerPage + dataPerPage;
	if (endPage > dataList.length) endPage = dataList.length;

	function formatDate(date) {
	var d = new Date(date);
	var month = "" + (d.getMonth() + 1);
	var day = "" + d.getDate();
	var year = d.getFullYear();
	if (month.length < 2) month = "0" + month;
	if (day.length < 2) day = "0" + day;

	return [year, month, day].join("-");
	}

	for (var i = startPage; i < endPage; i++) {
	var formattedEscrowStart =
	formatDate(dataList[i].escrow_start) || "";
	var formattedEscrowEnd = formatDate(dataList[i].escrow_end) || "";
	chartHtml +=
		  "<tr><td class='tdCenter1'>" +
		  (dataList[i].escrow_start
		    ? formatDate(new Date(dataList[i].escrow_start))
		    : "") +
		  "</td><td class='tdCenter1'>" +
		  (dataList[i].escrow_user_id || "") +
		  "</td><td class='tdCenter1'>" +
		  (dataList[i].tiper_user_id || "") +
		  "</td><td class='tdCenter1'>" +
		  (dataList[i].lesson_title || "") +
		  "</td><td class='tdCenter1'>" +
		  (dataList[i].escrow_status === 0
		    ? "신청중"
		    : dataList[i].escrow_status === 1
		    ? "진행중"
		    : dataList[i].escrow_status === 2
		    ? "완료"
		    : dataList[i].escrow_status === 3
		    ? "관리자완료"
		    : dataList[i].escrow_status === 4
		    ? "관리자취소"
		    : "") +
		  "</td><td class='tdCenter1'>" +
		  (dataList[i].escrow_end
		    ? formatDate(new Date(dataList[i].escrow_end))
		    : "") +
		  "</td><td class='tdCenter1'>" +
		  (dataList[i].escrow_price || "").toLocaleString() +
		  "</td></tr>";
	}

	if (chartHtml === "") {
	chartHtml +=
	"<tr><td colspan='7' style='text-align:center;' id='if_undefined'>해당 정보가 없습니다.</td></tr>";
	}

	$("#dataTableBody").html(chartHtml);
	}

	//페이징함수
	function paging(totalData, dataPerPage, pageCount, currentPage) {
	totalPage = Math.ceil(totalData / dataPerPage);

	if (totalPage < pageCount) {
	pageCount = totalPage;
	}

	let pageGroup = Math.ceil(currentPage / pageCount);
	let endPage = pageGroup * pageCount;

	if (endPage > totalPage) {
	endPage = totalPage;
	}

	let startPage = endPage - (pageCount - 1);
	let next = Number(currentPage) + 1;
	let prev = Number(currentPage) - 1;

	let pageHtml = "";

	if (prev > 0) {
	pageHtml += "<li><a href='javascript:void(0)' id='prev'> 이전 </a></li>";
	}

	for (var i = startPage; i <= endPage; i++) {
	if (currentPage == i) {
	pageHtml +=
	"<li class='on'><a href='javascript:void(0)' id='" + i + "'>" + i +"</a></li>";
	} else {
	pageHtml +=
	"<li><a href='javascript:void(0)' id='" + i + "'>" + i + "</a></li>";
	}
	}

	if (next <= totalPage) {
	pageHtml += "<li><a href='javascript:void(0);' id='next'> 다음 </a></li>";
	}

	$("#pagingul").html(pageHtml);
	let displayCount = "현재 1 - " + totalPage + " 페이지 / " + totalData + "건";
	$("#displayCount").text(displayCount);

	$("#pagingul li a").click(function () {
	let $id = $(this).attr("id");
	selectedPage = $(this).text();
	if ($id == "next") selectedPage = next;
	if ($id == "prev") selectedPage = prev;

	globalCurrentPage = selectedPage;
	ajaxFnc();
	});
	}
</script>
	<div class="container">
		<h2 style="margin: 40px 0px;">안전결제내역</h2>

		<button id="view-all-button" onclick="viewAllFnc()">전체목록보기</button>
		<br>
<label for="start-date">기간선택</label> <input type="date"
			id="start-date" name="startDate"> <label for="end-date">~</label>
		<input type="date" id="end-date" name="endDate">
		<button id="search-button" onclick="btnSFnc()"
			style="outline: none; border: none; background: transparent;">
			<i class="fa fa-search" style="font-size:24px; color:#FFD400;"></i>
		</button>
		<br>
		<br>
		<div class="plz-right">
			<select id="escrow-status-select">
				<option value="" disabled selected>진행상황</option>
				<option id="status-0" value="0">신청중</option>
				<option id="status-1" value="1">진행중</option>
				<option id="status-2" value="2">완료</option>
				<option id="status-3" value="3">관리자완료</option>
				<option id="status-4" value="4">관리자취소</option>
			</select>
		</div>
		<hr class="hrFirst">
		<br> <span id="displayCount"></span>
		<table class="cont1_table">
			<thead>
				<tr class="cont1_th">
					<th class="thCenter1" style="width: 15%;">강의시작날짜</th>
	               <th class="thCenter1" style="width: 10%;">수강회원</th>
	               <th class="thCenter1" style="width: 10%;">강사회원</th>
	               <th class="thCenter1" style="width: 20%;">강의명</th>
	               <th class="thCenter1" style="width: 15%;">진행상황</th>
	               <th class="thCenter1" style="width: 15%;">완료날짜</th>
	               <th class="thCenter1" style="width: 15%;">금액</th>

				</tr>
			</thead>
			<tbody id="dataTableBody"></tbody>
		</table>
		<ul id="pagingul"></ul>
	</div>
	<div style="padding: 100px 0px"></div>
</body>
</html>