<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="insertFaq" method="post">
		<table>
			<tr>
				<td>질문</td>
				<td><input type="text" name="faq_question"> </td>
			</tr>
			<tr>
				<td>답변</td>
				<td><input type="text" name="faq_answer"> </td>
			</tr>
		</table>
		<input type="submit" value="FAQ등록">
	</form>
</body>
</html>