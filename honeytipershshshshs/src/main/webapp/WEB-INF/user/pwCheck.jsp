<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../main/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Insert title here</title>
<link rel="stylesheet" media="screen and (min-width:769px)" href="front/user.css">
   <link rel="stylesheet" media="screen and (max-width:768px)" href="front/userJoinMobile.css">
</head>

<body>
	
	<div class="password_check_edit login_wrap">
		<div class="password_check_input login_contents">
			<div class="pwChange_info_div">
				<h3>비밀번호 입력</h3>
				<div class="pwChange_div">
					<span class="pwChange_info">
						*개인정보를 변경하기 위해 비밀번호를 입력해주세요
					</span>
				</div>
			</div>
			<form action="checkPW" class="pwChange_form" method="post">
				<input type="password" name="user_pw" class="pwChange_input" placeholder="비밀번호를 입력하세요." autofocus required>
				<button class="pwChange_btn">확인</button>
			</form>
		</div>
	</div>
	<%@include file="../main/footer.jsp"%>
</body>
</html>