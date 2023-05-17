<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.ggul.zip.user.UserVO"%>
<%@page import="com.ggul.zip.tiper.TiperVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<%
int point = (int) session.getAttribute("user_point");

// TiperVO tiperVO = (TiperVO) request.getAttribute("myTiper");

// if (tiperVO.getTiper_agree() == 0) {
//    out.println("<script>");
//    out.println("alert('승인대기 중입니다. 조금만 더 기다려 주세욧!');");
//    out.println("history.back();");
//    out.println("</script>");
// }

String user_id1 = (String) session.getAttribute("user_id");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<title>마이페이지</title>
<%@include file="../main/header.jsp"%>

<style>
body {
	padding: 0;
	margin: 0 auto;
}

a {
	border-style: none;
	color: black;
}

a: hover {
	background: white;
}

h3 {
	font-weight: bold;
}

h5 {
	font-weight: bold;
}

h4 {
	font-weight: bold;
	font-size: 27px;
}

.container0_grid {
	display: flex;
	flex-direction: column;
	width: 90%;
	margin: 0px auto;
	gap: 4px;
}

#backgray {
	background-color: rgb(247, 247, 247);
	width: 100%;
}

.container0{
	width: 95%;
	}

.container1 {
	width: 768px;
	margin: 0 auto;
	margin-top: 90px;
}

#sub_1 {
	text-align: left;
	display: block;
	font-weight: bold;
	font-size: 27px;
	margin-left: 20px;
}

#sub_2 {
	font-size: 38px;
}

#sub_3 {
	text-align: right;
	font-size: 38px;
	font-weight: bold;
}

.container0 {
	width: 768px;
	padding: 50px 0px 25px 0px;
	margin-bottom: -20px;
	background-color: rgb(247, 247, 247);
	margin: 0 auto;
}

.container0_grid {
	display: grid;
	grid-template-columns: 300px auto;
	margin: 0px auto;
	gap: 4px;
	width: 100%;
}

#container0_grid001 {
	padding: 50px 15px 30px;
	grid-row: 1/3;
	display: flex;
	flex-direction: column;
	-webkit-box-pack: justify;
	justify-content: space-between;
	background: rgb(255, 255, 255);
}

#container0_grid002 {
	display: flex;
	column-gap: 4px;
	background-color: white;
	align-items: center;
}

#container0_grid003 {
	display: flex;
	column-gap: 4px;
	background-color: white;
	justify-content: space-between;
	align-items: center;
	background: #FFD400;
}

#container0_grid003:hover{
	background:#FFC70F;
	cursor: pointer;
}

#container0_cont1 {
	display: flex;
	margin-bottom: 30px;
}

#container0_cont2 {
	display: flex;
	flex-direction: column;
	margin-top: 30px;
	margin-left: 24px;
	
}

#container0_cont3 {
	flex: 1 1 0%;
	overflow: hidden;
	background: rgb(255, 255, 255);
	height:100%
}

.container0_cont3_text {
	display: flex;
	flex-direction: column;
	width: 100%;
	height: 100%;
	padding: 10px 10px 10px 10px;
	border-right: 4px solid rgb(247, 247, 247);
	justify-content: center;
}

#container0_cont4 {
	flex: 1 1 0%;
	overflow: hidden;
	background: rgb(255, 255, 255);
	height:100%
}

#container0_cont5 {
	flex: 1 1 0%;
	overflow: hidden;
	background: rgb(255, 255, 255);
	height:100%
}

#container0_cont6 {
	padding: 13px 130px 13px 25px;
	font-size: 17px;
	font-weight: bold;
}

.container0_cont1_text {
	display: block;
	overflow: hidden;
	font-weight: 500;
	font-size: 14px;
	color: rgb(51, 51, 51);
	line-height: 28px;
	white-space: nowrap;
	text-overflow: ellipsis;
}

#cont1_username {
	font-weight: bold;
	margin-left: 24px;
	font-size: 18px;
	line-height: inherit;
}

