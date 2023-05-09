<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
	<script>
		function sample6_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var addr = ''; // 주소 변수
							var extraAddr = ''; // 참고항목 변수
							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}
							// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraAddr !== '') {
									extraAddr = ' (' + extraAddr + ')';
								}
								// 조합된 참고항목을 해당 필드에 넣는다.
								document.getElementById("sample6_extraAddress").value = extraAddr;
							} else {
								document.getElementById("sample6_extraAddress").value = '';
							}
							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('sample6_postcode').value = data.zonecode;
							document.getElementById("sample6_address").value = addr;
							// 커서를 상세주소 필드로 이동한다.
							document.getElementById("sample6_detailAddress")
									.focus();
						}
					}).open();
		}

		window.onload = function() {
			$("#failed").hide();
			$("#success").hide();
			$(".invalid-feedback").hide();
			$("#mailSuccess").hide();
		}
		function idCheck() {

			var id = $("#user_id").val();
			console.log(id);

			$.ajax({
				type : "POST",
				url : "idCheck", 
				data : {
					"user_id" : id
				}, 
				cache : false, 
				success : function(data) { 
					console.log("data 찍어보기 : " + data.check)
					if (data.check == "success") { 
						$("#success").show();
						$("#failed").hide(); 
						console.log("성공");
					} else {
						$("#failed").show();
						$("#success").hide();
						console.log("실패");
					}
				},
				error : function(request, status) {
					alert("오류가 발생했습니다.")
				}
			});
		}
	</script>

	<section id="body_css">
		<section id="writeForm">

			<form name="joinform" action="userJoin" method="post" class="needs-validation" novalidate>

				<table style="border-collapse: inherit;">

					<tr>
						<td colspan="2"><h3 style="text-align: left;">회원가입</h3> <br></td>
					</tr>
					<tr>
						<td class="td_left"><label for="user_id">아이디</label></td>
						<td class="td_right"><input type="text" name="user_id"
							id="user_id" required>
							<button type="button" onclick="idCheck()">아이디 중복체크</button>
							<div class="valid-feedback" id="success">사용가능한 아이디입니다.</div>
							<div class="invalid-feedback">필수 정보입니다.</div>
							<div id="failed">사용불가한 아이디입니다.</div></td>
					</tr>

					<tr>
						<td class="td_left"><label for="user_pw">비밀번호</label></td>
						<td class="td_right"><input name="user_pw" type="password"
							id="user_pw" required>
							<div class="invalid-feedback">필수 정보입니다.</div></td>
					</tr>

					<tr>
						<td class="td_left"><label for="user_pw2">비밀번호 확인</label></td>
						<td class="td_right"><input name="user_pw2" type="password"
							id="user_pw2" required>
							<div class="invalid-feedback">필수 정보입니다.</div></td>
					</tr>

					<tr>
						<td class="td_left"><label for="user_name">이름</label></td>
						<td class="td_right"><input name="user_name" type="text"
							id="user_name" required>
							<div class="invalid-feedback">필수 정보입니다.</div></td>
					</tr>

					<tr>
						<td class="td_left"><label for="user_addr">주소</label></td>
						<td class="td_right"><input type="text" id="sample6_postcode"
							name="user_addr1" placeholder="우편번호" required>
							<button type="button" style="border-radius: 3px; margin: auto;"
								onclick="sample6_execDaumPostcode()" value="우편번호 찾기">우편번호찾기</button>
							<input type="text" id="sample6_address" name="user_addr2"
							placeholder="주소" required><br> <input type="text"
							id="sample6_detailAddress" name="user_addr3" placeholder="상세주소">
							<input type="text" id="sample6_extraAddress" name="user_addr4"
							placeholder="참고항목">
							<div class="invalid-feedback">필수 정보입니다.</div></td>
					</tr>

					<tr>
						<td class="td_left"><label for="user_tel">전화번호</label></td>
						<td class="td_right"><input name="user_tel" type="text"
							id="user_tel" placeholder="(- 제외)숫자만 입력해주세요" required>
							<button type="button" id="telCheck" onclick="smsSend()">인증번호받기</button>
							<div class="forTextLabel">인증번호</div> <input type="text"
							id="certificationTel">
							<div>
								<button id="telConfirmBtn" onclick="smsConfirm()">인증하기</button>
								<input type="hidden" id="checkTel" value="false">
							</div>
							<div class="invalid-feedback">필수 정보입니다.</div>
							<div id="telSuccess">핸드폰번호 인증완료.</div></td>
						</td>
					</tr>

					<tr>
						<td class="td_left" style="border: 1px solid black;">
							<label for="user_email">이메일</label>
						</td>
						<td class="td_right"><input name="user_email" type="text"
							id="emailText" placeholder="(@)포함 주소" required>
							<button type="button" id="emailCheck" onclick="emailSend()">인증번호받기</button>
							<div class="forTextLabel">인증번호</div> <input type="text"
							id="certificationEmail">
							<div>
								<button id="emailConfirmBtn" onclick="mailConfirm()">인증하기</button>
								<input type="hidden" id="checkEmail" value="false">
							</div>
							<div class="invalid-feedback">필수 정보입니다.</div>
							<div id="mailSuccess">이메일 인증완료.</div></td>
					</tr>
					<tr>
						<td class="td_left">
							관심있는 분야
						</td> 
						<td class="td_right">
						<input type="radio" name="user_cate" class="user_cate" value="예체능">예체능
						<input type="radio" name="user_cate" class="user_cate" value="공예">공예
						<input type="radio" name="user_cate" class="user_cate" value="사무">사무
						<input type="radio" name="user_cate" class="user_cate" value="라이프스타일">라이프스타일
						<input type="radio" name="user_cate" class="user_cate" value="IT">IT
						<input type="radio" name="user_cate" class="user_cate" value="기타">기타
					</tr>

				</table>
				<br> <br>

				<section id="commandCell">
					<button style="border-radius: 3px; margin: auto;" type="reset"
						value="다시쓰기">다시쓰기</button>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button style="border-radius: 3px; margin: auto;" value="회원가입">회원가입</button>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button style="border-radius: 3px; margin: auto;" type="button"
						onclick="javascript:history.go(-1)">취소</button>

				</section>

			</form>

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
			
				//메일 전송 함수
				var mailData = '';
				
				function emailSend() {
					alert('emailSend 들어왔음');
					let clientEmail = $("#emailText").val();
					console.log(clientEmail);
					
					console.log('입력 이메일' + clientEmail);
					let emailYN = isEmail(clientEmail);
					
					let checked = false;
					checked = emailCheck(clientEmail);
					if (checked == "false") {
						checked = false;
					} else {
						checked = true;
					}
					console.log('checked : ' + checked);
					if (checked) {
						console.log('사용 가능한 이메일입니다.')
						if (emailYN == true) {
							alert('이메일 형식입니다');

							$.ajax({
								type : "POST",
								url : "sendEmail",
								async : false,
								data : {
									userEmail : clientEmail
								},
								success : function(data) {
									console.log("data : ", data);
									mailData = data;
								},
								error : function(e) {
									alert('오류입니다. 잠시 후 다시 시도햐주세요');
								}
							})
						} else {
							alert('이메일 형식에 알맞게 입력해주세요 xxx@xxx.com');
						}
					}else {
						console.log('존재하는 이메일입니다')
					}

					
				}
				
				//메일 정규식 확인함수
				function isEmail(asValue) {
					console.log('이메일 정규식 확인')
					var regExp = /^[-!#$%\s'*+./0-9=?A-Z^_a-z{|}~]+@[A-Za-z{|}~]+.[A-Za-z]+$/
					return regExp.test(asValue); //형식에 맞는 경우 true 리턴
				}
				
				//메일 중복체크
				function emailCheck(mail) {
					console.log('이메일 중복체크');
					
					$.ajax({
						type : "POST",
						url : "mailCheck",
						async : false,
						data : {
							"mail" : mail
						},
						cache : false,
						success : function(data) {
							if (data.check == "success"){
								return "true";
							} else {
								return "false";
							}
						}
					});
				}
				
				//메일 인증번호 확인함수
				function mailConfirm() {
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
								$("#mailSuccess").show();
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
					var idRegex = /^[0-9A-Za-z]+$/, 
					passwordRegex = /^[0-9A-Z_a-z]+$/, 
					nameRegex = /^[가-힣]{2,4}$/,
					id = $("#user_id"), 
					name = $("#user_name"), 
					email = $("#emailText"), 
					password = $("#user_pw"), 
					passwordre = $("#user_pw2"), 
					tel = $("#user_tel"),
					cate = $("#user_cate");
					var valid = true;
					valid = valid && checkRegexp(id, idRegex, "영문 대소문자와 숫자의 조합으로 입력해주세요.");
					valid = valid && checkRegexp(name, nameRegex, "한글 2~4자 이내로 입력해주세요 .");
					valid = valid && checkMatch(password.val(), passwordre.val(), passwordre);
					valid = valid && checkRegexp(password, passwordRegex, "비밀번호 입력 형식이 잘못되었습니다.");
					valid = valid && checkLength(password, "비밀번호", 5, 16);
					valid = valid && checkWriten();
					
					//입력 확인
					function checkWriten(cate) {
						if ( ! $('input[name="user_cate"]:checked').val()) {
							alert('항목을 선택해주세요.');
							return false;
						} else {
							return true;
						}
					}
					
					//비밀번호 매칭
					function checkMatch(p, pre, passre) {
						let pval = p;
						console.log(pval);
						let pvalre = pre;
						console.log(pvalre);
						let res = true;
						if (pval != pvalre) {
							passre.nextAll("div.invalid-feedback").text(
									"비밀번호가 일치하지 않습니다.").show();
							passre.nextAll("div.valid-feedback").hide();
							res = false;
						} else {
							passre.nextAll("div.valid-feedback").text(
									"비밀번호가 일치합니다.").show();
							passre.nextAll("div.invalid-feedback").hide();
						}
						return res;
					}
					//정규식 일치 여부 확인
					function checkRegexp(o, regexp, n) {
						let cnt = $("#" + o.attr('id')
								+ " ~ div.invalid-feedback").length;
						console.log('o: ', o);
						console.log('cnt: ', cnt);
						console.log('o.val(): ', o.val());
						console.log('regexp.test( o.val() ): ', regexp.test(o
								.val()));
						if (!(regexp.test(o.val()))) {
							if (cnt == 0) {
								o.closest("div.row").nextAll(
										"div.invalid-feedback").eq(0).text(n)
										.show();
							} else {
								o.nextAll("div.invalid-feedback").eq(0).text(n)
										.show();
								o.nextAll("div.valid-feedback").eq(0).hide();
							}
							return false;
						} else {
							if (cnt == 0) {
								o.closest("div.row").nextAll(
										"div.invalid-feedback").eq(0).text(n)
										.hide();
							} else {
								o.nextAll("div.invalid-feedback").eq(0).text(n)
										.hide();
							}
							return true;
						}
					}

					function checkLength(o, n, min, max) {
						if (o.val().length > max || o.val().length < min) {
							return false;
						} else {
							return true;
						}
					}
					if (valid)
						e.target.submit();
				}
			</script>
</body>
</html>