<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Insert title here</title>
   <link rel="stylesheet" media="screen and (min-width:769px)" href="front/user.css">
   <link rel="stylesheet" media="screen and (max-width:768px)" href="front/userJoinMobile.css">
</head>
<%
if(request.getParameter("error")!=null){
	out.print("<script>");
	out.print("alert('관리자아이디 비밀번호를 다시확인해주세요.');");
	out.print("</script>");
}
%>
<body class="login_body">
	<div class="login_wrap">
		<div class="login_contents">
			<h3 class="form-signin-heading">꿀 TIPer 관리자</h3>
			<form class="form-signin" action="/adminLogin" method="post">
			<div class="form-input">
				<input type="text" class="login_input" placeholder="ID" name="user_id" id="user_id" required autofocus>
			</div>
			<div class="admin_input_login">
				<div class="form-input">
					<input type="password" class="login_input" placeholder="Password" name="user_pw" id="user_pw" required>
				</div>
				<div class="loginBtn_section">
					<button class="login_Btn_admin" id="login" type="submit">로그인</button><br>
					<button type="button" onclick="javascript:history.go(-1)">뒤로가기</button>
				</div>
			</div>
		</form>
		</div>
	</div>

</body>
</html>