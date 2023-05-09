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
			$("#showID").hide();
		}
	</script>
	<h3>아이디찾기</h3>
		<label for="user_tel">전화번호 인증</label>
		<div id="telcertification">
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
		<div id="showID">
			<h4>고객님의 아이디입니다</h4>
			<div id="id"></div>
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
		</script>
</body>
</html>