<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!-- Bootstrap CDN -->
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />

<!--  메세지관련 css파일 -->
<link href="front/message.css" rel="stylesheet">
<!-- 메세지 전송 아이콘(종이비행기) 때문에 필요 -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" type="text/css" rel="stylesheet" />

<!-- 부가적인 테마 -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css" />
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<script src="https://code.jquery.com/jquery-latest.min.js"></script>


<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<title>Document</title>


<style>
/* # Header, Main Menu
================================ */

.menu_hr{
	margin: 0 0 7px 0;
	width: 100%;
}

#main-navbar{
   border-bottom: solid 0.5px #D2D2D2;
}

.navbar {
   opacity: 0.8;
   margin-bottom: 0;
   background-color: #fff;
   transition: all 0.2s ease-out;
   display: contents;
}

.navbar-container {
   position: relative;
   margin: 0 auto;
}

.navbar .navbar-nav {
   margin-left: -100px;
}

.navbar .navbar-nav li a {
   font-size: 18px;
   text-transform: capitalize ;
   color: #2e1c05;
   transition: all 0.2s ease-out;
}

.navbar-brand {
   font-size: 25px;
   transition: all 0.2s ease-out;
   padding: 5px;
}

.navbar-brand img {
   width: 100px;
}

.navbar-scroll {
   opacity: 1;
}

#top-social-menu {
   display: none;
}

.dropdown-menu li a:hover {
	background: none;
	background-color: #FFBB00;
}

.subDropdown-menu li:hover{
	width: 100%;
	background-color: #FFBB00;
}

@media ( min-width : 1500px) {
   .navbar-container {
      width: 100%;
      margin: 0 auto;
      max-width: 90%;
   }
}

@media ( min-width : 768px) {

   #open {
      opacity: 0;
   }
   
   .navbar .navbar-nav li a {
    font-weight: bolder;
    font-size: 16px;
    text-transform: capitalize;
    color: #2e1c05;
    transition: all 0.2s ease-out;
   }
   
   .navbar {
      height: 120px;
   }
   .navbar-nav>li>a {
      padding: 0;
      margin-top: 35px;
      margin-left: 30px;
      line-height: 70px;
   }
   .navbar-brand {
      font-size: 20px;
      height: 120px;
      line-height: 120px;
      display: none;
   }
   .navbar-brand img {
      transform: translateX(0px);
   }
   #top-social-menu {
      display: initial;
   }

   /* Navbar when scrolled */
   .navbar-scroll {
      height: 70px;
   }
   .navbar-scroll #top-social-menu {
      display: none;
      transition: all 0.2s ease-out;
   }
   .navbar-scroll .navbar-nav>li>a {
      opacity: 1;
      padding: 0;
      margin-top: 0;
   }
   .navbar-nav>li>a::after {
      text-decoration: none;
      position: absolute;
      top: 80%;
      left: 0;
      width: 100%;
      height: 1px;
      background: #FFBB00;
      content: "";
      opacity: 0;
      transform: translateY(-);
   }
   
   .navbar-nav>li>a:hover::after, .navbar-nav>li>a:focus::after {
      text-decoration: none;
      height: 2px;
      opacity: 1;
      transform: translateY(0px); 
   }
   
   .navbar-nav>:nth-child(1)>a:hover::after, .navbar-nav>:nth-child(1)>a:focus::after
      {
      opacity: 0;
   }
   .main {
      display: block;
   }
   #nav1 {
      display: none;
   }
   #send_msgImg {
      display: none;
   }

}

@media ( max-width : 767px) {
   #send_msgImg {
      float: right;
      margin-right: 60px;
      margin-top: 10px;
   }
   .main {
      display: none;
   }
   
   #send_msgImg {
      float: right;
      margin-right: 80px;
      margin-top: 8px;
   }
   
   .msg_reload{
        margin-right: 20px;
   }
}

@media ( max-width : 995px) {
   .main{
      display: none;
   }
}

/* # Social menu
================================ */
#top-social-menu {
   position: absolute;
   top: 7px;
   right: 0;
   font-size: 13px;
   z-index: 101;
   padding-right: 0px;
   list-style: none;
   color: #2e1c05;
   /*    transition: all 0.2s ease-out; */
}

#top-social-menu li {
   float: left;
   padding: 10px 15px;
}

#top-social-menu li:last-child {
   padding-right: 0;
}

#top-social-menu li a {
   text-decoration: none;
   color: #2e1c05;
}

#top-social-menu li a:hover {
   text-decoration: none;
   color: #543a1a;
}

