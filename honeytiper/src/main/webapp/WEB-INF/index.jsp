<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<%@include file="main/header.jsp"%>
</head>
<style>
.cW {
   width: 100%;
}

body {
   width: 100%;

}

.banner_img {
   display: inline-block;
   position: relative;
}

.banner_img:after {
   content: ''; */
   position: absolute;
   top: 0;
   right: 0;
   bottom: 0;
   left: 0;
   background: rgba(0, 0, 0, 0.3);
   z-index: 10;
}

.banner_img img {
   height: 200px;
   width: 200px;
   margin: 0 20px 50px 20px;
   text-aling: center;
}

.cbanner img {border: 1px solid #ddd;}

#show_text {
   position: absolute;
   bottom: 0;
   left: 18.5px;
   color: #fff;
   z-index: 20;
   font-weight: 600;
   font-size: 15px;
   width: 84%;
   height: 60px;
   background-color: rgba(0, 0, 0, 0.5);
   text-align: center;
   margin-bottom: 50px;
   padding-top: 10px;
}

.show_text {
   position: absolute;
   bottom: 0;
   left: 18.5px;
   color: #fff;
   z-index: 20;
   font-weight: 600;
   font-size: 15px;
   width: 84%;
   height: 60px;
   background-color: rgba(0, 0, 0, 0.5);
   text-align: center;
   margin-bottom: 50px;
   padding-top: 10px;
}

.lessonMain {
   width: 80%;
   margin: 0 auto;
}

.mainRecm, .mainPop {
   text-align: center;
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
            <img src="/front/image1.jpg" alt="img1"
               class="d-block h-100 w-100 cW">
         </div>

         <div class="item">
            <img src="/front/image1.jpg" alt="img2"
               class="d-block h-100 w-100  cW">
         </div>

         <div class="item">
            <img src="/front/image1.jpg" alt="img3"
               class="d-block h-100 w-100  cW">
         </div>
      </div>

      <!-- Left and right controls -->
      <a class="left carousel-control" href="#myCarousel" data-slide="prev">
         <span class="glyphicon glyphicon-chevron-left"></span> <span
         class="sr-only">Previous</span>
      </a> <a class="right carousel-control" href="#myCarousel"
         data-slide="next"> <span
         class="glyphicon glyphicon-chevron-right"></span> <span
         class="sr-only">Next</span>
      </a>
   </div>

   <div class="lessonMain"><br>
      <div class="mainRecm">
         <c:choose>
            <c:when test='${user_id ne NULL}'>
            <h4 style="text-align:left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;내가 좋아할 꿀팁</h4>
               <c:forEach items="${mainRecm}" var="mainPg">
                  <tr>
                     <a href="getLessonDetail?lesson_num=${mainPg.lesson_num}"
                        class="banner_img"> <img
                        src="${pageContext.request.contextPath}/front/lesson/${mainPg.lesson_img}"
                        alt="">
                        <p class="show_text">
                           <td>${mainPg.lesson_title}</td> <br>
                           <td>${mainPg.lesson_cate}</td>
                        </p>
                     </a>
                  </tr>
               </c:forEach>
            </c:when>
            <c:otherwise>
            </c:otherwise>
         </c:choose>
      </div>


      <div class="mainPop">
          <h4 style="text-align:left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;인기있는 꿀팁</h4>
         <c:forEach items="${mainPop}" var="mainPg">
            <tr>
               <a href="getLessonDetail?lesson_num=${mainPg.lesson_num}"
                  class="banner_img"> <img
                  src="${pageContext.request.contextPath}/front/lesson/${mainPg.lesson_img}"
                  alt="">
                  <p class="show_text">
                     <td>${mainPg.lesson_title}</td> <br>
                     <td>${mainPg.review_score}/5.0</td>
                  </p>
               </a>
            </tr>
         </c:forEach>
      </div>

      <div id="myCarousel2" class="carousel slide mainNew"
         data-ride="carousel">
         <!-- Indicators -->
         <h4>&nbsp;&nbsp;&nbsp;&nbsp;떠오르는 꿀팁</h4>
         <ol class="carousel-indicators">
            <c:forEach items="${mainNew}" var="mainPg" varStatus="status">
               <li data-target="#myCarousel2" data-slide-to="${status.index / 4}"
                  class="${status.index == 0 ? 'active' : ''}"></li>
            </c:forEach>
         </ol>

         <!-- Wrapper for slides -->
         <div class="carousel-inner">
            <c:forEach items="${mainNew}" var="mainPg" varStatus="status">
               <c:if test="${status.index % 4 == 0}">
                  <div class="item ${status.index == 0 ? 'active' : ''}">
                     <div class="row">
               </c:if>
               <div class="col-xs-3">
                  <a href="getLessonDetail?lesson_num=${mainPg.lesson_num}" class="banner_img cbanner">
               <img src="${pageContext.request.contextPath}/front/lesson/${mainPg.lesson_img}" alt="" >
                  </a>
               </div>
               <c:if
                  test="${status.index % 4 == 3 || status.index == mainNew.size() - 1}">
         </div>
      </div>
      </c:if>
      </c:forEach>
   </div>
   </div>

   </div>
   <script>
$(document).ready(function() {
   // 캐러셀 자동 슬라이딩 활성화
   $('#myCarousel2').carousel({
      interval: 4000s // 각 슬라이드 간의 전환 간격 (밀리초 단위)
   });
});
</script>
   <%@include file="main/footer.jsp"%>
</body>
</html>