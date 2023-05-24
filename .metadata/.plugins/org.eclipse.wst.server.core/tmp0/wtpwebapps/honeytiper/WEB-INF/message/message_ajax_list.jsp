<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<script src="${pageContext.request.contextPath}/front/message_ajax_list.js"></script>
<c:forEach var="tmp" items="${list }">
	<div class="chat_list_box${tmp.message_room } chat_list_box">
		<div type="button" class="chat_list" message_room="${tmp.message_room }" other-user_id="${tmp.other_user_id }" user_role="${tmp.user_role }">
			<!-- active-chat -->
			<div class="chat_people">
				<div class="chat_img">
					 <c:choose>
					 	<c:when test="${tmp.other_user_id eq 'admin'}">
							 	<img onerror="this.src='${pageContext.request.contextPath}/front/default.png'" class="list_img" src="${pageContext.request.contextPath}/front/profile/admin.png" alt="관리자">
<!-- 							 	<img class="list_img" src="front/profile/admin.png" alt="관리자"> -->
						</c:when>
					 	<c:otherwise>
							<div class="chat_img_div">
						 		<img onerror="this.src='${pageContext.request.contextPath}/front/default.png'" class="list_img" src="${pageContext.request.contextPath}/front/profile/${tmp.tiper_img}" alt="${tmp.other_user_id }">
<%-- 						 		<img class="list_img" src="front/profile/${tmp.tiper_img}" alt="${tmp.other_user_id }"> --%>
<!-- 							 	</a> -->
								<div id="${tmp.other_user_id }" class="modal">
								  <button class="modal_close" type="button"><i class="fa fa-close" aria-hidden="true"></i></button>
								  <img onerror="this.src='${pageContext.request.contextPath}/front/default.png'" class="modal_img" src="${pageContext.request.contextPath}/front/profile/${tmp.tiper_img}" alt="${tmp.other_user_id }">
<%-- 								  <img class="modal_img" src="front/profile/${tmp.tiper_img}" alt="${tmp.other_user_id }"> --%>
								</div>
							</div>
					 	</c:otherwise>
					 </c:choose>
				</div>
				<div class="chat_ib">
					<h5>${tmp.other_user_id }<span class="chat_date">${tmp.message_send_time }</span>
					</h5>
					<div class="row">
						<div class="col-10">
							<pre>${tmp.message_cont}</pre>
						</div>
						<%-- 만약 현재사용자가 안읽은 메세지 갯수가 0보다 클때만 badge를 표시한다. --%>
						<c:if test="${tmp.unread > 0 }">
							<div class="col-2 unread${tmp.message_room }">
								<span class="badge">${tmp.unread }</span>
							</div>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
</c:forEach>
