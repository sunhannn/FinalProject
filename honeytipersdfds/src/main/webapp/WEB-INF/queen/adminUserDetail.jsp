<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../queen/adminNavbar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>꿀TIPer 관리자 - 회원 상세 정보</title>
<link href="${pageContext.request.contextPath}/front/adminUserDetail.css" rel="stylesheet">
</head>
<body>
	<div class="container">
		<div style="margin: 40px 0;">
			<span id="userName">회원상세정보</span>
			<button type="button" onclick="location.href='listuser'">목록가기</button>
		</div>

		<table>
			<tr>
				<td class="td_left">아이디</td>
				<td class="td_right">${getUser.user_id }</td>
			</tr>
			<tr>
				<td class="td_left">이름</td>
				<td class="td_right">${getUser.user_name }</td>
			</tr>
			<tr>
				<td class="td_left">주소</td>
				<td class="td_right">${getUser.user_addr2}${getUser.user_addr3}${getUser.user_addr4}</td>
			</tr>
			<tr>
				<td class="td_left">전화번호</td>
				<td class="td_right">${getUser.user_tel }</td>
			</tr>
			<tr>
				<td class="td_left">이메일</td>
				<td class="td_right">${getUser.user_email }</td>
			</tr>
			<tr>
				<td class="td_left">관심TIP</td>
				<td class="td_right">${getUser.user_cate }</td>
			</tr>

		</table>

	</div>
</body>
</html>