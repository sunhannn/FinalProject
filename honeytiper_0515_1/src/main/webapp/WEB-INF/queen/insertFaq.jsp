<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
		body {
			background-color: #F5F5F5;
			font-family: Arial, sans-serif;
			padding: 20px;
		}
		h1 {
			color: #333;
			text-align: center;
			margin-top: 50px;
		}
		form {
			background-color: #FFF;
			padding: 20px;
			border-radius: 4px;
			box-shadow: 0 0 10px rgba(0,0,0,0.1);
			margin-top: 50px;
			max-width: 800px;
			margin: 0 auto;
		}
		table {
			width: 100%;
		}
		td {
			padding: 10px;
		}
		textarea {
			width: 100%;
			height: 6.25em;
			resize: none;
			border: 1px solid #CCC;
			padding: 5px;
			border-radius: 4px;
			font-size: 14px;
			margin-bottom: 10px;
		}
		
		#answerUpdate{
			width: 100%;
			height: 25.25em;
			resize: none;
			border: 1px solid #CCC;
			padding: 5px;
			border-radius: 4px;
			font-size: 14px;
			margin-bottom: 10px;
		}
		input[type="radio"] {
			margin-right: 5px;
		}
		input[type="submit"], button {
			background-color: #008CBA;
			color: #FFF;
			border: none;
			border-radius: 4px;
			padding: 10px 20px;
			font-size: 16px;
			cursor: pointer;
			margin-top: 20px;
			display: inline-block;
		}
		button[type="button"] {
			background-color: #FFD400;
			border: none;
			border-radius: 3px;
			box-shadow: 0 3px 0 #E6BF00;
			color: #FFF;
			cursor: pointer;
			font-size: 16px;
			font-weight: bold;
			margin-top: 10px;
			padding: 10px 20px;
			transition: background-color 0.3s;
			margin-right: 0;
			float:right;
		}
		button[type="button"]:hover {
			background-color: #DBB600;
		}
</style>
<body>
		<h1>질문과 답변 등록</h1>
	<form action="insertFaq" method="post">
		<table>
			<tr>
				<td>질문</td>
				<td><textarea name="faq_question"></textarea> </td>
			</tr>
			<tr>
				<td>답변</td>
				<td><textarea name="faq_answer" id="answerUpdate"></textarea> </td>
			</tr>
		</table>
		<input type="submit" value="FAQ등록" style="float: right;">
	</form>
</body>
</html>