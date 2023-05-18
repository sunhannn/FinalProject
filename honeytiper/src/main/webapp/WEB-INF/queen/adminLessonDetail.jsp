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
#lessonName {
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
	padding-left: 20px;
	/* 	width: 300px; */
	height: 50px;
	background: white;
	border-width: 1px;
	border-top-style: solid;
	border-right-style: none;
	border-left-style: none;
	border-color: #ddd;
}

.sans-serif {
	font-family: sans-serif;
}

/* 자동 줄바꿈 */
#pre123 {
	white-space: pre-wrap;
}
</style>

<body>
	<div class="container">
		<div style="margin: 40px 0;">
			<span id="lessonName">강의상세정보</span>
			<button type="button" onclick="location.href='listlesson'">목록가기</button>
		</div>

		<table>
			<tr>
				<td class="td_left">강의이미지</td>
				<td class="td_right" style="text-align: center;"><img
					style="width: 300px; height: 300px;"
					src="${pageContext.request.contextPath}/front/lesson/${getLesson.lesson_img }"
					alt="${getLesson.lesson_img }" title="${getLesson.lesson_img }"></td>
			</tr>
			<tr>
				<td class="td_left">강의제목</td>
				<td class="td_right">${getLesson.lesson_title }</td>
			</tr>
			<tr>
				<td class="td_left">강사아이디</td>
				<td class="td_right">${getLesson.tiper_user_id }</td>
			</tr>
			<tr>
				<td class="td_left">강사정보</td>
				<td class="td_right">${getLesson.tiper_info }</td>
			</tr>
			<tr>
				<td class="td_left">강의정보</td>
				<td class="td_right"><pre class="sans-serif" id="pre123">${getLesson.lesson_info }</pre></td>
			</tr>
			<tr>
				<td class="td_left">강의등록일</td>
				<td class="td_right">${getLesson.lesson_date }</td>
			</tr>

		</table>
		<br>
		<button type="button" onclick="confirmDelete()">삭제하기</button>
	</div>

	<script>
		function confirmDelete() {
			if (confirm("정말 삭제하시겠습니까?")) {
				deleteLesson();
			} else {
				alert('삭제가 취소되었습니다.');
			}
		}

		function deleteLesson() {
			location.href = 'deleteLesson?lesson_num=${getLesson.lesson_num}';
		}
	</script>
	<br>


</body>
</html>