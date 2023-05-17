<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*, com.ggul.zip.faq.FaqVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<%@include file="../main/header.jsp"%>
<style>
.faqCont{
	width: 65%;
}
mark{
	border-radius: 50px;
	background-color: lightblue;
}

.panel-heading{
	background-image: url('');
	background-repeat: no-repeat;
	background-color: white;
}
.panel{
	-webkit-box-shadow : none;
	box-shadow: 0em;
}
.panel-body{
border:0;
text-align: right;
}
.LBLquestion{
	border-radius: 30px;
}
	label.LBLanswer{
	background-color:#FFD400;
	border-radius: 30px;
}
.panel-body{
	border:0;
}

#btnMore {
  display: block;
  margin: 10px auto;
  background-color: lightblue;
  color: white;
  border-radius: 20px;
  padding: 10px;
  border: none;
  cursor: pointer;
}

button.allSearch{
	border-style: none;
    background: #FFD400;
    color: #5c3b0c;
    margin: 5px;
    padding: 5px 18px;
    cursor: pointer;
    border-radius: 5px;
}

#searchFaq{
	padding: 5px;
	font-size: 14px;
}

@media ( max-width : 768px) {
	.faqCont{
		width:100%;
	}
}
</style>

<script type="text/javascript">
    
var isMobile = /Android|webOS|iPhone|iPad|iPod|BlackBerry/i.test(navigator.userAgent) ? true : false;


 $(function(){
     $(".moreList").slice(0, 7).show();
     if($(".moreList:hidden").length == 0){
         $("#btnMore").hide();
     }
     $("#btnMore").click(function(e){
         e.preventDefault();
         $(".moreList:hidden").slice(0, 3).show();
         if($(".moreList:hidden").length == 0){
             $("#btnMore").hide();
         }
     });
     
     
 	if(isMobile) {
		$(".allSearch").text('전체');
	}     
     
 });
 </script>
<body>
<br>
	<div class="container faqCont">
		<div class="divLeft" style="width:100%; margin: 0 auto;">
		  <span style="font-size:17pt; font-weight: bolder;">자주찾는 도움말</span><br>
		  <span>평소에 <strong>꿀티퍼에게 궁금한점이</strong> 있으시면 <strong>질문을 </strong>클릭해보세요.</span>
			  <form action="faqList" style="float:right;">
			  	<button type="button" class="allSearch" onclick="location.href='faqList'" 
				  	style="	border-style: none;
				    background: #FFD400;
				    color: #5c3b0c;
				    margin: 5px;
				    padding: 5px 18px;
				    cursor: pointer;
				    border-radius: 5px;
				        font-size: 12pt;
    font-weight: bolder;">전체보기
				 </button>
			  	<input type="text" name="faq_search" id="searchFaq" style="	padding: 5px; font-size: 14px; width: 200px;" placeholder="검색하실 제목을 입력하세요.">
			  	<button type="submit" style="border:0; background:none;"><i class="fa fa-search" style="font-size:24px; color:#FFD400;"></i></button>
			  </form>
		</div>
		<br>
		<hr>
		<br><br>

<!--  표현태그방식   -->
  <%
  List<FaqVO> faqList = (List<FaqVO>)request.getAttribute("faqList");
  if(faqList != null){
     for(FaqVO faq : faqList){
  %>
	<div class="panel-group moreList" id="accordion" style="width:100%; margin: 0 auto; display: none; ">
 		<div class="panel panel-default" style="border:0;" id="accordion2">
			<div class="panel-heading" style="background-image: url(''); background-color: white; font-size: 16px; font-weight: bolder;" id="accordion3">
				<a data-toggle="collapse" data-parent="#accordion" href="#collapse<%=faq.getFaq_question_num() %>" aria-expanded="false">
  		 			<span class="LBLquestion" style="cursor: pointer;"><%=faq.getFaq_question() %></span>
  		 			<span style="float:right;"><i class='fas fa-angle-down' style='font-size:30px'></i></span>
  		 		</a>
			</div>
  		 	<div id="collapse<%=faq.getFaq_question_num() %>" class="panel-collapse collapse">
	  		 	<div class="panel-body" style="border:0;">
	  		 		<pre class="LBLanswer" style="padding:25px; background-color:rgba(255,212,0,0.1); border-radius: 5px; width: 100%; border:0;
	white-space: pre-wrap; text-align: left; font-size: 12pt;"><%=faq.getFaq_answer() %></pre>
	  		 	</div>
  		 	</div>
		</div>
  		 	<hr>
	</div>
  <%
     }
  }
  %>
  
<div style="display: flex; justify-content: center; ">
	<button id="btnMore" type="button" style="border: 0; background: transparent;">
		<i class='fas fa-angle-double-down' style='font-size:35px;'></i>
	</button>
	</div>
	<br>
</div>
	<%@include file="../main/footer.jsp"%>
</body>
</html>