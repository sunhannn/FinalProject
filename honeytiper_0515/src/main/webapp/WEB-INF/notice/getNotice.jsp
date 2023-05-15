<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>공지사항 상세보기</title>
	<%@ include file="../main/header.jsp" %>
	<style>
		#bdyMain {
			background-color: #F2F2F2;
			font-family: Arial, sans-serif;
			margin: 0;
			padding: 0;
		}

		#noticeName {
			font-size: 20pt;
			font-weight: bold;
			margin-left: 20px;
			margin-top: 30px;
			margin-bottom: 10px;
			color: #333;
		}

/* 		button[type="button"] { */
/* 			background-color: #333; */
/* 			border: none; */
/* 			border-radius: 3px; */
/* 			color: #FFF; */
/* 			cursor: pointer; */
/* 			font-size: 14px; */
/* 			padding: 8px 16px; */
/* 			text-align: center; */
/* 			transition: background-color 0.3s; */
/* 			margin-top: 20px; */
/* 			margin-right: 20px; */
/* 			float: right; */
/* 		} */

/* 		button[type="button"]:hover { */
/* 			background-color: #555; */
/* 		} */

		#frmMain {
			background-color: #FFF;
			border-radius: 5px;
			box-shadow: 0 0 10px rgba(0,0,0,0.2);
			margin: 30px auto;
			max-width: 800px;
			padding: 20px;
		}
		#spnTitle {
			font-size: 18pt;
			font-weight: bold;
			margin-bottom: 10px;
			color: #333;
		}

		#lblDate {
			font-size: 12pt;
			color: #777;
		}

		#noticeCont {
			font-size: 12pt;
			white-space: pre-wrap;
			word-wrap: break-word;
			margin-top: 20px;
			padding: 20px;
			background-color: #F2F2F2;
			border-radius: 5px;
			line-height: 1.5;
			min-height: 300px;
			overflow: auto;
			max-width: 100%;
			box-sizing: border-box;
		}

		button[type="submit"], #userListBack, #adminListBack, #listUpdate{
			background-color: #FFD400;
			border: none;
			border-radius: 3px;
			box-shadow: 0 3px 0 #E6BF00;
			color: #FFF;
			cursor: pointer;
			font-size: 16px;
			font-weight: bold;
			padding: 10px 20px;
			transition: background-color 0.3s;
			float: right;
			margin: 10px;
		}

		button[type="submit"]:hover, #adminListBack:hover, #userListBack:hover, #listUpdate:hover {
			background-color: #DBB600;
		}
	</style>
</head>
<%
	
%>
<body id="bdyMain">
	<div class="container">
		<span id="noticeName" style="margin:165px; font-size: 30pt; font-weight: border;">공지사항</span>
		<button type="button" onclick="location.href='listnotice'" style="margin-right:170px;" id="userListBack">목록으로 돌아가기</button>
	</div>
	<form action="updateMoveNotice?notice_num=${notice.notice_num}" method="post" id="frmMain">
		<span id="spnTitle">${notice.notice_title}</span><br>
		<label id="lblDate">${notice.notice_date }</label>
		<div id="divCont"><pre id="noticeCont">${notice.notice_cont }</pre></div><hr>
		<c:if test="${user_id eq 'admin' }"><button type="submit">수정하기</button></c:if>
		<c:if test="${user_id eq 'admin' }"><button type="button" onclick="location.href='deleteNotice'" id="listUpdate">삭제하기</button></c:if>
	</form>
	<br>
	<%@include file="../main/footer.jsp"%>
</body>
</html>