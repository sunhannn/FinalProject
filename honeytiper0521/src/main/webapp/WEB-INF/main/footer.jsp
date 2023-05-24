<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />


<style>

.flex-container, .flex-container2 {
	display: flex;
	align-items: center;
	justify-content: center;
	background-color: #white;
	color: #black;
	font-weight: bold;
	text-align: center;
	height: 170px;
	margin-top: 0;
	padding-top: 15px;
	margin-bottom: 0 !important;
	border-top: solid 0.5px #D2D2D2;
}

.foot_text {
	font-size: 13px;
	font-family: Arial, Helvetica, sans-serif;
}

.texthv span {
	transition: 0.35s ease-in-out;
	cursor: pointer;
}

@media ( max-width : 767px) {
	.flex-container2 {
		height: 150px;
	}
	.flex-container {
		display: none;
	}
}

@media ( min-width : 768px) {
	.flex-container2 {
		display: none;
	}
}
</style>
</head>
<body>
	<div class="flex-container">
		<div class="foot_text">
			<p>
				장승무 오현민 김보영 양소연 이승희 정성현 한상현 해애언 
			</p>
			<p class="texthv">현재 사이트는 교육용으로 제작된 웹 사이트로 실제로 사용 불가</p>
			<a style="color:#fff8e3;" href="adminLoginBtn">관리자로그인</a>
			<p>Copyright © 2023 honeytiper</p>
		</div>
	</div>

	<div class="flex-container2">
		<div class="foot_text">
			<p>
				장승무 오현민 김보영 양소연 이승희 <br> 정성현 한상현 해애언 
			</p>
			<p class="texthv">교육용으로 제작된 웹 사이트로 실제 사용이 불가능</p>
			<a style="color:#fff8e3;" href="adminLoginBtn">관리자로그인</a>
			<p class="last_p">Copyright © 2023 honeytiper</p>
		</div>
	</div>