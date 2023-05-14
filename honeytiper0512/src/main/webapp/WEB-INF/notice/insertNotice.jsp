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
 textarea {
    width: 100%;
    height: 6.25em;
    resize: none;
  }
  #noticeCont{
  	height: 35em;
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