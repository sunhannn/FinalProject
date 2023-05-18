<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../queen/adminNavbar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
body {
	font-family: Arial, sans-serif;
	font-size: 14px;
	line-height: 1.5;
	margin: 0;
	padding: 0;
}

.container {
	width: 65%;
	margin: 0 auto;
}

/* Style the title */
#userName {
	font-size: 24px;
	font-weight: bold;
	margin: 10px;
}

/* Style the table */
table {
	border-collapse: collapse;
	width: 100%;
}

table td {
	border: 1px solid #ccc;
	padding: 10px;
}

table textarea {
	width: 100%;
	height: 70px;
	font-size: 14px;
}

#contSpace {
	width: 100%;
	height: 600px;
}

/* Style the buttons */
button {
	border-style: none;
	background: #FFD400;
	color: #5c3b0c;
	margin: 5px;
	padding: 5px 18px;
	cursor: pointer;
	float: right;
	font-size: 12pt;
	font-weight: bolder;
	border-radius: 5px;
}

button:hover {
	background-color: #E6B800;
}

/* Style the radio buttons */
input[type="radio"] {
	margin-right: 10px;
}

/* Style the form */
form {
	margin: 10px;
}

.td_left {
	color: #474747;
  	border-spacing: 0 10px;  
	width: 150px;
  	background: #F5F5F5; 
	text-align: center;
 	border-width: 1px; 
 	border-top-style: solid; 
	border-right-style: none;
	border-left-style: none;
  	border-color: #ddd;
 	font-weight: bold;
}

.td_right {
	padding-left:20px;
/* 	width: 300px; */
	height: 50px;
	background: white;
 	border-width: 1px; 
 	border-top-style: solid;
	border-right-style:none;
	border-left-style:none;
 	border-color: #ddd;
}
</style>

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