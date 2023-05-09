<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
        <link rel="stylesheet" href="front/bootstrap.css">
        <link rel="stylesheet" href="front/notice.css">
</head>
<style>
	#insertTable{
		border: 1px solid #000;
	}
	
	#noticeCont{
		resize: none;
		white-space: pre;
	}
</style>
<body>
	<h1>공지사항등록</h1>
	<form action="insertnotice" method="post">
	<table id="insertTable">
		<tr>
			<td>제목</td><td><input type="text" name="notice_title" required> </td>
		</tr>
		<tr>
			<td>내용</td><td><textarea name="notice_cont" id="noticeCont"></textarea></td>
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
			<td><button type="button" onclick="location.href='listnotice'">목록가기</button></td>
		</tr>
	</table>
	</form>
</body>
</html>