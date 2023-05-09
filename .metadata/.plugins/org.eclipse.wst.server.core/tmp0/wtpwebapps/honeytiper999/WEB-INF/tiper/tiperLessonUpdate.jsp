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

<link rel="stylesheet" href="front/common.css">
<link rel="stylesheet" href="front/bootstrap.css">
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
		font-size: 24px;
		height: 70px;
		text-decoration-line: underline;
		text-decoration-color: #FFD400;
	}
	#lesup_input1 {
		width: 300px;
		height: 40px;
		margin-left: 2px;
	}
	#lesup_input1:focus {
		border: 3px solid #FFD400;
		outline: none;
	}
	#lesup_tr2 {
		height: 70px;
	}
	#lesup_tr3 {
		font-size: 24px;
		height: 70px;
		text-decoration-line: underline;
		text-decoration-color: #FFD400;
	}
	#lesup_info1 {
		margin-left: 2px;
		width: 350px;
	}
	#lesup_info1:focus {
		border: 3px solid #FFD400;
		outline: none;
	}
	#lesup_img1 {
		width: 200px;
		height: 200px;
	}
	#lesup_tr5 {
		height: 300px;
	}
	#lesup_td5 {
		font-size: 24px;
	}
	#lesup_tr6 {
		height: 70px;
	}
	#lesup_div3 {
		text-align: center;
	}
	#lesup_btn1 {
		background-color: #FFD400;
		border: 0;
		border-radius: 10%;
		width: 200px;
		height: 40px;
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
		font-size: 30px;
		height: 80px;
		text-decoration-line: underline;
		text-decoration-color: #FFD400;
	}
	#lesup_input1 {
		width: 400px;
		height: 50px;
		margin-left: 2px;
	}
	#lesup_input1:focus {
		border: 3px solid #FFD400;
		outline: none;
	}
	#lesup_tr2 {
		height: 70px;
	}
	#lesup_tr3 {
		font-size: 30px;
		height: 80px;
		text-decoration-line: underline;
		text-decoration-color: #FFD400;
	}
	#lesup_info1 {
		margin-left: 2px;
		width: 450px;
	}
	#lesup_info1:focus {
		border: 3px solid #FFD400;
		outline: none;
	}
	#lesup_img1 {
		width: 300px;
		height: 300px;
	}
	#lesup_tr5 {
		height: 400px;
	}
	#lesup_td5 {
		font-size: 24px;
	}
	#lesup_tr6 {
		height: 70px;
	}
	#lesup_div3 {
		text-align: center;
	}
	#lesup_btn1 {
		background-color: #FFD400;
		border: 0;
		border-radius: 10%;
		width: 200px;
		height: 40px;
	}
}
</style>


</head>
<body>

	<div class="container">
		<span id="lesup_sub1">TIPer 강의 수정하기</span> <br>
		<hr>
	</div>
	<div class="container">
		<form action="lessonUpdateAction?lessonNum=<%=vo.getLesson_num()%>"
			method="post">
			<table id="lesup_tab1">

				<tr id="lesup_tr1">
					<td id="lesup_td1">원래 강의 제목 : <%=vo.getLesson_title()%> <br>
					</td>
				</tr>

				<tr id="lesup_tr2">
					<td id="lesup_td2"><input type="text" placeholder="수정할 강의 제목"
						name="lesson_title" id="lesup_input1"></td>
				</tr>
				<tr id="lesup_tr3">
					<td id="lesup_td3">원래 강의 내용 : <%=vo.getLesson_info()%>

					</td>
				</tr>
				<tr id="lesup_tr4">
					<td id="lesup_td4"><textarea name="lesson_info"
							id="lesup_info1" cols="30" rows="10" placeholder="수정할 강의 내용"></textarea></td>

				</tr>


				<tr id="lesup_tr5">
					<td id="lesup_td5">원래 이미지 : <img
						src="front/<%=vo.getLesson_img()%>" alt="강의 사진" id="lesup_img1">
					</td>
				</tr>
				<tr id="lesup_tr6">
					<td><input type="file" placeholder="수정할 사진" name="lesson_img"
						accept=".jpg,.jpeg,.png" id="lesup_img"></td>
				</tr>
			</table>
			<br> <br>
			<div id="lesup_div3">
				<button type="submit" id="lesup_btn1">수정완료</button>
			</div>
		</form>

	</div>



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
	
	
	
	
	
	
	
	</script>







</body>
</html>