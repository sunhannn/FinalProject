<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="main/header.jsp"%>
</head>
<body>
<br><br><br><br><br><br><br>

<c:choose>
	<c:when test='${user_id ne NULL}'>
		<h1>내가 좋아할 꿀팁</h1>
		<c:forEach items="${mainRecm}" var="mainPg">
			<tr>
				<td><img
					src="${pageContext.request.contextPath}/front/${mainPg.lesson_img}"
					alt="" title="${mainPg.lesson_img}" width="150px" height="150px"></td>
				<td>${mainPg.lesson_title}</td>
				<td>${mainPg.lesson_cate}</td>
			</tr>
		</c:forEach>
	</c:when>
	<c:otherwise>
	</c:otherwise>
</c:choose>

	<h1>인기있는 꿀팁</h1>
	<c:forEach items="${mainPop}" var="mainPg">
		<tr>
			<td><img
				src="${pageContext.request.contextPath}/front/${mainPg.lesson_img}"
				alt="" title="${mainPg.lesson_img}" width="150px" height="150px"></td>
			<td>${mainPg.lesson_title}</td>
			<td>${mainPg.review_score}</td>
		</tr>
	</c:forEach>



	<h1>떠오르는 꿀팁 (최근 1주 랜덤으로)</h1>
	<c:forEach items="${mainNew}" var="mainPg">
		<tr>
			<td><img
				src="${pageContext.request.contextPath}/front/${mainPg.lesson_img}"
				alt="" title="${mainPg.lesson_img}" width="150px" height="150px"></td>
			<td>${mainPg.lesson_title}</td>
			<td>${mainPg.lesson_date}</td>
		</tr>
	</c:forEach>
<%@include file="main/footer.jsp"%>
</body>
</html>