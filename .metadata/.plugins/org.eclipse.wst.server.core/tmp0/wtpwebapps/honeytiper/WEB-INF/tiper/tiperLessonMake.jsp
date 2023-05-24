<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.ggul.zip.tiper.TiperVO"%>
<%
TiperVO tiperVO = (TiperVO) request.getAttribute("tiperGo");

boolean cateCheck1 = true;
boolean cateCheck2 = true;
String style1 = null;
String style2 = null;

if (tiperVO.getTiper_cate2() == null) {
	cateCheck1 = false;
	if (tiperVO.getTiper_cate3() == null) {
		cateCheck2 = false;
	}
}
if (cateCheck1 == false) {

	style1 = "display: none;";

}

if (cateCheck2 == false) {

	style2 = "display: none;";

}
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>꿀TIPer - 꿀TIP 등록</title>
<!-- <link rel="stylesheet" href="front/common.css"> -->
<!-- <link rel="stylesheet" href="front/bootstrap.css"> -->
<link href="${pageContext.request.contextPath}/front/tiperLessonMake.css" rel="stylesheet">
</head>
<body>
	<%@include file="../main/header.jsp"%>

	<br>
	<br>
	<div class="container" id="lesmake-div1">
		<span id="lesmake_sub1">TIPer 꿀TIP 등록</span> <br>
		<hr>
	</div>
	<div class="container" id="lesmake-div2">


		<form action="lessonMakeAction" id="lesmake_form">
			<div id="lesmake_imgdiv">
				<input type="file" accept=".jpg,.jpeg,.png" name="lesson_img"
					id="lesmake_img" onchange="previewImage(event)"
					style="display: none;"> <label for="lesmake_img"
					id="lesmake-label"> <img onerror="this.src='${pageContext.request.contextPath}/front/default.png'" id="lesmake_preview"
					src="front/lessonimg.png" alt="꿀TIP 사진을 올려주세요"
					onmouseover="changeCursor(this)" title="이미지를 클릭해서 사진을 선택해주세요!"></label>
				<br> <br>
			</div>
			<table id="lesmake_tab1">
				<tr class="lesmake_tr" id="lesmake-tr1">
					<td class="lesmake_td1">꿀TIP명</td>
					<td class="lesmake_td2"><input type="text" name="lesson_title"
						placeholder="꿀TIP명을 입력해주세요" id="lesmake_title" required="required"></td>
				</tr>

				<tr class="lesmake_tr" id="lesmake-tr2">
					<td class="lesmake_td1">꿀TIP 내용</td>
					<td class="lesmake_td2"><textarea name="lesson_info"
							id="lesmake_info" cols="30" rows="10" placeholder="꿀TIP 내용을 입력해주세요"
							required="required"></textarea></td>
				</tr>
				<tr class="lesmake_tr" id="lesmake-tr3">
					<td class="lesmake_td1">카테 고리</td>
					<td class="lesmake_td2" id="lesmake-catetd"><select
						name="lesson_cate" id="lesmake_cate" required="required">
							<option selected disabled hidden>꿀TIP 카테고리 선택</option>
							<option value="<%=tiperVO.getTiper_cate1()%>"><%=tiperVO.getTiper_cate1()%></option>
							<option style="<%=style1%>" value="<%=tiperVO.getTiper_cate2()%>"><%=tiperVO.getTiper_cate2()%></option>
							<option style="<%=style2%>" value="<%=tiperVO.getTiper_cate3()%>"><%=tiperVO.getTiper_cate3()%></option>

					</select></td>

				</tr>

			</table>
			<br> <br> <br>
			<div id="lesmake_div2">
				<button type="submit" id="lesmake_btn1">꿀TIP 등록하기</button>
			</div>
		</form>

	</div>
	<br>
	<script type="text/javascript">
		function hsh(fparam) {

			console.log($('#lesmake_img input[type=file]'), fparam);

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
			document.getElementById('sin_img1').click();
		}

		function previewImage(event) {
			var reader = new FileReader();
			reader.onload = function() {
				var output = document.getElementById('lesmake_preview');
				output.src = reader.result;
			}
			reader.readAsDataURL(event.target.files[0]);
			// 파일 선택 후 input 요소 숨기기
			var input = document.getElementById('lesmake_img');
			input.style.display = 'none';
			hsh(event.target.files[0]);
		}

		function onLessonMakeSubmit(event) {
			// 이미지를 선택하지 않았을 때 경고(alert) 표시
			var imgInput = document.getElementById('lesmake_img');
			if (imgInput.files.length === 0) {
				event.preventDefault(); // submit 이벤트 중지
				alert('\uD83D\uDE0E이미지를 선택해주세요.');
				return;
			}

			// 확인(confirm) 창을 띄웁니다.
			if (confirm('꿀TIP을 정말 등록할까요?')) {
				// 확인 버튼을 클릭한 경우 form을 submit합니다.
				event.target.submit();
			} else {
				// 취소 버튼을 클릭한 경우 아무 작업도 하지 않습니다.
				return false;
			}
		}
		// 마우스를 올리면 pointer로 바뀌는 함수
		function changeCursor(img) {
			img.style.cursor = "pointer";
		}
		// form 요소를 선택합니다.
		const form = document.querySelector("#lesmake_form");

		// form submit 이벤트를 처리하는 함수를 등록합니다.
		form.addEventListener("submit", onLessonMakeSubmit);

		// img 요소를 클릭했을 때 파일 선택 창 활성화
		document.getElementById('tiperpreview-label').addEventListener('click',
				selectProfileImage);
	</script>


	<%@include file="../main/footer.jsp"%>
</body>
</html>