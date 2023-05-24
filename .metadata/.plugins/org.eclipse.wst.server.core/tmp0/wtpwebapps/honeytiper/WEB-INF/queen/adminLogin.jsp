<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>꿀TIPer 관리자 로그인</title>
   <link rel="stylesheet" href="${pageContext.request.contextPath}/front/user.css">
</head>
<%
if(request.getParameter("error")!=null){
	out.print("<script>");
	out.print("alert('관리자아이디 비밀번호를 다시확인해주세요.');");
	out.print("</script>");
}
%>
<body class="login_body admin_login_body">
	<div class="admin_cover">
	<div class="login_wrap admin_login_wrap">
	<div class="agreement_logo admin_logo"><a href="/"><img onerror="this.src='${pageContext.request.contextPath}/front/default.png'" src="${pageContext.request.contextPath}/front/ggulTiper.png" title="Logo"></a></div>
		<div class="login_contents">
			<h3 class="form-signin-heading">꿀TIPer 관리자</h3>
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
					<button type="button" onclick="location.href='/'">메인페이지</button>
				</div>
			</div>
		</form>
		</div>
	</div>
	</div>

</body>
</html>