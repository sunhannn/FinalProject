<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../main/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>꿀TIPer - 아이디 찾기</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <link rel="stylesheet" media="screen and (min-width:769px)" href="${pageContext.request.contextPath}/front/user.css">
   <link rel="stylesheet" media="screen and (max-width:768px)" href="${pageContext.request.contextPath}/front/userJoinMobile.css">
   <script src="${pageContext.request.contextPath}/front/userCertification.js"></script>
   <style>
   		.info_ptag {
   			color: red;
   		}
   		
   		.findId_body .login_wrap {
   			margin-top: 80px;
   		}
   </style>
</head>
<body class="login_body findId_body">

	<script>
		window.onload = function(){
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
						<button type="button" id="telCheck" class="btn_recive_num" onclick="smsSend()" disabled>인증번호받기</button>
						<p class="info_ptag"></p>
					</div>
					<div class="telConfirmDiv certification_cover">
						<input type="text" id="certificationTel" placeholder="인증번호">
						<span class="time"></span>
						<button id="telConfirmBtn" class="btn_chk" onclick="smsConfirm()">인증하기</button>
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
					<button type="button" onclick="location.href='find?find=pw'" class="goBack_findId">비밀번호 찾기</button>
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
			let clientTel = $("#user_tel").val();
			console.log('입력 핸드폰번호' + clientTel);
			
			findUser(clientTel);
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
						$("#certificationTel").focus();
						$("#showID").show();
	                  	$("#login_wrap").hide();
	                  	clearInterval(timer);
                 		$(".time").html("");
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
					idExist(data, value);
				},
				error : function(request, status) {
					console.log("아이디 가져오는 과정 오류발생");
				}
			});
		}
		
		//아이디 있는지 확인
		function idExist(data, clientTel){
			
			if (data == "") {
				alert("일치하는 계정이 없습니다");
			}else{
				for (i = 0 ; i <= data.length-1 ; i++){
					var user = data[i];
					console.log(user);
					$(".show_id_div").append("<div>" + user + "</div>");
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
		                     $("#certificationTel").attr("readonly", false);
		                     $("#certificationTel").focus();
		                  },
		                  error : function(e) {
		                     alert('오류입니다. 잠시 후 다시 시도해주세요');
		                  }
		            });
				}
			}
		}
		
		//유효성 검사
		$(".check").keyup (function(){
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
					 $(this).css({
	                           "borderColor":"green"
	                        });
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
		<%@include file="../main/footer.jsp"%>
</body>
</html>