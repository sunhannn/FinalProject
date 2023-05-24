<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
   <%@include file="adminNavbar.jsp"%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>꿀TIPer 관리자 - 정보 수정</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel="stylesheet" media="screen and (min-width:769px)" href="${pageContext.request.contextPath}/front/user.css">
   <link rel="stylesheet" media="screen and (max-width:768px)" href="${pageContext.request.contextPath}/front/userJoinMobile.css">
   <script>
   	$(function(){
   		
		if ('<%=request.getParameter("error")%>' != 'null') {
			$(".alert_loginError").html("비밀번호가 일치하지 않습니다.");
		}
	   		
   	});
   	
	</script>
</head>

<body>
	
	<div class="password_check_edit_admin login_wrap">
		<div class="password_check_input login_contents">
			<div class="pwChange_info_div">
				<h3>비밀번호 입력</h3>
				<div class="pwChange_div">
					<p class='alert_loginError'></p>
					<span class="pwChange_info">
						*관리자정보를 변경하기 위해 비밀번호를 입력해주세요
					</span>
				</div>
			</div>
			<form action="adminChkPassword" class="pwChange_form" method="post">
				<input type="password" name="user_pw" class="pwChange_input" placeholder="비밀번호를 입력하세요." autofocus required>
				<button class="pwChange_btn">확인</button>
			</form>
		</div>
	</div>
</body>
</html>