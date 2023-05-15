<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
        <link rel="stylesheet" href="front/bootstrap.css">
        <link rel="stylesheet" href="front/notice.css">
</head>
<style>
		body {
			background-color: #F5F5F5;
			font-family: Arial, sans-serif;
			padding: 20px;
		}
		h1 {
			color: #333;
			text-align: center;
			margin-top: 50px;
		}
		form {
			background-color: #FFF;
			padding: 20px;
			border-radius: 4px;
			box-shadow: 0 0 10px rgba(0,0,0,0.1);
			margin-top: 50px;
			max-width: 800px;
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
</style>
<body>
	<h1>공지사항등록</h1>
	<form action="insertnotice" method="post">
	<table id="insertTable" width="80%">
		<tr>
			<td>제목</td><td><textarea name="notice_title" required></textarea> </td>
		</tr>
		<tr>
			<td>내용</td><td width="80%"><textarea name="notice_cont" id="noticeCont"></textarea></td>
		</tr>
		<tr>
			<td>
			고정여부
			</td>
			<td>
				<input type="radio" name="notice_pin" value="1">고정
				<input type="radio" name="notice_pin" value="0" checked>일반
			</td>
				
		</tr>
		<tr>
			<td><input type="submit" value="등록"></td>
			<td><button type="button" onclick="location.href='adminNoticeList'">목록가기</button></td>
		</tr>
	</table>
	</form>
</body>
</html>