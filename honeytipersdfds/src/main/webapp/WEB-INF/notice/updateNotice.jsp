<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../queen/adminNavbar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>꿀TIPer 관리자 - 공지사항 수정</title>
</head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/front/bootstrap.css">
    <link href="${pageContext.request.contextPath}/front/updateNotice.css" rel="stylesheet">
<script>
	function btnDelete(){
		location.href="deleteNotice?notice_num="+${getNotice.notice_num}
	}
</script>
<body>
<div class="container">
	<div style="margin: 40px 0;">
		<span id="noticeName">공지사항</span>
		<button type="button" onclick="location.href='listnotice'">목록(사용자) 가기</button>
		<button type="button" onclick="location.href='adminNoticeList'">목록(관리자) 가기</button>
	</div>
	<form action="updateNotice?notice_num=+${getNotice.notice_num}" method="post">
	
		<table>
			<tr>
				<td style="font-size: 14pt;">${getNotice.notice_date }</td>
			</tr>
			<tr>
				<td><textarea name="notice_title" >${getNotice.notice_title}</textarea></td>
			</tr>
			
			<tr>
				<td><textarea name="notice_cont" id="contSpace">${getNotice.notice_cont }</textarea></td>
			</tr>
			<tr>
				<td style="text-align: right; font-size:13pt;">
				고정여부&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="notice_pin" value="1" id="pin1"><label for="pin1">고정</label>&nbsp;&nbsp;
					<input type="radio" name="notice_pin" value="0" id="pin0" checked><label for="pin0">일반</label>
				</td>
			</tr>
		</table>
	<button type="submit">수정하기</button>
	<button type="button" onclick="btnDelete()">삭제하기</button>
	</form>
	</div>
</body>
</html>