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
	#spnTitle{
		font-weight: bolder;
		font-size: 24px;
		text-align: center;
		padding: 20px 0;
		background-color: #f5f5f5;
		border-radius: 10px;
		margin: 30px auto;
		width: 60%;
		box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
	}

	.tblFaq{
		margin: 0 auto;
		width: 80%;
		border-collapse: collapse;
		box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
	}

	.tblFaq th{
		padding: 10px;
		background-color: #f5f5f5;
		border-bottom: 1px solid #ddd;
		text-align: left;
	}

	.tblFaq td{
		padding: 10px;
		border-bottom: 1px solid #ddd;
		text-align: left;
	}

	.tdRight{
		text-align: right;
	}

	#tdQuestion{
		font-weight: bold;
		padding-top: 10px;
		color: red;
	}

	#tdAnswer{
		font-weight: bold;
		color: blue;
		border-bottom: 3px solid #000;
	}

	.btnAddFaq{
		background-color: #4CAF50;
		color: white;
		padding: 10px 20px;
		border: none;
		border-radius: 5px;
		cursor: pointer;
	}

	.btnDeleteFaq{
		color: red;
		cursor: pointer;
	}

	.btnUpdateFaq{
		background-color: #007bff;
		color: white;
		padding: 5px 10px;
		border: none;
		border-radius: 5px;
		cursor: pointer;
		margin-right: 10px;
	}
</style>
<!-- <script> -->
<!--  	function addFaq(){ -->
<!--  		location.href="insertMoveFaq"; -->
<!--  	} -->
<!-- </script> -->

<body>
	<span id="spnTitle">자주묻는질문</span>
	<hr>
<!-- 	<button type="button" onclick="addFaq()">자묻질 등록</button> -->
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
	<%@include file="../main/footer.jsp"%>
</body>
</html>