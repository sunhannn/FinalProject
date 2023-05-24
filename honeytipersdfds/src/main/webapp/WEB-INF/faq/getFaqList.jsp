<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*, com.ggul.zip.faq.FaqVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>꿀TIPer - FAQ</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<%@include file="../main/header.jsp"%>
<link href="${pageContext.request.contextPath}/front/getFaqList.css" rel="stylesheet">
<script type="text/javascript">
    
var isMobile = /Android|webOS|iPhone|iPad|iPod|BlackBerry/i.test(navigator.userAgent) ? true : false;


 $(function(){
	 
	 
	 //더보기
     $(".menu").slice(0, 7).show();
     if($(".menu:hidden").length == 0){
         $("#btnMore").hide();
     }
     $("#btnMore").click(function(e){
         e.preventDefault();
         $(".menu:hidden").slice(0, 4).show();
         if($(".menu:hidden").length == 0){
             $("#btnMore").hide();
         }
     });
     
     
     
    //모바일반응형 
 	if(isMobile) {
		$(".allSearch").text('전체');
	}     
     
    //탑버튼
    $(window).scroll(function() {
	    if ($(this).scrollTop() > 200) { //250 넘으면 버튼이 보여짐니다. 
	      $('#topBtn').fadeIn();
	    } else {
	      $('#topBtn').fadeOut();
	    }
	  }); // 버튼 클릭시 
	  $("#topBtn").click(function() { 
	  	$('html, body').animate({ scrollTop : 0 // 0 까지 animation 이동합니다. 
	  	}, 400); // 속도 400 
	  	return false; 
	  }); 
	  
	  
	  
	    //아코디언
	    $(".menu>li>a").click(function(){
	        $(this).next("pre").slideToggle(200);
// 	        $(this).parent("li").siblings("li").children("pre").slideUp(200);
			if($(this).children("span").children("span").children("img").attr("src") == "front/down.png"){
				$(this).children("span").children("span").children("img").attr("src","front/up.png");
			}else{
				$(this).children("span").children("span").children("img").attr("src","front/down.png");
			}
			
	        });
 	
 });
 
 
 </script>
<body>
<br>
	<div class="container faqCont">
		<div class="divLeft" style="width:100%; margin: 0 auto;">
		  <span style="font-size:17pt; font-weight: bolder;">자주찾는 도움말</span><br>
		  <span>평소에 <strong>꿀티퍼에게 궁금한점이</strong> 있으시면 <strong>질문을 </strong>클릭해보세요.</span>
			  <form action="faqList" style="float:right;">
			  	<button type="button" class="allSearch" onclick="location.href='faqList'" >
    				전체보기
				 </button>
			  	<input type="text" name="faq_search" id="searchFaq" style="	padding: 5px; font-size: 14px; width: 200px;" placeholder="검색하실 제목을 입력하세요.">
			  	<button type="submit" style="border:0; background:none;"><i class="fa fa-search" style="font-size:24px; color:#FFD400;"></i></button>
			  </form>
		</div>
		<br>
		<hr>
		<br>

<!--  표현태그방식   -->
  <%
  List<FaqVO> faqList = (List<FaqVO>)request.getAttribute("faqList");
  if(faqList != null){
     for(FaqVO faq : faqList){
  %>
<ul class="menu">
      <li class="transLi">
        <a data-toggle="collapse" data-parent="#accordion" href="#collapse<%=faq.getFaq_question_num() %>" aria-expanded="false">  
        	<span class="LBLquestion" style="cursor: pointer;"><%=faq.getFaq_question() %>
        		<span style="float:right;">
        			<img src="${pageContext.request.contextPath}/front/down.png" style="width:40px; height: 40px;" onerror="this.src='${pageContext.request.contextPath}/front/default.png'"> 
        		</span>
        	</span>
		</a>
        <pre class="LBLanswer" style="padding:25px; background-color:rgba(255,212,0,0.1); border-radius: 5px; width: 100%; border:0;
        	white-space: pre-wrap; text-align: left; font-size: 12pt;"><%=faq.getFaq_answer() %></pre>
      </li>
  </ul>  
  <%
     }
  }
  %>
  
<div style="display: flex; justify-content: center; ">
	<button id="btnMore" type="button" style="border: 0; background: transparent;">
		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-down-circle-fill" viewBox="0 0 16 16" style="width: 35px; height: 35px;">
		  <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8.5 4.5a.5.5 0 0 0-1 0v5.793L5.354 8.146a.5.5 0 1 0-.708.708l3 3a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 10.293V4.5z" style="color:#FFD400;"/>
		</svg>
	</button>
	</div>
		<a id="topBtn" href="#">
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-up-circle-fill" viewBox="0 0 16 16" style="width: 35px; height: 35px;">
  				<path d="M16 8A8 8 0 1 0 0 8a8 8 0 0 0 16 0zm-7.5 3.5a.5.5 0 0 1-1 0V5.707L5.354 7.854a.5.5 0 1 1-.708-.708l3-3a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 5.707V11.5z"/>
			</svg>
		</a>
	<br>
</div>
	<%@include file="../main/footer.jsp"%>
</body>
</html>