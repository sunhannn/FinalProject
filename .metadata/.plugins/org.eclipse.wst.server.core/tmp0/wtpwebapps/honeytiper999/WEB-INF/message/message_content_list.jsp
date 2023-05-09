<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
$('.content_img').click(function(event){
    event.stopPropagation();
    $(this).siblings("div").toggle();
});

$(document).click(function(){
	$('.content_img').siblings("div").hide();
});
</script>
<c:forEach var="tmp" items="${clist }">
	<c:choose>
		<c:when test="${sessionScope.user_id ne tmp.message_send_id }">
		<!-- 받은 메세지 -->
		<div class="incoming_msg">
			<div class="incoming_msg_img">
					 <c:choose>
					 	<c:when test="${tmp.message_send_id eq '여왕벌'}">
					 		<a href="#modal1" rel="modal:open">
						 		<img class="content_img" src="front/profile/admin.png" alt="관리자" >
						 	</a>
						 	<div id="modal1" class="modal">
						 		<img src="front/profile/admin.png" alt="관리자" >
						 	</div>
						</c:when>
					 	<c:otherwise>
					 	<div class="chat_img_div">
<!-- 						 	<a href="#modal2" rel="modal:open" > -->
						 		<img class="content_img" src="front/profile/${tmp.tiper_img}" alt="${tmp.message_send_id }" >
<!-- 						 	</a> -->
						 		<div id="modal2" class="modal">
						 			<button class="modal_close" type="button"><i class="fa fa-close" aria-hidden="true"></i></button>
				 					<img class="modal_img" src="front/profile/${tmp.tiper_img}" alt="${tmp.message_send_id }" >
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