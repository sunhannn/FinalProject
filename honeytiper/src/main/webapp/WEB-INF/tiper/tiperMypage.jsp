<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.ggul.zip.tiper.TiperVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
int point = (int) request.getAttribute("user_point");
TiperVO tiperVO = (TiperVO) request.getAttribute("tiperVO");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>강사 마이페이지</title>
<!-- <link rel="stylesheet" href="front/common.css"> -->
<!-- <link rel="stylesheet" href="front/bootstrap.css"> -->
</head>

<style>
@media ( max-width : 768px) {
	#mytip_sub1 {
		font-size: 25px;
	}
	#mytip_sub2 {
		font-size: 15px;
	}
	#mytip_sub3 {
		font-size: 18px;
		font-weight: bold;
	}
	#mytip_point1 {
		text-align: right;
	}
	#mytip_point2 {
		font-size: 18px;
		font-weight: bold;
	}
	#mytip_point3 {
		background-color: #FFD400;
		border-radius: 20%;
	}
	#mytip_table1 {
		width: 100%;
	}
	.mytip_tr1 {
		border-bottom: 2px solid #d8dee5;
		height: 70px;
	}
	.my_singo2 {
		width: 20px;
		height: 20px;
	}
	.mytip_td1 {
		text-align: left;
	}
	.mytip_td2 {
		text-align: left;
	}
	.mytip_td3 {
		width: 110px;
	}
	.mytip_td4 {
		width: 100px;
	}
	.mytip_btn1 {
		background-color: #FFD400;
		border: 0;
		border-radius: 10px;
		color: white;
	}
	#mytip_btn2 {
		background-color: #FFD400;
		border: 0;
		border-radius: 10px;
		width: 170px;
		height: 40px;
		color: white;
	}
	#mytip_btn3 {
		background-color: #FFD400;
		border: 0;
		border-radius: 10px;
		width: 170px;
		height: 40px;
		color: white;
	}
}

@media ( min-width : 769px) {
	#mytip_sub1 {
		font-size: 40px;
	}
	#mytip_sub2 {
		margin-top: 10px;
		font-size: 28px;
		text-align: left;
		font-size: 28px;
	}
	#mytip_sub3 {
		font-weight: bold;
		font-size: 30px;
	}
	#mytip_point1 {
		text-align: right;
	}
	#mytip_point2 {
		font-size: 30px;
		font-weight: bold;
	}
	#mytip_point3 {
		text-decoration: underline;
		text-decoration-color: #FFD400;
	}
	#mytip_table1 {
		width: 100%;
	}
	.mytip_tr1 {
		border-bottom: 2px solid #d8dee5;
		height: 90px;
		font-size: 22px;
	}
	.my_singo2 {
		width: 30px;
		height: 30px;
	}
	.mytip_td1 {
		text-align: left;
		width: 250px;
	}
	.mytip_td2 {
		text-align: left;
		width: 300px;
	}
	.mytip_td3 {
		width: 300px;
		text-align: left;
	}
	.mytip_td4 {
		width: 250px;
	}
	.mytip_btn1 {
		background-color: #FFD400;
		border: 0;
		border-radius: 10%;
		color: white;
	}
	#mytip_btn2 {
		background-color: #FFD400;
		border: 0;
		border-radius: 10px;
		width: 150px;
		height: 50px;
		color: white;
	}
	#mytip_btn3 {
		background-color: #FFD400;
		border: 0;
		border-radius: 10px;
		width: 150px;
		height: 50px;
		color: white;
	}
	#mytip_imgpro {
		width: 150px;
		height: 150px;
		border-radius: 10px;
	}
	#mytip_tdpro2{
	text-align: center;
	}
	#mytip_tdpro1{
	width: 300px;
	
	}
}
</style>
<body>
	<%@include file="../main/header.jsp"%>
	<div class="container">
		<h4 id="mytip_sub1">TIPer마이페이지(강사)</h4>
		<br> <br>
		<div id="mytip_div1">
			<table id="mytip_tabpro">
				<tr id="mytip_trpro">
					<td id="mytip_tdpro1"><img alt="프로필" src="front/<%=tiperVO.getTiper_img()%>"
						id="mytip_imgpro"></td>
					<td id="mytip_tdpro2"><p id="mytip_point2">
							<span id="mytip_point3">My허니페이 <%=point%> point
							</span>
						</p> <br>
						<button type="button" onclick="location.href='honeyTake'"
							id="mytip_btn2">허니페이 정산하기</button></td>
					<td id="mytip_tdpro3"></td>
				</tr>


			</table>


		</div>


		<div id="mytip_sub2">
			<span id="mytip_sub3">진행중인 꿀TIP</span><br> <span>강의종료 후
				완료를 누르시면 회원이 리뷰를 남길 수 있습니다</span>
		</div>
		<br>
		<div id="mytip_point1"></div>
	</div>
	<br>
	<div class="container">
		<table id="mytip_table1">
			<c:forEach items="${lessonTiper}" var="lesson">
				<tr class="mytip_tr1">
					<td class="mytip_td1">${lesson.lesson_date}</td>
					<td class="mytip_td2">
						<div>회원ID: ${lesson.lesson_info}</div>
					</td>
					<td class="mytip_td3"><span>${lesson.lesson_title}</span></td>
					<td class="mytip_td4"><span>가격 : ${lesson.lesson_onoff}</span></td>
					<td><img src="front/siren.png" alt="신고" class="my_singo2"></td>
				</tr>

			</c:forEach>

		</table>
		<br> <br>

		<button type="button" onclick="location.href='lessonMakeGo'"
			id="mytip_btn3">강의등록하기</button>
	</div>



</body>
</html>