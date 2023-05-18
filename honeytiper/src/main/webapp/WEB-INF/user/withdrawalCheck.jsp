<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../main/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>회원탈퇴 비밀번호 체크</title>
<link rel="stylesheet" media="screen and (min-width:769px)"
	href="front/user.css">
<link rel="stylesheet" media="screen and (max-width:768px)"
	href="front/userJoinMobile.css">
</head>

<body>

	<div class="password_check_edit login_wrap">
		<div class="password_check_input login_contents">
			<div class="pwChange_info_div">
				<h3>비밀번호 입력</h3>
				<div class="pwChange_div">
					<span class="pwChange_info"> *회원탈퇴 확인을 위한 비밀번호를 입력 해 주세요! </span>
				</div>
			</div>
			<form action="withdrawalCheckPw" class="pwChange_form" id="deleteForm" method="post">
				<input type="password" name="user_pw" class="pwChange_input"
					placeholder="비밀번호를 입력하세요." autofocus required>
				<button class="pwChange_btn" id="delete-btn">확인</button>
			</form>
		</div>
	</div>

	<script type="text/javascript">
		document.getElementById('delete-btn').addEventListener('click',
				function() {
					if (confirm('정말로 탈퇴하시겠습니까?')) {
						document.getElementById('deleteForm').submit();
					}
				});
	</script>

	<%@include file="../main/footer.jsp"%>
</body>
</html>