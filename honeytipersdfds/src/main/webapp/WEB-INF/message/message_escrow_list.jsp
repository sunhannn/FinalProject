<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script></script>
	<c:forEach var="lesson" items="${list }">
		<option class="select_option" value="${lesson.escrow_lesson_num}"><p style="display: none" class="lesson_title">${lesson.lesson_title}</p></option><input class="tiper_code" value="${lesson.escrow_tiper_code }" style="display: none;"><input class="escrow_status" value="${lesson.escrow_status }" style="display: none;">
	</c:forEach>