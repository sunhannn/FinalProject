<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../queen/adminNavbar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
        <link rel="stylesheet" href="front/bootstrap.css">
        <link rel="stylesheet" href="front/notice.css">
</head>
<style>
.container{
	width: 65%;
}
		form {
			background-color: #FFF;
			padding: 20px;
			border-radius: 4px;
			box-shadow: 0 0 10px rgba(0,0,0,0.1);
			margin-top: 50px;
			max-width: 100%;
			margin: 0 auto;
			border: 2px solid;
		}
		table {
			width: 100%;
		}
		td {
			padding: 10px;
		}
		textarea {
/* 			width: 100%; */
/* 			height: 6.25em; */
/* 			resize: none; */
/* 			border: 1px solid #CCC; */
/* 			padding: 5px; */
/* 			border-radius: 4px; */
/* 			font-size: 14px; */
/* 			margin-bottom: 10px; */
			width: 100%;
			height: 6.25em;
			resize: none;
			border: 1px solid #CCC;
			padding: 5px;
			border-radius: 4px;
			font-size: 14px;
			margin-bottom: 10px;
		}
		
		#noticeCont:focus, #noticeTitle:focus{
			border:2px solid gray;
			outline: none;
		}
		
		input[type="radio"] {
			margin-right: 5px;
		}
		input[type="submit"], button {
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
		input[type="submit"]:hover, button:hover {
			background-color: #E6B800;
		}
		
		#noticeCont{
			width: 100%;
			height: 23.25em;
			resize: none;
			border: 1px solid #CCC;
			padding: 5px;
			border-radius: 4px;
			font-size: 14px;
			margin-bottom: 10px;
		}
		#noticeName {
    font-size: 24px;
    font-weight: bold;
    margin: 10px;
    text-align: left;
}
#akwls0dhxh{
	text-align: center;
}

		
</style>
<body>
	<div class="container">
	<div style="margin: 40px 0;">
		<span id="noticeName">공지사항</span>
	</div>
	<form action="insertnotice" method="post">
	<table id="insertTable" style='width="80%" '>
		<tr>
			<td style="font-size: 16px; font-weight: bolder; text-align: center;">제목</td>
			<td><textarea name="notice_title" id="noticeTitle" required></textarea> </td>
		</tr>
		<tr>
			<td style="font-size: 16px; font-weight: bolder; text-align: center;">내용</td>
			<td width="80%"><textarea name="notice_cont" id="noticeCont"></textarea></td>
		</tr>
		<tr>
			<td style="padding-bottom: 18px; font-size: 16px; font-weight: bolder; text-align: center;">
			고정여부
			</td>
			<td style="text-align: left; font-size: 16px; font-weight: bolder;">
				<input type="radio" name="notice_pin" value="1" id="rhwjd"><label for="rhwjd">고정</label>&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio" name="notice_pin" value="0" id="dlfqks" checked><label for="dlfqks">일반</label>
			</td>
				
		</tr>
		<tr>
			<td></td>
		</tr>
	</table>
	<div id="akwls0dhxh">
		<input type="submit" value="등록">
		<button type="button" onclick="location.href='adminNoticeList'">목록가기</button>
	</div>
	</form>
	</div>
</body>
</html>