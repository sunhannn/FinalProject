<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>허니페이 정산하기</title>
<!-- <link rel="stylesheet" href="front/common.css"> -->
<!-- <link rel="stylesheet" href="front/bootstrap.css"> -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.js"></script>
<style type="text/css">
@media ( max-width : 768px) {
	#honeyTake_sub1 {
		font-size: 24px;
		font-weight: bold;
	}
	#myhoney_span1 {
		font-size: 18px;
	}
	#honeyTake_point {
		border: 0;
		width: 300px;
		height: 45px;
	}
	#honeyTake_point:focus {
		border: 3px solid #FFD400;
		outline: none;
		border-radius: 10px;
	}
	#honeyTake_btn {
		background-color: #FFD400;
		border: 0;
		border-radius: 10px;
		width: 150px;
		height: 30px;
		font-weight: bold;
	}
	#honeyTake_div2 {
		width: 100%;
		text-align: center;
	}
	#honeyTake_div3 {
		text-align: center;
	}
}

@media ( min-width : 769px) {
	#honeyTake_sub1 {
		font-size: 24px;
		font-weight: bold;
	}
	#myhoney_span1 {
		font-size: 18px;
	}
	#honeyTake_point {
		border: 0;
		width: 300px;
		height: 45px;
	}
	#honeyTake_point:focus {
		border: 3px solid #FFD400;
		outline: none;
		border-radius: 10px;
	}
	#honeyTake_btn {
		background-color: #FFD400;
		border: 0;
		border-radius: 10px;
		width: 150px;
		height: 30px;
		font-weight: bold;
	}
	#honeyTake_div2 {
		width: 100%;
		text-align: center;
	}
	#honeyTake_div3 {
		text-align: center;
	}
}
</style>
</head>
<body>
	<%@include file="../main/header.jsp"%>
	<div class="container">
		<p id="honeyTake_sub1" style="margin: 40px 0;">허니페이
			정산하기</p>
		<br>
		<hr>
		<br>
	</div>
	<div class="container" id="honeyTake_div1">
		<form action="honeyTakeAction" id="honeyTake_form">
			<div id="honeyTake_div2">
				<span id="myhoney_span1">정산 받을 계좌번호 입력</span> <br> <input
					type="text" id="honeyTake_point" name="point_history"
					required="required">
			</div>
			<br> <br>
			<div id="honeyTake_div3">
				<button type="submit" id="honeyTake_btn">정산하기</button>
			</div>
		</form>

	</div>
	<br>
	<br>
	<%@include file="../main/footer.jsp"%>
</body>

</html>