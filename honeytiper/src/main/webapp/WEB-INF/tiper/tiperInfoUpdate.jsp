<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.ggul.zip.user.UserVO"%>
<%@page import="com.ggul.zip.tiper.TiperVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<%
TiperVO tiperVO = (TiperVO) request.getAttribute("tiperVO");
%>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>꿀TIPer - TIPer 정보 관리</title>

<!-- <link rel="stylesheet" href="front/common.css"> -->
<!-- <link rel="stylesheet" href="front/bootstrap.css"> -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.js"></script>
<link href="${pageContext.request.contextPath}/front/tiperInfoUpdate.css" rel="stylesheet">
</head>
<body>
	<%@include file="../main/header.jsp"%>
	<br>
	<br>
	<div class="container">
		<span id="tipup_sub1">TIPer 정보 관리</span>
		<hr>

	</div>
	<form action="tiperUpdateAction" method="post" id="tipup_form">
		<div class="container">
			<span id="tipup_sub2">프로필 수정</span> <br> <br>
			<table id="tipup_tab1">

				<tr id="tipup_tr1">
					<td id="tipup_td1"><input type="file" name="tiper_img"
						id="tipimg" accept=".jpg,.jpeg,.png"
						onchange="previewImage(event)" value="<%=tiperVO.getTiper_img()%>"
						style="display: none;"> <br> <label for="tipimg"
						id="tiperpreview-label"> <img onerror="this.src='${pageContext.request.contextPath}/front/default.png'" id="tiperpreview"
							src="front/profile/<%=tiperVO.getTiper_img()%>" alt="프로필사진 없음"
							onmouseover="changeCursor(this)" title="이미지를 클릭해서 사진을 선택해주세요!">
					</label></td>

					<td id="tipup_td2"><textarea name="tiper_info"
							id="tipup_info1" cols="30" rows="10"><%=tiperVO.getTiper_info()%></textarea></td>
				</tr>


			</table>
			<br>
			<div id="tipup_btn_div1">
				<button type="submit" id="tipup_btn2">수정하기</button>
			</div>
			<hr>
		</div>
		<div class="container">
			<span id="tipup_sub3">꿀TIP 목록</span> <br> <br>
			<table id="tipup_tab2">
				<c:forEach items="${lessonTiper}" var="lesson">
					<tr class="tipup_tr2">
						<td class="tipup-img-td"><img onerror="this.src='${pageContext.request.contextPath}/front/default.png'" alt="꿀TIP사진 없음"
							src="front/lesson/${lesson.lesson_img}"
							title="${lesson.lesson_title }" class="tipup-lesson-img"
							onclick="location.href='getLessonDetail?lesson_num=${lesson.lesson_num}'"></td>
						<td class="tipup_td4">${lesson.lesson_title }</td>
						<td class="tipup-td6">현재 전수자 ${lesson.lesson_onoff} 명</td>
						<td class="tipup-review">
							<button type="button" class="tipup-delete-btn"
								onclick="deleteLesson(${lesson.lesson_num})">삭제</button>
						</td>
						<td class="tipup_td5"><button type="button"
								class="tipup_btn1"
								onclick="location.href='lessonUpdateGo?lesson_num=${lesson.lesson_num}'">수정</button></td>


					</tr>
				</c:forEach>

			</table>
			<br> <br>

		</div>
		<br> <br> <br>
	</form>
<script type="text/javascript">
   function hsh(fparam) {
      console.log($('#tipimg input[type=file]'), fparam);

      let formData = new FormData();
      formData.append('tiper_img', fparam);
      $.ajax({
         url: "/uploadProfile",
         type: "post",
         data: formData,
         contentType: false,
         processData: false,
         cache: false,
         success: function() {
            console.log('success');
         },
         error: function() {
            alert('\uD83E\uDD15error');
         }
      });
   }

   function selectProfileImage() {
      // 클릭 이벤트 트리거를 제거했습니다.
   }

   function previewImage(event) {
      var reader = new FileReader();
      reader.onload = function() {
         var output = document.getElementById('tiperpreview');
         output.src = reader.result;
      }
      reader.readAsDataURL(event.target.files[0]);
      // 파일 선택 후 input 요소 숨기기
      var input = document.getElementById('tipimg');
      input.style.display = 'none';
      hsh(event.target.files[0]);
   }

   function tiperInfoUpdateSubmit(event) {
      // 이미지를 선택하지 않았을 때 경고(alert) 표시
      var imgInput = document.getElementById('sin_img1');
      if (imgInput.files.length === 0) {
         event.preventDefault(); // submit 이벤트 중지
         alert('\uD83D\uDE0E이미지를 선택해주세요.');
         return;
      }

      // 확인(confirm) 창을 띄웁니다.
      if (confirm('이대로 TIPer 신청을 하시겠습니까?')) {
         // 확인 버튼을 클릭한 경우 form을 submit합니다.
         event.target.submit();
      } else {
         // 취소 버튼을 클릭한 경우 아무 작업도 하지 않습니다.
         return false;
      }
   }

   function deleteLesson(lessonNum) {
      if (confirm("정말로 꿀TIP을 삭제하시겠습니까?")) {
         // 확인 버튼을 클릭한 경우에만 삭제 동작을 수행
         location.href = 'lessonDelete?lesson_num=' + lessonNum;
      }
   }

   // 마우스를 올리면 pointer로 바뀌는 함수
   function changeCursor(img) {
      img.style.cursor = "pointer";
   }
   // form 요소를 선택합니다.
   const form = document.querySelector("#tipup_form");

   // form submit 이벤트를 처리하는 함수를 등록합니다.
   form.addEventListener("submit", tiperInfoUpdateSubmit);

   // selectProfileImage()에 대한 클릭 이벤트 리스너를 제거했습니다.
</script>
	<%@include file="../main/footer.jsp"%>
</body>
</html>