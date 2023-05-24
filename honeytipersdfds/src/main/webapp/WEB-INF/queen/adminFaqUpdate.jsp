<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>꿀TIPer 관리자 - FAQ 수정</title>
	<link href="${pageContext.request.contextPath}/front/adminFaqUpdate.css" rel="stylesheet">

</head>

<style>
		body{
			background-color: white;
		}

		.txtarea:focus{
			border:2px solid #FFD400;
			outline:none;
		}
</style>
	<script>
 		function submitForm(event) {
 			event.preventDefault();
 			document.getElementById("FrmUpdate").submit();
 		}
 		
 		function BtnClose(){
 			self.close();
 		}
 		
 		
	</script>
<body>

	<h1>질문과 답변 수정</h1>
	<form action="updateFaq" id="FrmUpdate" onsubmit="submitForm(event)">
		<input type="text" name="faq_question_num" value="${faqUpdate.faq_question_num }" style="display: none;">
		<textarea placeholder="변경할 `질문`내용을 입력하세요" name="faq_question" class="txtarea">${faqUpdate.faq_question }</textarea>
		<textarea placeholder="변경할 `답변`내용을 입력하세요" name="faq_answer" class="txtarea" id="faqUpdate">${faqUpdate.faq_answer }</textarea>
		<div style="height:50px;">
			<input type="submit" class="btn" value="수정완료">
			<button type="button" class="btn" onclick="BtnClose()">닫기</button>
		</div>
	</form>
</body>
</html>