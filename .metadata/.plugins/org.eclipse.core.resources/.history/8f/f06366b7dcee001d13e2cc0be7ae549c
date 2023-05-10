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

</head>
<body>
	<div class="container">
		<h4>TIPer 강의 등록</h4>
		<br>
		<hr>
	</div>
	<div class="container">


		<form action="lessonMakeAction">
			<input type="file" placeholder="강의사진을 올려주세요" accept=".jpg,.jpeg,.png"
				name="lesson_img">
			<table>
				<tr>
					<td>강의 제목</td>
					<td><input type="text" name="lesson_title"
						placeholder="강의제목을 입력해주세요"></td>
				</tr>
				<tr>
					<td>강의 내용</td>
					<td><textarea name="lesson_info" id="" cols="30" rows="10"
							placeholder="강의내용을 입력해주세요"></textarea></td>
				</tr>
				<tr>
					<td>강의 카테고리</td>
					<td><select name="lesson_cate">
							<option selected disabled hidden>강의 카테고리 선택</option>
							<option value="<%=tiperVO.getTiper_cate1()%>"><%=tiperVO.getTiper_cate1()%></option>
							<option style="<%=style1%>" value="<%=tiperVO.getTiper_cate2()%>"><%=tiperVO.getTiper_cate2()%></option>
							<option style="<%=style2%>" value="<%=tiperVO.getTiper_cate3()%>"><%=tiperVO.getTiper_cate3()%></option>

					</select></td>

				</tr>

			</table>
			<br>
			<button type="submit">강의등록하기</button>
		</form>

	</div>


</body>
</html>