<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
	<span id="noticeName">공지사항</span>
	<button type="button" onclick="location.href='listnotice'">목록가기</button>
	<form action="updateMoveNotice?notice_num=+${notice.notice_num}" method="post">
		<table>
			<tr>
				<td>${notice.notice_title}</td>
			</tr>
			
			<tr>
				<td>${notice.notice_date }</td>
			</tr>
			
			<tr>
				<td><pre>${notice.notice_cont }</pre></td>
			</tr>
		</table>
	<button type="submit">수정하기</button>
	</form>
	
</body>
</html>