.container0_cont2_text {
	display: block;
	overflow: hidden;
	font-weight: 500;
	font-size: 14px;
	color: rgb(51, 51, 51);
	line-height: 28px;
	white-space: nowrap;
	text-overflow: ellipsis;
}

#tip_img1 {
	width: 100px;
	height: 100px;
	border-radius: 10%;
}

#btn_complete {
	width: 120px;
	height: 33px;
	font-size: 1.3rem;
	background-color: #FFD400;
	border: 0;
	border-radius: 10%;
	display: inline;
	font-weight: bold;
}

#mypage_tab {
	width: 100%;
}

#cont1_table {
	margin: 0 auto;
}

.mytab_1 {
	width: 100px;
}

.mytab_23 {
	width: 150px;
	padding: 0 3%;
	display: flex;
	flex-direction: column;
	align-items: flex-start;
	text-align: left !important;
	margin-bottom: -6px;
}

.grid002_title {
	font-size: 12px;
	padding-bottom: 20px;
}

.grid002_text {
	font-weight: bold;
	font-size: 16px;
	padding-bottom: 20px;
}

.mytab_2 {
	text-align: left;
}

.mytab_3 {
	
}

.cont1_btn_wrapper {
	display: flex;
	align-items: center;
	width: 190px;
}

.mytab_4 {
	width: 60px;
	text-align: center;
}

.mytab_5 {
	width: 100px;
	text-align: center;
	padding-left: 30px;
	padding-bottom: 15px;
}

.mytab_6 {
	width: 150px;
}

.mytab_tr {
	height: 100px;
	display: flex;
	align-items: center;
	justify-content: space-between;
	margin: 20px 0;
	border-bottom: 2px solid #E9E9E9;
	text-align: center;
}

#cont1_img_title {
	width: 500px;
	display: flex;
	align-items: center;
}

.cont2_img_title {
	width: 500px;
	display: flex;
	align-items: center;
}

#my_hr1 {
	height: 3px;
}

#myimg_singo {
	width: 30px;
	height: 30px;
}

.container2 {
	width: 768px;
	margin: 0 auto;
	margin-top: 100px;
}

.modal1 {
	position: fixed;
	top: 0;
	left: 0;
	width: 100vw;
	height: 100vh;
	display: none;
	background: rgba(0, 0, 0, 0.6);
}

.modal1 .modal1-window {
	background-color: white;
	position: relative;
	width: 600px;
	height: 450px;
	padding: 30px;
	margin: auto;
	margin-top: 20vh;
	border-radius: 3%;
	box-shadow: 1px 1px 3px 3px rgba(0, 0, 0, 0.3), -1px -1px 3px 3px rgba(0, 0, 0, 0.3);
}

#modal1-title {
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

#modal1-title h3 {
	padding: 10px;
	margin: 10 !important;
	width: 100%;
	font-size: 24px;
}

.modal1-content1 {
	position: relative;
	text-align: center;
	width: 100%;
	height: 100%;
	border-style: none;
	margin: 0 auto;
	display: flex;
	flex-direction: column;
	justify-content: flex-start;
}

#text_container {
	width: 70%;
	text-align: center;
	padding: 30px 0;
	margin: 0 auto;
}

.text_container_singo{
	padding: 30px 0;
}

.modal1-content1 img {
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
	display: flex;
	justify-content: center;
}

#sugar_button_box button {
	margin: 0 10px;
	width: 100px;
	height: 30px;
}

#review_text {
	width: 70%;
	margin: 20px;
	height: 35px;
}

.rev_span {
	font-size: 15px;
	font-weight: bolder;
	color: #382407;
}

.btn_submit {
	background-color: #FFD400;
	border: 0;
	border-radius: 10%;
	width: 200px;
	font-size: 14px;
}

.btn_close {
	background-color: #d8dee5;
	border: 0;
	border-radius: 10%;
	width: 200px;
	font-size: 14px;
}

#tiper_info:hover{
	background:rgb(235, 235, 235);
	cursor: pointer;
}

#singo_input1 {
	height: 140px;
	width: 70%;
	margin-top: -30px;
	resize:none;
	display: block;
	margin: 0 auto;
	border-radius: 3px;
	border: 1px solid #darkgray;
}

