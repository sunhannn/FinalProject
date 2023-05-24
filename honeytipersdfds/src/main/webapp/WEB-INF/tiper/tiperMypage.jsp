<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.ggul.zip.tiper.TiperVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	mobcate2 = ", " + tiperVO.getTiper_cate2();
}

if (tiperVO.getTiper_cate3() == null) {
	cate3 = "";
	mobcate3 = "";

} else {
	cate3 = tiperVO.getTiper_cate3();
	mobcate3 = ", " + tiperVO.getTiper_cate3();

}
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>꿀TIPer - TIPer 마이페이지</title>
<!-- <link rel="stylesheet" href="front/common.css"> -->
<!-- <link rel="stylesheet" href="front/bootstrap.css"> -->
<link href="${pageContext.request.contextPath}/front/tiperMypage.css" rel="stylesheet">
</head>
<body>
	<%@include file="../main/header.jsp"%>
	<!-- 모바일 프로필 부분 -->
	<div class="container" id="mob_profile_div">
		<span id="mob_sub1">TIPer 마이페이지</span> <br> <br>
		<div id="mob-tab-div">
			<table id="mob-tab">
				<tr id="mob-pro-tr1">
					<td id="mob-pro-td1" rowspan="2"><img onerror="this.src='${pageContext.request.contextPath}/front/default.png'" alt="프로필"
						src="front/profile/<%=tiperVO.getTiper_img()%>" id="mob-pro-img"
						onerror="this.src='front/profile/tiper.png'"></td>
					<td id="mob-pro-td2"><span id="mob-cate-sub">내 카테고리</span> <br>
						<span id="mob-cate-span"><%=tiperVO.getTiper_cate1()%><%=mobcate2%><%=mobcate3%></span></td>
					<td id="mob-pro-td3"><span id="mob-pay-sub">My허니페이<br>
							<br> <span id="mob-point"><fmt:formatNumber
									value="<%=point%>" /></span><span class="mob-point2">&nbsp;허니페이</span>
					</span></td>
				</tr>

				<tr id="mob-pro-tr2">
					<td id="mob-pro-td4"><span id="mob-tiper-sub">TIPer 소개</span> <br>
						<pre id="mob-tiper-info"><%=tiperVO.getTiper_info()%></pre></td>
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
			id="mytip_btn3">꿀TIP 등록하기</button>

	</div>



	<!-- 웹페이지 프로필 부분 -->
	<div class="container" id="mytip_div1">
		<h4 id="mytip_sub1">TIPer 마이페이지</h4>
		<br> <br>
		<div>
			<table id="mytip_tabpro">
				<tr id="mytip_trpro">
					<td id="mytip_tdpro1"><img onerror="this.src='${pageContext.request.contextPath}/front/default.png'" alt="프로필"
						src="front/profile/<%=tiperVO.getTiper_img()%>" id="mytip_imgpro"></td>

					<td id="mytip_tdpro3"><span id="myip_catesub">내 카테고리</span> <br>
						<br> <span id="mytip_catespan"><%=tiperVO.getTiper_cate1()%>
							<br><%=cate2%><br> <%=cate3%></span></td>
					<td id="mytip_tdpro2"><p id="mytip_point2">
							<span id="mytip_point3">My허니페이<br> <br> <span
								id="mytip_pointspan"><fmt:formatNumber value="<%=point%>" /></span>
								<span class="honey_pay"> 허니페이</span>
							</span><br>
							<button type="button" onclick="location.href='honeyTake'"
								id="mytip_btn2">허니페이 정산하기</button></td>
					</p>

					<td id="mytip_tdpro4"><span id="mytip_infosub">TIPer 소개</span> <br>
						<pre id="mytip_infospan"><%=tiperVO.getTiper_info()%></pre></td>
				</tr>
			</table>
		</div>
		<div id="tipup_div4">
			<button type="button" onclick="location.href='lessonMakeGo'"
				id="mytip_btn3">꿀TIP 등록하기</button>

		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<!-- 공통 작성 부분 -->
	<div class="container">
		<div id="mytip_sub2">
			<span id="mytip_sub3">현재 전수중인 꿀TIP</span><br>
		</div>
		<br>
		<table id="mytip_table1">
			<c:forEach items="${lessonTiper}" var="lesson">
				<tr class="mytip_tr1">
					<c:choose>
						<c:when test="${lesson.escrow_status == 0}">
							<td class="mytip_td1"><span class="consult"
								style="color: #B08C7E;">협의중<span class="tooltip_consult">전수
										거절은<br>관리자에게 문의해주세요!
								</span> <svg xmlns="http://www.w3.org/2000/svg" font-size="16px"
										color="#FFD400" width="16" height="16" fill="currentColor"
										class="bi bi-exclamation-square" viewBox="0 0 16 16">
					  <path
											d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z" />
					  <path
											d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995z" />
					</svg></span></td>
						</c:when>
						<c:otherwise>
							<td class="mytip_td1">전수 날짜<br>${lesson.escrow_start}</td>
						</c:otherwise>
					</c:choose>
					<td class="mytip_td2">
						<div>
							<span class="tip_mypg_cos">${lesson.escrow_user_id}
							</span>님 <button title="메세지 보내기" type="button" id="msg_button" onclick="open_popup(this)"><i class='fa fa-paper-plane-o' aria-hidden='true'></i></button>
										<span style="display: none"; class="cont1-group-title" id="cont1-group-text">@${lesson.escrow_user_id}</span>
						</div>
					</td>
					<td class="mytip_td3"><span>${lesson.lesson_title}</span></td>
					<c:choose>
						<c:when test="${lesson.escrow_status == 0}">
							<td class="mytip_td4"><span class="consult"
								style="color: #B08C7E;">협의중<span class="tooltip_consult">전수
										거절은<br>관리자에게 문의해주세요!
								</span> <svg xmlns="http://www.w3.org/2000/svg" font-size="16px"
										color="#FFD400" width="16" height="16" fill="currentColor"
										class="bi bi-exclamation-square" viewBox="0 0 16 16">
					  <path
											d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z" />
					  <path
											d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995z" />
					</svg></span></td>
						</c:when>
						<c:otherwise>
							<td class="mytip_td4"><span>${lesson.escrow_price}
									허니페이</span></td>
							<c:if test="${lesson.lesson_onoff eq 0 }">
								<td class="mytip_td5"><img onerror="this.src='${pageContext.request.contextPath}/front/default.png'" src="${pageContext.request.contextPath}/front/siren.png" alt="신고"
									class="filemodal1_singo ${lesson.lesson_num}"
									onclick="hsh2(${lesson.lesson_num}, '${lesson.escrow_user_id}')"
									id="mytip_singo"></td>
							</c:if>

							<c:if test="${lesson.lesson_onoff eq 1}">
								<td class="mytip_td5"><img onerror="this.src='${pageContext.request.contextPath}/front/default.png'" src="${pageContext.request.contextPath}/front/siren_click.png"
									alt="신고" class="filemodal1_singo ${lesson.lesson_num}"
									onclick="hsh2(${lesson.lesson_num}, '${lesson.escrow_user_id}')"
									id="mytip_singo"></td>
							</c:if>
						</c:otherwise>
					</c:choose>

					<%-- 					<c:if test="${lesson.lesson_onoff eq 0 }"> --%>
					<!-- 						<td class="mytip_td5"><img src="front/siren.png" alt="신고" -->
					<%-- 							class="filemodal1_singo ${lesson.lesson_num}" --%>
					<%-- 							onclick="hsh2(${lesson.lesson_num}, '${lesson.escrow_user_id}')" --%>
					<!-- 							id="mytip_singo"></td> -->
					<%-- 					</c:if> --%>

					<%-- 					<c:if test="${lesson.lesson_onoff eq 1}"> --%>
					<!-- 						<td class="mytip_td5"><img src="front/siren_click.png" -->
					<%-- 							alt="신고" class="filemodal1_singo ${lesson.lesson_num}" --%>
					<!-- 							id="mytip_singo"></td> -->
					<%-- 					</c:if> --%>

					<!-- 					<td class="mytip_td5"><img src="front/siren.png" alt="신고" -->
					<%-- 						class="filemodal1_singo ${lesson.lesson_num}" --%>
					<%-- 						onclick="hsh2(${lesson.lesson_num}, '${lesson.escrow_user_id}')" --%>
					<!-- 						id="mytip_singo"></td> -->
				</tr>
			</c:forEach>
		</table>
		<br> <br>
	</div>
	<br>
	<div class="container">
		<p id="mytip-leslist-p">
			<span id="mytip-leslist-sub">나의 꿀TIP 목록</span>
		</p>
		<br>
		<table id="mytip-leslist-tab">
			<c:forEach items="${lessonList}" var="leslist">
				<tr class="mytip-leslist-tr">
					<td class="mytip-leslist-td1"><img onerror="this.src='${pageContext.request.contextPath}/front/default.png'" alt="꿀TIP 사진"
						src="front/lesson/${leslist.lesson_img}" class="leslist-img"
						title="${leslist.lesson_title}"
						onclick="location.href='getLessonDetail?lesson_num=${leslist.lesson_num}'"></td>
					<td class="mytip-leslist-td2"><span
						class="mytip-leslist-title">${leslist.lesson_title}</span></td>
					<td class="mytip-leslist-td3"><span class="mytip-leslist-cate">${leslist.lesson_cate}</span></td>
					<td class="mytip-leslist-td4"><span class="mytip-leslist-info"
						title="${leslist.lesson_info}">${leslist.lesson_info}</span></td>
					<td class="mytip-leslist-td5">
						<button type="button" class="mytip-leslist-btn"
							onclick="deleteLesson(${leslist.lesson_num})">삭제</button>
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

					<span class="rev_span">전수받은 회원에게 문제가 있었나요?</span><br> <span
						class="rev_span"> 신고를 통해 보다 나은 꿀TIP 환경을 만들어 주세요! </span>

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
    	   document.body.style.overflow = 'auto';
           });
       
       function deleteLesson(lessonNum) {
    	    if (confirm("정말로 꿀TIP을 삭제하시겠습니까?")) {
    	      // 확인 버튼을 클릭한 경우에만 삭제 동작을 수행
    	      location.href = 'lessonDelete?lesson_num=' + lessonNum;
    	    }
    	  }
       // 신고버튼 누르면 색깔 변경
     const $myImage = $(".filemodal1_singo");
const originalSrc = $myImage.attr("src"); // 원래 이미지의 src 저장

// $myImage.on("mouseover", function() {
//   $(this).attr("src", "front/siren_click.png"); // 이미지 위에 마우스를 올리면 이미지 변경
//   $(this).css("width", "30px"); // 이미지 크기를 20x20으로 변경
//   $(this).css("height", "30px");
// });

// $myImage.on("mouseout", function() {
//   $(this).attr("src", originalSrc); // 마우스를 이미지 밖으로 빼면 원래 이미지로 돌아감
// });

var isMobile = /Android|webOS|iPhone|iPad|iPod|BlackBerry/i.test(navigator.userAgent) ? true : false;
$(document).ready(function(){
// 		var tip_mypg_cos = $('.tip_mypg_cos').text();
	if(isMobile) {
		$('.bi-exclamation-square').attr('font-size','11px');
	}
});
    </script>
	<%@include file="../main/footer.jsp"%>
</body>
</html>