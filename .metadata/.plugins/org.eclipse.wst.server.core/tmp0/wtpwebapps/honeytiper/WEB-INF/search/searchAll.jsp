<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../main/header.jsp"%>
</head>
<body>
<br><br><br><br><br><br><br><br>
	<button type="button" id="searchListBtn" onclick="location.href='allSearch';">전체 리스트</button><br>
	<div id="searchBox">
		<form action="selectPartSearch" method="post" name="lesson_cate">
			<div class="searchForm1">
				<label for="lesson_cate"></label>
				<select name="lesson_cate" id="lesson_cate">
					<option value="카테고리" disabled selected>카테고리</option>
					<option value="예체능">예체능</option>
					<option value="공예">공예</option>
					<option value="사무">사무</option>
					<option value="라이프스타일">라이프스타일</option>
					<option value="IT">IT</option>
					<option value="기타">기타</option>
				</select>
			</div>
			<div>
				<label for="search_detail"></label>
				<select name="search_detail" id="search_detail">
					<option value="선택" disabled selected>선택</option>
					<option value="lesson_title">강의</option>
					<option value="user_name">강사</option>
					<option value="tiper_addr">지역</option>
				</select>
			</div>
			<div class="searchForm2">
				<label for="search_keyword"></label>
				<input type="text" name="search_keyword" id="search_keyword" placeholder="검색어를 입력해주세요"/>	
			</div>
			<div>
				<input type="submit" value="검색">
			</div>
		</form>
	</div>

	<c:forEach items="${searchAll}" var="search">
		<tr>
			<td><img src="${pageContext.request.contextPath}/front/${search.lesson_img}" alt="" title="${search.lesson_img}" width="150px" height="150px"></td>
			<td>${search.lesson_cate}</td>
			<td>${search.lesson_title}</td>
			<td>${search.lesson_user_name}</td>
			<button type="button" id="lessonDetailBtn" onclick="location.href='/getLessonDetail?lesson_num=${search.lesson_num}';">더보기</button><br>
		</tr>
	</c:forEach>
	<a href="/">메인페이지</a>
	<%@include file="../main/footer.jsp"%>
</body>
</html>