<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../main/header.jsp"%>
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
</head>
<body class="login_body findId_body">

	<script>
		window.onload = function(){
			$(".invalid-feedback").hide();
			$("#telSuccess").hide();
			$("#showID").hide();
			$(".info_ptag").hide();
		}
	</script>
    <div class="findId_cover login_wrap">
    	<div id="findId_wrap" class="login_contents">
			<div id="login_wrap" class="findId_wrap_content findId_input_content">
				<h3>아이디찾기</h3>
				<div id="telcertification" class="form-input find_id_form_input">
					<div class="login-input">
						<div class="login-input findId_inputName">
							<p class="findId_info">이름</p>
							<input type="text" name="user_name" id="user_name" class="check" placeholder="가입하신 이름을 입력해주세요." autofocus>
							<p class="info_ptag"></p>
						</div>
						<p class="findId_info">핸드폰번호</p>
						<input type="text" name="user_tel" id="user_tel" class="check" placeholder="(- 제외)숫자만 입력해주세요">
						<button type="button" id="telCheck" onclick="smsSend()" disabled>인증번호받기</button>
						<p class="info_ptag"></p>
					</div>
					<div class="telConfirmDiv">
						<input type="text" id="certificationTel" placeholder="인증번호를 입력해주세요.">
						<button id="telConfirmBtn" onclick="smsConfirm()">인증하기</button>
						<p class="info_ptag"></p>
						<input type="hidden" id="checkTel" value="false">
					</div>
				</div>
			</div>
			<div id="showID" class="input_wrap findId_show_content">
				<h4>고객님의 아이디입니다</h4>
				<div id="id" class="show_id_div"></div>
				<div class="page_btn">
					<button type="button" onclick="location.href='login'">로그인하기</button>
					<button type="button" onclick="location.href='updatePW'" class="goBack_findId">비밀번호 찾기</button>
				</div>
			</div>
			<div class="findId_show_content">
				<button type="button" onclick="javascript:history.go(-1)" class="goBack_findId">뒤로가기</button>
			</div>
		</div>
    </div>
			
		
		<script>
		//sms 전송 함수
		var smsData = '';
		
		function smsSend(){
			alert('smsSend 들어왔음');
			let clientTel = $("#user_tel").val();
			console.log('입력 이메일' + clientTel);
			let telYN = isTel(clientTel);
			
				if (telYN) {
					alert('핸드폰번호 형식입니다');

					$.ajax({
						type : "POST",
						url : "sendSMS",
						async : false,
						data : {
							"user_tel" : clientTel
						},
						success : function(data) {
							console.log("data", data);
							smsData = data;
						},
						error : function(e) {
							alert('오류입니다. 잠시 후 다시 시도햐주세요');
						}
					});
				} else {
					alert('핸드폰번호 형식에 알맞게 입력해주세요 (-)제외 010 시작');
				}
		}
		
		//핸드폰번호 정규식 확인함수
		function isTel(asValue) {
			console.log('핸드폰번호 정규식 확인')
			var regExp = /^010\d{4}\d{4}$/
			return regExp.test(asValue); //형식에 맞는 경우 true 리턴
		}
		
		//sms 인증번호 확인함수
		function smsConfirm() {
			var telNum = $("#user_tel").val();
			var confirmNum = $("#certificationTel").val();
			var sendNum = smsData;
			console.log('confirmNum',confirmNum);
			console.log('sendNum',sendNum);
			
			$.ajax({
				type : "POST",
				url : "confirmNum",
				data: {
					"confirmNum" : confirmNum,
					"sendNum" : smsData
				},
				cache : false,
				success: function(data) {
					if (data.check == "success") { //controller에서 넘겨준 성공여부 코드
						console.log("성공");
						$("#telSuccess").show();
						findUser(telNum);
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
		
		//회원확인절차
		function findUser(value) {
			var user = "";
			var name = $("#user_name").val();
			console.log("value : ", value);
			
			$.ajax({
				type : "POST",
				url : "findUser",
				data : {
					"user_tel" : value,
					"user_name" : name
				},
				async : false,
				cache : false,
				success : function(data) {
					console.log("data : ", data);
					user = data;
				},
				error : function(request, status) {
					alert("아이디 가져오는 과정 오류발생")
				}
			});
			
			console.log("user : ", user);
			
			if (user.length === 0) {
				alert("오류입니다.")
			}else{
				$("#telcertification").hide();
				$("#showID").show();
				$("#id").append(user);
			}
		}
		
		//유효성 검사
		$(".check").change (function(){
	        var checkText = "";
	        var thisVal = $(this).val();
	        var nameRegex = /^[가-힣]{2,4}$/;
			var telRegex = /^010\d{4}\d{4}$/;
		               
		        switch($(this).attr("name")){
		            case "user_name":
		            	if(thisVal == "") {
		            		checkText = "이름을 입력해주세요";
		            		const target = document.getElementById('telCheck');
							  target.disabled = true;
		            	}else if (thisVal.length != 0 && nameRegex.test(thisVal) == false){
		            		checkText = "이름은 한글 2-4자로 입력해주세요.";
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