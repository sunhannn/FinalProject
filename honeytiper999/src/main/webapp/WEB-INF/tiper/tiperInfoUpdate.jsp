<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.ggul.zip.user.UserVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>강사 정보 수정</title>

<link rel="stylesheet" href="front/common.css">
<link rel="stylesheet" href="front/bootstrap.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.js"></script>
<style type="text/css">
body {
	padding: 0;
	margin: 0 auto;
}

@media ( max-width : 768px) {
	#tipup_sub1 {
		font-size: 27px;
		background-color: #FFD400;
		border: 0;
		border-radius: 10%;
		font-weight: bolder;
	}
	#tipup_sub2 {
		font-size: 22px;
		text-decoration-line: underline;
		text-decoration-color: #FFD400;
	}
	#tipup_tab1 {
		width: 100%;
	}
	#tipup_td1 {
		width: 200px;
	}
	#tipup_td2 {
		
	}
	#tipup_info1{
	border: 0;
	width: 100%;
	
	}
	
	#tipup_info1:focus {
		border: 3px solid #FFD400;
		outline: none;
	}
	#tipup_sub3 {
		font-size: 22px;
		text-decoration-line: underline;
		text-decoration-color: #FFD400;
	}
	#tipup_tab2 {
		width: 100%;
	}
	#tipup_tr2 {
		height: 100px;
		border-bottom: 2px solid #d8dee5;
	}
	#tipup_td4 {
		font-size: 19px;
		text-decoration-line: underline;
		text-decoration-color: #FFD400;
	}
	#tipup_btn1 {
		background-color: #FFD400;
		border-radius: 10%;
		border: 0;
		width: 120px;
		height: 30px;
	}
	#tipup_btn_div1 {
		text-align: center;
	}
	#tipup_btn2 {
		background-color: #FFD400;
		border-radius: 10%;
		border: 0;
		width: 120px;
		height: 30px;
	}
	#tiperpreview {
		width: 180px;
		height: 180px;
		border-radius: 10%;
	}
}

@media ( min-width : 769px) {
	#tipup_sub1 {
		font-size: 40px;
		background-color: #FFD400;
		border: 0;
		border-radius: 10%;
		font-weight: bolder;
	}
	#tipup_sub2 {
		font-size: 30px;
		text-decoration-line: underline;
		text-decoration-color: #FFD400;
	}
	#tipup_tab1 {
		width: 100%;
	}
	#tipup_td1 {
		width: 200px;
	}
	#tipup_td2 {
		text-align: center;
	}
	#tipup_info1:focus {
		border: 3px solid #FFD400;
		outline: none;
	}
	#tipup_info1 {
		width: 450px;
	}
	#tipup_sub3 {
		font-size: 22px;
		text-decoration-line: underline;
		text-decoration-color: #FFD400;
	}
	#tipup_tab2 {
		width: 100%;
	}
	#tipup_tr2 {
		height: 100px;
		border-bottom: 2px solid #d8dee5;
	}
	#tipup_td4 {
		font-size: 19px;
		text-decoration-line: underline;
		text-decoration-color: #FFD400;
	}
	#tipup_td5 {
		text-align: center;
	}
	#tipup_btn1 {
		background-color: #FFD400;
		border-radius: 10%;
		border: 0;
		width: 180px;
		height: 50px;
	}
	#tipup_btn_div1 {
		text-align: center;
	}
	#tipup_btn2 {
		background-color: #FFD400;
		border-radius: 10%;
		border: 0;
		width: 200px;
		height: 55px;
	}
	#tiperpreview {
		width: 240px;
		height: 240px;
		border-radius: 10%;
	}
}
</style>
</head>
<body>
	<div class="container">
		<span id="tipup_sub1">TIPer 정보 수정</span>
		<hr>

	</div>
	<form action="tiperUpdateAction" method="post">
		<div class="container">
			<span id="tipup_sub2">프로필 수정</span>
			<table id="tipup_tab1">

				<tr id="tipup_tr1">
					<td id="tipup_td1"><input type="file" name="tiper_img"
						placeholder="강사에 대한 img 수정" accept=".jpg,.jpeg,.png" id="tipimg"
						onchange="previewImage(event)"> <img id="tiperpreview"
						src="#" alt="강의사진을 올려주세요"></td>

					<td id="tipup_td2"><textarea name="tiper_info"
							placeholder="TIPer소개를 수정해 주세요 (경력, 수상내역, 취득자격증,등등..)"
							id="tipup_info1" cols="30" rows="10"></textarea></td>
				</tr>


			</table>
			<hr>
		</div>
		<div class="container">
			<span id="tipup_sub3">강의 목록 보기</span> <br> <br>
			<table id="tipup_tab2">
				<c:forEach items="${lessonTiper}" var="lesson">
					<tr id="tipup_tr2">
						<td id="tipup_td4">${lesson.lesson_title }</td>
						<td id="tipup_td5"><button type="button" id="tipup_btn1"
								onclick="location.href='lessonUpdateGo?lesson_num=${lesson.lesson_num}'">강의수정하기</button></td>


					</tr>
				</c:forEach>

			</table>
			<br> <br>
			<div id="tipup_btn_div1">
				<button type="submit" id="tipup_btn2">수정완료</button>
			</div>
		</div>

	</form>
	<script type="text/javascript">


	$(() => {
		   $("#tipimg input[type=file]").change(function(){
		      console.log($('#tipimg input[type=file]')[0].files);
		      
		      let formData = new FormData();
		      formData.append('tiper_img', $('#tipimg input[type=file]')[0].files[0]);
		      $.ajax({
		         url : "/upload",
		         type : "post",
		         data : formData,
		         contentType: false,
		         processData: false,
		         cache : false,
		         success : function(){
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
			var output = document.getElementById('tiperpreview');
			output.src = reader.result;
		}
		reader.readAsDataURL(event.target.files[0]);
		// 파일 선택 후 input 요소 숨기기
		var input = document.getElementById('tipimg');
		input.style.display = 'none';
		
	}
	
	
	
</script>
</body>
</html>