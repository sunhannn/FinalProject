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
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>강의 등록</title>
<!-- <link rel="stylesheet" href="front/common.css"> -->
<!-- <link rel="stylesheet" href="front/bootstrap.css"> -->
<style type="text/css">
@media ( max-width : 768px) {
	#lesmake_sub1 {
		font-size: 24px;
		font-weight: bold;
	}
	#lesmake_tab {
		width: 100%;
	}
	#lesmake_img {
		width: 150px;
	}
	#lesmake_preview {
		width: 200px;
		height: 200px;
		border-radius: 10px;
	}
	.lesmake_tr {
		height: 60px;
	}
	#lesmake_info {
		border: 0;
		vertical-align: middle;
		width: 200px;
		height: 200px;
		resize: none;
	}
	#lesmake_info:focus {
		border: 3px solid #FFD400;
		outline: none;
		border-radius: 10px;
	}
	#lesmake_title {
		width: 200px;
		height: 35px;
		border: 0;
	}
	#lesmake_title:focus {
		border: 3px solid #FFD400;
		outline: none;
		border-radius: 10px;
	}
	.lesmake_td1 {
		font-size: 15px;
		vertical-align: top;
		width: 150px;
		font-weight: bold;
	}
	.lesmake_td2 {
		vertical-align: top;
	}
	#lesmake_cate {
		height: 40px;
		border: 0;
		width: 200px;
		border: 0;
	}
	#lesmake_cate:focus {
		border: 3px solid #FFD400;
		outline: none;
		border-radius: 10px;
	}
	#lesmake_btn1 {
		background-color: #FFD400;
		border-radius: 10px;
		border: 0;
		width: 120px;
		height: 45px;
		font-weight: bold;
	}
	#lesmake_div2 {
		text-align: center;
	}
	input[type=file]::file-selector-button {
		width: 150px;
		height: 30px;
		background: #FFD400;
		border: 0;
		border-radius: 10px;
		cursor: pointer;
		font-weight: bold;
	}
	#lesmake_divimg2 {
		text-align: center;
	}
}

@media ( min-width : 769px) {
	#lesmake_sub1 {
		font-size: 27px;
		font-weight: bold;
	}
	#lesmake_tab {
		width: 100%;
	}
	#lesmake_imgdiv {
		width: 600px;
		height: 350px;
	}
	#lesmake_img {
		width: 150px;
	}
	#lesmake_preview {
		width: 200px;
		height: 200px;
		border-radius: 10%;
	}
	.lesmake_tr {
		height: 60px;
	}
	#lesmake_info {
		border: 0;
		vertical-align: middle;
		width: 300px;
		height: 300px;
		resize: none;
	}
	#lesmake_info:focus {
		border: 3px solid #FFD400;
		outline: none;
		border-radius: 10px;
	}
	#lesmake_title {
		width: 300px;
		height: 45px;
		border: 0;
	}
	#lesmake_title:focus {
		border: 3px solid #FFD400;
		outline: none;
		border-radius: 10px;
	}
	.lesmake_td1 {
		font-size: 20px;
		width: 200px;
	}
	.lesmake_td2 {
		width: 500px;
		text-align: center;
	}
	#lesmake_cate {
		height: 40px;
		border: 0;
		width: 300px;
		margin-left: 20px;
	}
	#lesmake_cate:focus {
		border: 3px solid #FFD400;
		outline: none;
		border-radius: 10px;
	}
	#lesmake_btn1 {
		background-color: #FFD400;
		border-radius: 10px;
		border: 0;
		width: 200px;
		height: 55px;
		color: white;
	}
	#lesmake_div2 {
		text-align: center;
	}
	input[type=file]::file-selector-button {
		width: 150px;
		height: 30px;
		background: #FFD400;
		border: 0;
		border-radius: 10px;
		cursor: pointer;
		color: white;
	}
	#lesmake_divimg2 {
		text-align: center;
	}
}
</style>
</head>
<body>
	<%@include file="../main/header.jsp"%>

	<br>
	<br>
	<div class="container">
		<span id="lesmake_sub1">TIPer 강의 등록</span> <br>
		<hr>
	</div>
	<div class="container">


		<form action="lessonMakeAction" id="lesmake_form">
			<div id="lesmake_imgdiv">
				<div id="lesmake_divimg1">
					<input type="file" accept=".jpg,.jpeg,.png" name="lesson_img"
						id="lesmake_img" onchange="previewImage(event)"
						required="required" style="display: none;">
				</div>
				<div id="lesmake_divimg2">
					<label for="lesmake_img" id="lesmake-label"> <img
						id="lesmake_preview" src="front/lessonimg.png" alt="강의사진을 올려주세요"
						onmouseover="changeCursor(this)" title="이미지를 클릭해서 사진을 선택해주세요!"></label>
				</div>
				<br> <br>
			</div>
			<table id="lesmake_tab1">
				<tr class="lesmake_tr">
					<td class="lesmake_td1">강의 제목</td>
					<td class="lesmake_td2"><input type="text" name="lesson_title"
						placeholder="강의제목을 입력해주세요" id="lesmake_title" required="required"></td>
				</tr>

				<tr class="lesmake_tr">
					<td class="lesmake_td1">강의 내용</td>
					<td class="lesmake_td2"><textarea name="lesson_info"
							id="lesmake_info" cols="30" rows="10" placeholder="강의내용을 입력해주세요"
							required="required"></textarea></td>
				</tr>
				<tr class="lesmake_tr">
					<td class="lesmake_td1">카테 고리</td>
					<td class="lesmake_td2"><select name="lesson_cate"
						id="lesmake_cate" required="required">
							<option selected disabled hidden>강의 카테고리 선택</option>
							<option value="<%=tiperVO.getTiper_cate1()%>"><%=tiperVO.getTiper_cate1()%></option>
							<option style="<%=style1%>" value="<%=tiperVO.getTiper_cate2()%>"><%=tiperVO.getTiper_cate2()%></option>
							<option style="<%=style2%>" value="<%=tiperVO.getTiper_cate3()%>"><%=tiperVO.getTiper_cate3()%></option>

					</select></td>

				</tr>

			</table>
			<br> <br> <br>
			<div id="lesmake_div2">
				<button type="submit" id="lesmake_btn1">강의등록하기</button>
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
				url : "/upload",
				type : "post",
				data : formData,
				contentType : false,
				processData : false,
				cache : false,
				success : function() {
					console.log('success');
				},
				error : function() {
					alert('error');
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
			// form submit 이벤트를 중지합니다.
			event.preventDefault();
			console.log("작동");
			// 확인(confirm) 창을 띄웁니다.
			if (confirm("강의를 정말 등록할까요?")) {
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