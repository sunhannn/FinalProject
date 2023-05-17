<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.js"></script>

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

.mainLesson {
   width: 95%;
   margin: 0 auto;
   text-align: center;
}

.newCarousel2 {
   width: 80%;
   max-width: 90%;
   margin: 0 auto;
   text-align: center;
}

.h4mainNew2 {
   width: 80%;
   margin: 10px auto;
}

.whatImgBorder {
   position: relative;
   border: 1px solid #ddd;
}

.wahtImgCarousel2 {
   border: 1px solid #ddd;
}

div.whatImg .show_text {
   width: 200px;
   max-width: 100%;
   height: 60px;
   position: absolute;
   bottom: 0;
   left: 0;
   margin-bottom: 0;
   color: #fff;
   z-index: 20;
   font-weight: 600;
   font-size: 14px;
   background-color: rgba(0, 0, 0, 0.5);
   text-align: center;
   padding-top: 10px;
}

div.whatImg {
   box-sizing: border-box;
   padding-bottom: 20px;
}

div.whatImg .col-sub, div.whatImg2 {
   width: 100%;
   height: 100%;
   display: flex;
   align-s: center;
   justify-content: start;
}

.container {
    min-height: 100%;
    position: relative;
}

.tooltiptext {
   visibility: hidden;
    width: auto;
    background-color: #fff8e3;
    color: black;
    text-align: center;
    border-radius: 5px;
    padding: 5px 0;
    position: absolute;
    z-index: 999;
    display: flex;
    bottom: 100%;
    border: 2px solid #FFD400;
    padding: 10px;
    font-size: smaller;
}

.random_tip:hover .tooltiptext {
  visibility: visible;
}
.new_tip:hover .tooltiptext {
  visibility: visible;
}
.hot_tip:hover .tooltiptext {
  visibility: visible;
}
.like_tip:hover .tooltiptext {
  visibility: visible;
}

@media ( max-width : 767px) {
   div.questionLession {
      width: 100%;
   }
   div.mainRecm {
      width: 100%;
   }
   div.mainPop {
      width: 100%;
   }
   div.mainNew {
      width: 100%;
   }
   .mainNew2 {
      display: none;
   }
   .mainNew {
      display: block;
   }
   div.whatImg img {
      width: 150px;
      height: 150px;
   }
}

@media ( min-width : 768px) {
   div.questionLession {
      width: 80%;
      max-width: 90%;
      margin: 30px auto;
   }
   div.mainRecm {
      width: 80%;
      max-width: 90%;
      margin: 30px auto;
   }
   div.mainPop {
      width: 80%;
      max-width: 90%;
      margin: 30px auto;
   }
   div.mainNew {
      width: 80%;
      max-width: 90%;
      margin: 30px auto;
   }
   .mainNew {
      display: none;
   }
   .mainNew2 {
      margin: 0 auto;
      display: flex;
      flex-direction: column;
   }
   div.whatImg img {
      width: 200px;
      height: 200px;
   }
}

/* 여기서부터 소연언니 */
.carousel-control.left, .carousel-control.right {
   background-image: none
}

.ImgDiv {
   padding: 50px 15px 70px 15px;
   background: #fff8e3;
   max-width: 100%;
}

#allSearch {
   font-size: 15pt;
   padding: 5px;
   cursor: pointer;
   color: gray;
   font-weight: bold;
   text-decoration: underline;
}

#allSearch:hover {
   color: #382407;
}

.brand_idx{
font-weight: bold;
}