#user_singo1{
	text-align: left;
	margin: 0 0 40px 0;
}
#singo_input1:focus{
	border: 2px solid #FFD400;
	outline : none;
}

#singo_span_ps{
	color: gray;
	padding-left: 80px;
    margin-top: 20px;
    font-size: 12px;
}

#pagingul {
	margin: 0 auto;
	border-right: 0;
	padding-left: 0;
}

#pagingul li {
	text-align: center;
	float: left;
	list-style: none;
}

#pagingul li .a_tag {
	display: block;
	font-size: 14px;
	color: black;
	padding: 9px 12px;
	border-right: solid 1px #ccc;
	box-sizing: border-box;
	text-decoration-line: none;
}

ul li.on {
	background: #FFD400;
}

ul li.on .a_tag {
	color: #fff;
}

#page_box {
	display:flex;
}

#pagingul {
  margin-top: 20px;
  list-style: none;
  display: flex;
  justify-content: center;
}

#pagingul li {
  margin-right: 5px;
}

#pagingul li a {
  display: block;
  padding: 5px 10px;
  border: 1px solid #ddd;
  background-color: #fff;
  color: #333;
  text-decoration: none;
}

#pagingul li.on a {
  background-color: #FFD400;
  color: #fff;
}

#pt_if_undefined{
	text-align: center;
	margin: 50px auto;
}

#pt_if_undefined span{
	font-size: 1.65rem;
}

#if_undefined_completed{
	text-align: center;
	margin: 50px auto;
}

#if_undefined_completed span{
	font-size: 1.65rem;
}

#if_undefined{
	text-align: center;
	margin: 50px auto;
}

#if_undefined span{
	font-size: 1.65rem;
}

#container0_cont5 .container0_cont3_text{
	border-right-style: none !important;
}

.tiper_rejected {
	color: #8A8A8A;
	font-size: 11px;
	font-weight: lighter;	
}

.pt_cont1_btn_wrapper{
	display: flex;
   	align-items: center;
   	width: 400px;
   	justify-content: flex-end;
}
	
.pt_mytab_4 {
	width: 100px;
	text-align: center;
}

.pt_mytab_5 {
	width: 100px;
	text-align: center;
}

.pt_btn_del{
	width: 120px;
	height: 33px;
	background : #FFD400;
	border: 0;
    border-radius: 10%;
    font-size: 1.3rem;
    font-weight: bolder;
}

.pt_btn_msg{
	width: 120px;
	height: 33px;
	background : #FFD400;
	border: 0;
    border-radius: 10%;
    font-size: 1.3rem;
    margin-left : 30px;
    font-weight: bolder;
}

