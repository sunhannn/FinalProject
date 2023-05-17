<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.ggul.zip.user.UserVO"%>
<%@page import="com.ggul.zip.tiper.TiperVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<%
TiperVO tiperVO = (TiperVO) request.getAttribute("tiperVO");
%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>강사 정보 수정</title>

<!-- <link rel="stylesheet" href="front/common.css"> -->
<!-- <link rel="stylesheet" href="front/bootstrap.css"> -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.js"></script>
<style type="text/css">
@media ( max-width : 768px) {
	#tipup_sub1 {
		font-size: 23px;
		font-weight: bold;
	}
	#tipup_sub2 {
		font-size: 18px;
		font-weight: bold;
	}
	#tipup_tab1 {
		width: 100%;
	}
	#tipup_td1 {
		width: 50%;
		border-right: 1px solid #d8dee5;
		vertical-align: top;
		text-align: center;
	}
	#tipimg {
		width: 120px;
		margin-left: 30px;
	}
	#tipup_td2 {
		text-align: right;
		width: 50%;
	}
	#tipup_info1 {
		border: 0;
		width: 95%;
		resize: none;
		border: 1px solid #efefef;
		border-radius: 10px;
	}
	#tipup_info1:focus {
		border: 3px solid #FFD400;
		outline: none;
		border-radius: 20px;
	}
	#tipup_sub3 {
		font-size: 18px;
		font-weight: bold;
	}
	#tipup_tab2 {
		width: 100%;
	}
	.tipup_tr2 {
		height: 100px;
		border-bottom: 2px solid #d8dee5;
	}
	.tipup_td4 {
		font-size: 16px;
	}
	.tipup_td5 {
		text-align: right;
	}
	.tipup_btn1 {
		background-color: #FFD400;
		border-radius: 10px;
		border: 0;
		font-size: 12px;
		width: 120px;
		height: 30px;
		font-weight: bold;
		width: 100px;
	}
	#tipup_btn_div1 {
		text-align: center;
	}
	#tipup_btn2 {
		background-color: #FFD400;
		border-radius: 10px;
		border: 0;
		width: 120px;
		height: 30px;
		font-weight: bold;
	}
	#tiperpreview {
		width: 140px;
		height: 140px;
		border-radius: 10%;
	}
	.tipup-lesson-img {
		width: 60px;
		height: 60px;
		border-radius: 10px;
	}
	.tipup_td4 {
		font-size: 12px;
		font-weight: bold;
	}
	.tipup-td6 {
		font-size: 12px;
		font-weight: bold;
	}
	.tipup-img-td {
		width: 75px;
	}
	.tipup-review {
		display: none;
	}
}

