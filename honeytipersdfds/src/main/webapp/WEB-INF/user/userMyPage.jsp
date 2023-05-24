<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.ggul.zip.user.UserVO"%>
<%@page import="com.ggul.zip.tiper.TiperVO"%>
<%@ page import="java.util.Date"%>
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
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script> -->
<title>꿀TIPer - 마이페이지</title>
<%@include file="../main/header.jsp"%>
<link href="${pageContext.request.contextPath}/front/userMyPage.css" rel="stylesheet">
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
								<button type="button" id="btn_unreg" onclick="location.href='withdrawalCheck'">회원탈퇴</button>
							</div>
						</div>

						<div id="container0_grid002">
							<div id="container0_cont3">
								<div class="container0_cont3_text">
									<div id="container0_cont3_text1">
										<div class="grid002_title">허니페이</div>
										<span class="grid002_text"><fmt:formatNumber value="${info[0].user_point}" groupingUsed="true" /></span> <span>허니페이</span>
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
									
										<span class="grid002_text">TIPer 신청하기 ></span>
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
					<h4>전수 요청한 꿀TIP</h4>
					<c:if test="${empty potentialLessonList}"><div id="pt_if_undefined"><span>전수 요청한 꿀TIP이 없어요</span></div></c:if>
					
					<c:forEach items="${potentialLessonList}" var="potentialLesson">
						<div class="mytab_tr">

							<div id="cont1_img_title">
								<div class="mytab_1">
									<img onerror="this.src='${pageContext.request.contextPath}/front/default.png'" alt="꿀TIP이미지" src="${pageContext.request.contextPath}/front/lesson/${potentialLesson.lesson_img}" id="tip_img1" onclick='location.href="getLessonDetail?lesson_num=${potentialLesson.lesson_num}"' style="cursor: pointer">
								</div>


								<div class="mytab_23" onclick='location.href="getLessonDetail?lesson_num=${potentialLesson.lesson_num}"' style="cursor: pointer">
									<div class="mytab_2">${potentialLesson.lesson_user_name}TIPer의</div>
									<div class="mytab_3">
										<h5>${potentialLesson.lesson_title}</h5>
									</div>
								</div>
							</div>

							<div class="pt_cont1_btn_wrapper">
								<div class="pt_mytab_4">
									<button type="button" class="pt_btn_del"
										onclick="location.href='deleteEscrowLesson?escrow_lesson_num=${potentialLesson.escrow_lesson_num}'">전수받지않기</button>
								</div>

								<div class="pt_mytab_5">
<%-- 									<button type="button" class="pt_btn_msg" value="${potentialLesson.lesson_num}" onclick="hsh(${potentialLesson.lesson_num}, '<%=user_id1%>')">쪽지</button> --%>
										<button title="메세지 보내기" type="button" id="msg_button" onclick="open_popup(this)"><i class='fa fa-paper-plane-o' aria-hidden='true'></i></button>
										<span style="display: none"; class="cont1-group-title" id="cont1-group-text">@${potentialLesson.tiper_user_id}</span>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>

			<div class="container1" id="div_tab1">
				<div id="cont1_table">
					<h4>전수받고 있는 꿀TIP</h4>
					<c:if test="${empty lessonList}"><div id="if_undefined"><span>전수받는 꿀TIP이 없어요</span></div></c:if>
					
					<c:forEach items="${lessonList}" var="lesson">
						<div class="mytab_tr">

							<div id="cont1_img_title">
								<div class="mytab_1">
									<img onerror="this.src='${pageContext.request.contextPath}/front/default.png'" alt="꿀TIP 이미지" src="${pageContext.request.contextPath}/front/lesson/${lesson.lesson_img}" onclick='location.href="getLessonDetail?lesson_num=${lesson.lesson_num}"' style="cursor: pointer" id="tip_img1">
								</div>


								<div class="mytab_23" onclick='location.href="getLessonDetail?lesson_num=${lesson.lesson_num}"' style="cursor: pointer">
									<div class="mytab_2">${lesson.lesson_user_name}TIPer의</div>
									<div class="mytab_3">
										<h5>${lesson.lesson_title}</h5>
									</div>
								</div>
							</div>

