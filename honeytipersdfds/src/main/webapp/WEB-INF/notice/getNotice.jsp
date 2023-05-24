<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>꿀TIPer - 공지사항 상세보기</title>
	<%@ include file="../main/header.jsp" %>
	<link href="${pageContext.request.contextPath}/front/getNotice.css" rel="stylesheet">
</head>
<body id="bdyMain">
	<div class="container getNotice">
		<div class="noticeNameClass">
			<span id="noticeName" style="font-size: 27px; font-weight: border;">공지사항</span>
			<button type="button" onclick="location.href='listnotice'" id="userListBack">목록</button>
		</div>
	</div>
	<form action="updateMoveNotice?notice_num=${notice.notice_num}" method="post" id="frmMain">
		<span id="spnTitle">${notice.notice_title}</span><br>
		<label id="lblDate">${notice.notice_date }</label>
		<div id="divCont"><pre id="noticeCont">${notice.notice_cont }</pre></div><hr>
<%-- 		<c:if test="${user_id eq 'admin' }"><button type="submit">수정하기</button></c:if> --%>
<%-- 		<c:if test="${user_id eq 'admin' }"><button type="button" onclick="location.href='deleteNotice'" id="listUpdate">삭제하기</button></c:if> --%>
	</form>
	<br>
	<%@include file="../main/footer.jsp"%>
</body>
</html>