<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<%@include file="main/header.jsp"%>
</head>
<style>
 .cW{
 	width: 100%
 }
</style>
<body>
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">
      <div class="item active">
        <img src="/front/image1.jpg" alt="img1" class="d-block h-100 w-100 cW">
      </div>

      <div class="item">
        <img src="/front/image1.jpg" alt="img2" class="d-block h-100 w-100  cW">
      </div>
    
      <div class="item">
        <img src="/front/image1.jpg" alt="img3" class="d-block h-100 w-100  cW">
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>

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