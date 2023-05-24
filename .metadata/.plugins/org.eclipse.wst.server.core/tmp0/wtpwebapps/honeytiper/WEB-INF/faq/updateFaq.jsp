<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>꿀TIPer - FAQ</title>
</head>
<body>
	<form action="updateFaq?faq_question_num=${faq.faq_question_num }" method="post">
		<table>
			<tr>
				<td>질문</td>
				<td><input type="text" name="faq_question" value="${faq.faq_question }"> </td>
			</tr>
			<tr>
				<td>답변</td>
				<td><input type="text" name="faq_answer" value="${faq.faq_answer }"> </td>
			</tr>
		</table>
		<input type="submit" value="수정완료">
	</form>
</body>
</html>