@media ( min-width : 768px) {
   .brand_intro1 {
      font-size: 45px;
      font-weight: bold;
      color: #212a30;
      letter-spacing: -.5px;
   }
   .brand_intro2 {
      font-size: 22px;
      font-weight: bold;
      color: #212a30;
      letter-spacing: -.5px;
      "
   }
   .brand_intro3 {
      letter-spacing: -.5px;
      font-size: 16px;
      color: #212a30;
   }
   .search-containerC {
      position: relative;
      display: inline-block;
      border-radius: 20px;
      overflow: hidden;
      max-width: 100%;
   }
   .search-inputC:active, .search-inputC:focus {
      border: 4px solid #FFDF48;
   }
   .search-inputC {
      padding: 10px;
      border: 2px solid gray;
      border-radius: 33px;
      outline: none;
      height: 70px;
      width: 460px;
      position: relative;
   }
   .search-buttonC {
      position: absolute;
      top: 50%;
      right: 10px;
      transform: translateY(-50%);
      padding: 5px;
      background-color: transparent;
      border: none;
      outline: none;
      cursor: pointer;
   }
   .search-buttonC i {
      font-size: 30px;
   }
   #myCarousel {
      width: 450px;
      height: 450px;
      max-width: 95%;
   }
   #myCarousel-inner {
      width: 450px;
      height: 450px;
      max-width: 95%;
   }
}

@media ( max-width : 767px) {
   .brand_intro1 {
      font-size: 33px;
      font-weight: bold;
      color: #212a30;
      letter-spacing: -.5px;
   }
   .brand_intro2 {
      font-size: 17px;
      font-weight: bold;
      color: #212a30;
      letter-spacing: -.5px;
      "
   }
   .brand_intro3 {
      letter-spacing: -.5px;
      font-size: 14px;
      color: #212a30;
   }
   .search-containerC {
      position: relative;
      display: inline-block;
      border-radius: 20px;
      overflow: hidden;
   }
   .search-inpuCt:active, .search-inputC:focus {
      border: 2px solid #FFDF48;
   }
   .search-inputC {
      padding: 10px;
      border: 2px solid gray;
      border-radius: 20px;
      outline: none;
      width: 300px;
      position: relative;
   }
   .search-buttonC {
      position: absolute;
      top: 50%;
      right: 10px;
      transform: translateY(-50%);
      padding: 5px;
      background-color: transparent;
      border: none;
      outline: none;
      cursor: pointer;
   }
   .search-buttonC i {
      font-size: 20px;
   }
   #myCarousel {
      width: 300px;
      height: 300px;
      max-width: 95%;
   }
   #myCarousel-inner {
      width: 300px;
      height: 300px;
      max-width: 95%;
   }
}
</style>

