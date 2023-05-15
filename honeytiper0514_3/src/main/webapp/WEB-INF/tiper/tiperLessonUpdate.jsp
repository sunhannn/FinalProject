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
		font-size: 24px;
		font-weight: bold;
	}
	#lesup_tab1 {
		width: 100%;
	}
	#lesup_td1 {
		width: 300px;
		font-size: 18px;
		height: 70px;
	}
	#lesup_td3 {
		width: 300px;
		font-size: 18px;
	}
	#lesup_td5 {
		width: 300px;
		tex
	}
	#lesup_input1 {
		width: 300px;
		height: 40px;
		margin-left: 2px;
		border: 0;
	}
	#lesup_input1:focus {
		border: 3px solid #FFD400;
		outline: none;
		border-radius: 10px;
	}
	#lesup_tr2 {
		height: 70px;
	}
	#lesup_tr3 {
		font-size: 19px;
		height: 70px;
	}
	#lesup_info1 {
		margin-left: 2px;
		width: 300px;
		border: 0;
		resize: none;
	}
	#lesup_info1:focus {
		border: 3px solid #FFD400;
		outline: none;
		border-radius: 10px;
	}
	#lesup_img1 {
		width: 100px;
		height: 100px;
	}
	#lesup_imgg {
		width: 200px;
		height: 200px;
	}
	#lesup_td5 {
		font-size: 20px;
	}
	#lesup_td6 {
		text-align: left;
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
	input[type=file]::file-selector-button {
		width: 150px;
		height: 30px;
		background: #FFD400;
		border: 0;
		border-radius: 10px;
		cursor: pointer;
		color: white;
	}
	.lesup_span {
		font-size: 18px;
	}
}

@media ( min-width : 769px) {
	#lesup_sub1 {
		font-size: 27px;
		font-weight: bold;
	}
	#lesup_tab1 {
		width: 100%;
	}
	#lesup_td1 {
		font-size: 20px;
		height: 80px;
		vertical-align: top;
		width: 300px;
	}
	#lesup_td2 {
		vertical-align: top;
	}
	#lesup_input1 {
		width: 450px;
		height: 50px;
		margin-left: 2px;
		border: 0;
	}
	#lesup_input1:focus {
		border: 3px solid #FFD400;
		outline: none;
		border-radius: 10px;
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
		border: 0;
	}
	#lesup_info1:focus {
		border: 3px solid #FFD400;
		outline: none;
		border-radius: 10px;
	}
	#lesup_img1 {
		width: 200px;
		height: 200px;
		border-radius: 10px;
	}
	#lesup_imgg {
		width: 300px;
		height: 300px;
		border-radius: 10px;
	}
	#lesup_td3 {
		font-size: 20px;
		vertical-align: top;
	}
	#lesup_td5 {
		font-size: 20px;
		height: 300px;
		vertical-align: top;
	}
	#lesup_td6 {
		vertical-align: top;
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
	input[type=file]::file-selector-button {
		width: 150px;
		height: 30px;
		background: #FFD400;
		border: 0;
		border-radius: 10px;
		cursor: pointer;
		font-weight: bold;
	}
}
</style>


</head>
<body>
	<%@include file="../main/header.jsp"%>
	<div class="container">
		<span id="lesup_sub1">TIPer 강의 수정하기</span> <br>
		<hr>
	</div>
	<div class="container">
		<form action="lessonUpdateAction?lessonNum=<%=vo.getLesson_num()%>"
			method="post" id="lesup_form">
			<table id="lesup_tab1">

				<tr id="lesup_tr1">
					<td id="lesup_td1"><span class="lesup_span">수정할 강의 제목</span> :<br></td>
					<td id="lesup_td2"><input type="text"
						placeholder="<%=vo.getLesson_title()%>" name="lesson_title"
						id="lesup_input1"></td>
				</tr>

				<tr id="lesup_tr2">

					<td id="lesup_td3"><span class="lesup_span">수정할 강의 내용</span> :


					
					<td id="lesup_td4"><textarea name="lesson_info"
							id="lesup_info1" cols="30" rows="10"
							placeholder="<%=vo.getLesson_info()%>"></textarea></td>


				</tr>
				<tr id="lesup_tr3">
					<td id="lesup_td5"><span class="lesup_span">수정할 이미지 :</span></td>

					<td id="lesup_td6"><input type="file" placeholder="수정할 사진"
						name="lesson_img" accept=".jpg,.jpeg,.png" id="lesup_img"
						onchange="previewImage(event);"> <img
						src="front/lessonimg.png" alt="강의 사진" id="lesup_img1"></td>
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

		function previewImage(event) {
			var reader = new FileReader();
			reader.onload = function() {
				var output = document.getElementById('lesup_img1');
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

		// form 요소를 선택합니다.
		const form = document.querySelector("#lesup_form");

		// form submit 이벤트를 처리하는 함수를 등록합니다.
		form.addEventListener("submit", onLessonUpSubmit);
	</script>





	<%@include file="../main/footer.jsp"%>

</body>
</html>