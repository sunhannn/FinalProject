<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>

	<script>
		window.onload = function(){
			$(".invalid-feedback").hide();
			$("#telSuccess").hide();
			$("#showPW").hide();
		}
	</script>
	<h3>비밀번호찾기</h3>
		<div id="telcertification">
		<label for="user_tel">전화번호 인증</label>
			<table>
				<tr>
					<td class="td_right"><input name="user_tel" type="text" id="user_tel" placeholder="(- 제외)숫자만 입력해주세요" required>
						<button type="button" id="telCheck" onclick="smsSend()">인증번호받기</button>
						<div class="forTextLabel">인증번호</div> <input type="text" id="certificationTel">
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
			<form action="updatePW" method="post" class="needs-validation" novalidate>
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
				<input type="hidden" name="user_id" id="user_id" value="">
				<button>비밀번호 수정</button>
			</form>
		</div>
		
		<button type="button" onclick="javascript:history.go(-1)">뒤로가기</button>
			
		
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
		
		//전화번호 인증에 따른 회원아이디 가져오기
		var user = "";
		
		function findUser(value) {
			var user = "";
			console.log("value : ", value);
			
			$.ajax({
				type : "POST",
				url : "findUser",
				data : {
					"user_tel" : value
				},
				async : false,
				cache : false,
				success : function(data) {
					console.log("data : ", data);
					user = data;
					$('#user_id').val(data);
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
				$("#showPW").show();
			}
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
		</script>
</body>
</html>