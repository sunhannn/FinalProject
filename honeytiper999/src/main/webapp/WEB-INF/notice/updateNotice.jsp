<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
	function btnDelete(){
		location.href="deleteNotice?notice_num="+${getNotice.notice_num}
	}
</script>
<body>
<span id="noticeName">공지사항</span>
	<button type="button" onclick="location.href='listnotice'">목록가기</button>
	<form action="updateNotice?notice_num=+${getNotice.notice_num}" method="post">
		<table>
			<tr>
				<td><input type="text" name="notice_title" value="${getNotice.notice_title}"></td>
			</tr>
			
			<tr>
				<td>${getNotice.notice_date }</td>
			</tr>
			
			<tr>
				<td><input type="text" name="notice_cont" value="${getNotice.notice_cont }"></td>
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
		</table>
	<button type="submit">수정하기</button>
	<button type="button" onclick="btnDelete()">삭제하기</button>
	</form>
</body>
</html>