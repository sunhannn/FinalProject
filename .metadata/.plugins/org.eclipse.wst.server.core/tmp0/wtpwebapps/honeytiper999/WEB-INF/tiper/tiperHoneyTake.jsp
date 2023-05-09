<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>허니페이 정산하기</title>
<link rel="stylesheet" href="front/common.css">
<link rel="stylesheet" href="front/bootstrap.css">
</head>
<body>
	<div class="container">
		<h4>허니페이 정산하기</h4>
		<br>
		<hr>

	</div>
	<div class="container">
		<form action="honeyTakeAction">
			<span id="myhoney_span1">정산 받을 계좌번호 입력</span> <br> <input
				type="text" id="point" name="user_point"> <br> <br>
			<button type="submit">정산하기</button>
		</form>

	</div>
</body>

</html>