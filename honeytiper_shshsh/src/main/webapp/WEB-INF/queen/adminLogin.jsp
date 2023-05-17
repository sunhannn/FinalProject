<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
if(request.getParameter("error")!=null){
	out.print("<script>");
	out.print("alert('관리자아이디 비밀번호를 다시확인해주세요.');");
	out.print("</script>");
}
%>
<body>
	<form class="form-signin" action="/adminLogin" method="post">
		<div class="form-group">
			<label for="user_id" class="sr-only">User ID</label> 
			<input type="text" class="form-control" placeholder="ID" id="user_id" name="user_id" required autofocus>
		</div>
		<div class="form-group">
			<label for="user_pw" class="sr-only">Password</label> 
			<input type="password" class="form-control" placeholder="Password" id="user_pw" name="user_pw" required>
		</div>
		<button class="btn btn btn-lg btn-success btn-block" id="login" type="submit">로그인</button>
	</form>

</body>
</html>