@media ( max-width : 769px) {   /*==========================================================*/
	.container0_grid {
		display: flex;
		flex-direction: column;
		width: 90%;
		margin: 0px auto;
		gap: 4px;
	}
	#cont1_username{
		font-weight: bold;
    	margin-left: 20px;
  	 	 font-size: 18px;
    	line-height: inherit;
	}
	#container0_cont6 {
		padding: 30px 0px 30px 30px;
		font-size: 17px;
		font-weight: bold;
	}
	
	#container0_grid001 {
		padding: 50px 15px 30px;
		grid-row: 1/3;
		display: flex;
		flex-direction: row;
		-webkit-box-pack: justify;
		justify-content: space-between;
		background: rgb(255, 255, 255);
		-webkit-box-pack: justify;
	}
	#container0_cont2 {
		display: flex;
		flex-direction: column;
		margin-top: 0;
	}
	.grid002_title {
	font-size: 10px;
	padding-bottom: 4px;
	}
	#container0_grid001 {
		padding: 50px 15px 30px;
		grid-row: 1/3;
		display: flex;
		flex-direction: column;
		-webkit-box-pack: justify;
		justify-content: space-around;
		background: rgb(255, 255, 255);
	}
	
	.container0_cont3_text{
		display: flex;
    flex-direction: column;
    width: 100%;
    height: 100%;
    padding: 30px 10px 30px 10px;
    border-right: 4px solid rgb(247, 247, 247);
	}
	
	.mytab_6{
		display:none;
	}
	.grid002_text {
	font-size: 14px;
}
	
	.cont1_btn_wrapper{
		display: flex;
		flex-direction: column;
    	align-items: center;
   		 width: 190px;
   		 margin-right: 10px;
	}
	.container0{
		width: 98%;
	}
	.container1{
		width: 95%;
	}
	
	.container2{
		width: 95%;
	}
	
	#btn_complete{
		width: 100px;
	}
	
	.filemodal1.singo{
		width: 30px;
		height: 30px;
	}
	.mytab_5 {
    width: 100px;
    padding-top: 5px;
    padding-left: 0px ! important;
	}
	
	#container0_cont5 .container0_cont3_text{
	border-right-style: none !important;
	}
	
	.pt_cont1_btn_wrapper{
		flex-direction:column;
	}
	
	.pt_btn_del{
		margin-left: 0px !important;
		width: 100px;
	}
	
	.pt_btn_msg{
		margin-left: 0px !important;
		margin-top: 5px;
		width: 100px;
	}
	.pt_mytab_5{
	margin-top: 10px;
	}
	
	.modal1 .modal1-window {
	width: 95%;
	margin-top: 15vh;
	height: 400px;
	}
	
	#text_container {
    width: 90%;
    padding: 15px 0;
}
	.grid002_text {
    font-size: 12px;
	}
	
	.rev_span {
    font-size: 12px;
    font-weight: bolder;
    color: #382407;
    }
    
    #singo_span_ps {
    color: gray;
    margin-top: 20px;
    font-size: 10px;
    padding-left: 0px;
}
    
    #singo_input1 {
	height: 70px;
	width: 100%;
	resize:none;
	}
	
}
</style>
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/front/myPage.css"> --%>
</head>
<body>

	<div id="super_container">
		<div class="container99">
			<div id="backgray">
				<div class="container0">
					<p id="sub_1">마이페이지</p>
					<div class="container0_grid">

						<div id="container0_grid001">
							<div id="container0_cont1">
<!-- 								<div class="container0_cont1_text">일반회원</div> -->
								<span class="container0_cont1_text" id="cont1_username">${info[0].user_name}</span><span
									class="container0_cont1_text">님</span>
							</div>
							<div id="container0_cont2">
								<div class="container0_cont2_text">${info[0].user_tel}</div>
								<span class="container0_cont2_text">${info[0].user_email}</span>
								<span class="container0_cont2_text">
								<fmt:formatDate value="${info[0].user_date}" pattern = "yyyy년 M월 d일"/>에 가입</span>
							</div>
						</div>

						<div id="container0_grid002">
							<div id="container0_cont3">
								<div class="container0_cont3_text">
									<div id="container0_cont3_text1">
										<div class="grid002_title">포인트</div>
										<span class="grid002_text">${info[0].user_point}</span> <span>페이</span>
									</div>
								</div>
							</div>
							<div id="container0_cont4">
								<div class="container0_cont3_text">
									<div id="container0_cont4_text1">
										<div class="grid002_title">관심 카테고리</div>
										<span class="grid002_text">${info[0].user_cate}</span>
									</div>
								</div>
							</div>
							
							
							
							<div id="container0_cont5">

							<c:if test="${isTiper eq 0}">
								<div class="container0_cont3_text" id="tiper_info" onclick="location.href='tiperSignUpMove'">
									<div id="container0_cont5_text1">
										<div class="grid002_title">TIPer</div>
									
										<span class="grid002_text">티퍼신청하기 ></span>
									</div>
								</div>
							</div>
										</c:if>


										<c:if test="${isTiper eq 1}">
										
										<div class="container0_cont3_text">
									<div id="container0_cont5_text1">
										<div class="grid002_title">TIPer</div>
										
											<c:if test="${isTiperAgree eq 0}">
											<span class="grid002_text">승급진행중</span>
											</c:if>
										
											<c:if test="${isTiperAgree eq 1}">
											<span class="grid002_text">TIPer입니다</span>
											</c:if>
											
											<c:if test="${isTiperAgree eq 2}">
											<span class="grid002_text">거절됨</span>
											</c:if>
									
									
									
									</div>
								</div>
							</div>
										</c:if>

						</div>
						
						
						<div id="container0_grid003">
							<div id="container0_cont6" onclick="location.href='chkPassword'">
								회원정보 수정하러 가기 >
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="container1" id="div_tab1">
				<div id="cont1_table">
					<h4>수강신청한 강의</h4>
					<c:if test="${empty potentialLessonList}"><div id="pt_if_undefined"><span>수강신청한 강의가 없어요</span></div></c:if>
					
					<c:forEach items="${potentialLessonList}" var="potentialLesson">
						<div class="mytab_tr">

							<div id="cont1_img_title">
								<div class="mytab_1">
									<img alt="강의이미지" src="${pageContext.request.contextPath}/front/lesson/${potentialLesson.lesson_img}" id="tip_img1">
								</div>


								<div class="mytab_23" onclick='location.href="getLessonDetail?lesson_num=${potentialLesson.lesson_num}"' style="cursor: pointer">
									<div class="mytab_2">${potentialLesson.lesson_user_name}강사의</div>
									<div class="mytab_3">
										<h5>${potentialLesson.lesson_title}</h5>
									</div>
								</div>
							</div>

							<div class="pt_cont1_btn_wrapper">
								<div class="pt_mytab_4">
									<button type="button" class="pt_btn_del"
										onclick="location.href='deleteEscrowLesson?escrow_lesson_num=${potentialLesson.escrow_lesson_num}'">수강 취소</button>
								</div>

								<div class="pt_mytab_5">
