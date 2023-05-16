<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.ggul.zip.lesson.LessonVO"%>

<%
LessonVO vo = (LessonVO) request.getAttribute("lesson");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>tiper 강의수정</title>

<!-- <link rel="stylesheet" href="front/common.css"> -->
<!-- <link rel="stylesheet" href="front/bootstrap.css"> -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.js"></script>
<style type="text/css">
@media ( max-width : 768px) {
	#lesup_sub1 {
		font-size: 22px;
		font-weight: bold;
	}
	#lesup_tab1 {
		width: 100%;
		margin: 0 auto;
	}
	#lesup_td1 {
		font-size: 14px;
		height: 70px;
		background-color: #efefef;
		border-bottom: 8px solid white;
		text-align: center;
		vertical-align: middle;
		border-radius: 2px;
	}
	#lesup_td2 {
		text-align: right;
	}
	#lesup_td3 {
		font-size: 14px;
		vertical-align: middle;
		text-align: center;
		background-color: #efefef;
		border-radius: 2px;
	}
	#lesup_td5 {
		text-align: center;
		vertical-align: top;
	}
	#lesup_input1 {
		width: 200px;
		height: 40px;
		margin-left: 2px;
		border: 2px solid #efefef;
		border-radius: 2px;
	}
	#lesup_input1:focus {
		border: 3px solid #FFD400;
		outline: none;
		border-radius: 2px;
	}
	#lesup_tr2 {
		height: 70px;
	}
	#lesup_tr3 {
		height: 70px;
	}
	#lesup_info1 {
		margin-left: 2px;
		width: 200px;
		border: 2px solid #efefef;
		resize: none;
		border-radius: 2px;
	}
	#lesup_info1:focus {
		border: 3px solid #FFD400;
		outline: none;
		border-radius: 2px;
	}
	#lesup_preview {
		width: 100px;
		height: 100px;
	}
	#lesup_td5 {
		vertical-align: top;
		height: 150px;
	}
	#lesup_td4 {
		text-align: right;
	}
	#lesup_div3 {
		text-align: center;
	}
	#lesup_btn1 {
		background-color: #FFD400;
		border: 0;
		border-radius: 2px;
		width: 200px;
		height: 40px;
		font-weight: bold;
	}
	.lesup_span {
		font-size: 16px;
	}
}

@media ( min-width : 769px) {
	#lesup_sub1 {
		font-size: 27px;
		font-weight: bold;
		margin: 40px 0;
	}
	#lesup_tab1 {
		width: 100%;
		margin: 0 auto;
	}
	#lesup_td1 {
		font-size: 18px;
		height: 70px;
		vertical-align: middle;
		width: 200px;
		background-color: #efefef;
		border-bottom: 10px solid white;
		text-align: center;
	}
	#lesup_td2 {
		vertical-align: center;
		text-align: center;
	}
	#lesup_input1 {
		width: 450px;
		height: 45px;
		margin-left: 2px;
		border: 0;
		border: 2px solid #efefef;
		border-radius: 2px;
	}
	#lesup_input1:focus {
		border: 3px solid #FFD400;
		outline: none;
		border-radius: 2px;
	}
	#lesup_tr2 {
		height: 70px;
	}
	#lesup_tr3 {
		font-size: 20px;
		height: 80px;
	}
	#lesup_info1 {
		margin-left: 2px;
		width: 450px;
		resize: none;
		border: 2px solid #efefef;
		border-radius: 2px;
		height: 250px;
	}
	#lesup_info1:focus {
		border: 3px solid #FFD400;
		outline: none;
		border-radius: 2px;
	}
	#lesup_preview {
		width: 200px;
		height: 200px;
		border-radius: 2px;
	}
	#lesup_td3 {
		font-size: 18px;
		vertical-align: middle;
		background-color: #efefef;
		border-bottom: 10px solid white;
		height: 300px;
		width: 200px;
		text-align: center;
	}
	#lesup_td4 {
		text-align: center;
	}
	#lesup_td5 {
		font-size: 18px;
		height: 250px;
		vertical-align: middle;
		text-align: center;
	}
	#lesup_td6 {
		vertical-align: center;
		text-align: center;
	}
	#lesup_div3 {
		text-align: center;
	}
	#lesup_btn1 {
		background-color: #FFD400;
		border: 0;
		border-radius: 10px;
		width: 200px;
		height: 40px;
		font-weight: bold;
	}
	#lesup_img {
		width: 200px;
	}
	#lesmake_imgdiv {
		margin: 0 auto;
	}
	#lesup-sub-div {
		margin: 0 auto;
		width: 768px;
	}
	#lesup-tab-div {
		width: 768px;
	}
}
</style>


</head>
<body>
	<%@include file="../main/header.jsp"%>
	<div class="container" id="lesup-sub-div">
		<p id="lesup_sub1">TIPer 강의 수정하기</p>
		<hr>
	</div>
	<div class="container" id="lesup-tab-div">
		<form action="lessonUpdateAction?lessonNum=<%=vo.getLesson_num()%>"
			method="post" id="lesup_form">
			<table id="lesup_tab1">
				<tr id="lesup_tr3">
					<td id="lesup_td5" colspan="2"><input type="file"
						placeholder="수정할 사진" name="lesson_img" accept=".jpg,.jpeg,.png"
						id="lesup_img" onchange="previewImage(event);" required="required"
						style="display: none;"> <br> <label for="lesup_img"
						id="lesup_preview_label"> <img src="front/lessonimg.png"
							alt="강의 사진" id="lesup_preview" onmouseover="changeCursor(this)"
							title="이미지를 클릭해서 사진을 선택해주세요!"></label></td>
				</tr>
				<tr id="lesup_tr1">
					<td id="lesup_td1"><span class="lesup_span">수정할 강의 제목</span><br></td>
					<td id="lesup_td2"><input type="text"
						placeholder="<%=vo.getLesson_title()%>" name="lesson_title"
						id="lesup_input1" required="required"></td>
				</tr>

				<tr id="lesup_tr2">

					<td id="lesup_td3"><span class="lesup_span">수정할 강의 내용</span>
					<td id="lesup_td4"><textarea name="lesson_info"
							id="lesup_info1" cols="30" rows="10"
							placeholder="<%=vo.getLesson_info()%>" required="required"></textarea></td>

				</tr>


			</table>
			<br> <br>
			<div id="lesup_div3">
				<button type="submit" id="lesup_btn1">수정완료</button>
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
			if (confirm("강의를 수정할까요?")) {
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