<body>
   <div class="container-fluid ImgDiv">
      <div class="container">
         <!-- 메인 시작-->

         <div class="row">
            <!-- 줄 시작 -->

             <div class="col-lg-7" style="max-width: 100%;">
               <!--  첫째칸 시작 -->
               <div class="company_intro">
                  <!-- 메인정보 시작 -->
                  <br>

                  <p class="brand_intro1">
                     <span style="color: #FDB933">꿀</span>TIPer
                  </p>
                  <br>
                  <p class="brand_intro2">
                     이곳에서 <span style="color: #FDB933">'꿀'</span>과 같은 <span
                        style="color: #FDB933">'TIP'</span>을 얻을 수 있습니다.
                  </p>
                  <br>
                  <p class="brand_intro3"><span class="brand_idx">꿀TIPer</span>는 누구나 <span class="brand_idx">강사(TIPer)</span>가 되어</p>
                  <p class="brand_intro3">자신의 취미와 재능을 공유하는 플랫폼입니다.</p>
                  <br> <br> <br>
                  <form action="selectSearch" method="post" name="lesson_search">
                     <div class="search-containerC">
                        <input type="text" name="lesson_search" id="lesson_search"
                           class="search-inputC" placeholder="  강의 강사 지역을 검색해보세요"/>
                        <button type="submit" class="search-buttonC"
                           onclick="document.lesson_search.submit();">
                           <i class="fas fa-search"></i>
                        </button>
                     </div>
                  </form>
                  <br> <a href="allSearch" id="allSearch">꿀TIP 바로가기 &gt;</a>


               </div>
               <!-- 메인정보 끝 -->
            </div>


            <div class="col-lg-5" style="text-align: center; margin-top: 20px;">
               <!--  캐러셀 시작 -->
               <div id="myCarousel" class="carousel slide" data-ride="carousel"
                  style="margin: 0 auto;">
                  <!-- Indicators Wrapper for slides -->
                  <ol class="carousel-indicators">
                     <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                     <li data-target="#myCarousel" data-slide-to="1"></li>
                     <li data-target="#myCarousel" data-slide-to="2"></li>
                  </ol>

                  <div id="myCarousel-inner" class="carousel-inner"
                     style="margin: 0 auto;">
                     <div class="item active">
                        <img src="/front/lesson/animal.png" alt="img1"
                           class="d-block h-100 w-100 cW">
                     </div>

                     <div class="item">
                        <img src="/front/lesson/codingC.png" alt="img2"
                           class="d-block h-100 w-100  cW">
                     </div>

                     <div class="item">
                        <img src="/front/lesson/report.png" alt="img3"
                           class="d-block h-100 w-100  cW">
                     </div>
                  </div>

                  <!--                   Left and right controls -->
                  <a class="left carousel-control" href="#myCarousel"
                     data-slide="prev"> <span
                     class="glyphicon glyphicon-chevron-left"></span> <span
                     class="sr-only">Previous</span>
                  </a> <a class="right carousel-control" href="#myCarousel"
                     data-slide="next"> <span
                     class="glyphicon glyphicon-chevron-right"></span> <span
                     class="sr-only">Next</span>
                  </a>
               </div>
            </div>

            <!--  캐러셀 종료 -->
            <!--  첫째칸 종료 -->

         </div>
         <!-- 줄 종료 -->

      </div>
      <!-- 메인 종료 -->
   </div>
   <br>
   <div class="container mainLesson">
      <c:choose>
         <c:when test='${user_id ne NULL}'>
            <div class="container mainRecm">
               <h4 class="like_tip" style="text-align: left;"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pin-angle-fill" viewBox="0 0 16 16">
  <path d="M9.828.722a.5.5 0 0 1 .354.146l4.95 4.95a.5.5 0 0 1 0 .707c-.48.48-1.072.588-1.503.588-.177 0-.335-.018-.46-.039l-3.134 3.134a5.927 5.927 0 0 1 .16 1.013c.046.702-.032 1.687-.72 2.375a.5.5 0 0 1-.707 0l-2.829-2.828-3.182 3.182c-.195.195-1.219.902-1.414.707-.195-.195.512-1.22.707-1.414l3.182-3.182-2.828-2.829a.5.5 0 0 1 0-.707c.688-.688 1.673-.767 2.375-.72a5.922 5.922 0 0 1 1.013.16l3.134-3.133a2.772 2.772 0 0 1-.04-.461c0-.43.108-1.022.589-1.503a.5.5 0 0 1 .353-.146z"/>
</svg> 내가 좋아할 꿀TIP
               <span class="tooltiptext tooltip-top">관심있을 꿀TIP 추천!</span></h4>
               <div class="row">
                  <c:forEach items="${mainRecm}" var="mainPg">
                     <a href="getLessonDetail?lesson_num=${mainPg.lesson_num}">
                        <div class="col-xs-6 col-sm-6 col-md-3 col-lg-3 whatImg">
                           <div class="col-sub">
                              <div class="whatImgBorder">
                                 <img
                                    src="${pageContext.request.contextPath}/front/lesson/${mainPg.lesson_img}"
                                    alt="${mainPg.lesson_img}" title="${mainPg.lesson_title}">
                                 <p class="show_text">
                                    <td>${mainPg.lesson_title}</td> <br>
                                    <td>${mainPg.lesson_cate}</td>
                                 </p>
                              </div>
                           </div>
                        </div>
                     </a>
                  </c:forEach>
               </div>
            </div>
         </c:when>
         <c:otherwise>
            <div class="container questionLession">
               <h4 class="random_tip" style="text-align: left;"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pin-angle-fill" viewBox="0 0 16 16">
  <path d="M9.828.722a.5.5 0 0 1 .354.146l4.95 4.95a.5.5 0 0 1 0 .707c-.48.48-1.072.588-1.503.588-.177 0-.335-.018-.46-.039l-3.134 3.134a5.927 5.927 0 0 1 .16 1.013c.046.702-.032 1.687-.72 2.375a.5.5 0 0 1-.707 0l-2.829-2.828-3.182 3.182c-.195.195-1.219.902-1.414.707-.195-.195.512-1.22.707-1.414l3.182-3.182-2.828-2.829a.5.5 0 0 1 0-.707c.688-.688 1.673-.767 2.375-.72a5.922 5.922 0 0 1 1.013.16l3.134-3.133a2.772 2.772 0 0 1-.04-.461c0-.43.108-1.022.589-1.503a.5.5 0 0 1 .353-.146z"/>
