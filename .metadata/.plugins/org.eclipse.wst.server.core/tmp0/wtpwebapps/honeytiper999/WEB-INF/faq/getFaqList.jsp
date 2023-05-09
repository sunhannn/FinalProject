<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	#spnTitl{
		font-weight: bolder;
		font-size: 18pt;
	}
	
	.tdRight{
		text-align: right;
		
	}
	
	.tblFaq{
		margin:0 auto;
		width:80%;
	}
	
	#tdAnswer{
		font-weight: border;
		color:blue;
		border-bottom: 3px solid #000;
	}
	
	#tdQuestion{
		font-weight: border;
		padding-top: 10px;
		color: red;
	}
</style>
<script>
	function addFaq(){
		location.href="insertMoveFaq";
	}
</script>
<%
	if(request.getAttribute("update")!=null){
		out.print("<script>");
		out.print("alert('업데이트되었습니다.')");
		out.print("</script>");
	}
%>
<body>
	<span id="spnTitle">자주묻는질문</span>
	<hr>
	<button type="button" onclick="addFaq()">자묻질 등록</button>
	<table class="tblFaq">
	    <c:forEach items="${faqList}" var="faq">
			<tr>
			  <td id="tdQuestion"><label>${faq.faq_question}</label></td>
			</tr>
			<tr>
			  <td class="tdRight" id="tdAnswer"><label>${faq.faq_answer}</label></td>
			  <td><a href="deleteFaq?faq_question_num=${faq.faq_question_num }">✖</a></td>
			  <td><button type="button" onclick="location.href='updateMoveFaq?faq_question_num='+${faq.faq_question_num}">수정하기</button></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>