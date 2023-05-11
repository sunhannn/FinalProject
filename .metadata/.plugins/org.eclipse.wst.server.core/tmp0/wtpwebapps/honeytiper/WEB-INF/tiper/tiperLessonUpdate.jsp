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
		font-size: 29px;
		background-color: #FFD400;
		border-radius: 10%;
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
		width: 200px;
		height: 200px;
	}
	#lesup_imgg {
		width: 200px;
		height: 200px;
	}
	#lesup_td5 {
		font-size: 20px;
	}
	#lesup_td6 {
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
		color: white;
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
		font-size: 22px;
		text-decoration-line: underline;
		text-decoration-color: #FFD400;
		text-decoration-line: underline;
	}
}

@media ( min-width : 769px) {
	#lesup_sub1 {
		font-size: 40px;
		background-color: #FFD400;
		border-radius: 10%;
		font-weight: bold;
	}
	#lesup_tab1 {
		width: 100%;
	}
	#lesup_td1 {
		font-size: 20px;
		height: 80px;
		vertical-align: top;
		width: 45%;
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
		width: 300px;
		height: 300px;
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
		color: white;
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
		text-decoration-line: underline;
		text-decoration-color: #FFD400;
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
			method="post">
			<table id="lesup_tab1">

				<tr id="lesup_tr1">
					<td id="lesup_td1"><span class="lesup_span">원래 강의 제목</span> :
						<%=vo.getLesson_title()%> <br></td>
					<td id="lesup_td2"><input type="text" placeholder="수정할 강의 제목"
						name="lesson_title" id="lesup_input1"></td>
				</tr>

				<tr id="lesup_tr2">

					<td id="lesup_td3"><span class="lesup_span">원래 강의 내용</span> :
						<%=vo.getLesson_info()%>
					<td id="lesup_td4"><textarea name="lesson_info"
							id="lesup_info1" cols="30" rows="10" placeholder="수정할 강의 내용"></textarea></td>


				</tr>
				<tr id="lesup_tr3">
					<td id="lesup_td5"><span class="lesup_span">원래 이미지 :</span> <img
						src="front/<%=vo.getLesson_img()%>" alt="강의 사진" id="lesup_imgg">
					</td>

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
	$(() => {
		   $("#lesup_img input[type=file]").change(function(){
		      console.log($('#lesup_img input[type=file]')[0].files);
		      
		      let formData = new FormData();
		      formData.append('tiper_img', $('#lesup_img input[type=file]')[0].files[0]);
		      $.ajax({
		         url : "/upload",
		         type : "post",
		         data : formData,
		         contentType: false,
		         processData: false,
		         cache : false,
		         success : function(sin_img1){
		            console.log('success');
		         },
		         error : function(){
		            alert('error');
		         }
		      });
		   });
		});
	
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
		
	}
	
	
	
	
	
	</script>





	<%@include file="../main/footer.jsp"%>

</body>
</html>