<%-- 									<button type="button" class="pt_btn_msg" value="${potentialLesson.lesson_num}" onclick="hsh(${potentialLesson.lesson_num}, '<%=user_id1%>')">쪽지</button> --%>
										<button title="메세지 보내기" type="button" id="msg_button" onclick="open_popup()"><i class='fa fa-paper-plane-o' aria-hidden='true'></i></button>
										<span style="display: none"; class="cont1-group-title" id="cont1-group-text">@${potentialLesson.tiper_user_id}</span>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>

			<div class="container1" id="div_tab1">
				<div id="cont1_table">
					<h4>내가 듣고 있는 강의</h4>
					<c:if test="${empty lessonList}"><div id="if_undefined"><span>듣고 있는 강의가 없어요</span></div></c:if>
					
					<c:forEach items="${lessonList}" var="lesson">
						<div class="mytab_tr">

							<div id="cont1_img_title">
								<div class="mytab_1">
									<img alt="강의이미지" src="${pageContext.request.contextPath}/front/lesson/${lesson.lesson_img}" id="tip_img1">
								</div>


								<div class="mytab_23" onclick='location.href="getLessonDetail?lesson_num=${lesson.lesson_num}"' style="cursor: pointer">
									<div class="mytab_2">${lesson.lesson_user_name}강사의</div>
									<div class="mytab_3">
										<h5>${lesson.lesson_title}</h5>
									</div>
								</div>
							</div>

							<div class="mytab_6">${lesson.escrow_start}~</div>

							<div class="cont1_btn_wrapper">
								<div id="mytab_4">
									<button type="button" id="btn_complete" class="filemodal1"
										value="${lesson.lesson_num}"
										onclick="hsh(${lesson.lesson_num}, '<%=user_id1%>')">수강완료</button>
								</div>

								<div class="mytab_5">
									<img src="front/siren.png" alt="신고" class="filemodal1_singo"
										onclick="hsh2(${lesson.lesson_num}, '<%=user_id1%>')"
										id="myimg_singo">
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>

			<div class="container2" id="div_tab2">
				<div id="cont2_table">
					<h4>지금까지 들은 강의</h4>
					<div id="data_table_body"></div>
					<div id="page_box">
						<ul id="pagingul"></ul>
					</div>
				</div>
			</div>


			<!-- 리뷰 하기 모달창 -->

			<div class="modal1 review1">
				<div class="modal1-window">

					<div class="modal1-content1">

						<div id="modal1-title">
							<h3>리뷰 작성</h3>
						</div>
						<div id="text_container">

							<span class="rev_span">꿀TIP 잘 전수 받으셨나요?</span> <br> <span
								class="rev_span">잘 받으셨다면 리뷰 작성 부탁드립니다!</span> <br> <span
								class="rev_span">꿀TIPer에게 큰 도움이 됩니다.</span> <br> <br>
							<span class="rev_span">도움이 되신 만큼 '당도'를 평가해주세요!</span>

						</div>

						<form action="reviewAction" method="get">

							<div id="sugar_img_container">
								<div id="sugar_img_box">
									<img src="front/honeycomb.png" alt="이미지 경로를 설정해주세요!"> X5
									<input type="radio" name="review_sugar" value="5" />
								</div>

								<div id="sugar_img_box">
									<img src="front/honeycomb.png" alt="이미지 경로를 설정해주세요!"> X4
									<input type="radio" name="review_sugar" value="4" />
								</div>

								<div id="sugar_img_box">
									<img src="front/honeycomb.png" alt="이미지 경로를 설정해주세요!"> X3
									<input type="radio" name="review_sugar" value="3" />
								</div>

								<div id="sugar_img_box">
									<img src="front/honeycomb.png" alt="이미지 경로를 설정해주세요!"> X2
									<input type="radio" name="review_sugar" value="2" />
								</div>

								<div id="sugar_img_box">
									<img src="front/honeycomb.png" alt="이미지 경로를 설정해주세요!"> X1
									<input type="radio" name="review_sugar" value="1" />
								</div>


							</div>
							<input type="hidden" name="review_lesson_num" id="lessonNum">
							<input type="hidden" name="escrow_lesson_num"
								id="escrowLessonNum"> <input type="hidden"
								name="review_writer" id="reviewWriter"> <input
								type="hidden" name="escrow_user_id" id="escrowUserId"> <input
								type="text" name="review_cont" id="review_text"
								placeholder="한 줄 리뷰를 작성해주세요" />
							<div id="sugar_button_box">
								<button type="submit" class="btn_submit" id="btn_submit">리뷰등록</button>
								<button type="button" class="btn_close" id="btn_close">닫기</button>
							</div>
						</form>
					</div>
				</div>
			</div>

			<!-- 신고하기 모달창  -->
			<div class="modal1" id="modal1Singo">
				<div class="modal1-window">

					<div class="modal1-content1" id="modal1-content2-singo">

						<div id="modal1-title-singo">
							<h3>신고 하기</h3>
						</div>

						<div class="text_container_singo">

							<span class="rev_span">강의에 문제가 있었나요?</span><br>
							<span class="rev_span"> 신고를 통해 보다 나은 꿀집 환경을 만들어 주세요! </span> 

						</div>

						<form action="reportLessonNum" method="post">

							<div id="user_singo1">
								<textarea placeholder="신고내용을 입력해주세요!" id="singo_input1" name="report_cont"></textarea> 
								<span id="singo_span_ps">*허위 신고시 처벌의 대상이 될 수 있습니다.</span>
									<input type="hidden" name="report_lesson_num" id="lessonNum_singo"> 
									<input type="hidden" name="report_user_id" id="userID_singo">
							</div>

							<div id="sugar_button_box">
								<button type="submit" class="btn_submit" id="btn_submit_singo">신고하기</button>
								<button type="button" class="btn_close" id="btn_close_singo">닫기</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
   
       const modal1 = document.querySelector('.modal1');
       const modal1Singo = document.querySelector('#modal1Singo');
       const btnFilemodal1 = document.querySelector('.filemodal1');
       const btnmodal1Close = document.querySelector('#btn_close');
       const btnSubmitSingo = document.querySelector('#btn_submit_singo');
       const btnmodal1CloseSingo = document.querySelector('#btn_close_singo');
       
          //리뷰창 강의 번호 주기 함수
          function hsh(val1, val2) {
        	  console.log(val1 + val2 + "이것이 val1과 val2");
             modal1.style.display='block';
               document.body.style.overflow = 'hidden';
                 document.getElementById("lessonNum").value = val1;
                 document.getElementById("escrowLessonNum").value = val1;
                 document.getElementById("reviewWriter").value = val2;
                 document.getElementById("escrowUserId").value = val2;
         }
       
          //신고창 강의 번호 주기 함수
          function hsh2(val1, val2) {
        	  console.log(val1 + val2 + "이것이 val1과 val2");
             modal1Singo.style.display='block';
               document.body.style.overflow = 'hidden';
                 document.getElementById("lessonNum_singo").value = val1;
                 document.getElementById("userID_singo").value = val2;
         }
          
       //리뷰창 닫기
       btnmodal1Close.addEventListener('click', () => {
       modal1.style.display='none';
    	   document.body.style.removeProperty('overflow');
       });
       // 신고창 닫기
       btnmodal1CloseSingo.addEventListener('click', () => {
    	   modal1Singo.style.display='none';
    	   document.body.style.removeProperty('overflow');
           });
       
    </script>
