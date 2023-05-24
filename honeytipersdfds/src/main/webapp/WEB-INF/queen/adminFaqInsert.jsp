<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>꿀TIPer 관리자 - FAQ 등록</title>
</head>
<link href="${pageContext.request.contextPath}/front/adminFaqInsert.css" rel="stylesheet">
<script>
	function goBack(){
		  history.back();
	}
	
// 	$(function(){
// 		$(".txta").focus().css('outline','2px solid #fff8e3');
// 	});
	
</script>
<%@include file="../queen/adminNavbar.jsp"%>
<body>
	<div style="width:65%; margin: 0 auto;">
		<h2 style="margin:40px 0px;">F A Q 등록</h2>
		<form action="insertFaq" method="post">
			<table>
				<tr>
					<td class="tdFaq" style="padding-top:15px;"><span class="spnMark">Q.</span>질문</td>
					<td class="whkdn"><textarea name="faq_question" class="txta" placeholder="질문을 입력하는 영역입니다." style="border:1px solid #dcdcdc;"></textarea> </td>
				</tr>
				<tr>
					<td class="tdFaq" style="color:red;"><span class="spnMark">A.</span>답변</td>
					<td class="whkdn"><textarea name="faq_answer" id="answerUpdate" class="txta" placeholder="답변을 입력하는 영역입니다." style="border:thin solid #dcdcdc;"></textarea> </td>
				</tr>
			</table>
			<div id="akwls0dhxh">
				<input type="submit" value="FAQ등록" class="allButton">
				<button type="button" class="allButton" onclick="goBack()">목록으로 돌아가기</button>
			</div>
		</form>
	</div>
</body>
</html>