@media ( min-width : 769px) {
	.container {
		width: 65%;
	}
	#tipup_sub1 {
		font-size: 27px;
		border: 0;
		font-weight: bolder;
	}
	#tipup_sub2 {
		font-size: 22px;
		font-weight: bold;
	}
	#tipup_tab1 {
		width: 100%;
	}
	#tipimg {
		width: 150px;
	}
	#tipup_td1 {
		text-align: center;
		width: 50%;
		border-right: 2px solid #d8dee5;
	}
	#tipup_td2 {
		text-align: center;
		width: 50%;
	}
	#tipup_info1:focus {
		border: 3px solid #FFD400;
		outline: none;
		border-radius: 20px;
	}
	#tipup_info1 {
		width: 90%;
		border: 0;
		resize: none;
		border: 1px solid #efefef;
		border-radius: 10px;
	}
	#tipup_sub3 {
		font-size: 22px;
		font-weight: bold;
	}
	#tipup_tab2 {
		width: 100%;
	}
	.tipup_tr2 {
		height: 130px;
		border-bottom: 1px solid #d8dee5;
	}
	.tipup_td4 {
		font-size: 15px;
		font-weight: bold;
	}
	.tipup_td5 {
		text-align: right;
	}
	.tipup_btn1 {
		background-color: #FFD400;
		border-radius: 10px;
		border: 0;
		width: 150px;
		height: 50px;
		font-weight: bold;
	}
	#tipup_btn_div1 {
		text-align: center;
	}
	#tipup_btn2 {
		background-color: #FFD400;
		border-radius: 10px;
		border: 0;
		width: 200px;
		height: 50px;
		font-weight: bold;
	}
	#tiperpreview {
		width: 200px;
		height: 200px;
		border-radius: 10%;
	}
	.tipup-lesson-img {
		width: 100px;
		height: 100px;
		border-radius: 10px;
		cursor: pointer;
	}
	.tipup-img-td {
		width: 180px;
	}
	.tipup-td6 {
		font-size: 15px;
		font-weight: bold;
		width: 220px;
	}
	.tipup-review {
		font-size: 15px;
		font-weight: bold;
	}
}
</style>
</head>
<body>
	<%@include file="../main/header.jsp"%>
	<br>
	<br>
	<div class="container">
		<span id="tipup_sub1">TIPer 정보 수정</span>
		<hr>

	</div>
	<form action="tiperUpdateAction" method="post" id="tipup_form">
		<div class="container">
			<span id="tipup_sub2">프로필 수정</span> <br> <br>
			<table id="tipup_tab1">

				<tr id="tipup_tr1">
					<td id="tipup_td1"><input type="file" name="tiper_img"
						id="tipimg" accept=".jpg,.jpeg,.png"
						onchange="previewImage(event)" required="required"
						style="display: none;"> <br> <label for="tipimg"
						id="tiperpreview-label"> <img id="tiperpreview"
							src="front/<%=tiperVO.getTiper_img()%>" alt="프로필사진 없음"
							onmouseover="changeCursor(this)" title="이미지를 클릭해서 사진을 선택해주세요!">
					</label></td>

					<td id="tipup_td2"><textarea name="tiper_info"
							id="tipup_info1" cols="30" rows="10"><%=tiperVO.getTiper_info()%></textarea></td>
				</tr>


			</table>
			<br>
			<div id="tipup_btn_div1">
				<button type="submit" id="tipup_btn2">수정완료</button>
			</div>
			<hr>
		</div>
		<div class="container">
			<span id="tipup_sub3">강의 목록 보기</span> <br> <br>
			<table id="tipup_tab2">
				<c:forEach items="${lessonTiper}" var="lesson">
					<tr class="tipup_tr2">
						<td class="tipup-img-td"><img alt="강의사진 없음"
							src="front/lesson/${lesson.lesson_img}"
							title="${lesson.lesson_title }" class="tipup-lesson-img"
							onclick="location.href='getLessonDetail?lesson_num=${lesson.lesson_num}'"></td>
						<td class="tipup_td4">${lesson.lesson_title }</td>
						<td class="tipup-td6">수강자 수 ${lesson.lesson_onoff}</td>
						<td class="tipup-review">평균 리뷰 평점 : ${lesson.lesson_info }</td>
						<td class="tipup_td5"><button type="button"
								class="tipup_btn1"
								onclick="location.href='lessonUpdateGo?lesson_num=${lesson.lesson_num}'">강의수정하기</button></td>


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
				url : "/uploadProfile",
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
			document.getElementById('tipimg').click();
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
			// form submit 이벤트를 중지합니다.
			event.preventDefault();
			console.log("작동");
			// 확인(confirm) 창을 띄웁니다.
			if (confirm("강사 정보를 정말 수정할까요?")) {
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
		const form = document.querySelector("#tipup_form");

		// form submit 이벤트를 처리하는 함수를 등록합니다.
		form.addEventListener("submit", tiperInfoUpdateSubmit);

		// img 요소를 클릭했을 때 파일 선택 창 활성화
		document.getElementById('tiperpreview-label').addEventListener('click',
				selectProfileImage);
	</script>
	<%@include file="../main/footer.jsp"%>
</body>
</html>