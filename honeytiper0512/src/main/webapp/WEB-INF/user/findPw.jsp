<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
	p {
		color : red;
	}	
</style>
</head>
<body>

	<script>
		window.onload = function(){
			$(".invalid-feedback").hide();
			$("#telSuccess").hide();
			$("#showPW").hide();
		}
	</script>
	<div id="wrap">
        <div class="logo"><img src="${pageContext.request.contextPath}/front/ggulTiper.png"></div>
	
		
	</div>
			<h3>비밀번호찾기</h3>
			<div id="contents">
				<label for="user_tel">전화번호 인증</label>
			<table>
				<tr>
					<td>
						<div>아이디
							<input type="text" name="user_id" id="user_id" class="check" placeholder ="영문숫자조합으로 입력해주세요." required>
							<p></p>
						</div>
						<div>전화번호
							<input name="user_tel" type="text" id="user_tel" class="check" placeholder="(- 제외)숫자만 입력해주세요" required>
							<button type="button" id="telCheck" onclick="smsSend()" disabled>인증번호받기</button>
							<p></p>
						</div>
						<div class="forTextLabel">인증번호</div> <input type="text" id="certificationTel" required>
						<div>
							<button id="telConfirmBtn" onclick="smsConfirm()">인증하기</button>
							<input type="hidden" id="checkTel" value="false">
						</div>
						<div class="invalid-feedback">필수 정보입니다.</div>
						<div id="telSuccess">핸드폰번호 인증완료.</div>
					</td>
				</tr>
			</table>
		</div>
		<div id="showPW">
			<h4>비밀번호를 재설정해주세요</h4>
				<table>
					<tr>
						<td class="td_left"><label for="user_pw">비밀번호</label></td>
						<td class="td_right">
							<input name="user_pw" type="password" id="user_pw" required>
							<div class="invalid-feedback">필수 정보입니다.</div>
						</td>
					</tr>
	
					<tr>
						<td class="td_left"><label for="user_pw2">비밀번호 확인</label></td>
						<td class="td_right">
							<input name="user_pw2" type="password" id="user_pw2" required>
							<div class="invalid-feedback">필수 정보입니다.</div>
						</td>
					</tr>
				</table>
				<button type="button" onclick="updatePW()">비밀번호 수정</button>
		</div>
		<button type="button" onclick="javascript:history.go(-1)">뒤로가기</button>
		
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
		//sms 전송 함수
		var smsData = '';
		
		function smsSend(){
			alert('smsSend 들어왔음');
			let clientTel = $("#user_tel").val();
			console.log('입력 이메일' + clientTel);
			
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
		
		//전화번호 인증에 따른 회원아이디 가져오기
		function findUser(value) {
			var user = $("#user_id").val();
			console.log("value : ", value);
			
			$.ajax({
				type : "POST",
				url : "findUserPW",
				data : {
					"user_tel" : value,
					"user_id" : user
				},
				cache : false,
				success : function(data) {
					console.log("data : ", data);
					if (data == "true") {
					$("#contents").hide();
					$("#showPW").show();
					}else {
						alert("존재하지 않는 아이디입니다.");
					}
				},
				error : function(request, status) {
					alert("에러.");
				}
			});
			
		}
		
		//유효성 확인
		(function() {
			'use strict';
			window.addEventListener('load', function() {
				var forms = document
						.getElementsByClassName('needs-validation');
				var validation = Array.prototype.filter.call(forms,
						function(form) {
							form.addEventListener('submit', function(
									event) {
								if (form.checkValidity() === false) {
									event.preventDefault();
									event.stopPropagation();
								}
								form.classList.add('was-validated');
								valChk(event);
							}, false);
						});
			}, false);
		})();
		function valChk(e) {
			e.preventDefault();
			var 
			passwordRegex = /^[0-9A-Z_a-z]+$/, 
			password = $("#user_pw"), 
			passwordre = $("#user_pw2"); 
			var valid = true;
			valid = valid && checkMatch( password.val(), passwordre.val(), passwordre);
			valid = valid && checkRegexp(password, passwordRegex, "비밀번호 입력 형식이 잘못되었습니다.");
			valid = valid && checkLength(password, 5, 16, "비밀번호는 5-16 내로 입력해주세요.");

			  //비밀번호 매칭
			function checkMatch(p, pre, passre){
				let pval = p;
				console.log(pval);
				let pvalre = pre;
				console.log(pvalre);
				let res = true;
				if(pval != pvalre){
					passre.nextAll("div.invalid-feedback").text("비밀번호가 일치하지 않습니다.").show();
					passre.nextAll("div.valid-feedback").hide();
				  	res = false;
			  } else {
				  passre.nextAll("div.valid-feedback").text("비밀번호가 일치합니다.").show();
				  passre.nextAll("div.invalid-feedback").hide();
			  }
			  return res;
			}
			
			//정규식 일치 여부 확인
			function checkRegexp(o, regexp, n) {
				let cnt = $("#" + o.attr('id')+ " ~ div.invalid-feedback").length;
				console.log('o: ', o);
				console.log('cnt: ', cnt);
				console.log('o.val(): ', o.val());
				console.log('regexp.test( o.val() ): ', regexp.test(o.val()));
				if (!(regexp.test(o.val()))) {
					if (cnt == 0) {
						o.closest("div.row").nextAll("div.invalid-feedback").eq(0).text(n).show();
					} else {
						o.nextAll("div.invalid-feedback").eq(0).text(n).show();
						o.nextAll("div.valid-feedback").eq(0).hide();
					}
					return false;
				} else {
					if (cnt == 0) {
						o.closest("div.row").nextAll("div.invalid-feedback").eq(0).text(n).hide();
					} else {
						o.nextAll("div.invalid-feedback").eq(0).text(n).hide();
					}
					return true;
				}
			}

			function checkLength(o, min, max, n) {
				if (o.val().length > max || o.val().length < min) {
					return false;
					o.closest("div.row").nextAll("div.invalid-feedback").eq(0).text(n).show();
				} else {
					return true;
				}
			}
			if (valid){
				console.log('user 값 마지막 : ' + user);
				e.target.submit();
			}
		}
		
		//유효성 검사
		$(".check").change (function(){
	        var checkText = "";
	        var thisVal = $(this).val();
	        var idRegex = /^[0-9A-Za-z]{4,10}$/;
			var telRegex = /^010\d{4}\d{4}$/;
		               
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
		            
		        }
		        if(checkText != ""){
		            $(this).siblings("p").html(checkText);
		            $(this).siblings("p").addClass("vali");
		            $(this).siblings("p").slideDown();
		        } else {
		            $(this).siblings("p").slideUp(function(){
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