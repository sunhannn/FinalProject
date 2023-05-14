<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />


<style>
.flex-container {
	margin: 0 auto;
}

@media ( max-width : 768px) {
	.flex-container {
		margin: 0 auto;
		padding: 0 20px;
		height: 150px
	}
}

.foot_text {
	color: rgb(255, 255, 255);
	font-size: 11px;
	font-family: Arial, Helvetica, sans-serif;
}

.texthv span {
	transition: 0.35s ease-in-out;
	cursor: pointer;
}

.texthv span:hover {
	color: yellow;
}

.flex-container {
	height: 150px;
	display: flex;
	align-items: stretch;
	background-color: #212a30;
	text-align: center;
	margin-bottom: 0;
}
</style>

<div class="flex-container" style="padding: 50px 0">
	<div style="flex-grow: 1"></div>
	<div style="flex-grow: 9" class="foot_text">
		<p style="font-size: 13px; font-family: Arial, Helvetica, sans-serif;">
			장승무 오현민 김보영 양소연 이승희 정성현 한상현 해애언 <a href="adminLoginBtn">관리자로그인</a>
		</p>

		<p style="font-size: 13px; font-family: Arial, Helvetica, sans-serif;"
			class="texthv">현재 사이트는 교육용으로 제작된 웹 사이트로 실제로 사용이 불가능 합니다</p>
		<p>Copyright © 2023 honeytiper</p>


	</div>
</div>