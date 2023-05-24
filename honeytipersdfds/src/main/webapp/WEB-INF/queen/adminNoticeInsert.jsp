<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../queen/adminNavbar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>꿀TIPer 관리자 - 공지사항 등록</title>
        <link rel="stylesheet" href="front/bootstrap.css">
        <link rel="stylesheet" href="front/notice.css">
</head>
<link href="${pageContext.request.contextPath}/front/adminNoticeInsert.css" rel="stylesheet">
<style>
		#noticeCont:focus, #noticeTitle:focus{
			border:2px solid #FFD400;
			outline: none;
		}
		
		form{
			border:0;
		}
</style>
<body>
	<div class="container">
	<div style="margin: 40px 0;">
		<span id="noticeName">공지사항 등록</span>
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