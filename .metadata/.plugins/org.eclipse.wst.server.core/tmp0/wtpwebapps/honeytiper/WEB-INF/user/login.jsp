<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../main/header.jsp"%>
<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.min.js" charset="utf-8"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<head>
<title>꿀TIPer - 로그인</title>
<link rel="stylesheet" media="screen and (min-width:769px)" href="${pageContext.request.contextPath}/front/user.css">
   <link rel="stylesheet" media="screen and (max-width:768px)" href="${pageContext.request.contextPath}/front/userJoinMobile.css">
   	<script>
   	$(function(){
   		
		if ('<%=request.getParameter("error")%>' == '1') {
			$(".password_input_login + p").text("아이디나 비밀번호가 일치하지 않습니다.");
		}else if('<%=request.getParameter("error")%>' == '2'){
			$(".password_input_login + p").text("정지된 계정입니다.");
		}
	   		
   	});

	</script>
</head>
<body class="login_body">
	<div class="login_wrap">
			<div class="login_contents">
				<h3 class="form-signin-heading">로그인</h3>
				<form class="login_form__wrap" action="/login" method="post">
					<div class="form-input">
						<label for="user_id" class="sr-only">User Name</label> 
						<input type="text" class="login_input" placeholder="ID" name="user_id" id="user_id" required autofocus>
					</div>
					<div class="form-input password_input_login">
						<label for="user_pw" class="sr-only">Password</label> 
						<input type="password" class="login_input" placeholder="Password" name="user_pw" id="user_pw" required>
					</div>
					<p class='alert_loginError'></p>
					<div class="loginBtn_section">
						<button class="login_Btn loginPage_btn" id="login" type="submit">로그인</button><br>
					</div>
				</form>
					
				<form action="joinByKakao" method="post" class="kakaoJoinBtn">
					<input type="hidden" name="user_email" class="kakao_email">
					<input type="hidden" name="user_name" class="kakao_name">
					<input type="hidden" name="user_id" class="kakao_id">
					<div class="loginBtn_section">
						<button type="button" class="kakaoLogin_login" onclick="loginWithKakao()">카카오 로그인</button>
					</div>
				</form>
					<div class="login_find_user">
						<a href="find?find=id">아이디찾기</a> 
						<a href="find?find=pw">비밀번호찾기</a>
					</div>
					<div class="join_Btn_section">
						<a class="join_Btn" onclick="agreementBtn()">회원가입</a>
					</div>
			</div>
	</div>

	<script type="text/javascript">
		//회원가입 페이지 이동
		function agreementBtn() {
			document.location = "agreementBtn";
		}

		//초기화 시키기. 
		$(document).ready(function() {
			Kakao.init('e249d8f9f86e7dc7235a6fdf46fcc2f2');
			console.log(Kakao.isInitialized());
		});

		//카카오서버에 로그인
		function loginWithKakao() {
			Kakao.Auth.login({
				success : function(response) {
					Kakao.API.request({
						url : '/v2/user/me',
						success : function(response) {
							
							let mail = response.kakao_account.email;
							let id = response.id;
							let name = response.kakao_account.profile.nickname;
							
							login = loginByKakao(mail, id);
							console.log(login);

								if (login == "true") {
									console.log("로그인 성공");
									location.href = "index";
								}else {
									console.log("회원가입 실행");
									joinByKakao(mail, id , name);
								}
							}

						});
					}
				});
			}
		
		function logoutWithKakao() {
			Kakao.Auth.logout()
			.then(function(response) {
				console.log(Kakao.Auth.getAccessToken());
				
				Kakao.API.request({
					  url: '/v1/user/unlink',
					})
					  .then(function(response) {
					    console.log(response);
					  })
					  .catch(function(error) {
					    console.log(error);
					  });
			})
			.catch(function(error) {
			    console.log('Not logged in.');
			  });
		}

		$("#joinUser").click(function() {
			location.href = "join.jsp";
		});

		//이메일로 로그인 
		function loginByKakao(mail, id) {

			var login = "";

			console.log("카카오 이메일로 로그인 시도");
			$.ajax({
				type : "POST",
				url : "/loginByKakao",
				async : false,
				data : {
					"user_email" : mail,
					"user_id" : id
				},
				cache : false,
				success : function(data) {
					if (data.check == "success") {
						console.log("true return");
						login = "true";
					} else {
						login = "false";
					}
				},
				error : function(request, status) {
					
					alert("오류가 발생했습니다.")
				}

			});
			return login;
		}
		
		//카카오 회원가입
		function joinByKakao(mail, id, name) {
			
			console.log("카카오 회원가입");
			$(".kakao_name").val(name);
			$(".kakao_email").val(mail);
			$(".kakao_id").val(id);
			
			$(".kakaoJoinBtn").submit();
		}
	</script>
	<br><br><br><br><br><br><br><br>
	<%@include file="../main/footer.jsp"%>
</body>
</html>