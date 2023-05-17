<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.ggul.zip.tiper.TiperVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
int point = (int) request.getAttribute("user_point");
TiperVO tiperVO = (TiperVO) request.getAttribute("tiperVO");

String cate2 = null;
String mobcate2 = null;
String cate3 = null;
String mobcate3 = null;

if (tiperVO.getTiper_cate2() == null) {
	cate2 = "";
	mobcate2 = "";

} else {
	cate2 = tiperVO.getTiper_cate2();
	mobcate2 = " ," + tiperVO.getTiper_cate2();
}

if (tiperVO.getTiper_cate3() == null) {
	cate3 = "";
	mobcate3 = "";

} else {
	cate3 = tiperVO.getTiper_cate3();
	mobcate3 = " ," + tiperVO.getTiper_cate3();

}
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
@media ( min-width : 769px) {
	.container {
		width: 65%;
	}
	#mytip_sub1 {
		font-size: 27px;
		font-weight: bold;
	}
	#mytip_sub2 {
		font-size: 24px;
		font-weight: bold;
	}
	.mytip_tr1 {
		border-bottom: 2px solid #d8dee5;
		height: 90px;
		font-weight: bold;
	}
	.my_singo2 {
		width: 30px;
		height: 30px;
	}
	.mytip_td1 {
		text-align: left;
		font-size: 15px;
		width: 250px;
	}
	.mytip_td2 {
		text-align: left;
		font-size: 15px;
		width: 300px;
	}
	.mytip_td3 {
		width: 300px;
		font-size: 15px;
		text-align: left;
	}
	.mytip_td4 {
		width: 200px;
		font-size: 15px;
	}
	.mytip_td5 {
		text-align: center;
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
		height: 40px;
		margin-top: 4px;
		font-weight: bold;
	}
	#mytip_btn3 {
		background-color: #FFD400;
		border: 0;
		border-radius: 10px;
		width: 300px;
		height: 50px;
		font-size: 15px;
		font-weight: bold;
		margin: 10px;
	}
	#mytip_imgpro {
		width: 150px;
		height: 150px;
		border-radius: 10px;
	}
	#mytip_tdpro2 {
		text-align: center;
		vertical-align: middle;
		width: 300px;
		background-color: white;
		border-right: 6px solid rgb(247, 247, 247);
	}
	#mytip_tdpro1 {
		width: 200px;
		text-align: center;
		vertical-align: middle;
		background-color: rgb(247, 247, 247);
		border-right: 6px solid rgb(247, 247, 247);
		border-left: 6px solid rgb(247, 247, 247);
	}
	#mytip_tdpro3 {
		vertical-align: middle;
		width: 260px;
		font-size: 14px;
		text-align: center;
		background-color: white;
		border-right: 6px solid rgb(247, 247, 247);
	}
	#mytip_tdpro4 {
		vertical-align: top;
		text-align: center;
		width: 300px;
		background-color: white;
		border-right: 6px solid rgb(247, 247, 247);
	}
	#mytip_trpro {
		height: 170px;
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
		box-shadow: 1px 1px 3px 3px rgba(0, 0, 0, 0.3), -1px -1px 3px 3px
			rgba(0, 0, 0, 0.3);
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
	.text_container_singo {
		padding: 30px 0;
	}
	.modal1-content1 img {
		width: 40px;
		height: 40px;
	}
	.btn_submit {
		background-color: #FFD400;
		border: 0;
		border-radius: 10px;
		width: 200px;
		font-size: 14px;
		width: 200px;
		height: 40px;
	}
	.btn_close {
		background-color: #d8dee5;
		border: 0;
		border-radius: 10px;
		width: 200px;
		font-size: 14px;
		width: 200px;
		height: 40px;
	}
	#tiper_info:hover {
		background: rgb(235, 235, 235);
		cursor: pointer;
	}
	#singo_input1 {
		height: 140px;
		width: 70%;
		margin-top: -30px;
		resize: none;
		display: block;
		margin: 0 auto;
		border-radius: 3px;
		border: 1px solid #darkgray;
	}
	#user_singo1 {
		text-align: left;
		margin: 0 0 40px 0;
	}
	#singo_input1:focus {
		border: 2px solid #FFD400;
		outline: none;
	}
	#singo_span_ps {
		color: gray;
		padding-left: 80px;
		margin-top: 20px;
		font-size: 12px;
	}
	#mytip_singo {
		width: 30px;
		height: 30px;
	}
	#tipup_div4 {
		text-align: right;
	}
	#mytip_div1 {
		background-color: rgb(247, 247, 247);
		padding: 0;
	}
	#mytip_tabpro {
		width: 100%;
	}
	#mytip_infosub {
		display: block;
		margin-top: 10px;
	}
	#mob_profile_div {
		display: none;
	}
	#mob-btn-div {
		display: none;
	}
	#myip_catesub {
		font-weight: bold;
		font-size: 14px;
	}
	#mytip_point2 {
		font-weight: bold;
	}
	#mytip_infosub {
		font-weight: bold;
	}
	#mytip-leslist-tab {
		width: 100%;
	}
	.mytip-leslist-tr {
		height: 100px;
		border-bottom: 2px solid #d8dee5;
	}
	.leslist-img {
		width: 80px;
		height: 80px;
		border-radius: 10px;
		cursor: pointer;
	}
	.mytip-leslist-td1 {
		width: 150px;
	}
	.mytip-leslist-td2 {
		width: 180px;
		font-size: 15px;
		font-weight: bold;
	}
	.mytip-leslist-td3 {
		width: 100px;
		font-size: 15px;
		font-weight: bold;
	}
	.mytip-leslist-td4 {
		font-size: 15px;
		font-weight: bold;
	}
	#mytip-leslist-sub {
		font-size: 24px;
		font-weight: bold;
	}
	.mytip-leslist-td5 {
		text-align: right;
		width: 150px;
	}
	.mytip-leslist-btn {
		background-color: #FFD400;
		border: 0;
		border-radius: 10px;
		width: 100px;
		height: 50px;
		font-weight: bold;
	}
	.mytip-leslist-info {
		display: block;
		overflow: hidden;
		text-overflow: ellipsis;
		white-space: nowrap;
		width: 200px;
		margin-left: 10px;
	}
	#mytip_table1 {
		width: 100%;
	}
}

