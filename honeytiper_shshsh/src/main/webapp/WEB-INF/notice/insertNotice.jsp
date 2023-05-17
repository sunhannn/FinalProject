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
			max-width: 1300px;
			margin: 0 auto;
		}
		table {
			width: 100%;
		}
		td {
			padding: 10px;
		}
		textarea {
			width: 100%;
			height: 6.25em;
			resize: none;
			border: 1px solid #CCC;
			padding: 5px;
			border-radius: 4px;
			font-size: 14px;
			margin-bottom: 10px;
		}
		input[type="radio"] {
			margin-right: 5px;
		}
		input[type="submit"], button {
			background-color: #008CBA;
			color: #FFF;
			border: none;
			border-radius: 4px;
			padding: 10px 20px;
			font-size: 16px;
			cursor: pointer;
			margin-top: 20px;
			display: inline-block;
		}
		button[type="button"] {
			background-color: #F5F5F5;
			color: #333;
			border: none;
			border-radius: 4px;
			padding: 10px 20px;
			font-size: 16px;
			cursor: pointer;
			margin-top: 20px;
			display: inline-block;
			margin-left: 10px;
		}
		button[type="button"]:hover {
			background-color: #CCC;
		}
		
		#noticeCont{
			width: 100%;
			height: 35.25em;
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
		
</style>
<body>
	<div class="container">
	<div style="margin: 40px 0;">
		<span id="noticeName">공지사항</span>
	</div>
	<form action="insertnotice" method="post">
	<table id="insertTable" style='width="80%" '>
		<tr>
			<td style="font-size: 16pt; font-weight: bolder; text-align: center;">제목</td>
			<td><textarea name="notice_title" required></textarea> </td>
		</tr>
		<tr>
			<td style="font-size: 16pt; font-weight: bolder; text-align: center;">내용</td>
			<td width="80%"><textarea name="notice_cont" id="noticeCont"></textarea></td>
		</tr>
		<tr>
			<td style="padding-bottom: 0; font-size: 16pt; font-weight: bolder; text-align: center;">
			고정여부
			</td>
			<td style="text-align: center; font-size: 16pt; font-weight: bolder;">
				<input type="radio" name="notice_pin" value="1">고정&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio" name="notice_pin" value="0" checked>일반
			</td>
				
		</tr>
		<tr>
			<td></td>
			<td>
				<input type="submit" value="등록" style="float:right; margin: 20px 400px 0 30px;">
				<button type="button" onclick="location.href='adminNoticeList'" style="float:right;">목록가기</button>
			</td>
		</tr>
	</table>
	</form>
	</div>
</body>
</html>