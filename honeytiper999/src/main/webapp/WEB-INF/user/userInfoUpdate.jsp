<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.ggul.zip.user.UserVO"%>
<%@ page
	import="java.security.MessageDigest, java.security.NoSuchAlgorithmException"%>


<%
//UserVO 객체 받아오기
UserVO vo = (UserVO) request.getAttribute("userVO");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원정보 수정 및 조회<%=vo.getUser_cate()%></title>
<link rel="stylesheet" href="front/common.css">
<link rel="stylesheet" href="front/bootstrap.css">
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style type="text/css">
@media ( max-width : 768px) {
	#userup_sub1 {
		font-size: 30px;
		text-decoration-line: underline;
		text-decoration-color: #FFD400;
	}
	#userup_tab1 {
		width: 100%;
	}
	.userup_tr {
		height: 100px;
	}
	#userup_tr5 {
		height: 160px;
	}
	.userup_input:focus {
		border: 3px solid #FFD400;
		outline: none;
	}
	.userup_input {
		width: 220px;
		border: 0;
	}
	#userup_td1, #userup_td3, #userup_td5, #userup_td7, #userup_td9,
		#userup_td11, #userup_td13 {
		width: 150px;
	}
	.tab_span {
		font-size: 20px;
		text-decoration-line: underline;
		text-decoration-color: #FFD400;
	}
	.userup_addr {
		background-color: #FFD400;
		border: 0;
		width: 100px;
		height: 40px;
		border-radius: 10%;
		color: white;
	}
	.userup_btn {
		background-color: #FFD400;
		border: 0;
		width: 100px;
		height: 40px;
		border-radius: 10%;
		color: white;
	}
}

@media ( min-width : 769px) {
	#userup_sub1 {
		font-size: 30px;
		text-decoration-line: underline;
		text-decoration-color: #FFD400;
	}
	#userup_tab1 {
		width: 100%;
	}
	.userup_tr {
		height: 100px;
	}
	#userup_tr5 {
		height: 160px;
	}
	.userup_input:focus {
		border: 3px solid #FFD400;
		outline: none;
	}
	.userup_input {
		width: 220px;
		border: 0;
		height: 50px;
	}
	#userup_td1, #userup_td3, #userup_td5, #userup_td7, #userup_td9,
		#userup_td11, #userup_td13 {
		width: 150px;
	}
	.tab_span {
		font-size: 20px;
		text-decoration-line: underline;
		text-decoration-color: #FFD400;
	}
	.userup_addr {
		background-color: #FFD400;
		border: 0;
		width: 100px;
		height: 40px;
		border-radius: 10%;
		color: white;
	}
	.userup_btn {
		background-color: #FFD400;
		border: 0;
		width: 100px;
		height: 40px;
		border-radius: 10%;
		color: white;
	}
}
</style>
</head>
<body>
	<div class="container">
		<span id="userup_sub1">회원정보 수정 및 조회</span>
		<hr>
	</div>
	<br>
	<div class="container">
		<form action="userUpdateAction">
			<table id="userup_tab1">
				<tr class="userup_tr" id="userup_tr1">
					<td id="userup_td1"><span class="tab_span">아이디</span></td>
					<td id="userup_td2"><input type="text" readonly="readonly"
						placeholder="<%=vo.getUser_id()%>" class="userup_input"></td>
				</tr>
				<tr class="userup_tr" id="userup_tr2">
					<td id="userup_td3"><span class="tab_span">이름</span></td>
					<td id="userup_td4"><input type="text" readonly="readonly"
						placeholder="<%=vo.getUser_name()%>" class="userup_input"></td>
				</tr>
				<tr class="userup_tr" id="userup_tr3">
					<td id="userup_td5"><span class="tab_span">비밀번호</span></td>
					<td id="userup_td6"><input type="password" name="user_pw"
						placeholder="영문 숫자 조합으로 최대 8자" class="userup_input">
						<div class="invalid-feedback">비밀번호가 일치하지 않습니다.</div></td>
				</tr>
				<tr class="userup_tr" id="userup_tr4">
					<td id="userup_td7"><span class="tab_span">비밀번호 확인</span></td>
					<td id="userup_td8"><input type="password"
						placeholder="비밀번호를 재입력해주세요" class="userup_input">
						<div class="invalid-feedback">비밀번호가 일치하지 않습니다.</div></td>
				</tr>
				<tr class="userup_tr" id="userup_tr5">
					<td id="userup_td9"><span class="tab_span">주소</span></td>
					<td id="userup_td10"><input type="text" id="sample4_postcode"
						placeholder="<%=vo.getUser_addr1()%>" name="user_addr1"
						class="userup_input"> <input type="button"
						onclick="sample4_execDaumPostcode()" value="주소 변경" name="M_ADDR"
						class="userup_addr"><br> <input type="text"
						id="sample4_roadAddress" placeholder="<%=vo.getUser_addr2()%>"
						name="user_addr2" class="userup_input"> <input type="text"
						id="sample4_jibunAddress" placeholder="<%=vo.getUser_addr3()%>"
						name="user_addr3" class="userup_input"> <span id="guide"
						style="color: #999; display: none"></span> <input type="text"
						id="sample4_detailAddress" placeholder="<%=vo.getUser_addr4()%>"
						name="user_addr4" class="userup_input"> <input type="text"
						id="sample4_extraAddress" placeholder="참고항목" class="userup_input"></td>
				</tr>
				<tr class="userup_tr" class="userup_td" id="userup_tr6">
					<td id="userup_td11"><span class="tab_span">핸드폰번호</span></td>
					<td id="userup_td12"><input type="text"
						placeholder="<%=vo.getUser_tel()%>" readonly="readonly"
						class="userup_input">
				</tr>
				<tr class="userup_tr" id="userup_tr7">
					<td class="userup_td" id="userup_td13"><span class="tab_span">이메일</span></td>
					<td class="userup_td" id="userup_td14"><input type="text"
						name="user_email" placeholder="<%=vo.getUser_email()%>"
						readonly="readonly" class="userup_input"></td>
				</tr>

				<tr>
					<td><span>관심 카테고리</span></td>
					<td><select id="userup_cate1" name="user_cate">
							<option selected value="<%=vo.getUser_cate()%>">변경안함</option>
							<option value="예체능">예체능</option>
							<option value="공예">공예</option>
							<option value="사무">사무</option>
							<option value="라이프스타일">라이프스타일</option>
							<option value="IT">IT</option>
							<option value="기타">기타</option>


					</select></td>


				</tr>
			</table>
			<br>
			<button type="submit" class="userup_btn">수정완료</button>
			<button type="button" onclick="location.href='userDeleteAction'"
				class="userup_btn">회원탈퇴</button>
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

		//비밀번호 매칭
		function checkMatch(p, pre, passre) {
			let pval = p;
			console.log(pval);
			let pvalre = pre;
			console.log(pvalre);
			let res = true;
			if (pval != pvalre) {
				passre.nextAll("div.invalid-feedback").text("비밀번호가 일치하지 않습니다.")
						.show();
				passre.nextAll("div.valid-feedback").hide();
				res = false;
			} else {
				passre.nextAll("div.valid-feedback").text("비밀번호가 일치합니다.")
						.show();
				passre.nextAll("div.invalid-feedback").hide();
			}
			return res;
		}
	</script>



</body>
</html>