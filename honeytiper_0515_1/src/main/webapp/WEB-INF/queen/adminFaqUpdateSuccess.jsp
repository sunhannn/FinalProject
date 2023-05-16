<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>수정 완료</title>
	<style>
		body {
			background-color: #F5F5F5;
			font-family: Arial, sans-serif;
		}
		h1 {
			color: #333;
			text-align: center;
			margin-top: 250px;
		}
		button {
			background-color: #FFD400;
			color: #FFF;
			border: none;
			border-radius: 4px;
			padding: 10px 20px;
			font-size: 16px;
			cursor: pointer;
			margin-top: 20px;
			display: block;
			margin: 0 auto;
		}
		button:hover {
			background-color: #E6B800;
		}
	</style>
	<script>
		function BtnClose(){
			close1();
 			self.close();
 		}
		
		function close1() {
		    opener.location.reload();
		    window.close();
		}
	</script>
</head>
<body>
	<h1>수정이 완료되었습니다.</h1>
	<button type="button" onclick="BtnClose()">닫기</button>
</body>
</html>