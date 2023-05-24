<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>꿀TIPer - 회원정보 수정</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/front/common.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/front/bootstrap.css">
	<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
	<div class="container">
		<h4>회원정보수정</h4>
		<hr>
	</div>
	<div class="container">
		<form action="userUpdateAction">
			<table>
				<tr>
					<td><span class="tab_span">이름</span></td>
					<td><input type="text" name="user_name" placeholder="고정값입니다."></td>
				</tr>
				<tr>
					<td><span class="tab_span">비밀번호</span></td>
					<td><input type="password" name="user_pw"
						placeholder="영문 숫자 조합으로 최대 8자 입력해주세요."></td>
				</tr>
				<tr>
					<td><span class="tab_span">비밀번호 확인</span></td>
					<td><input type="password" 
						placeholder="비밀번호를 재입력해주세요"></td>
				</tr>
				<tr>
					<td><span class="tab_span">주소</span></td>
					<td><input type="text" id="sample4_postcode"
						placeholder="우편번호" name="user_addr1"
						style="border-bottom: 2px solid black; margin-bottom: 20px;"
						required> <input type="button"
						onclick="sample4_execDaumPostcode()" value="우편번호 찾기" name="M_ADDR"
						style="color: white; background: #3B4A71; border-radius: 0.3em;"><br>
						<input type="text" id="sample4_roadAddress" placeholder="도로명주소"
						name="user_addr2"
						style="border-bottom: 2px solid black; margin-bottom: 20px;">
						<input type="text" id="sample4_jibunAddress" placeholder="지번주소"
						name="user_addr3"
						style="border-bottom: 2px solid black; margin-bottom: 20px;">
						<span id="guide" style="color: #999; display: none"></span> <input
						type="text" id="sample4_detailAddress" placeholder="상세주소"
						name="user_addr4"
						style="border-bottom: 2px solid black; margin-bottom: 20px;">
						<input type="text" id="sample4_extraAddress" placeholder="참고항목"
						style="border-bottom: 2px solid black; margin-bottom: 20px;"></td>
				</tr>
				<tr>
					<td><span class="tab_span">핸드폰번호</span></td>
					<td><span>핸드폰 번호를 입력해주세요.</span> <br> <input type="text"
						placeholder="인증번호 입력" name="user_tel">
						<button type="button">인증번호 발송</button></td>
				</tr>
				<tr>
					<td><span class="tab_span">이메일</span></td>
					<td><input type="text" name="user_email"
						placeholder="이메일을 입력해주세요"></td>

				</tr>


			</table>
			<br>
			<button type="submit">수정완료</button>
			<button type="button" onclick="location.href='userDeleteAction'">회원탈퇴</button>
			</form>
	</div>
	

	<script>
		//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
		function sample4_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
							// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var roadAddr = data.roadAddress; // 도로명 주소 변수
							var extraRoadAddr = ''; // 참고 항목 변수
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraRoadAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraRoadAddr += (extraRoadAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraRoadAddr !== '') {
								extraRoadAddr = ' (' + extraRoadAddr + ')';
							}
							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('sample4_postcode').value = data.zonecode;
							document.getElementById("sample4_roadAddress").value = roadAddr;
							document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

							// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
							if (roadAddr !== '') {
								document.getElementById("sample4_extraAddress").value = extraRoadAddr;
							} else {
								document.getElementById("sample4_extraAddress").value = '';
							}
							var guideTextBox = document.getElementById("guide");
							// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
							if (data.autoRoadAddress) {
								var expRoadAddr = data.autoRoadAddress
										+ extraRoadAddr;
								guideTextBox.innerHTML = '(예상 도로명 주소 : '
										+ expRoadAddr + ')';
								guideTextBox.style.display = 'block';
							} else if (data.autoJibunAddress) {
								var expJibunAddr = data.autoJibunAddress;
								guideTextBox.innerHTML = '(예상 지번 주소 : '
										+ expJibunAddr + ')';
								guideTextBox.style.display = 'block';
							} else {
								guideTextBox.innerHTML = '';
								guideTextBox.style.display = 'none';
							}
						}
					}).open();
		}
	</script>



</body>
</html>