@media ( max-width : 768px) {
	#mytip_sub3 {
		font-size: 18px;
		font-weight: bold;
	}
	.mytip_tr1 {
		border-bottom: 2px solid #d8dee5;
		height: 70px;
	}
	.filemodal1_singo {
		width: 20px;
		height: 20px;
	}
	.mytip_td1 {
		text-align: left;
		font-size: 12px;
	}
	.mytip_td2 {
		text-align: left;
		font-size: 12px
	}
	.mytip_td3 {
		font-size: 12px
	}
	.mytip_td4 {
		font-size: 12px
	}
	.mytip_td5 {
		width: 35px;
	}
	.mytip_btn1 {
		background-color: #FFD400;
		border: 0;
		border-radius: 10px;
		font-weight: bold;
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
		width: 300px;
		height: 500px;
		padding: 30px;
		margin: auto;
		margin-top: 20vh;
		border-radius: 3%;
		box-shadow: 1px 1px 3px 3px rgba(0, 0, 0, 0.3), -1px -1px 3px 3px
			rgba(0, 0, 0, 0.3);
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
	.text_container_singo {
		padding: 30px 0;
	}
	.modal1-content1 img {
		width: 40px;
		height: 40px;
	}
	.btn_submit {
		background-color: #FFD400;
		border: 0;
		border-radius: 10px;
		width: 200px;
		height: 40px;
		font-size: 14px;
	}
	.btn_close {
		background-color: #d8dee5;
		border: 0;
		border-radius: 10%;
		width: 200px;
		font-size: 14px;
	}
	#tiper_info:hover {
		background: rgb(235, 235, 235);
		cursor: pointer;
	}
	#singo_input1 {
		height: 140px;
		width: 70%;
		margin-top: -30px;
		resize: none;
		display: block;
		margin: 0 auto;
		border-radius: 3px;
		border: 1px solid #darkgray;
	}
	#user_singo1 {
		text-align: left;
		margin: 0 0 40px 0;
	}
	#singo_input1:focus {
		border: 2px solid #FFD400;
		outline: none;
	}
	#singo_span_ps {
		color: gray;
		margin-top: 20px;
		font-size: 12px;
	}
	#mytip_singo {
		width: 20px;
		height: 20px;
		margin-bottom: 2px;
	}
	#tipup_div4 {
		text-align: center;
		background-color: white;
	}
	#mytip_div1 {
		display: none;
	}
	#mytip_tabpro {
		width: 100%;
	}
	#mytip_catespan {
		font-weight: bold;
	}
	#mytip_pointspan {
		font-weight: bold;
	}
	.mytip_td5 {
		text-align: center;
	}
	#mytip_infosub {
		display: block;
		margin-top: 5px;
	}
	#mob-tab {
		width: 100%;
	}
	#mob_profile_div {
		background-color: rgb(247, 247, 247);
		padding: 10px;
	}
	#mob_sub1 {
		font-size: 22px;
		font-weight: bold;
	}
	#mob-pro-img {
		width: 80px;
		height: 80px;
	}
	#mob-pro-tr1 {
		height: 70px;
	}
	#mob-pro-td1 {
		vertical-align: top;
	}
	#mob-pro-td2 {
		vertical-align: top;
		text-align: center;
		font-size: 12px;
		background-color: white;
		border-right: 3px solid rgb(247, 247, 247);
		border-bottom: 3px solid rgb(247, 247, 247);
	}
	#mob-pro-td3 {
		vertical-align: top;
		text-align: center;
		font-size: 12px;
		background-color: white;
		border-bottom: 3px solid rgb(247, 247, 247);
	}
	#mob-cate-sub {
		display: block;
		margin-top: 5px;
	}
	#mob-tiper-sub {
		display: block;
		margin-top: 5px;
	}
	#mob-pro-tr2 {
		height: 130px;
	}
	#mob-pro-td4 {
		text-align: center;
		vertical-align: top;
		font-size: 12px;
		background-color: white;
		border-right: 3px solid rgb(247, 247, 247);
	}
	#mytip_btn2 {
		background-color: #FFD400;
		border: 0;
		border-radius: 10px;
		width: 130px;
		height: 40px;
		margin-top: 4px;
		font-weight: bold;
		font-size: 12px;
	}
	#mob-pro-td5 {
		text-align: center;
		vertical-align: middle;
		background-color: rgb(247, 247, 247);
	}
	#mob-cate-span {
		font-weight: bold;
	}
	#mob-point {
		font-weight: bold;
	}
	#mob-tiper-info {
		font-weight: bold;
	}
	#mytip_table1 {
		width: 100%;
	}
	#mob-pay-sub {
		display: block;
		margin-top: 5px;
	}
	#mob-btn-div {
		text-align: center;
	}
	#mytip_btn3 {
		background-color: #FFD400;
		border: 0;
		border-radius: 10px;
		width: 150px;
		height: 40px;
		font-size: 12px;
		font-weight: bold;
		margin-right: 6px;
	}
	.leslist-img {
		width: 50px;
		height: 50px;
	}
}
</style>
<body>
	<%@include file="../main/header.jsp"%>
	<!-- 모바일 프로필 부분 -->
	<div class="container" id="mob_profile_div">
		<span id="mob_sub1">TIPer 마이페이지</span> <br> <br>
		<div id="mob-tab-div">
			<table id="mob-tab">
				<tr id="mob-pro-tr1">
					<td id="mob-pro-td1" rowspan="2"><img alt="프로필"
						src="front/profile/<%=tiperVO.getTiper_img()%>" id="mob-pro-img"></td>
					<td id="mob-pro-td2"><span id="mob-cate-sub">내 카테고리</span> <br>
						<span id="mob-cate-span"><%=tiperVO.getTiper_cate1()%><%=mobcate2%><%=mobcate3%></span></td>
					<td id="mob-pro-td3"><span id="mob-pay-sub">My허니페이&nbsp;<span
							id="mob-point"><%=point%></span>point
					</span></td>
				</tr>

				<tr id="mob-pro-tr2">
					<td id="mob-pro-td4"><span id="mob-tiper-sub">강사 정보</span> <br>
						<span id="mob-tiper-info"><%=tiperVO.getTiper_info()%></span></td>
					<td id="mob-pro-td5"><button type="button"
							onclick="location.href='honeyTake'" id="mytip_btn2">허니페이
							정산하기</button></td>
				</tr>
			</table>


		</div>


	</div>
	<br>
	<div id="mob-btn-div">
		<button type="button" onclick="location.href='lessonMakeGo'"
			id="mytip_btn3">강의등록하기</button>

	</div>



	<!-- 웹페이지 프로필 부분 -->
	<div class="container" id="mytip_div1">
		<h4 id="mytip_sub1">TIPer마이페이지</h4>
		<br> <br>
		<div>
			<table id="mytip_tabpro">
				<tr id="mytip_trpro">
					<td id="mytip_tdpro1"><img alt="프로필"
						src="front/<%=tiperVO.getTiper_img()%>" id="mytip_imgpro"></td>

					<td id="mytip_tdpro3"><span id="myip_catesub">내 카테고리</span> <br>
						<br> <span id="mytip_catespan"><%=tiperVO.getTiper_cate1()%><br>
							<br><%=cate2%><br> <br><%=cate3%></span></td>
					<td id="mytip_tdpro2"><p id="mytip_point2">
							<span id="mytip_point3">My허니페이 <span id="mytip_pointspan"><%=point%></span>point
							</span>
						</p> <br> <br> <br> <br>
						<button type="button" onclick="location.href='honeyTake'"
							id="mytip_btn2">허니페이 정산하기</button></td>
					<td id="mytip_tdpro4"><span id="mytip_infosub">강사 소개</span> <br>
						<span id="mytip_infospan"><%=tiperVO.getTiper_info()%></span></td>
				</tr>
			</table>
		</div>
		<div id="tipup_div4">
			<button type="button" onclick="location.href='lessonMakeGo'"
				id="mytip_btn3">강의등록하기</button>

		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<!-- 공통 작성 부분 -->
	<div class="container">
		<div id="mytip_sub2">
			<span id="mytip_sub3">진행중인 꿀TIP</span><br>
		</div>
		<br>
		<table id="mytip_table1">
			<c:forEach items="${lessonTiper}" var="lesson">
				<tr class="mytip_tr1">
					<td class="mytip_td1">${lesson.lesson_date}</td>
					<td class="mytip_td2">
						<div>회원ID: ${lesson.lesson_info}</div>
					</td>
					<td class="mytip_td3"><span>${lesson.lesson_title}</span></td>
					<td class="mytip_td4"><span>가격 : ${lesson.lesson_cate}</span></td>
					<td class="mytip_td5"><img src="front/siren.png" alt="신고"
						class="filemodal1_singo ${lesson.lesson_num}"
						onclick="hsh2(${lesson.lesson_num}, '${lesson.lesson_info}')"
						id="mytip_singo"></td>
				</tr>

			</c:forEach>

		</table>
		<br> <br>
	</div>
	<br>
	<div class="container">
		<p id="mytip-leslist-p">
			<span id="mytip-leslist-sub">나의 꿀TIP들</span>
		</p>
		<br>
		<table id="mytip-leslist-tab">
			<c:forEach items="${lessonList}" var="leslist">
				<tr class="mytip-leslist-tr">
					<td class="mytip-leslist-td1"><img alt="강의 사진"
						src="front/lesson/${leslist.lesson_img}" class="leslist-img"
						title="${leslist.lesson_title}"
						onclick="location.href='getLessonDetail?lesson_num=${leslist.lesson_num}'"></td>
					<td class="mytip-leslist-td2"><span class="mytip-leslist-img">${leslist.lesson_title}</span></td>
					<td class="mytip-leslist-td3"><span class="mytip-leslist-cate">${leslist.lesson_cate}</span></td>
					<td class="mytip-leslist-td4"><span class="mytip-leslist-info"
						title="${leslist.lesson_info}">${leslist.lesson_info}</span></td>
					<td class="mytip-leslist-td5">
						<button type="button" class="mytip-leslist-btn"
							onclick="deleteLesson(${leslist.lesson_num})">강의삭제</button>
					</td>
				</tr>

			</c:forEach>
		</table>
	</div>
	<br>
	<br>
	<br>

	<!-- 신고하기 모달창  -->
	<div class="modal1" id="modal1Singo">
		<div class="modal1-window">

			<div class="modal1-content1" id="modal1-content2-singo">

				<div id="modal1-title-singo">
					<h3>신고 하기</h3>
				</div>

				<div class="text_container_singo">

					<span class="rev_span">수강자에게 문제가 있었나요?</span><br> <span
						class="rev_span"> 신고를 통해 보다 나은 꿀집 환경을 만들어 주세요! </span>

				</div>

				<form action="tiperReportLessonNum" method="post">

					<div id="user_singo1">
						<textarea placeholder="신고내용을 입력해주세요!" id="singo_input1"
							name="report_cont"></textarea>
						<span id="singo_span_ps">*허위 신고시 처벌의 대상이 될 수 있습니다.</span> <input
							type="hidden" name="report_lesson_num" id="lessonNum_singo">
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

	<script>
   
       const modal1 = document.querySelector('.modal1');
       const modal1Singo = document.querySelector('#modal1Singo');
       const btnFilemodal1 = document.querySelector('.filemodal1');
       const btnmodal1Close = document.querySelector('#btn_close');
       const btnSubmitSingo = document.querySelector('#btn_submit_singo');
       const btnmodal1CloseSingo = document.querySelector('#btn_close_singo');
       
      
          //신고창 강의 번호 주기 함수
          function hsh2(val1, val2) {
        	  console.log(val1 + val2 + "이것이 val1과 val2");
             modal1Singo.style.display='block';
               document.body.style.overflow = 'hidden';
                 document.getElementById("lessonNum_singo").value = val1;
                 document.getElementById("userID_singo").value = val2;
         }
          
     
       // 신고창 닫기
       btnmodal1CloseSingo.addEventListener('click', () => {
    	   modal1Singo.style.display='none';
           });
       
       function deleteLesson(lessonNum) {
    	    if (confirm("정말로 강의를 삭제하시겠습니까?")) {
    	      // 확인 버튼을 클릭한 경우에만 삭제 동작을 수행
    	      location.href = 'lessonDelete?lesson_num=' + lessonNum;
    	    }
    	  }
       // 신고버튼 누르면 색깔 변경
     const $myImage = $(".filemodal1_singo");
const originalSrc = $myImage.attr("src"); // 원래 이미지의 src 저장

$myImage.on("mouseover", function() {
  $(this).attr("src", "front/siren_click.png"); // 이미지 위에 마우스를 올리면 이미지 변경
  $(this).css("width", "30px"); // 이미지 크기를 20x20으로 변경
  $(this).css("height", "30px");
});

$myImage.on("mouseout", function() {
  $(this).attr("src", originalSrc); // 마우스를 이미지 밖으로 빼면 원래 이미지로 돌아감
});
    </script>
	<%@include file="../main/footer.jsp"%>
</body>
</html>