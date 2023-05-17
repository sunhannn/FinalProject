<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <link rel="stylesheet" media="screen and (min-width:769px)" href="front/user.css">
   <link rel="stylesheet" media="screen and (max-width:768px)" href="front/userJoinMobile.css">
<style>
</style>
</head>
<body>

	<script>
		window.onload = function(){
			$(".invalid-feedback").hide();
			$("#telSuccess").hide();
			$("#showPW").hide();
			$(".info_ptag").hide();
		}
	</script>
	<div class="findId_cover login_wrap">
    	<div id="findId_wrap" class="login_contents">
			<div id="login_wrap" class="findId_wrap_content findId_input_content">
				<h3>비밀번호 변경</h3>
				<div id="telcertification" class="form-input find_id_form_input">
					<div class="login-input">
						<div class="login-input findId_inputName">
							<p>아이디</p>
							<input type="text" name="user_id" id="user_id" class="check" placeholder="아이디를 입력해주세요." autofocus>
							<p class="info_ptag"></p>
						</div>
						<p>이메일</p>
						<input type="text" name="user_email" id="user_email" class="check" placeholder="이메일을 입력하세요.">
						<button type="button" id="telCheck" onclick="emailSend()" disabled>인증번호받기</button>
						<p class="info_ptag"></p>
					</div>
					<div class="telConfirmDiv">
						<input type="text" id="certificationEmail" placeholder="인증번호를 입력해주세요.">
						<button id="telConfirmBtn" onclick="smsConfirm()">인증하기</button>
						<p class="info_ptag"></p>
						<input type="hidden" id="checkTel" value="false">
					</div>
				</div>
			</div>
			<div id="showPW" class="input_wrap findId_show_content">
				<h4>비밀번호를 재설정해주세요</h4>
						<p>비밀번호</p>
						<input name="user_pw" type="password" id="user_pw" class="check" placeholder="비밀번호를 입력해주세요" required>
						<p class="info_ptag"></p>
	
						<p>비밀번호 확인</p>
						<input name="user_pw2" type="password" id="user_pw2" class="check" placeholder="비밀번호를 입력해주세요." required>
						<p class="info_ptag"></p>
				<div class="page_btn">
					<button type="button" onclick="updatePW()">비밀번호 수정</button>
				</div>
			</div>
			<div class="findId_show_content">
				<button type="button" onclick="javascript:history.go(-1)" class="goBack_findId">뒤로가기</button>
			</div>
		</div>
    </div>
		
		<script>
		function updatePW(){
			user = $("#user_id").val();
			pw = $("#user_pw").val();
			pwre = $("#user_pw2").val();
			
			$.ajax({
				type : "POST",
				url : "updatePW",
				cache : false,
				data : {
					"user_id" : user,
					"user_pw" : pw,
					"user_pw2" : pwre
				},
				success : function(data) {
					alert("비밀번호가 수정되었습니다.")
					location.replace("index");
				}
			});
		}
		//이메일 전송함수
		var mailData = "";
		
		function emailSend() {
			alert('emailSend 들어왔음');
			let clientEmail = $("#user_email").val();
			
			console.log('입력 이메일 ' + clientEmail);
			
				$.ajax({
					type : "POST",
					url : "sendEmail",
					async : false,
					data : {
						"user_email" : clientEmail
					},
					success : function(data) {
						console.log("data : ", data);
						mailData = data;
					},
					error : function(e) {
						alert('오류입니다. 잠시 후 다시 시도햐주세요');
					}
				});
			}
		
		//이메일 인증번호 확인 함수
		function smsConfirm() {
			var confirmNum = $("#certificationEmail").val();
			var sendNum = mailData;
			console.log('confirmNum',confirmNum);
			console.log('sendNum',sendNum);
			
			$.ajax({
				type : "POST",
				url : "confirmNum",
				data: {
					"confirmNum" : confirmNum,
					"sendNum" : sendNum
				},
				cache : false,
				success: function(data) {
					if (data.check == "success") { //controller에서 넘겨준 성공여부 코드
						console.log("성공");
						$("#showPW").show();
						$("#login_wrap").hide();
						$(".goBack_findId").hide();
					} else {
						console.log("실패");
					}
				},
				error: function(request, status) {
					alert("오류가 발생했습니다.")
				}
			});
			
			mailData = "";
		}
		
		//유효성 검사
		$(".check").change (function(){
	        var checkText = "";
	        var thisVal = $(this).val();
	        var idRegex = /^[0-9A-Za-z]{4,10}$/;
			var telRegex = /^010\d{4}\d{4}$/;
			var passwordRegex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
		               
		        switch($(this).attr("name")){
		            case "user_id":
		            	if(thisVal == "") {
		            		checkText = "아이디를 입력해주세요";
		            		const target = document.getElementById('telCheck');
							  target.disabled = true;
		            	}else if (thisVal.length != 0 && idRegex.test(thisVal) == false){
		            		checkText = "아이디는 영문, 숫자조합으로 최소4자, 최대 10자를 입력해주세요.";
		            		const target = document.getElementById('telCheck');
							  target.disabled = true;
		            	}
		            	break;
		            	
		            	
		            case "user_tel":
		            	if(thisVal.length == 0) {
		            		checkText = "핸드폰번호를 입력해주세요.";
		            		const target = document.getElementById('telCheck');
							  target.disabled = true;
		            	}else if (thisVal.length != 0 && telRegex.test(thisVal) == false){
		                    checkText = "핸드폰번호는 (-)제외 010포함 11자리를 입력해주세요";
		                    const target = document.getElementById('telCheck');
							  target.disabled = true;
		                }
		            	break;
		            	
		            case "user_pw":
	                       if(thisVal.length != 0 && passwordRegex.test(thisVal) == false) {
	                           checkText = "영문 대소문자, 숫자, 특수문자의 조합으로 최소 8자를 입력해주세요";
	                        }else if(thisVal.length == 0) {
	                        	checkText = "비밀번호를 입력해주세요.";
	                        }
	                        break;
	                        
	                     case "user_pw2":
	                       if(thisVal.length != 0 && $("#user_pw").val() != thisVal) {
	                           checkText = "비밀번호가 일치하지 않습니다.";
	                        }
	                        break;
		            
		        }
		        if(checkText != ""){
		            $(this).siblings(".info_ptag").html(checkText);
		            $(this).siblings(".info_ptag").addClass("vali");
		            $(this).siblings(".info_ptag").slideDown();
		        } else {
		            $(this).siblings(".info_ptag").slideUp(function(){
		                $(this).removeClass("vali");
		                
						 if($("check").length == 0){
							 const target = document.getElementById('telCheck');
							  target.disabled = false;
						 }
		            });
		        }
		});
		</script>
</body>
</html>