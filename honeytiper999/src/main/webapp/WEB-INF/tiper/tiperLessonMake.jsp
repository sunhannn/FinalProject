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
<link rel="stylesheet" href="front/common.css">
<link rel="stylesheet" href="front/bootstrap.css">
<style type="text/css">
@media ( max-width : 768px) {
	#lesmake_sub1 {
		font-size: 30px;
		background-color: #FFD400;
		border-radius: 10%;
	}
	#lesmake_tab {
		width: 100%;
	}
	#lesmake_imgdiv {
		width: 500px;
		height: 350px;
	}
	#lesmake_img {
		width: 150px;
	}
	#preview {
		width: 300px;
		height: 300px;
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
	}
	#lesmake_info:focus {
		border: 3px solid #FFD400;
		outline: none;
	}
	#lesmake_title {
		width: 300px;
		height: 35px;
		border: 0;
	}
	#lesmake_title:focus {
		border: 3px solid #FFD400;
		outline: none;
	}
	.lesmake_td1 {
		font-size: 20px;
		text-decoration: underline;
		text-decoration-color: #FFD400;
		width: 150px;
	}
	#lesmake_cate {
		height: 40px;
		border: 0;
		width: 200px;
		margin-left: 20px;
	}
	#lesmake_btn1 {
		background-color: #FFD400;
		border-radius: 10%;
		border: 0;
		width: 200px;
		height: 55px;
	}
	#lesmake_div2 {
		text-align: center;
	}
}

@media ( min-width : 769px) {
	#lesmake_sub1 {
		font-size: 30px;
		background-color: #FFD400;
		border-radius: 10%;
	}
	#lesmake_tab {
		width: 100%;
	}
	#lesmake_imgdiv {
		width: 500px;
		height: 350px;
	}
	#lesmake_img {
		width: 150px;
	}
	#preview {
		width: 300px;
		height: 300px;
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
	}
	#lesmake_info:focus {
		border: 3px solid #FFD400;
		outline: none;
	}
	#lesmake_title {
		width: 300px;
		height: 35px;
		border: 0;
	}
	#lesmake_title:focus {
		border: 3px solid #FFD400;
		outline: none;
	}
	.lesmake_td1 {
		font-size: 20px;
		text-decoration: underline;
		text-decoration-color: #FFD400;
		width: 150px;
	}
	#lesmake_cate {
		height: 40px;
		border: 0;
		width: 200px;
		margin-left: 20px;
	}
	#lesmake_btn1 {
		background-color: #FFD400;
		border-radius: 10%;
		border: 0;
		width: 200px;
		height: 55px;
	}
	#lesmake_div2 {
		text-align: center;
	}
}
</style>
</head>
<body>
	<div class="container">
		<span id="lesmake_sub1">TIPer 강의 등록</span> <br>
		<hr>
	</div>
	<div class="container">


		<form action="lessonMakeAction">
			<div id="lesmake_imgdiv">
				<input type="file" accept=".jpg,.jpeg,.png" name="lesson_img"
					id="lesmake_img" onchange="previewImage(event)"> <img
					id="preview" src="#" alt="강의사진을 올려주세요">
			</div>
			<table id="lesmake_tab1">
				<tr class="lesmake_tr">
					<td class="lesmake_td1">강의 제목</td>
					<td class="lesmake_td2"><input type="text" name="lesson_title"
						placeholder="강의제목을 입력해주세요" id="lesmake_title"></td>
				</tr>
				<tr class="lesmake_tr">
					<td class="lesmake_td1">강의 내용</td>
					<td class="lesmake_td2"><textarea name="lesson_info"
							id="lesmake_info" cols="30" rows="10" placeholder="강의내용을 입력해주세요"></textarea></td>
				</tr>
				<tr class="lesmake_tr">
					<td class="lesmake_td1">강의 카테고리</td>
					<td class="lesmake_td2"><select name="lesson_cate"
						id="lesmake_cate">
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
	<script type="text/javascript">
		function previewImage(event) {
			var reader = new FileReader();
			reader.onload = function() {
				var output = document.getElementById('preview');
				output.src = reader.result;
			}
			reader.readAsDataURL(event.target.files[0]);
			// 파일 선택 후 input 요소 숨기기
			var input = document.getElementById('lesmake_img');
			input.style.display = 'none';
			
		}
	</script>

</body>
</html>