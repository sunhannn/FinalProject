<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.ggul.zip.user.UserVO"%>
<%@page import="com.ggul.zip.tiper.TiperVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%
int point = (int) session.getAttribute("user_point");

// TiperVO tiperVO = (TiperVO) request.getAttribute("myTiper");

// if (tiperVO.getTiper_agree() == 0) {
// 	out.println("<script>");
// 	out.println("alert('승인대기 중입니다. 조금만 더 기다려 주세욧!');");
// 	out.println("history.back();");
// 	out.println("</script>");
// }
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>마이페이지</title>
<link rel="stylesheet" href="front/common.css">
<link rel="stylesheet" href="front/bootstrap.css">
<script type="text/javascript" src="front/jquery-3.6.4.js"></script>

<style>
body {
	padding: 0;
	margin: 0 auto;
}

@media ( max-width : 768px) {
	#sub_1 {
		text-align: left;
		display: block;
		font-weight: bold;
		font-size: 20px;
	}
	#sub_2 {
		font-size: 20px;
	}
	#sub_3 {
		text-align: right;
		font-size: 18px;
		font-weight: bold;
	}
	#sub_point {
		background-color: #FFD400;
		border-radius: 20%;
	}
	#tip_img1 {
		width: 70px;
		height: 70px;
		border-radius: 10%;
	}
	#fileModal {
		width: 75px;
		height: 30px;
		font-size: 5px;
		background-color: #FFD400;
		border: 0;
		border-radius: 10%;
	}
	#mypage_tab {
		width: 100%;
	}
	.my_singo1 {
		width: 20px;
		height: 20px;
	}
	#mytab_1 {
		vertical-align: middle;
	}
	#mytab_2 {
		width: 200px;
		text-align: center;
	}
	#mytab_3 {
		width: 100px;
	}
	#mytab_4 {
		width: 100px;
	}
	#mytab_tr {
		border-bottom: 2px solid #d8dee5;
		height: 100px;
		width: 80vw;
	}
	#my_hr1 {
		height: 2px;
	}
	.modal {
		position: absolute;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		display: none;
		background: rgba(0, 0, 0, 0.6);
	}
	.modal .modal-window {
		background-color: white;
		position: relative;
		width: 90vw;
		height: 50%;
		padding: 10px;
		text-align: center !important;
		margin: auto;
		margin-top: 20vh;
		border-radius: 10%;
	}
	#modal-title {
		display: flex;
		flex-direction: row;
		flex-wrap: wrap;
		justify-content: space-between;
		align-content: space-around;
		height: 15%;
		margin: 0 30px;
		vertical-align: middle;
		text-align: center;
	}
	#modal-title h3 {
		padding: 10px;
		margin: 10 !important;
		display: inline;
		width: 100%;
		background-color: #FFD400;
		border-radius: 20%;
	}
	.modal-content {
		position: relative;
		text-align: center;
		vertical-align: middle;
		width: 100%;
		height: 85%;
		border-style: none;
		margin: 0 auto;
		font-size: 18px;
		width: 100%;
	}
	#text_container pre {
		width: 70%;
		text-align: center;
	}
	.modal-content img {
		width: 30px;
		height: 30px;
	}
	#sugar_img_container {
		display: flex;
		justify-content: space-between;
		width: 70%;
		margin: 0 auto;
	}
	#sugar_img_box {
		vertical-align: middle;
	}
	#sugar_radio_container {
		margin: 0 auto;
		width: 70%;
	}
	#sugar_radio_box {
		display: flex;
		justify-content: space-between;
		vertical-align: middle;
	}
	#sugar_button_box {
		margin: 10px;
		display: flex;
		justify-content: center;
	}
	#sugar_button_box button {
		margin: 15px;
	}
	#review_text {
		width: 70%;
		margin: 20px;
		height: 40px;
	}
	#btn_submit {
		background-color: #FFD400;
		border: 0;
		border-radius: 10%;
		width: 100px;
	}
	#btn_close {
		background-color: #d8dee5;
		border: 0;
		border-radius: 10%;
		width: 100px;
	}
}