</svg> 이런건 어때요?
 <span class="tooltiptext tooltip-top"> 고민된다면 랜덤 추천! </span>
</h4>
               <div class="row">
                  <c:forEach items="${mainRecm2}" var="mainPg">
                     <a href="getLessonDetail?lesson_num=${mainPg.lesson_num}">
                        <div class="col-xs-6 col-sm-6 col-md-3 col-lg-3 whatImg">
                           <div class="col-sub">
                              <div class="whatImgBorder">
                                 <img
                                    src="${pageContext.request.contextPath}/front/lesson/${mainPg.lesson_img}"
                                    alt="${mainPg.lesson_img}" title="${mainPg.lesson_title}">
                                 <p class="show_text">
                                    <td>${mainPg.lesson_title}</td> <br>
                                    <td>${mainPg.lesson_cate}</td>
                                 </p>
                              </div>
                           </div>
                        </div>
                     </a>
                  </c:forEach>
               </div>
            </div>
         </c:otherwise>
      </c:choose>
      <div class="container mainPop">
         <h4 class="hot_tip" style="text-align: left;"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pin-angle-fill" viewBox="0 0 16 16">
  <path d="M9.828.722a.5.5 0 0 1 .354.146l4.95 4.95a.5.5 0 0 1 0 .707c-.48.48-1.072.588-1.503.588-.177 0-.335-.018-.46-.039l-3.134 3.134a5.927 5.927 0 0 1 .16 1.013c.046.702-.032 1.687-.72 2.375a.5.5 0 0 1-.707 0l-2.829-2.828-3.182 3.182c-.195.195-1.219.902-1.414.707-.195-.195.512-1.22.707-1.414l3.182-3.182-2.828-2.829a.5.5 0 0 1 0-.707c.688-.688 1.673-.767 2.375-.72a5.922 5.922 0 0 1 1.013.16l3.134-3.133a2.772 2.772 0 0 1-.04-.461c0-.43.108-1.022.589-1.503a.5.5 0 0 1 .353-.146z"/>
</svg> 인기있는 꿀TIP
 <span class="tooltiptext tooltip-top">당도가 높은 꿀TIP들이에요!</span></h4>
         <div class="row">
            <c:forEach items="${mainPop}" var="mainPg">
               <a href="getLessonDetail?lesson_num=${mainPg.lesson_num}">
                  <div class="col-xs-6 col-sm-6 col-md-3 col-lg-3 whatImg">
                     <div class="col-sub">
                        <div class="whatImgBorder">
                           <img
                              src="${pageContext.request.contextPath}/front/lesson/${mainPg.lesson_img}"
                              alt="${mainPg.lesson_img}" title="${mainPg.lesson_title}">
                           <p class="show_text">
                              <td>${mainPg.lesson_title}</td> <br>
                              <td>${mainPg.review_score} / 5.0</td>
                           </p>
                        </div>
                     </div>
                  </div>
               </a>
            </c:forEach>
         </div>
      </div>
      <!-- 앱 -->
      <div class="container mainNew">
         <h4 class="new_tip" style="text-align: left;"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pin-angle-fill" viewBox="0 0 16 16">
  <path d="M9.828.722a.5.5 0 0 1 .354.146l4.95 4.95a.5.5 0 0 1 0 .707c-.48.48-1.072.588-1.503.588-.177 0-.335-.018-.46-.039l-3.134 3.134a5.927 5.927 0 0 1 .16 1.013c.046.702-.032 1.687-.72 2.375a.5.5 0 0 1-.707 0l-2.829-2.828-3.182 3.182c-.195.195-1.219.902-1.414.707-.195-.195.512-1.22.707-1.414l3.182-3.182-2.828-2.829a.5.5 0 0 1 0-.707c.688-.688 1.673-.767 2.375-.72a5.922 5.922 0 0 1 1.013.16l3.134-3.133a2.772 2.772 0 0 1-.04-.461c0-.43.108-1.022.589-1.503a.5.5 0 0 1 .353-.146z"/>
