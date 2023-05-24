<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>error_page</title>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<style>
@font-face {
    font-family: 'SUITE-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/SUITE-Regular.woff2') format('woff2');
    font-weight: 400;
    font-style: normal;
}

body{
font-family:SUITE-Regular;
}


#goBack{
	border-style: none;
	background: #FFD400;
	color: #5c3b0c;
	margin: 5px;
	padding: 5px 18px;
	cursor: pointer;
	border-radius: 5px;
	font-size: 12pt;
	font-weight: bolder;
}

#goBack:hover{
	background-color: #E6B800;
}

#error_img{
width:400px;
height:400px;
}
</style>

<script>
$(document).ready(function(){ 
	$("#goBack").on('click',function() {
		history.back();
	});	
});
</script>
</head>
<body>
<br>
	<div style="text-align:center; margin: o auto;">
	<br>
	   <h1>에러 발생</h1>      

	<div class="alert alert-danger" style="text-align:center; margin: o auto;">
		<h3>서비스 처리 과정에서 에러가 발생하였습니다.</h3>
		<br>
<%-- 		<br>${exception.message} --%>
	<img src="${pageContext.request.contextPath}/front/error_img.png" id="error_img" alt="error_img" onerror="this.src='${pageContext.request.contextPath}/front/default.png'">
<div style="text-align:center; margin: o auto;">
		<button type="button" id="goBack" class="btn btn-primary">돌아가기</button></div>
	</div>
	</div>
</body>
</html>