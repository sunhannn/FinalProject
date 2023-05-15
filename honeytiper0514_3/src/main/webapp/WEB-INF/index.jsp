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
   height: 150px;
   width: 150px;
   margin: 0 10px 20px 10px;
   text-align: center;
   border: 1px solid #ddd;
}

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
    left: 10px;
    color: #fff;
    z-index: 20;
    font-weight: 600;
    font-size: 13px;
    width: 88%;
    height: 60px;
    background-color: rgba(0, 0, 0, 0.5);
    text-align: center;
    margin-bottom: 20px;
    padding-top: 10px;
}

.lessonMain {
   width: 100%;
   margin: 0 auto;
   text-align: center;
}

.newCarousel2 {
   width: 90%;
   margin: 0 auto;
   text-align: center;
}

@media ( min-width : 768px) {
   #myCarousel3 {
      display: none;
   }
}

@media ( max-width : 767px) {
   #myCarousel2 {
      display: none;
   }
}


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
  color: #382407;
  font-weight: bold;
  text-decoration:underline;
}

#allSearch:hover {
  background-color: #E6B800;
  }


@media ( min-width : 768px) {  
.brand_intro1{
	font-size: 45px;
	font-weight: bold;
	color: #212a30;
	letter-spacing: -.5px;
}

.brand_intro2{
	font-size: 22px;
	font-weight: bold;
	color: #212a30;
	letter-spacing: -.5px;"
}

.brand_intro3{
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
.brand_intro1{
	font-size: 33px;
	font-weight: bold;
	color: #212a30;
	letter-spacing: -.5px;
}

.brand_intro2{
	font-size: 17px;
	font-weight: bold;
	color: #212a30;
	letter-spacing: -.5px;"
}

.brand_intro3{
	letter-spacing: -.5px;
	font-size: 13px;
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
							<span style="color: #FFD400">꿀</span>TIPer
						</p>
						<br>
						<p class="brand_intro2">
							이곳에서 <span style="color: #FFD400">'꿀'</span>과 같은 <span
								style="color: #FFD400">TIP</span>을 얻을 수 있습니다.
						</p>
						<br>
						<p class="brand_intro3">꿀TIPer는 누구나 강사(티퍼)가 되어</p>
						<p class="brand_intro3">자신의 취미와 재능을 공유하는 플랫폼입니다.</p>
						<br><br><br>
						 <form action="selectSearch" method="post" name="lesson_search">
                              <div class="search-containerC">
                                 <input type="text" name="lesson_search" id="lesson_search"
                                    class="search-inputC" placeholder="    키워드를 입력해주세요" />
                                 <button type="submit" class="search-buttonC"
                                    onclick="document.lesson_search.submit();">
                                    <i class="fas fa-search"></i>
                                 </button>
                              </div>
                           </form>
                           <br>
						<a href="allSearch" id="allSearch">클래스 바로가기 &gt;</a>


					</div>
					<!-- 메인정보 끝 -->
				</div>


				<div class="col-lg-5" style="text-align:center;  margin-top:20px;" >
					<!--  캐러셀 시작 -->
					<div id="myCarousel" class="carousel slide" data-ride="carousel">
					<!-- Indicators Wrapper for slides -->
						<ol class="carousel-indicators">
							<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
							<li data-target="#myCarousel" data-slide-to="1"></li>
							<li data-target="#myCarousel" data-slide-to="2"></li>
						</ol>
					
						<div id="myCarousel-inner" class="carousel-inner" style="margin:0 auto;">
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

<!-- 						Left and right controls -->
						<a class="left carousel-control"
							href="#myCarousel" data-slide="prev"> <span
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


   <div class="lessonMain">
      <br>
      <div class="mainRecmAll">
         <c:choose>

            <c:when test='${user_id ne NULL}'>
               <div class="mainRecm">
                  <h4 style="text-align: left;">내가 좋아할 꿀팁</h4>
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
               </div>
            </c:when>


            <c:otherwise>
               <div class="mainRecm2">
                  <h4 style="text-align: left;">무엇을 들을까?</h4>
                  <c:forEach items="${mainRecm2}" var="mainPg">
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
               </div>
            </c:otherwise>

         </c:choose>
      </div>

      <div class="mainPop">
         <h4 style="text-align: left;">인기있는 꿀팁</h4>
         <c:forEach items="${mainPop}" var="mainPg">
            <tr>
               <a href="getLessonDetail?lesson_num=${mainPg.lesson_num}"
                  class="banner_img"><img
                  src="${pageContext.request.contextPath}/front/lesson/${mainPg.lesson_img}"
                  alt="">
                  <p class="show_text">
                     <td>${mainPg.lesson_title}</td> <br>
                     <td>${mainPg.review_score}/5.0</td>
                  </p> </a>
            </tr>
         </c:forEach>
      </div>

      <!-- 앱 -->
      <div class="mainNew" id="myCarousel3">
         <h4 style="text-align: left;">떠오르는 꿀팁</h4>
         <c:forEach items="${mainNew2}" var="mainPg">
            <tr>
               <a href="getLessonDetail?lesson_num=${mainPg.lesson_num}"
                  class="banner_img"><img
                  src="${pageContext.request.contextPath}/front/lesson/${mainPg.lesson_img}"
                  alt="">
                  <p class="show_text">
                     <td>${mainPg.lesson_title}</td> <br>
                     <td>${mainPg.lesson_date}</td>
                  </p> </a>
            </tr>
         </c:forEach>
      </div>

   </div>

<div id="myCarousel2" class="carousel slide mainNew" data-ride="carousel">
   <!-- Indicators -->
   <h4>&nbsp;&nbsp;&nbsp;&nbsp;떠오르는 꿀팁</h4>
   <div class="newCarousel2">
      <!-- Wrapper for slides -->
      <div class="carousel-inner">
         <c:forEach items="${mainNew}" var="mainPg" varStatus="status">
            <c:if test="${status.index % 5 == 0}">
               <div class="item ${status.index == 0 ? 'active' : ''}">
                  <div class="row">
            </c:if>
            <div class="col-xs-2">
               <a href="getLessonDetail?lesson_num=${mainPg.lesson_num}" class="banner_img cbanner">
                  <img src="${pageContext.request.contextPath}/front/lesson/${mainPg.lesson_img}" alt="">
               </a>
            </div>
            <c:if test="${status.index % 5 == 4 || status.index == mainNew.size() - 1}">
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
      interval: 3000s // 각 슬라이드 간의 전환 간격 (밀리초 단위)
   });
});

</script>
<div style="padding:50px 0px"></div>
   <%@include file="main/footer.jsp"%>

</body>