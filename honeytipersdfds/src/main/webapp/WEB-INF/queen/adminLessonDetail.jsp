<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../queen/adminNavbar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>꿀TIPer 관리자 - 강의 상세보기</title>
</head>
<link href="${pageContext.request.contextPath}/front/adminLessonDetail.css" rel="stylesheet">

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

	function openModal() {
		var modal = document.getElementById("myModal");
		var modalImg = document.getElementById("modalImg");
		modal.style.display = "block";
		modalImg.src = "${pageContext.request.contextPath}/front/lesson/${getLesson.lesson_img}";
	}

	function closeModal() {
		var modal = document.getElementById("myModal");
		modal.style.display = "none";
	}
</script>

<body>
	<div class="container">
		<div style="margin: 40px 0;">
			<span id="lessonName">강의 상세정보</span>
			<button type="button" onclick="location.href='listlesson'">목록가기</button>
		</div>

		<table>
			<tr>
				<td class="td_left">강의이미지</td>
				<td class="td_right" style="text-align: center;"><img onerror="this.src='${pageContext.request.contextPath}/front/default.png'" 
					style="width: 300px; height: 300px; cursor: pointer;"
					src="${pageContext.request.contextPath}/front/lesson/${getLesson.lesson_img}"
					alt="${getLesson.lesson_img}" title="${getLesson.lesson_img}"
					onclick="openModal()"></td>
			</tr>
			<tr>
				<td class="td_left">강의명</td>
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

	<div id="myModal" class="modal">
		<span class="close" onclick="closeModal()">&times;</span> <img onerror="this.src='${pageContext.request.contextPath}/front/default.png'" 
			class="modal-content" id="modalImg">
	</div>


	<br>


</body>
</html>