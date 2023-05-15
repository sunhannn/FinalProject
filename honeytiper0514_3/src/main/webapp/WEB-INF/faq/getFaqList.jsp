<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%@include file="../main/header.jsp"%>
<style>
/* 제목 */
#accordion{
 	display: none;
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
label.LBLquestion{
	background-color:lightblue;
	border-radius: 30px;

label.LBLanswer{
	background-color:lightpink;
	border-radius: 30px;
}
.panel-body{
	border:0;
}
label{
	font-size: 15pt;
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
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(function(){
    $("#accordion").slice(0, 1).show(); // 초기갯수
    $("#btnMore").click(function(e){ // 클릭시 more
        e.preventDefault();
    	console.log('btn');
        $("#accordion:hidden").slice(0, 1).show(); // 클릭시 more 갯수 지저정
        if($("#accordion:hidden").length == 0){ // 컨텐츠 남아있는지 확인
            alert("게시물의 끝입니다."); // 컨텐츠 없을시 alert 창 띄우기 
        }
    });
});

// function addMore(){
// 	$('#accordion').slice(0,3).show();
// 	if($('#accordion').length == 0){
// 		alert("게시물의 끝입니다.");
// 	}
// }
</script>
<body>
	<div class="container">
  <h2>자주찾는 도움말</h2>
  <p>평소에 <strong>꿀티퍼에게 궁금한점이</strong> 있으시면 <strong>질문을 </strong>클릭해보세요.</p>
  
  <form action="faqList">
  	<input type="text" name="faq_search">
  	<input type="submit" value="검색">
  	<button type="button" onclick="location.href='faqList'">전체보기</button>
  </form>
  
  <c:forEach items="${faqList}" var="faq">
  <div class="panel-group" id="accordion" style="width:900px; margin: 0 auto;">
    <div class="panel panel-default" style="border:0;">
      <div class="panel-heading" style="background-image: url(''); background-color: white;">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse${faq.faq_question_num }" aria-expanded="false"><label class="LBLquestion">${faq.faq_question}</label></a>
      </div>
      <div id="collapse${faq.faq_question_num }" class="panel-collapse collapse">
        <div class="panel-body"  style="border:0;"><label class="LBLanswer" style="background-color:lightpink; border-radius: 30px;">${faq.faq_answer}</label>
        </div>
      </div>
    </div>
	</div>
	<br>
	</c:forEach>
<!-- 	<button id="btnMore" type="button">더 보기</button> -->
<a href="#" id="btnMore">더 보기</a>
</div>
    
	<%@include file="../main/footer.jsp"%>
</body>
</html>