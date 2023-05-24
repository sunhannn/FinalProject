<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.ggul.zip.lesson.LessonVO"%>

<%
LessonVO vo = (LessonVO) request.getAttribute("lesson");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>꿀TIPer - 꿀TIP 수정</title>

<!-- <link rel="stylesheet" href="front/common.css"> -->
<!-- <link rel="stylesheet" href="front/bootstrap.css"> -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.js"></script>
<link href="${pageContext.request.contextPath}/front/tiperLessonUpdate.css" rel="stylesheet">
</head>
<body>
	<%@include file="../main/header.jsp"%>
	<div class="container" id="lesup-sub-div">
		<p id="lesup_sub1">TIPer 꿀TIP 수정하기</p>
		<hr>
	</div>
	<div class="container" id="lesup-tab-div">
		<form action="lessonUpdateAction?lessonNum=<%=vo.getLesson_num()%>"
			method="post" id="lesup_form">
			<table id="lesup_tab1">
				<tr id="lesup_tr3">
					<td id="lesup_td5" colspan="2"><input type="file"
						placeholder="수정할 사진" name="lesson_img" accept=".jpg,.jpeg,.png"
						id="lesup_img" onchange="previewImage(event);"
						value="<%=vo.getLesson_img()%>" style="display: none;"> <br>
						<label for="lesup_img" id="lesup_preview_label"> <img onerror="this.src='${pageContext.request.contextPath}/front/default.png'" 
							src="front/lesson/<%=vo.getLesson_img()%>" alt="꿀TIP 사진"
							id="lesup_preview" onmouseover="changeCursor(this)"
							title="이미지를 클릭해서 사진을 선택해주세요!"></label></td>
				</tr>
				<tr id="lesup_tr1">
					<td id="lesup_td1"><span class="lesup_span">수정할 꿀TIP명</span><br></td>
					<td id="lesup_td2"><input type="text"
						value="<%=vo.getLesson_title()%>" name="lesson_title"
						id="lesup_input1"></td>
				</tr>

				<tr id="lesup_tr2">

					<td id="lesup_td3"><span class="lesup_span">수정할 꿀TIP명</span>
					<td id="lesup_td4"><textarea name="lesson_info"
							id="lesup_info1" cols="30" rows="10"><%=vo.getLesson_info()%></textarea></td>

				</tr>


			</table>
			<br> <br>
			<div id="lesup_div3">
				<button type="submit" id="lesup_btn1">수정완료</button>
				<button type="button" id="lesup_btn2" onclick='history.back();'>뒤로가기</button>
			</div>
		</form>

	</div>

	<br>
	<br>
	<br>

	<script type="text/javascript">
		function hsh(fparam) {

			console.log($('#lesup_img input[type=file]'), fparam);

			let formData = new FormData();
			formData.append('tiper_img', fparam);
			$.ajax({
				url : "/uploadLesson",
				type : "post",
				data : formData,
				contentType : false,
				processData : false,
				cache : false,
				success : function() {
					console.log('success');
				},
				error : function() {
					alert('\uD83E\uDD15error');
				}
			});
		}

		function selectProfileImage() {
			document.getElementById('tipimg').click();
		}

		function previewImage(event) {
			var reader = new FileReader();
			reader.onload = function() {
				var output = document.getElementById('lesup_preview');
				output.src = reader.result;
			}
			reader.readAsDataURL(event.target.files[0]);
			// 파일 선택 후 input 요소 숨기기
			var input = document.getElementById('lesup_img');
			input.style.display = 'none';
			hsh(event.target.files[0]);
		}

		function onLessonUpSubmit(event) {
			// form submit 이벤트를 중지합니다.
			event.preventDefault();

			// 확인(confirm) 창을 띄웁니다.
			if (confirm("꿀TIP을 수정할까요?")) {
				// 확인 버튼을 클릭한 경우 form을 submit합니다.
				event.target.submit();
			} else {
				// 취소 버튼을 클릭한 경우 아무런 작업을 하지 않습니다.
				return false;
			}
		}

		// 마우스를 올리면 pointer로 바뀌는 함수
		function changeCursor(img) {
			img.style.cursor = "pointer";
		}

		// form 요소를 선택합니다.
		const form = document.querySelector("#lesup_form");

		// form submit 이벤트를 처리하는 함수를 등록합니다.
		form.addEventListener("submit", onLessonUpSubmit);

		// img 요소를 클릭했을 때 파일 선택 창 활성화
		document.getElementById('tiperpreview-label').addEventListener('click',
				selectProfileImage);
	</script>
	<%@include file="../main/footer.jsp"%>


</body>
</html>