</svg> 떠오르는 꿀TIP
 <span class="tooltiptext tooltip-top">최근 4주이내에 새로 등록된<br>꿀TIP들이에요!</span></h4>
         <div class="row">
            <c:forEach items="${mainNew2}" var="mainPg">
               <a href="getLessonDetail?lesson_num=${mainPg.lesson_num}">
                  <div class="col-xs-6 col-sm-6 col-md-3 col-lg-3 whatImg">
                     <div class="col-sub">
                        <div class="whatImgBorder">
                           <img
                              src="${pageContext.request.contextPath}/front/lesson/${mainPg.lesson_img}"
                              alt="${mainPg.lesson_img}" title="${mainPg.lesson_title}">
                           <p class="show_text">
                              <td>${mainPg.lesson_title}</td> <br>
                              <td>${mainPg.lesson_date}</td>
                           </p>
                        </div>
                     </div>
                  </div>
               </a>
            </c:forEach>
         </div>
      </div>
   </div>
   <div id="myCarousel2" class="carousel slide mainNew2"
      data-ride="carousel">
      <!-- Indicators -->
      <h4 class="h4mainNew2 new_tip"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pin-angle-fill" viewBox="0 0 16 16">
  <path d="M9.828.722a.5.5 0 0 1 .354.146l4.95 4.95a.5.5 0 0 1 0 .707c-.48.48-1.072.588-1.503.588-.177 0-.335-.018-.46-.039l-3.134 3.134a5.927 5.927 0 0 1 .16 1.013c.046.702-.032 1.687-.72 2.375a.5.5 0 0 1-.707 0l-2.829-2.828-3.182 3.182c-.195.195-1.219.902-1.414.707-.195-.195.512-1.22.707-1.414l3.182-3.182-2.828-2.829a.5.5 0 0 1 0-.707c.688-.688 1.673-.767 2.375-.72a5.922 5.922 0 0 1 1.013.16l3.134-3.133a2.772 2.772 0 0 1-.04-.461c0-.43.108-1.022.589-1.503a.5.5 0 0 1 .353-.146z"/>
</svg> 떠오르는 꿀TIP
<span class="tooltiptext tooltip-top">최근 4주이내에 새로 등록된 꿀TIP들이에요!</span></h4>
      <div class="newCarousel2">
         <!-- Wrapper for slides -->
         <div class="carousel-inner">
            <c:forEach items="${mainNew}" var="mainPg" varStatus="status">
               <c:if test="${status.index % 4 == 0}">
                  <div class="item ${status.index == 0 ? 'active' : ''}">
                     <div class="row">
               </c:if>
               <div class="col-sm-3 whatImg">
                  <div class="col-sub">
                     <div class="whatImgBorder2">
                        <a href="getLessonDetail?lesson_num=${mainPg.lesson_num}"> <img
                           class="wahtImgCarousel2"
                           src="${pageContext.request.contextPath}/front/lesson/${mainPg.lesson_img}"
                           alt="${mainPg.lesson_img}" title="${mainPg.lesson_title}">
                        </a>
                     </div>
                  </div>
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
      interval: 2000 
      // 각 슬라이드 간의 전환 간격 (밀리초 단위)
   });
   
   $('.whatImgBorder2').hover(function() {
         clearInterval(carouselInterval); // 캐로셀 작동 중지
      }, function() {
         carouselInterval = setInterval(function() {
            $('#myCarousel2').carousel('next'); // 캐로셀 다음 슬라이드로 이동
         }, 2000); // 각 슬라이드 간의 전환 간격 (밀리초 단위)
      });
   
});

</script>
</body>
<%@include file="main/footer.jsp"%>