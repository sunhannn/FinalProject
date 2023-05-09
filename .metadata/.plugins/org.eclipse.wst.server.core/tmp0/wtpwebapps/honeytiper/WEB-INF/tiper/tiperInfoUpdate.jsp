<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.ggul.zip.user.UserVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>강사 정보 수정</title>

<link rel="stylesheet" href="front/common.css">
<link rel="stylesheet" href="front/bootstrap.css">
<style type="text/css">
body {
	padding: 0;
	margin: 0 auto;
}

@media ( max-width : 768px) {
	#tipup_sub1 {
		font-size: 25px;
		background-color: #FFD400;
		border: 0;
		border-radius: 10%;
		font-weight: bolder;
	}
	#tipup_sub2 {
		font-size: 22px;
	}
	#tipup_tab1{
	width: 100%;
	
	}
	#tipup_td1{
	width: 200px;
	}
}
</style>
</head>
<body>
	<div class="container">
		<span id="tipup_sub1">TIPer 정보 수정</span>
		<hr>

	</div>
	<form action="tiperUpdateAction" method="post">
		<div class="container">
			<span id="tipup_sub2">프로필 수정</span>
			<table id="tipup_tab1">

				<tr id="tipup_tr1">
					<td id="tipup_td1"><input type="file" name="tiper_img"
						placeholder="강사에 대한 img 수정" accept=".jpg,.jpeg,.png" id=""></td>

					<td id="tipup_td2">
						<textarea name="tiper_info"
							placeholder="TIPer소개를 수정해 주세요 (경력, 수상내역, 취득자격증,등등..)" id=""
							cols="30" rows="10"></textarea></td>
				</tr>


			</table>
		</div>
		<div class="container">
			<span id="tipup_sub3">강의 목록 보기</span> <br>
			<table id="tipup_tab2">
				<c:forEach items="${lessonTiper}" var="lesson">
					<tr id="tipup_tr2">
						<td id="tipup_td3">${lesson.lesson_num }</td>
						<td id="tipup_td4">${lesson.lesson_title }</td>
						<td id="tipup_td5"><button type="button" id="tipup_btn1"
								onclick="location.href='lessonUpdateGo?lesson_num=${lesson.lesson_num}'">강의수정하기</button></td>


					</tr>
				</c:forEach>

			</table>
			<button type="submit" id="tipup_btn2">수정완료</button>
		</div>

	</form>

</body>
</html>