@media ( min-width : 769px) {
	.container {
		width: 100%;
	}
	#sub_1 {
		text-align: left;
		display: block;
		font-weight: bold;
		font-size: 40px;
	}
	#sub_2 {
		font-size: 38px;
	}
	#sub_3 {
		text-align: right;
		font-size: 38px;
		font-weight: bold;
	}
	#sub_point {
		background-color: #FFD400;
		border-radius: 10%;
	}
	#tip_img1 {
		width: 100px;
		height: 100px;
		border-radius: 10%;
	}
	#fileModal {
		width: 150px;
		height: 50px;
		font-size: 18px;
		background-color: #FFD400;
		border: 0;
		border-radius: 10%;
		display: inline;
	}
	#mypage_tab {
		width: 100%;
	}
	.my_singo1 {
		width: 30px;
		height: 30px;
	}
	#mytab_1 {
		vertical-align: middle;
		width: 200px;
		text-align: left;
	}
	#mytab_2 {
		width: 300px;
		text-align: left;
	}
	#mytab_3 {
		width: 300px;
	}
	#mytab_4 {
		width: 300px;
		text-align: center;
	}
	#mytab_5 {
		width: 200px;
		text-align: center;
	}
	#mytab_tr {
		border-bottom: 3px solid #d8dee5;
		height: 200px;
		width: 80vw;
	}
	#my_hr1 {
		height: 3px;
	}
	.modal {
		position: absolute;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		display: none;
		background: rgba(0, 0, 0, 0.6);
	}
	.modal .modal-window {
		background-color: white;
		position: relative;
		width: 70vw;
		height: 60%;
		padding: 10px;
		margin: auto;
		margin-top: 20vh;
		margin-right: 10vw;
		border-radius: 10%;
	}
	#modal-title {
		display: flex;
		flex-direction: row;
		flex-wrap: wrap;
		justify-content: space-between;
		align-content: space-around;
		height: 15%;
		margin: 0 30px;
		vertical-align: middle;
		text-align: center;
	}
	#modal-title h3 {
		padding: 10px;
		margin: 10 !important;
		display: inline;
		width: 100%;
		background-color: #FFD400;
		border-radius: 20%;
		font-size: 40px;
	}
	.modal-content {
		position: relative;
		text-align: center;
		width: 100%;
		height: 85%;
		border-style: none;
		margin: 0 auto;
	}
	#text_container pre {
		width: 70%;
		text-align: center;
	}
	.modal-content img {
		width: 40px;
		height: 40px;
	}
	#sugar_img_container {
		display: flex;
		justify-content: space-between;
		width: 70%;
		margin: 0 auto;
	}
	#sugar_img_box {
		vertical-align: middle;
	}
	#sugar_radio_container {
		margin: 0 auto;
		width: 70%;
	}
	#sugar_radio_box {
		display: flex;
		justify-content: space-between;
		vertical-align: middle;
	}
	#sugar_button_box {
		margin: 10px;
		display: flex;
		justify-content: center;
	}
	#sugar_button_box button {
		margin: 15px;
	}
	#review_text {
		width: 70%;
		margin: 20px;
		height: 35px;
	}
	.rev_span {
		font-size: 27px;
	}
	#btn_submit {
		background-color: #FFD400;
		border: 0;
		border-radius: 10%;
		width: 200px;
		font-size: 25px;
	}
	#btn_close {
		background-color: #d8dee5;
		border: 0;
		border-radius: 10%;
		width: 200px;
		font-size: 25px;
	}
}
</style>
</head>
<body>
<%-- 	<%@include file="../main/header.jsp"%> --%>

	<div class="container">
		<p id="sub_1">마이페이지</p>
		<span id="sub_2">진행중인 Tip</span>
		<p id="sub_3">
			<span id="sub_point"> My허니페이 <%=point%>point
			</span>
		</p>
	</div>
	<br>
	<hr>

	<div class="container" id="div_tab1">
		<table>
			<c:forEach items="${lessonList}" var="lesson">
				<tr id="mytab_tr">
					<td id="mytab_1"><img alt="강사이미지"
						src="front/${lesson.lesson_img}" id="tip_img1"></td>
					<td id="mytab_2">${lesson.lesson_title}</td>
					<td id="mytab_3">${ lesson.lesson_info}</td>
					<td id="mytab_4"><button type="button" id="fileModal"
							class="fileModal" value="${lesson.lesson_num}"
							onclick="hsh(${lesson.lesson_num})">수강완료</button></td>
					<td id="mytab_5"><img src="front/siren.png"
						alt="신고" class="my_singo1"></td>
				</tr>

			</c:forEach>
		</table>
	</div>
	<br>
	<br>
	<br>






	<div class="modal">
		<div class="modal-window">
			<div id="modal-title">
				<h3>리뷰 작성</h3>
			</div>

			<div class="modal-content">

				<div id="text_container">

					<span class="rev_span">꿀TIP 잘 전수 받으셨나요?</span> <br> <span
						class="rev_span">잘 받으셨다면 리뷰 작성 부탁드립니다!</span> <br> <span
						class="rev_span">꿀TIPer에게 큰 도움이 됩니다.</span> <br> <br> <span
						class="rev_span">도움이 되신 만큼 '당도'를 평가해주세요!</span>

				</div>

				<br>

				<form action="reviewAction" method="get">

					<div id="sugar_img_container">
						<div id="sugar_img_box">
							<img src="front/honeycomb.png" alt="이미지 경로를 설정해주세요!"> X5 <input
								type="radio" name="review_sugar" value="5" />
						</div>

						<div id="sugar_img_box">
							<img src="front/honeycomb.png" alt="이미지 경로를 설정해주세요!"> X4 <input
								type="radio" name="review_sugar" value="4" />
						</div>

						<div id="sugar_img_box">
							<img src="front/honeycomb.png" alt="이미지 경로를 설정해주세요!"> X3 <input
								type="radio" name="review_sugar" value="3" />
						</div>

						<div id="sugar_img_box">
							<img src="front/honeycomb.png" alt="이미지 경로를 설정해주세요!"> X2 <input
								type="radio" name="review_sugar" value="2" />
						</div>

						<div id="sugar_img_box">
							<img src="front/honeycomb.png" alt="이미지 경로를 설정해주세요!"> X1 <input
								type="radio" name="review_sugar" value="1" />
						</div>


					</div>
					<input type="hidden" name="review_lesson_num" id="lessonNum">
					<input type="text" name="review_cont" id="review_text"
						placeholder="한 줄 리뷰를 작성해주세요" />
					<div id="sugar_button_box">
						<button type="submit" id="btn_submit">리뷰등록</button>
						<button type="button" id="btn_close">닫기</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<script>
    	const modal = document.querySelector('.modal');
    	const btnFileModal = document.querySelector('.fileModal');
    	const btnModalClose = document.querySelector('#btn_close');
    	
    	
    		function hsh(val) {
    			modal.style.display='block';
    	        document.body.style.overflow = 'hidden';
    	       	document.getElementById("lessonNum").value = val;
			}
    		
    		
   


    	
    	
//     	btnFileModal.addEventListener('click', () => {
//     	modal.style.display='block';
//         document.body.style.overflow = 'hidden';
//        	document.getElementById("lessonNum").value = document.getElementsByClassName("fileModal").value;
//     	});
    	
    	btnModalClose.addEventListener('click', () => {
    	modal.style.display='none';
    	});
    </script>
</body>
</html>