<script>

var totalData; //총 데이터 수
var dataPerPage=5; //한 페이지에 나타낼 글 수
var pageCount = 5; //한 번에 나타낼 페이지 수 ([이전] 1 2 3 4 5 [다음])
var globalCurrentPage= 1; //현재 페이지
var dataList; //데이터 리스트
 
window.onload= function(){

     //totalData(총 데이터 수) 구하기
	 dataList = ${completedListJSON};		
     
     //totalData(총 데이터 수) 구하기
	 totalData = dataList.length;
     
     displayData(1, dataPerPage);
     paging(totalData, dataPerPage, pageCount, 1);
};
 
//현재 페이지(currentPage)와 페이지당 글 개수(dataPerPage) 반영
function displayData(currentPage, dataPerPage) {

  let chartHtml = "";

//Number로 변환하지 않으면 아래에서 +를 할 경우 스트링 결합이 되어버림.. 
  currentPage = Number(currentPage);
  dataPerPage = Number(dataPerPage);
  
  
 if (totalData < (currentPage - 1) * dataPerPage + dataPerPage){
	
	  for (
		var i = (currentPage - 1) * dataPerPage;
		    i < totalData;
			     i++
			   ) {
		  chartHtml +=
			  '<div class="mytab_tr"><div class="cont2_img_title"><div class="mytab_1"><img alt="강사이미지"src="${pageContext.request.contextPath}/front/lesson/'
			  + dataList[i].lesson_img +'" id="tip_img1"></div>'+
			  '<div class="mytab_23" onclick="location.href=\'getLessonDetail?lesson_num='+dataList[i].lesson_num +'\'" style="cursor: pointer"><div class="mytab_2">' + dataList[i].lesson_user_name + '강사의</div><div class="mytab_3"><h5>'+
			  dataList[i].lesson_title + '</h5></div></div></div><div class="mytab_6">'+
			  moment(dataList[i].escrow_start).format("YYYY년 M월 D일")+'~'+moment(dataList[i].escrow_end).format("YYYY년 M월 D일")+'</div><div class="cont1_btn_wrapper">'+
		'<div class="mytab_5"><img src="${pageContext.request.contextPath}/front/siren.png" alt="신고" class="filemodal1_singo" onclick="hsh2('+
		  dataList[i].lesson_num +', \''+ dataList[i].escrow_user_id +'\')" id="myimg_singo"></div></div></div>';
			   } 
 }else{ 
  
  for (
    var i = (currentPage - 1) * dataPerPage;
    i < (currentPage - 1) * dataPerPage + dataPerPage;
    i++
  ) {
	   chartHtml +=
		   '<div class="mytab_tr"><div class="cont2_img_title"><div class="mytab_1"><img alt="강사이미지"src="${pageContext.request.contextPath}/front/lesson/'
			  + dataList[i].lesson_img +'" id="tip_img1"></div>'+
			  '<div class="mytab_23" onclick="location.href=\'getLessonDetail?lesson_num='+dataList[i].lesson_num +'\'" style="cursor: pointer"><div class="mytab_2">' + dataList[i].lesson_user_name + '강사의</div><div class="mytab_3"><h5>'+
			  dataList[i].lesson_title + '</h5></div></div></div><div class="mytab_6">'+
			  moment(dataList[i].escrow_start).format("YYYY년 M월 D일")+'~'+moment(dataList[i].escrow_end).format("YYYY년 M월 D일")+'</div><div class="cont1_btn_wrapper">'+
		'<div class="mytab_5"><img src="${pageContext.request.contextPath}/front/siren.png" alt="신고" class="filemodal1_singo" onclick="hsh2('+
		  dataList[i].lesson_num +', \''+ dataList[i].escrow_user_id +'\')" id="myimg_singo"></div></div></div>';
  } //dataList는 임의의 데이터임.. 각 소스에 맞게 변수를 넣어주면 됨...
}
 
 if( typeof chartHtml == "undefined" || chartHtml == ''){ chartHtml +=" <div id='if_undefined_completed'><span>지금까지 들은 강의가 없어요<span></div>"}

 
document.getElementById("data_table_body").innerHTML=chartHtml;
}
 
