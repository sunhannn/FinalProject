<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.ggul.zip.lesson.LessonVO"%>

<%
LessonVO vo = (LessonVO) request.getAttribute("lesson");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>tiper 강의수정</title>

<link rel="stylesheet"
	href="front/common.css">
<link rel="stylesheet"
	href="front/bootstrap.css">
</head>
</head>
<body>

	<div class="container">
		<h4 id="tiper_update1">
			TIPer 강의 수정하기</h4>
		<br>
		<hr>
	</div>
	<div class="container">
		<form action="lessonUpdateAction?lessonNum=<%=vo.getLesson_num()%>"
			method="post">
			<table>

				<tr>
					<td>원래 강의 제목 : <%=vo.getLesson_title()%> <br> <input
						type="text" placeholder="수정할 강의 제목" name="lesson_title">
					</td>
					<td>원래 강의 내용 : <%=vo.getLesson_info()%> <textarea
							name="lesson_info" id="" cols="30" rows="10"
							placeholder="수정할 강의 내용"></textarea>

					</td>
					<td>원래 이미지 <img src="" alt="강의 사진">

					</td>
					<td><input type="file" placeholder="수정할 사진" name="lesson_img"
						accept=".jpg,.jpeg,.png"></td>

				</tr>



			</table>
			<button type="submit">수정완료</button>
		</form>

	</div>











</body>
</html>