<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="${pageContext.request.contextPath}/front/message_content_list.js"></script>
<c:forEach var="tmp" items="${clist }">
	<c:choose>
		<c:when test="${sessionScope.user_id ne tmp.message_send_id }">
		<!-- 받은 메세지 -->
		<div class="incoming_msg">
			<div class="incoming_msg_img">
					 <c:choose>
					 	<c:when test="${tmp.message_send_id eq 'admin'}">
						 		<img onerror="this.src='${pageContext.request.contextPath}/front/default.png'" class="content_img" src="${pageContext.request.contextPath}/front/profile/admin.png" alt="관리자" >
<!-- 						 		<img class="content_img" src="front/profile/admin.png" alt="관리자" > -->
						</c:when>
					 	<c:otherwise>
					 	<div class="chat_img_div">
<!-- 						 	<a href="#modal2" rel="modal:open" > -->
						 		<img onerror="this.src='${pageContext.request.contextPath}/front/default.png'" class="content_img" src="${pageContext.request.contextPath}/front/profile/${tmp.tiper_img}" alt="${tmp.message_send_id }" >
<%-- 						 		<img class="content_img" src="front/profile/${tmp.tiper_img}" alt="${tmp.message_send_id }" > --%>
						 		<p class="msg_send_id">${tmp.message_send_id }</p>
<!-- 						 	</a> -->
						 		<div id="modal2" class="modal">
						 			<button class="modal_close" type="button"><i class="fa fa-close" aria-hidden="true"></i></button>
				 					<img onerror="this.src='${pageContext.request.contextPath}/front/default.png'" class="modal_img" src="${pageContext.request.contextPath}/front/profile/${tmp.tiper_img}" alt="${tmp.message_send_id }" >
<%-- 				 					<img class="modal_img" src="front/profile/${tmp.tiper_img}" alt="${tmp.message_send_id }" > --%>
				 				</div>
		 				</div>
					 	</c:otherwise>
					 </c:choose>
				
			</div>
			<div class="received_msg">
				<div class="received_withd_msg">
					<pre>${tmp.message_cont }</pre>
					<span class="time_date"> ${tmp.message_send_time }</span>
				</div>
			</div>
		</div>
		</c:when>
		
		<c:otherwise>
		<!-- 보낸 메세지 -->
		<div class="outgoing_msg">
			<div class="sent_msg">
				<pre>${tmp.message_cont }</pre>
				<span class="time_date"> ${tmp.message_send_time }</span>
			</div>
		</div>
		</c:otherwise>
	</c:choose>
</c:forEach>
		
<%-- 	<c:forEach var="lesson" items="${list }"> --%>
<%-- 		<option class="select_option" value="${lesson.escrow_lesson_num}"><p style="display: none" class="lesson_title">${lesson.lesson_title}</p></option><input class="tiper_code" value="${lesson.escrow_tiper_code }" style="display: none;"><input class="escrow_status" value="${lesson.escrow_status }" style="display: none;"> --%>
<%-- 	</c:forEach> --%>