function paging(totalData, dataPerPage, pageCount, currentPage) {

	  totalPage = Math.ceil(totalData / dataPerPage); //총 페이지 수
	  
	  if(totalPage<pageCount){
	    pageCount=totalPage;
	  }
	  
	  let pageGroup = Math.ceil(currentPage / pageCount); // 페이지 그룹
	  let endPage = pageGroup * pageCount; //화면에 보여질 마지막 페이지 번호
	  
	  if (endPage > totalPage) {
	    endPage = totalPage;
	  }

	  let startPage = endPage - (pageCount - 1); //화면에 보여질 첫번째 페이지 번호
	  let next = Number(currentPage)+1;
//	  let next = endPage +1;
	  let prev = Number(currentPage)-1;
//	  let prev = startPage - 1;

	  let pageHtml = "";

	  if (prev > 0) {
	    pageHtml += "<li><a href='javascript:void(0)' id='prev'> 이전 </a></li>";
	  }

	 //페이징 번호 표시 
	  for (var i = startPage; i <= endPage; i++) {
	    if (currentPage == i) {
	      pageHtml +=
	        '<li class="on"><a href="javascript:void(0)" id="' + i + '">' + i + '</a></li>';
//	        '<li class="on"><a href="javascript:displayData('+2+',5)" id="' + i + '">' + i + '</a></li>';
	    } else {
	      pageHtml += "<li><a href='javascript:void(0)' id='" + i + "'>" + i + "</a></li>";
	    }
	  }
	 
	 	console.log("토탈 : "+ totalPage);
	 	console.log("엔드 : "+ endPage);
	 	console.log("지금 : "+ currentPage);
	 	console.log("다음 : "+ next);
	 
	  if (next <= totalPage) {
	    pageHtml += '<li><a href="javascript:void(0);" id="next"> 다음 </a></li>';
	  }

// 	  $("#pagingul").html(pageHtml);
	  
	  document.getElementById("pagingul").innerHTML=pageHtml;



	  //페이징 번호 클릭 이벤트 
	  $("#pagingul li a").click(function () {
	    let $id = $(this).attr("id");
	    selectedPage = $(this).text();

	    if ($id == "next") selectedPage = next;
	    if ($id == "prev") selectedPage = prev;
	    
	    
	    //전역변수에 선택한 페이지 번호를 담는다...
	    globalCurrentPage = selectedPage;
	 
	    console.log("클릭시 글로벌 "+globalCurrentPage);
	    
	    //글 목록 표시 재호출
	    displayData(globalCurrentPage, dataPerPage);
	    //페이징 표시 재호출
	    paging(totalData, dataPerPage, pageCount, globalCurrentPage);
	  });
	}
	
</script>
<%@include file="../main/footer.jsp"%>
</html>