#top-social-menu i {
   font-size: 16px;
   transition: all 0.2s ease-in;
}

#top-social-menu i:hover {
   text-decoration: none;
   color: #543a1a;
}

.open1 {
   position: absolute;
   display: block;
   color: #FFD400;
   font-size: 3rem;
   top: 5px;
   right: 5%;
   cursor: pointer;
   opacity: 1;
   transition: 0.3s;
   font-size: 50px;
   transform: translate(0px, -13px);
}

.nav1 {
   position: absolute;
   top: 0;
   right: 0;
   text-align: right;
   width: 0%;
   overflow-x: hidden;
   height: 100vh;
   z-index: 99999;
   position: fixed;
   background: white;
   transition: 0.3s;
}

.nav1 a {
   color: black;
   font-size: 15px;
   text-decoration: none;
   display: block;
   transition: 0.3s;
   clear: both;
   padding: 10px 20px 10px 20px;
   font-size: larger;
}

.userName {
   font-weight: bold;
   margin-top: 50px;
   padding-right: 20px;
   text-algin: right;
   font-size: 16px;
}

.appMenu1 a {
/*    border-bottom: solid 0.5px #D2D2D2; */
   margin: 20px 5px;
}

.appMenu2 {
   width: 90%;
/*    border: solid 2px #FFD400; */
   margin: 30px 0 30px 30px;
   padding: 10px 0 10px 10px;
   text-align: center;
   text-decoration: underline;
   text-decoration: underline;
   text-align: right;
   
}

.appMenu3{
   width: 90%;
   text-align: center;
   border: solid 0.5px #D2D2D2;
   padding: 0px;
   margin: 0 auto;
   
   border: none;
   border-spacing: revert;
   border-collapse: inherit;
}

.appMenu3 td {
/* 	border: solid 0.5px #D2D2D2; */
/*     background-color: #FFD400; */
/*     border: none; */
    border: solid 0.5px #D2D2D2;
    border-radius: 8px;
}


.appMenu2Img {
    width: 10px;
    transform: translate(0px, 4px);
}

.logInOut {
   background-color: #FFD400;
   width: 90%;
   text-align: center;
   margin: 0 auto;
   border-radius: 8px;
}

.close {
   color: #FFD400 !important;
   width: 40px;
   height: 40px;
   line-height: 3rem;
    margin: 10px 10px 0px 10px;
   padding-bottom: 30px;
   font-size: 30px !important;
   cursor: pointer;
   transform: translate(-13px,-10px);
   opacity: 1;
}

.nav a:not(:first-child):hover {
   text-decoration: none;
   background: royalblue;
}

/* Styles for wrapping the search box */
.main {
   width: 100%;
   margin: 50px auto;
}

.main form>:nth-child(1) {
   display: flex;
}

.main form>:nth-child(1)>:nth-child(1) {
/*    margin-left: 150px; */
}
/* Bootstrap 4 text input with search icon */
.has-search .form-control {
   padding-left: 2.375rem;
}

.has-search .form-control-feedback {
   position: absolute;
   z-index: 2;
   display: block;
   width: 2.375rem;
   height: 2.375rem;
   line-height: 2.375rem;
   text-align: center;
   pointer-events: none;
   color: #aaa;
}

.btn-secondary {
   transform: translate(125px, -34px);
}

.dropdown:hover .dropdown-menu {
   display: block;
}

/*로고 위치 수정하기*/
 .navbar-left>:nth-child(1) img { 
    transform: translate(40px, -10px); 
    width: 150px; */
 }

.search-container {
   position: relative;
   display: inline-block;
   border-radius: 20px;
   overflow: hidden;
}

.search-input:active, .search-input:focus {
   border: 2px solid #FFBB00;
}

.search-input {
   padding: 10px;
   border: 2px solid gray;
   border-radius: 20px;
   outline: none;
   width: 300px;
   position: relative;
}

