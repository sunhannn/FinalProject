<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.ggul.zip.user.UserVO"%>
<%@page import="com.ggul.zip.tiper.TiperVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


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
<title>마이페이지</title>
<link rel="stylesheet" href="front/common.css">
<!-- <link rel="stylesheet" href="front/bootstrap.css"> -->
<script type="text/javascript" src="front/jquery-3.6.4.js"></script>
<%@include file="../main/header.jsp"%>

<style>
body {
	padding: 0;
	margin: 0 auto;
}

a {
	border-style: none;
}

h3 {
	font-weight: bold;
}

h5 {
	font-weight: bold;
}

hr {
	width: 100vw;
	border: 0px;
	border-top: 3px solid #E9E9E9;
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
	#filemodal1 {
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
	#myimg_singo {
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
		/*       border-bottom: 2px solid #d8dee5; */
		height: 100px;
		width: 80vw;
	}
	#mytab_td {
		/*       border-bottom: 2px solid #d8dee5; */
		height: 100px;
		width: 80vw;
	}
	#my_hr1 {
		height: 2px;
	}
	.modal1 {
		/* 		position: absolute; */
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
		width: 40vw;
		height: 50%;
		padding: 10px;
		text-align: center !important;
		margin: auto;
		margin-top: 20vh;
		border-radius: 10%;
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
		display: inline;
		width: 100%;
		background-color: #FFD400;
		border-radius: 20%;
	}
	.modal1-content1 {
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
	.modal1-content1 img {
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
	.modal1 .modal1-window-singo {
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
	#modal1-title-singo {
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
	#modal1-title-singo h3 {
		padding: 10px;
		margin: 10 !important;
		display: inline;
		width: 100%;
		background-color: #FFD400;
		border-radius: 20%;
	}
	.modal1-content1-singo {
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
}

@media ( min-width : 769px) {
	/*==========================================================*/
	h4 {
		margin-bottom: 40px;
		font-weight: bold;
	}
	.container1 {
		width: 65vw;
		margin: 0 auto;
		margin-top: 100px;
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
	#btn_complete {
		width: 120px;
		height: 33px;
		font-size: 1.3rem;
		background-color: #FFD400;
		border: 0;
		border-radius: 10%;
		display: inline;
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
		width: 30%;
		padding: 0 3%;
		display: flex;
		flex-direction: column;
		align-items: flex-start;
		text-align: left !important;
		margin-bottom: -6px;
	}
	.mytab_2 {
		/*       width: 30%; */
		text-align: left;
	}
	.mytab_3 {
	}
	.cont1_btn_wrapper {
		display: flex;
		align-items: center;
		/* 	    margin: 0 auto; */
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
	#my_hr1 {
		height: 3px;
	}
	#myimg_singo {
		width: 30px;
		height: 30px;
	}
	.container2 {
		width: 65vw;
		margin: 0 auto;
		margin-top: 100px;
	}
	.modal1 {
		position: absolute;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		display: none;
		background: rgba(0, 0, 0, 0.6);
	}
	.modal1 .modal1-window {
		background-color: white;
		position: relative;
		width: 40vw;
		height: 50%;
		padding: 10px;
		margin: auto;
		margin-top: 20vh;
		border-radius: 10%;
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
		display: inline;
		width: 100%;
		background-color: #FFD400;
		border-radius: 20%;
		font-size: 40px;
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
		justify-content: space-around;
	}
	#text_container pre {
		width: 70%;
		text-align: center;
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
		/*       font-size: 27px; */
		font-size: 1.25rem;
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
	#singo_input1 {
		height: 40px;
		width: 70%;
	}
	#pagingul {
		margin: 0 auto;
		border-right: 0;
		padding-left: 0;
	}
	ul li {
		text-align: center;
		float: left;
		list-style: none;
	}
	ul li .a_tag {
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
		margin: 0 auto;
	}
}
</style>
</head>
<body>

	<div id="super_container">
		<div class="container">
			<p id="sub_1">마이페이지</p>
			<p id="sub_3">
				<span id="sub_point"> My허니페이 <%=point%>point
				</span>
			</p>
		</div>
		<br>
		<hr>

		<div class="container1" id="div_tab1">
			<div id="cont1_table">
				<h4>내가 듣고 있는 강의</h4>
				<c:forEach items="${lessonList}" var="lesson">
					<div class="mytab_tr">

						<div id="cont1_img_title">
							<div class="mytab_1">
								<img alt="강사이미지" src="front/${lesson.lesson_img}" id="tip_img1">
							</div>

							<div class="mytab_23">
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
							class="rev_span">꿀TIPer에게 큰 도움이 됩니다.</span> <br> <br> <span
							class="rev_span">도움이 되신 만큼 '당도'를 평가해주세요!</span>

					</div>

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
						<input type="hidden" name="escrow_lesson_num" id="escrowLessonNum">
						<input type="hidden" name="review_writer" id="reviewWriter">
						<input type="hidden" name="escrow_user_id" id="escrowUserId">
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

		<!-- 신고하기 모달창  -->
		<div class="modal1" id="modal1Singo">
			<div class="modal1-window">

				<div class="modal1-content1" id="modal1-content2-singo">

					<div id="modal1-title-singo">
						<h3>신고 하기</h3>
					</div>

					<div class="text_container">

						<span class="rev_span">강의에 문제가 있었나요? 신고를 통해 보다 나은 꿀집 환경을
							만들어 주세요!</span> <br> <span class="rev_span">신고를 통해 보다 나은 꿀집
							환경을 만들어 주세요!</span><br> <br> <span class="rev_span">신고를
							하시기 전에 한번 더 생각 해주세요!</span> <br> <span class="rev_span">허위
							신고를 할 경우</span> <br> <span class="rev_span">그 사람에게 큰 상처가 될 수
							있습니다.</span>

					</div>

					<form action="reportLessonNum" method="post">

						<div id="user_singo1">
							<input type="text" placeholder="신고내용을 입력해주세요!" id="singo_input1"
								name="report_cont"> <input type="hidden"
								name="report_lesson_num" id="lessonNum_singo"> <input
								type="hidden" name="report_user_id" id="userID_singo">
						</div>

						<div id="sugar_button_box">
							<button type="submit" id="btn_submit_singo">신고하기</button>
							<button type="button" id="btn_close_singo">닫기</button>
						</div>
					</form>
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
       });
       // 신고창 닫기
       btnmodal1CloseSingo.addEventListener('click', () => {
    	   modal1Singo.style.display='none';
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
			  '<div class="mytab_tr"><div class="mytab_1"><img alt="강사이미지"src="front/ '
			  + dataList[i].lesson_img +'" id="tip_img1"></div>'+
			  '<div class="mytab_23"><div class="mytab_2">' + dataList[i].lesson_user_name + '강사의</div><div class="mytab_3"><h5>'+
			  dataList[i].lesson_title + '</h5></div></div><div class="mytab_6">'+
			  dataList[i].escrow_start+'~</div><div class="cont1_btn_wrapper">'+
       '<div class="mytab_5"><img src="front/siren.png" alt="신고" class="filemodal1_singo" onclick="hsh2('+
     		  dataList[i].lesson_num +', '+ dataList[i].escrow_user_id +')" id="myimg_singo"></div></div></div>';
			   } 
 }else{ 
  
  for (
    var i = (currentPage - 1) * dataPerPage;
    i < (currentPage - 1) * dataPerPage + dataPerPage;
    i++
  ) {
	   chartHtml +=
			  '<div class="mytab_tr"><div class="mytab_1"><img alt="강사이미지"src="front/ '
			  + dataList[i].lesson_img +'" id="tip_img1"></div>'+
			  '<div class="mytab_23"><div class="mytab_2">' + dataList[i].lesson_user_name + '강사의</div><div class="mytab_3"><h5>'+
			  dataList[i].lesson_title + '</h5></div></div><div class="mytab_6">'+
			  dataList[i].escrow_start+'~</div><div class="cont1_btn_wrapper">'+
       '<div class="mytab_5"><img src="front/siren.png" alt="신고" class="filemodal1_singo" onclick="hsh2('+
     		  dataList[i].lesson_num +', '+ dataList[i].escrow_user_id +')" id="myimg_singo"></div></div></div>';
  } //dataList는 임의의 데이터임.. 각 소스에 맞게 변수를 넣어주면 됨...
  
}

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

</html>