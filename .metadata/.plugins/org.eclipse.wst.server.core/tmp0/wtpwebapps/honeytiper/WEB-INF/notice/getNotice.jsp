<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>공지사항 상세보기</title>
	<%@ include file="../main/header.jsp" %>
	<style>
		#bdyMain {
			font-family: Arial, sans-serif;
			margin: 0;
			padding: 0;
		}

		#noticeName {
			font-size: 20pt;
			font-weight: bold;
			margin-bottom: 10px;
			color: #333;
		}


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
			background-color: #fff8e3;
			border-radius: 5px;
			line-height: 1.5;
			min-height: 300px;
			overflow: auto;
			max-width: 100%;
			box-sizing: border-box;
			border: 0;
		}

		#userListBack, #adminListBack, #listUpdate{
		    border-style: none;
		    background: #FFD400;
		    color: #5c3b0c;
		    margin: 5px;
		    padding: 5px 18px;
		    cursor: pointer;
			float: right;
			font-size: 12pt;
    		font-weight: bolder;
    		border-radius: 5px;
		}

		button[type="submit"]:hover, #adminListBack:hover, #userListBack:hover, #listUpdate:hover {
			background-color: #DBB600;
		}
	</style>
</head>
<body id="bdyMain">
	<div class="container">
		<div style="width: 85%; margin:50px auto;">
			<span id="noticeName" style="font-size: 27px; font-weight: border;">공지사항</span>
			<button type="button" onclick="location.href='listnotice'" id="userListBack">목록</button>
		</div>
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