.search-button {
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

.search-button i {
   font-size: 20px;
}

.honeycomb{
   width: 30px;
   height: auto;
}

</style>
</head>

<body>
   <div id="header-navbar" class="navbar navbar-default navbar-fixed-top">
      <%
      String user_id = session.getAttribute("user_id") != null ? session.getAttribute("user_id").toString() : "";
      %>

      <header>
         <nav id="main-navbar">
            <div class="container navbar-container">
               <div class="navbar-header">
                  <a class="navbar-brand" href="/"><img
                     src="${pageContext.request.contextPath}/front/ggulTiper.png"
                     alt="" title="Logo"></a> <span id="send_msgImg"> <c:if
                        test='${user_id ne NULL}'>
                        <c:choose>
                           <c:when test='${unread == 0}'>
                           <div class="image-container">
                            <img title="새로고침" alt="message reload" class="msg_reload" src="front/reload.png">
                             <img title="메세지함 열기" alt="message list" id="msg_img_m" class="send_msg" src="front/message.png">
                             <img title="메세지함 열기" alt="message list" id="msg_img_m2" class="send_msg" src="front/open-messsge.png">
                            </div>
                           </c:when>
                           <c:otherwise>
                           <div class="image-container">
                                <img title="새로고침" alt="message reload" class="msg_reload" src="front/reload.png">
                              <img title="메세지함 열기" alt="message list" id="msg_img_m" class="send_msg" src="front/on-message.png">
                              <img title="메세지함 열기" alt="message list" id="msg_img_m2" class="send_msg" src="front/open-messsge.png">
                            </div>
                           </c:otherwise>
                        </c:choose>
                     </c:if>
                  </span> <span id="open" class="open1" onclick="openNav()">≡</span>
               </div>
               <div id="navbar" class="navbar-collapse collapse">
                  <ul class="nav navbar-nav navbar-left">
                     <li><a href="/"><img
                           src="${pageContext.request.contextPath}/front/ggulTiper.png"
                           alt="" title="Logo"></a></li>
                     <li class="dropdown" style="margin-left:30px;"><a href="#" class=""
                        data-toggle="dropdown" role="button" aria-haspopup="true"
                        aria-expanded="false">전체 카테고리<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                        	<li class="subDropdown-menu">
	                           <li><a href="cateSearch?lesson_search=예체능">예체능</a></li>
	                           <li><a href="cateSearch?lesson_search=공예">공예</a></li>
	                           <li><a href="cateSearch?lesson_search=사무">사무</a></li>
	                           <li><a href="cateSearch?lesson_search=라이프스타일">라이프스타일</a></li>
	                           <li><a href="cateSearch?lesson_search=IT">IT</a></li>
	                           <li><a href="cateSearch?lesson_search=기타">기타</a></li>
                           </li>
                        </ul></li>
                     <li><a href="getBrand">꿀TIPer란?</a></li>
                     <li><a href="allSearch">꿀TIP</a></li>
                     <li><a href="listnotice">공지사항</a></li>
                     <li><a href="faqList">FAQ</a></li>
                  </ul>
                  <ul class="nav navbar-nav navbar-right">
                     <li>
                        <div class="main">
                           <form action="selectSearch" method="post" name="lesson_search">
                              <div class="search-container">
                                 <input type="text" name="lesson_search" id="lesson_search"
                                    class="search-input" placeholder="  강의 강사 지역을 검색해보세요" />
                                 <button type="submit" class="search-button"
                                    onclick="document.lesson_search.submit();">
                                    <i class="fas fa-search"></i>
                                 </button>
                              </div>
                           </form>
                        </div>
                     </li>
                  </ul>
               </div>
               <div class="top-social">
                  <ul id="top-social-menu">
                     <c:choose>
                        <c:when test='${user_id ne NULL}'>
                            <c:choose>
                              <c:when test='${unread == 0}'>
                                 <li style="padding: 0px;">
                                 <div class="image-container">
                                    <img title="메세지함 열기" alt="message list" id="msg_img" class="send_msg" src="front/message.png">
                                    <img title="메세지함 열기" alt="message list" id="msg_img2" class="send_msg" src="front/open-messsge.png">
                                    <img title="새로고침" alt="message reload" class="msg_reload" src="front/reload.png">
                                  </div>
                                 </li>
                              </c:when>
                              <c:otherwise>
                                 <li style="padding: 0px;">
                                 <div class="image-container">
                                    <img title="메세지함 열기" alt="message list" id="msg_img" class="send_msg" src="front/on-message.png">
                                    <img title="메세지함 열기" alt="message list" id="msg_img2" class="send_msg" src="front/open-messsge.png">
                                    <img title="새로고침" alt="message reload" class="msg_reload" src="front/reload.png">
                                   </div>
                                 </li>
                              </c:otherwise>
                           </c:choose>
                           <li><a href="logOut">로그아웃</a></li>
                        </c:when>
                        <c:otherwise>
                           <li><a href="loginBtn">로그인</a></li>
                        </c:otherwise>
                     </c:choose>
                     <c:choose>
                        <c:when test='${user_id ne NULL and user_role == 0}'>
                           <li class="dropdown" id="userDropdown"><a href="#" class=""
                              data-toggle="dropdown" role="button" aria-haspopup="true"
                              aria-expanded="false">${user_name}님 반갑습니다<span
                                 class="caret"></span></a>
                              <ul class="dropdown-menu">
                                 <li><a href="goMyHoneypay">허니페이</a></li>
                                 <li><a href="chkPassword">회원정보수정</a></li>
                                 <li><a href="userMyPageGo">마이페이지</a></li>
                                 <li><a href="tiperSignUpMove">TIPer신청</a></li>
								 <hr class="menu_hr">
                                 <li><a href="logOut">로그아웃</a></li>
                              </ul></li>                           
                        </c:when>
                        <c:when test='${user_id ne NULL and user_role == 1}'>
                           <li class="dropdown" id="userDropdown"><a href="#" class=""
                              data-toggle="dropdown" role="button" aria-haspopup="true"
                              aria-expanded="false">${user_name}님 반갑습니다<span
                                 class="caret"></span></a>
                              <ul class="dropdown-menu">
                                 <li><a href="goMyHoneypay">허니페이</a></li>
                                 <li><a href="chkPassword">회원정보수정</a></li>
                                 <li><a href="userMyPageGo">회원마이페이지</a></li>
                                 <li><a href="tiperMypage">TIPer마이페이지</a></li>
                                 <li><a href="tiperUpdateGo">TIPer관리</a></li>
                                 <hr class="menu_hr">
                                 <li><a href="logOut">로그아웃</a></li>
                              </ul></li>
                        </c:when>
                        <c:when test='${user_id ne NULL and user_role == 2}'>
                            <li class="dropdown" id="userDropdown"><a href="#" class=""
                              data-toggle="dropdown" role="button" aria-haspopup="true"
                              aria-expanded="false">${user_name}님 반갑습니다<span
                                 class="caret"></span></a>
                              <ul class="dropdown-menu">
                                 <li><a href="logOut">로그아웃</a></li>
                              </ul></li>
                        </c:when>
                        <c:when test='${user_id ne NULL and user_role == 3}'>
                            <li class="dropdown" id="userDropdown"><a href="#" class=""
                              data-toggle="dropdown" role="button" aria-haspopup="true"
                              aria-expanded="false">${user_name}님 반갑습니다<span
                                 class="caret"></span></a>
                              <ul class="dropdown-menu">
                                 <li><a href="logOut">로그아웃</a></li>
                              </ul></li>
                        </c:when>
                        <c:otherwise>
                           <li><a href="agreementBtn">회원가입</a></li>
                        </c:otherwise>
                     </c:choose>
                  </ul>
               </div>
            </div>
         </nav>
      </header>

      <nav class="nav1" id="nav1">
         <a href="#" id="close" class="close" onclick="closeNav()">✖</a>
         <c:if test="${user_id ne NULL and user_role == 0}">
          <div class="userName"><img class="honeycomb" src="${pageContext.request.contextPath}/front/honeycomb.png" alt="" title="">${user_name} 님</div>
            <div class="appMenu1">
               <a href="goMyHoneypay">허니페이</a>
               <a href="chkPassword">회원정보수정</a>
               <a href="userMyPageGo">마이페이지</a>
               <a href="tiperSignUpMove">TIPer신청</a>
            </div>
            <div class="appMenu2"><a href="allSearch"><svg class="appMenu2Img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 256 512"><!-- Font Awesome Pro 5.15.4 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) --><path d="M31.7 239l136-136c9.4-9.4 24.6-9.4 33.9 0l22.6 22.6c9.4 9.4 9.4 24.6 0 33.9L127.9 256l96.4 96.4c9.4 9.4 9.4 24.6 0 33.9L201.7 409c-9.4 9.4-24.6 9.4-33.9 0l-136-136c-9.5-9.4-9.5-24.6-.1-34z"/></svg>&nbsp;&nbsp;꿀TIP 찾아보아요</a></div>
            <table class="appMenu3">
               <tr>
                  <td rowspan="2" style="border: none; background-color:#FFD400;"><a href="getBrand">꿀TIPer란</a></td><td><a href="listnotice">공지사항</a></td>
               </tr>
               <tr>
                 <td><a href="faqList">FAQ</a></td>
              </tr>
           </table>
           <div class="logInOut" style="margin-top: 30px;"><a href="logOut">로그아웃</a></div>
         </c:if>
         <c:if test="${user_id ne NULL and user_role == 1}">
          <div class="userName"><img class="honeycomb" src="${pageContext.request.contextPath}/front/honeycomb.png" alt="" title="">${user_name} 님</div>            <div class="appMenu1">
               <a href="goMyHoneypay">허니페이</a>
               <a href="chkPassword">회원정보수정</a>
               <a href="userMyPageGo">회원마이페이지</a>
               <a href="tiperMypage">TIPer마이페이지</a>
               <a href="tiperUpdateGo">TIPer관리</a>  
            </div>
            <div class="appMenu2"><a href="allSearch"><svg class="appMenu2Img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 256 512"><!-- Font Awesome Pro 5.15.4 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) --><path d="M31.7 239l136-136c9.4-9.4 24.6-9.4 33.9 0l22.6 22.6c9.4 9.4 9.4 24.6 0 33.9L127.9 256l96.4 96.4c9.4 9.4 9.4 24.6 0 33.9L201.7 409c-9.4 9.4-24.6 9.4-33.9 0l-136-136c-9.5-9.4-9.5-24.6-.1-34z"/></svg>&nbsp;&nbsp;꿀TIP 찾아보아요</a></div>
            <table class="appMenu3">
               <tr>
                  <td rowspan="2" style="border: none; background-color:#FFD400;"><a href="getBrand">꿀TIPer란</a></td><td><a href="listnotice">공지사항</a></td>
               </tr>
               <tr>
                 <td><a href="faqList">FAQ</a></td>
              </tr>
           </table>
           <div class="logInOut" style="margin-top: 30px;"><a href="logOut">로그아웃</a></div>
         </c:if>
         <c:if test="${user_id ne NULL and (user_role == 2 or user_role == 3)}">
          <div class="userName"><img class="honeycomb" src="${pageContext.request.contextPath}/front/honeycomb.png" alt="" title="">${user_name} 님</div>            <div class="appMenu2"><a href="allSearch"><svg class="appMenu2Img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 256 512"><!-- Font Awesome Pro 5.15.4 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) --><path d="M31.7 239l136-136c9.4-9.4 24.6-9.4 33.9 0l22.6 22.6c9.4 9.4 9.4 24.6 0 33.9L127.9 256l96.4 96.4c9.4 9.4 9.4 24.6 0 33.9L201.7 409c-9.4 9.4-24.6 9.4-33.9 0l-136-136c-9.5-9.4-9.5-24.6-.1-34z"/></svg>&nbsp;&nbsp;꿀TIP 찾아보아요</a></div>
            <table class="appMenu3">
               <tr>
                  <td rowspan="2" style="border: none; background-color:#FFD400;"><a href="getBrand">꿀TIPer란</a></td><td><a href="listnotice">공지사항</a></td>
               </tr>
               <tr>
                 <td><a href="faqList">FAQ</a></td>
              </tr>
           </table>
           <div class="logInOut" style="margin-top: 30px;"><a href="logOut">로그아웃</a></div>
         </c:if>
         <c:if test="${user_id eq NULL}"><br>
            <div class="appMenu2"><a href="allSearch"><svg class="appMenu2Img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 256 512"><!-- Font Awesome Pro 5.15.4 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) --><path d="M31.7 239l136-136c9.4-9.4 24.6-9.4 33.9 0l22.6 22.6c9.4 9.4 9.4 24.6 0 33.9L127.9 256l96.4 96.4c9.4 9.4 9.4 24.6 0 33.9L201.7 409c-9.4 9.4-24.6 9.4-33.9 0l-136-136c-9.5-9.4-9.5-24.6-.1-34z"/></svg>&nbsp;&nbsp;꿀TIP 찾아보아요</a></div>
            <table class="appMenu3">
               <tr>
                  <td rowspan="2" style="border: none; background-color:#FFD400;"><a href="getBrand">꿀TIPer란</a></td><td><a href="listnotice">공지사항</a></td>
               </tr>
               <tr>
                 <td><a href="faqList">FAQ</a></td>
              </tr>
           </table>
           <div class="logInOut" style="margin-top: 30px;"><a href="loginBtn">로그인</a></div>
         </c:if>
      </nav>
   </div>
   <script>