<!-- 							//** 230520수정 : 날짜 포맷을 완료내역과 통일하였습니다. (성현) -->
							<div class="mytab_6"><fmt:formatDate value="${lesson.escrow_start}" pattern = "yyyy. M. d"/>~</div>

							<div class="cont1_btn_wrapper">
								<div id="mytab_4">
									<button type="button" id="btn_complete" class="filemodal1" value="${lesson.lesson_num}" onclick="hsh(${lesson.lesson_num}, '<%=user_id1%>')">전수완료</button>
								</div>

								<div class="mytab_5">
									<c:if test="${lesson.escrow_report_status eq 0}">
									<img onerror="this.src='${pageContext.request.contextPath}/front/default.png'" src="front/siren.png" alt="신고" onclick="hsh2(${lesson.lesson_num}, '<%=user_id1%>')" class="myimg_singo2">
									</c:if>
									
									<c:if test="${lesson.escrow_report_status eq 1}">
									<img onerror="this.src='${pageContext.request.contextPath}/front/default.png'" src="front/siren_click.png" alt="신고" onclick="alert('\uD83D\uDE33이미 신고한 꿀TIP이에요!');" class="myimg_singo_red2">
									</c:if>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>

			<div class="container2" id="div_tab2">
				<div id="cont2_table">
					<h4>지금까지 전수받은 꿀TIP</h4>
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

<!-- 							<div id="sugar_img_container"> -->
<!-- 								<div id="sugar_img_box"> -->
<%-- 									<img onerror="this.src='${pageContext.request.contextPath}/front/default.png'" src="${pageContext.request.contextPath}/front/honeycomb.png" alt="이미지 경로를 설정해주세요!"> X5 --%>
<!-- 									<input type="radio" name="review_sugar" value="5" /> -->
<!-- 								</div> -->

<!-- 								<div id="sugar_img_box"> -->
<%-- 									<img onerror="this.src='${pageContext.request.contextPath}/front/default.png'" src="${pageContext.request.contextPath}/front/honeycomb.png" alt="이미지 경로를 설정해주세요!"> X4 --%>
<!-- 									<input type="radio" name="review_sugar" value="4" /> -->
<!-- 								</div> -->

<!-- 								<div id="sugar_img_box"> -->
<%-- 									<img onerror="this.src='${pageContext.request.contextPath}/front/default.png'" src="${pageContext.request.contextPath}/front/honeycomb.png" alt="이미지 경로를 설정해주세요!"> X3 --%>
<!-- 									<input type="radio" name="review_sugar" value="3" /> -->
<!-- 								</div> -->

<!-- 								<div id="sugar_img_box"> -->
<%-- 									<img onerror="this.src='${pageContext.request.contextPath}/front/default.png'" src="${pageContext.request.contextPath}/front/honeycomb.png" alt="이미지 경로를 설정해주세요!"> X2 --%>
<!-- 									<input type="radio" name="review_sugar" value="2" /> -->
<!-- 								</div> -->

<!-- 								<div id="sugar_img_box"> -->
<%-- 									<img onerror="this.src='${pageContext.request.contextPath}/front/default.png'" src="${pageContext.request.contextPath}/front/honeycomb.png" alt="이미지 경로를 설정해주세요!"> X1 --%>
<!-- 									<input type="radio" name="review_sugar" value="1" /> -->
<!-- 								</div> -->
<!-- 							</div> -->
							<div id="sugar_img_container">
  <div id="sugar_img_box">
    <img onerror="this.src='${pageContext.request.contextPath}/front/default.png'" src="${pageContext.request.contextPath}/front/honeycomb.png" alt="이미지 경로를 설정해주세요!"> X5
    <input type="radio" name="review_sugar" value="5" onchange="animateWaterDrop(this)" />
    <img class="honey_drop" src="${pageContext.request.contextPath}/front/honey_drop.png" alt="꿀방울 이미지">
  </div>

  <div id="sugar_img_box">
    <img onerror="this.src='${pageContext.request.contextPath}/front/default.png'" src="${pageContext.request.contextPath}/front/honeycomb.png" alt="이미지 경로를 설정해주세요!"> X4
    <input type="radio" name="review_sugar" value="4" onchange="animateWaterDrop(this)" />
    <img class="honey_drop" src="${pageContext.request.contextPath}/front/honey_drop.png" alt="꿀방울 이미지">
  </div>

  <div id="sugar_img_box">
    <img onerror="this.src='${pageContext.request.contextPath}/front/default.png'" src="${pageContext.request.contextPath}/front/honeycomb.png" alt="이미지 경로를 설정해주세요!"> X3
    <input type="radio" name="review_sugar" value="3" onchange="animateWaterDrop(this)" />
    <img class="honey_drop" src="${pageContext.request.contextPath}/front/honey_drop.png" alt="꿀방울 이미지">
  </div>

  <div id="sugar_img_box">
    <img onerror="this.src='${pageContext.request.contextPath}/front/default.png'" src="${pageContext.request.contextPath}/front/honeycomb.png" alt="이미지 경로를 설정해주세요!"> X2
    <input type="radio" name="review_sugar" value="2" onchange="animateWaterDrop(this)" />
    <img class="honey_drop" src="${pageContext.request.contextPath}/front/honey_drop.png" alt="꿀방울 이미지">
  </div>

  <div id="sugar_img_box">
    <img onerror="this.src='${pageContext.request.contextPath}/front/default.png'" src="${pageContext.request.contextPath}/front/honeycomb.png" alt="이미지 경로를 설정해주세요!"> X1
    <input type="radio" name="review_sugar" value="1" onchange="animateWaterDrop(this)" />
    <img class="honey_drop" src="${pageContext.request.contextPath}/front/honey_drop.png" alt="꿀방울 이미지">
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

							<span class="rev_span">꿀TIP에 문제가 있었나요?</span><br>
							<span class="rev_span"> 신고를 통해 보다 나은 꿀TIP 환경을 만들어 주세요! </span> 

						</div>

							<form action="reportLessonNum" method="post">

							<div id="user_singo1">
								<textarea placeholder="신고내용을 입력해주세요!" id="singo_input1" name="report_cont"></textarea> 
								<span id="singo_span_ps">*허위 신고시 처벌의 대상이 될 수 있습니다.</span>
									<input type="hidden" name="report_lesson_num" id="lessonNum_singo"> 
									<input type="hidden" name="report_user_id" id="userID_singo">
									<input type="hidden" name="escrow_user_id" id="escrow_userID_singo">
									<input type="hidden" name="escrow_lesson_num" id="escrow_lesson_num_singo">
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
                 document.getElementById("escrow_lesson_num_singo").value = val1;
                 document.getElementById("userID_singo").value = val2;
                 document.getElementById("escrow_userID_singo").value = val2;
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
       
       
       function animateWaterDrop(radio) {
    	    if (radio.checked) {
    	      var sugarImgBox = radio.parentNode;
    	      var honeyDrop = sugarImgBox.querySelector(".honey_drop");
    	      honeyDrop.style.display = "block";
    	      honeyDrop.style.animation = "waterdrop 1s ease-in-out";
    	      honeyDrop.addEventListener("animationend", function () {
    	        honeyDrop.style.display = "none";
    	      });
    	    }
    	  }
    </script>
