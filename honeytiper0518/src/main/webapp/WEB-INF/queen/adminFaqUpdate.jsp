<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문과 답변 수정</title>
<style>
body {
	background-color: #F2F2F2;
	margin: 0;
	padding: 0;
}

h1 {
	color: #333;
	margin-top: 50px;
	text-align: center;
}

form {
	background-color: #FFF;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
	margin: 50px auto;
	max-width: 700px;
	padding: 20px;
}

input[type="text"], textarea {
	border-radius: 3px;
	box-sizing: border-box;
	margin-bottom: 10px;
	padding: 10px;
	width: 100%;
	border: none;
}

textarea {
	height: 100px;
	font-size: 14px;
	border: 1px solid #efefef;
}

input[type="submit"], button {
	background-color: #000;
	border: none;
	border-radius: 3px;
	box-shadow: 0 3px 0 #333;
	color: #FFF;
	cursor: pointer;
	font-size: 16px;
	font-weight: bold;
	padding: 10px 20px;
	transition: background-color 0.3s;
	margin: 10px;
	float: right;
}

button {
	background-color: #777;
	box-shadow: 0 3px 0 #666;
}

input[type="submit"]:hover, button:hover {
	background-color: #111;
}

input[type="submit"]:focus, button:focus {
	outline: none;
}

#faqUpdate {
	height: 400px;
}
</style>

</head>
<script>
	function submitForm(event) {
		event.preventDefault();
		document.getElementById("FrmUpdate").submit();
	}

	function BtnClose() {
		self.close();
	}
</script>
<body>

	<h1>질문과 답변 수정</h1>
	<form action="updateFaq" id="FrmUpdate" onsubmit="submitForm(event)">
		<input type="text" name="faq_question_num"
			value="${faqUpdate.faq_question_num }" style="display: none;">
		<textarea placeholder="변경할 '질문' 내용을 입력하세요" name="faq_question">${faqUpdate.faq_question }</textarea>
		<textarea placeholder="변경할 '답변' 내용을 입력하세요" name="faq_answer"
			id="faqUpdate">${faqUpdate.faq_answer }</textarea>
		<div style="height: 50px;">
			<input type="submit" class="btn" value="수정 완료">
			<button type="button" class="btn" onclick="BtnClose()">닫기</button>
		</div>
	</form>
</body>
</html>