function openNav() {
    document.getElementById("open").style.display = "none";
    document.getElementById("nav1").style.width = "70%";
 }

 function closeNav() {
    document.getElementById("nav1").style.width = "0%";
    document.getElementById("open").style.display = "block";
 }
 
 
 
 $(document).ready(function() {
     var userDropdown = $('#userDropdown');
     var dropdownMenu = userDropdown.find('.dropdown-menu');

     // 드롭다운 메뉴를 클릭했을 때, 하위 메뉴를 열거나 닫을 수 있도록 처리
     userDropdown.click(function(e) {
       e.stopPropagation();
       dropdownMenu.toggle();
     });

     // 화면의 다른 부분을 클릭했을 때, 열려있는 하위 메뉴를 닫도록 처리
     $(document).click(function(e) {
       if (!userDropdown.is(e.target) && userDropdown.has(e.target).length === 0) {
         dropdownMenu.hide();
       }
     });
     
     $(document).on("click", function(event) {
    	  if (!$(event.target).closest(".open1").length) {
    	    closeNav();
    	  }
    	});
     
   });
 
<!-- 여기서부터 쪽지관련 -->

//  메세지 전체리스트창 팝업창 띄우기
 $('.send_msg').on('click', function(){
    var isMobile = /Android|webOS|iPhone|iPad|iPod|BlackBerry/i.test(navigator.userAgent) ? true : false;

   if(isMobile) {
      location.href="message_list?send_btn=3";
//       FirstMessageList(message_room, other_user_id, send_btn);
      }else{
        popupWindow = window.open("message_list?send_btn=0", "_blank", "width=940, height=620, resizeable")
         //팝업창 리사이즈 방지
         popupWindow.onresize = (_=>{
            popupWindow.resizeTo(940,690);
        });
         popupWindow.onload = function (){
                call_chlid2();
         }
      }
  });
  
  var parent_value;
  
  
  // 전체 메세지리스트 실행할때 호출
  function call_chlid2(){  //부모창에서 자식창에 값 전달
         try{
             popup.child_value_send_btn = 0;
             popup.child_function(); // 자식창 함수 호출
         }catch(e){} // 부모 자식간의 연결이 끊어졌을 경우 처리할게 있으면 기술
     }
  
  
  // 직접 메세지 보낼때 호출
  function open_popup(){
     var isMobile = /Android|webOS|iPhone|iPad|iPod|BlackBerry/i.test(navigator.userAgent) ? true : false;
     if(isMobile) {
          let tiper_id = $('#cont1-group-text').text();
          tiper_id = tiper_id.replace("@", "");
        location.href="message_list?send_btn=4&other_user_id="+tiper_id;
      }else{
      popupWindow = window.open('message_list?send_btn=1', '_blank', 'width=940, height=620, resizeable');
      //팝업창 리사이즈 방지 함수
      popupWindow.onresize = (_=>{
           popupWindow.resizeTo(940,690);
        });
      
      popupWindow.onload = function (){
         call_chlid();
      }
      }
  }

     // 직접 메세지 보낼때 호출
  function call_chlid(){  //부모창에서 자식창에 값 전달
      try{
         let tiper_id = $('#cont1-group-text').text();
         tiper_id = tiper_id.replace("@", "");
         console.log("tiper_id??======",tiper_id);
         popup.child_value_id = tiper_id; // 현재 강의글에 있는 강사아이디값을 넣어야하는 곳
          popup.child_value_room = 0; // 방번호를 보내야할 곳
          popup.child_value_send_btn = 1;
          popup.child_function(); // 자식창 함수 호출
      }catch(e){} // 부모 자식간의 연결이 끊어졌을 경우 처리할게 있으면 기술
  }

  
  function parent_function(){
	  Message_chk();
  }
  
  // 헤더에서 메세지 미열람 체크
  const Message_chk = function(){
       
          $.ajax({
             url:"message_chk_on",
             method:"GET",
             success:function(data){
                console.log('헤더msg_chk??data??',data);
                if(data == 0){
                   $('#msg_img_m').attr("src", "front/message.png");
                   $('#msg_img').attr("src", "front/message.png");
                   console.log("메세지없음");
                }else{
                   $('#msg_img_m').attr("src", "front/on-message.png");
                   $('#msg_img').attr("src", "front/on-message.png");
                   console.log("메세지있음");
                }
                console.log("메세지 체크 하기");
             },
             error : function() {
                alert('알 수 없는 오류가 발생했어요.');
             }
          });
//            if (self.name != 'reload') {
//                 self.name = 'reload';
//                 self.location.reload(true);
//             }
//             else {
//                self.name = ''; 
//             }
    };
  
    $(document).ready(function(){
       Message_chk();
    });

    $('.msg_reload').on('click', function(){
         Message_chk();
      });
  </script>
  