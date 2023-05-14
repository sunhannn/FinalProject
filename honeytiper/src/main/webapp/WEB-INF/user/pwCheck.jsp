<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<div class="password_check_edit">
		<div class="password_check_input">
			<div><h3>비밀번호 입력</h3></div>
			<form action="checkPW" method="post">
				<input type="password" name="user_pw" placeholder="비밀번호를 입력하세요." required>
				<button>비밀번호 확인</button>
			</form>
		</div>
	</div>
	
</body>
</html>