<script>

var totalData; //총 데이터 수
var dataPerPage=5; //한 페이지에 나타낼 글 수
var pageCount = 5; //한 번에 나타낼 페이지 수 ([이전] 1 2 3 4 5 [다음])
var globalCurrentPage= 1; //현재 페이지
var dataList;
 
window.onload= function(){
	
	$.ajax({
		url : "/myEndClass",
		type : "post",
		cache : false,
		async : false,
		success : function(res){
			const trade_date = new Date(res[0].escrow_start).toLocaleString();
// 			console.log('trade_date' , trade_date.substring(0, trade_date.lastIndexOf('.')));
			 //totalData(총 데이터 수) 구하기
		 	 totalData = res.length;
			 dataList = res;
			 
			 console.log(dataList);
		     
		      displayData(1, dataPerPage);
		      paging(totalData, dataPerPage, pageCount, 1);
		},
		error : function(request, status){
			alert('오류 발생');
		}
		
	});

//      //totalData(총 데이터 수) 구하기
// 	 dataList = ${completedListJSON};		
     
//      //totalData(총 데이터 수) 구하기
// 	 totalData = dataList.length;
     
//      displayData(1, dataPerPage);
//      paging(totalData, dataPerPage, pageCount, 1);
};
 
//현재 페이지(currentPage)와 페이지당 글 개수(dataPerPage) 반영
function displayData(currentPage, dataPerPage) {
console.log('dataList: displayData에서 ',dataList);
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
		 if(dataList[i].escrow_report_status == 0){
// 			 var end = dataList[i].escrow_end.replace('월','');
			 let trade_date = new Date(dataList[i].escrow_start).toLocaleString();
			 var start = trade_date.substring(0, trade_date.lastIndexOf('.'));
			 trade_date = new Date(dataList[i].escrow_end).toLocaleString();
			 var end = trade_date.substring(0, trade_date.lastIndexOf('.'));
			 
			 console.log('start: '+start+', end: '+end);


			
			 
			 chartHtml +=
				  '<div class="mytab_tr"><div class="cont2_img_title"><div class="mytab_1"><img alt="TIPer이미지"src="${pageContext.request.contextPath}/front/lesson/'
				  + dataList[i].lesson_img +'" id="tip_img1" onclick="location.href=\'getLessonDetail?lesson_num='+dataList[i].lesson_num +'\'" style="cursor: pointer"></div>'+
				  '<div class="mytab_23" onclick="location.href=\'getLessonDetail?lesson_num='+dataList[i].lesson_num +'\'" style="cursor: pointer"><div class="mytab_2">' + dataList[i].lesson_user_name + 'TIPer의</div><div class="mytab_3"><h5>'+
				  dataList[i].lesson_title + '</h5></div></div></div><div class="mytab_6">'+
				  start+'~'+end+'</div><div class="cont1_btn_wrapper">'+
			'<div class="mytab_5"><img src="${pageContext.request.contextPath}/front/siren.png" alt="신고" onclick="hsh2('+
			  dataList[i].lesson_num +', \''+ dataList[i].escrow_user_id +'\')" class="myimg_singo"></div></div></div>';
			 }  else {
				  
				 chartHtml +=
					  '<div class="mytab_tr"><div class="cont2_img_title"><div class="mytab_1"><img alt="TIPer이미지"src="${pageContext.request.contextPath}/front/lesson/'
					  + dataList[i].lesson_img +'" id="tip_img1" onclick="location.href=\'getLessonDetail?lesson_num='+dataList[i].lesson_num +'\'" style="cursor: pointer"></div>'+
					  '<div class="mytab_23" onclick="location.href=\'getLessonDetail?lesson_num='+dataList[i].lesson_num +'\'" style="cursor: pointer"><div class="mytab_2">' + dataList[i].lesson_user_name + 'TIPer의</div><div class="mytab_3"><h5>'+
					  dataList[i].lesson_title + '</h5></div></div></div><div class="mytab_6">'+
					  start+'~'+end+'</div><div class="cont1_btn_wrapper">'+
				'<div class="mytab_5"><img src="${pageContext.request.contextPath}/front/siren.png" alt="신고" onclick="hsh2('+
				  dataList[i].lesson_num +', \''+ dataList[i].escrow_user_id +'\')" class="myimg_singo"></div></div></div>';
					 } 
		 
		 } 
 }else{ 
  
  for (
    var i = (currentPage - 1) * dataPerPage;
    i < (currentPage - 1) * dataPerPage + dataPerPage;
    i++
  ) {
if(dataList[i].escrow_report_status == 0){
		  
	 let trade_date = new Date(dataList[i].escrow_start).toLocaleString();
	 var start = trade_date.substring(0, trade_date.lastIndexOf('.'));
	 trade_date = new Date(dataList[i].escrow_end).toLocaleString();
	 var end = trade_date.substring(0, trade_date.lastIndexOf('.'));
	 
	 console.log('start: '+start+', end: '+end);
	
	
	
		  chartHtml +=
			  '<div class="mytab_tr"><div class="cont2_img_title"><div class="mytab_1"><img alt="TIPer이미지"src="${pageContext.request.contextPath}/front/lesson/'
			  + dataList[i].lesson_img +'" id="tip_img1" onclick="location.href=\'getLessonDetail?lesson_num='+dataList[i].lesson_num +'\'" style="cursor: pointer"></div>'+
			  '<div class="mytab_23" onclick="location.href=\'getLessonDetail?lesson_num='+dataList[i].lesson_num +'\'" style="cursor: pointer"><div class="mytab_2">' + dataList[i].lesson_user_name + 'TIPer의</div><div class="mytab_3"><h5>'+
			  dataList[i].lesson_title + '</h5></div></div></div><div class="mytab_6">'+
			  start+'~'+end+'</div><div class="cont1_btn_wrapper">'+
		'<div class="mytab_5"><img src="${pageContext.request.contextPath}/front/siren.png" alt="신고" onclick="hsh2('+
		  dataList[i].lesson_num +', \''+ dataList[i].escrow_user_id +'\')" class="myimg_singo"></div></div></div>';
			 }  else {
				  
				  chartHtml +=
					  '<div class="mytab_tr"><div class="cont2_img_title"><div class="mytab_1"><img alt="TIPer이미지"src="${pageContext.request.contextPath}/front/lesson/'
					  + dataList[i].lesson_img +'" id="tip_img1" onclick="location.href=\'getLessonDetail?lesson_num='+dataList[i].lesson_num +'\'" style="cursor: pointer"></div>'+
					  '<div class="mytab_23" onclick="location.href=\'getLessonDetail?lesson_num='+dataList[i].lesson_num +'\'" style="cursor: pointer"><div class="mytab_2">' + dataList[i].lesson_user_name + 'TIPer의</div><div class="mytab_3"><h5>'+
					  dataList[i].lesson_title + '</h5></div></div></div><div class="mytab_6">'+
					  start+'~'+end+'</div><div class="cont1_btn_wrapper">'+
				'<div class="mytab_5"><img src="${pageContext.request.contextPath}/front/siren_click.png" alt="신고" onclick="alert(\'\uD83D\uDE33이미 신고한 꿀TIP이에요!\');" class="myimg_singo_red"></div></div></div>';
					 }  //dataList는 임의의 데이터임.. 각 소스에 맞게 변수를 넣어주면 됨...
}
 } 
 if( typeof chartHtml == "undefined" || chartHtml == ''){ chartHtml +=" <div id='if_undefined_completed'><span>지금까지 전수받은 꿀TIP이 없어요<span></div>"}

 
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