<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>꿀TIPer - Message</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">
<!-- CSS File -->
<link href="${pageContext.request.contextPath}/front/message.css" rel="stylesheet">
<!-- <link href="./resources/css/navbar.css" rel="stylesheet"> -->

<!-- 메세지 전송 아이콘(종이비행기) 때문에 필요 -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"
	type="text/css" rel="stylesheet" />


<script src="http://code.jquery.com/jquery-latest.js"></script>
<style>
body {
    overscroll-behavior-y: none;
}
</style>
</head>

<body>

	<!-- 메뉴바 
       현재페이지 뭔지 param.thisPage에 넣어서 navbar.jsp에  던짐 -->
	<%-- 	<jsp:include page="../include/navbar.jsp"> --%>
	<%-- 		<jsp:param value="message" name="thisPage" /> --%>
	<%-- 	</jsp:include> --%>


	<div class="msg-container">
		<div class="messaging">
			<div class="inbox_msg">
				<!-- 메세지 목록 영역 -->
				<div class="inbox_people">
					<div class="headind_srch">
						<div class="recent_heading">
							<img onerror="this.src='${pageContext.request.contextPath}/front/default.png'" class="message_logo" src="${pageContext.request.contextPath}/front/LOGO.png">
							<h4>Message</h4>
							<img onerror="this.src='${pageContext.request.contextPath}/front/default.png'" title="새로고침" alt="message reload" class="msg_list_reload" src="${pageContext.request.contextPath}/front/reload.png">
						</div>
						<!-- 메세지 검색 -->
						<div class="srch_bar">
							<div class="stylish-input-group">
								<input id="search_id" type="text" class="search-bar"
									placeholder="ID검색"> <span class="input-group-addon">
									<i class="fa fa-search" aria-hidden="true"></i>
								</span>
							</div>
						</div>
					</div>

					<!-- 메세지 리스트 -->
					<div class="inbox_chat"></div>
				</div>

				<!-- 메세지 내용 영역 -->
				<div class="mesgs">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left-square-fill" viewBox="0 0 16 16">
				  <path d="M16 14a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12zm-4.5-6.5H5.707l2.147-2.146a.5.5 0 1 0-.708-.708l-3 3a.5.5 0 0 0 0 .708l3 3a.5.5 0 0 0 .708-.708L5.707 8.5H11.5a.5.5 0 0 0 0-1z"/>
				</svg>
					<!-- 메세지 내용 목록 -->
					<div class="msg_history" name="contentList">
						<!-- 메세지 내용이 올 자리 -->
					</div>
<!-- 					<div class="modal_price_input"> -->
<!-- 						<div style='display: none' id='price_modal' data-backdrop='static' -->
<!-- 							class='modal'> -->
<!-- 							<select class="escrow_lesson_title" name="lesson_num" size="1" -->
<!-- 								required="required"> -->
<!-- 							</select> -->
<!-- 							<button class="modal_close" type="button"> -->
<!-- 								<i class="fa fa-close" aria-hidden="true"></i> -->
<!-- 							</button> -->
<!-- 							<p class='price_p'>아래 입력란에 협의된 포인트를 입력해주세요.</p> -->
<!-- 							<input required="required" autofocus id='price_modal_input' class='price_input' type='number' -->
<!-- 								placeholder='&nbsp;숫자만 입력 가능합니다.'> -->
<!-- 							<button id='price_send_btn' type='button'> -->
<!-- 								<i class='fa fa-paper-plane-o' aria-hidden='true'></i> -->
<!-- 							</button> -->
<!-- 						</div> -->
<!-- 					</div> -->
					<div class="send_message">
						<!-- 메세지 입력란이 올자리 -->
					</div>
				</div>
			</div>

		</div>
	</div>

	<script>
	
    
	// 가장 처음 메세지 리스트를 가져온다.
	const FirstMessageList = function(send_btn){
		$.ajax({
			url:"message_ajax_list",
			method:"get",
			data:{
				send_btn : send_btn
			},
			success:function(data){
				console.log("메세지 리스트 리로드 성공");
				console.log('data: ',data);
				$('.inbox_chat').html(data.replaceAll("[<@전수일>]","<p class='start_date'>꿀TIP 전수일<br>").replaceAll("[<@강의명>]", "</p><pre class='lesson_title'><svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-receipt-cutoff' viewBox='0 0 16 16'><path d='M3 4.5a.5.5 0 0 1 .5-.5h6a.5.5 0 1 1 0 1h-6a.5.5 0 0 1-.5-.5zm0 2a.5.5 0 0 1 .5-.5h6a.5.5 0 1 1 0 1h-6a.5.5 0 0 1-.5-.5zm0 2a.5.5 0 0 1 .5-.5h6a.5.5 0 1 1 0 1h-6a.5.5 0 0 1-.5-.5zm0 2a.5.5 0 0 1 .5-.5h6a.5.5 0 0 1 0 1h-6a.5.5 0 0 1-.5-.5zm0 2a.5.5 0 0 1 .5-.5h6a.5.5 0 0 1 0 1h-6a.5.5 0 0 1-.5-.5zM11.5 4a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1zm0 2a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1zm0 2a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1zm0 2a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1zm0 2a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1z'/><path d='M2.354.646a.5.5 0 0 0-.801.13l-.5 1A.5.5 0 0 0 1 2v13H.5a.5.5 0 0 0 0 1h15a.5.5 0 0 0 0-1H15V2a.5.5 0 0 0-.053-.224l-.5-1a.5.5 0 0 0-.8-.13L13 1.293l-.646-.647a.5.5 0 0 0-.708 0L11 1.293l-.646-.647a.5.5 0 0 0-.708 0L9 1.293 8.354.646a.5.5 0 0 0-.708 0L7 1.293 6.354.646a.5.5 0 0 0-.708 0L5 1.293 4.354.646a.5.5 0 0 0-.708 0L3 1.293 2.354.646zm-.217 1.198.51.51a.5.5 0 0 0 .707 0L4 1.707l.646.647a.5.5 0 0 0 .708 0L6 1.707l.646.647a.5.5 0 0 0 .708 0L8 1.707l.646.647a.5.5 0 0 0 .708 0L10 1.707l.646.647a.5.5 0 0 0 .708 0L12 1.707l.646.647a.5.5 0 0 0 .708 0l.509-.51.137.274V15H2V2.118l.137-.274z'/></svg>견적서<br>").replaceAll("[<@/강의명>]", "</pre>").replaceAll("[<@가격>]", "<br><p class='lesson_price'>").replaceAll("[<@/전수일>]", "<br>").replaceAll("[<@/가격|버튼>]", "</p><button type='button' class='accept_btn'>수락하기</button><input class='escrow_lesson_num' type='hidden' value='").replaceAll("[<@/버튼|코드>]", "'><input class='escrow_tiper_code' type='hidden' value='").replaceAll("[<@/코드>]", "'><input class='escrow_status' value='").replaceAll("[<@status>]","' style='display: none;'>"));
// 				$('.inbox_chat').html(data.replaceAll('&lt;','<').replaceAll('&gt;','>'));
// 				console.log("data : "+data);
// 				$('.lesson_title').prepend('<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-receipt-cutoff" viewBox="0 0 16 16"><path d="M3 4.5a.5.5 0 0 1 .5-.5h6a.5.5 0 1 1 0 1h-6a.5.5 0 0 1-.5-.5zm0 2a.5.5 0 0 1 .5-.5h6a.5.5 0 1 1 0 1h-6a.5.5 0 0 1-.5-.5zm0 2a.5.5 0 0 1 .5-.5h6a.5.5 0 1 1 0 1h-6a.5.5 0 0 1-.5-.5zm0 2a.5.5 0 0 1 .5-.5h6a.5.5 0 0 1 0 1h-6a.5.5 0 0 1-.5-.5zm0 2a.5.5 0 0 1 .5-.5h6a.5.5 0 0 1 0 1h-6a.5.5 0 0 1-.5-.5zM11.5 4a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1zm0 2a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1zm0 2a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1zm0 2a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1zm0 2a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1z"/><path d="M2.354.646a.5.5 0 0 0-.801.13l-.5 1A.5.5 0 0 0 1 2v13H.5a.5.5 0 0 0 0 1h15a.5.5 0 0 0 0-1H15V2a.5.5 0 0 0-.053-.224l-.5-1a.5.5 0 0 0-.8-.13L13 1.293l-.646-.647a.5.5 0 0 0-.708 0L11 1.293l-.646-.647a.5.5 0 0 0-.708 0L9 1.293 8.354.646a.5.5 0 0 0-.708 0L7 1.293 6.354.646a.5.5 0 0 0-.708 0L5 1.293 4.354.646a.5.5 0 0 0-.708 0L3 1.293 2.354.646zm-.217 1.198.51.51a.5.5 0 0 0 .707 0L4 1.707l.646.647a.5.5 0 0 0 .708 0L6 1.707l.646.647a.5.5 0 0 0 .708 0L8 1.707l.646.647a.5.5 0 0 0 .708 0L10 1.707l.646.647a.5.5 0 0 0 .708 0L12 1.707l.646.647a.5.5 0 0 0 .708 0l.509-.51.137.274V15H2V2.118l.137-.274z"/></svg>');
				
				// 메세지 리스트중 하나를 클릭했을 때
				$('.chat_list').on('click', function(){
					let message_room = $(this).attr('message_room');
					let other_user_id = $(this).attr('other-user_id'); //**ohter-nick
					let user_role = $(this).attr('user_role');
					console.log('user_role',user_role);
					// 선택한 메세지빼고 나머지는 active 효과 해제하기
					$('.chat_list_box').not('.chat_list_box.chat_list_box'+message_room).removeClass('active_chat');
					// 선택한 메세지만 active 효과 주기
					$('.chat_list_box'+message_room).addClass('active_chat');
					let send_msg = "";
					send_msg +="<div class='type_msg'>";
			      	send_msg +="<div class='input_msg_write row'>";
			      	if($(this).attr('other-user_id') == 'admin'){
				      	send_msg +="<div class='col-11'>";
				      	send_msg +="<textarea id='admin_msg' class='write_msg form-control' maxlength='800' color='red' readonly='readonly'>&nbsp;여왕벌은 메세지를 받을 수 없어요.</textarea>";
				      	send_msg +="</div>";
				      	send_msg +="<div class='col-1'>";
// 				      	send_msg +="<button class='msg_send_btn' disabled='disabled' type='button'><i class='fa fa-paper-plane-o' aria-hidden='true'></i></button>";
				      	send_msg +="</div>";
			      	}else{
// 			      		send_msg +="<button class='msg_send_btn' type='button'><i class='fa fa-paper-plane-o' aria-hidden='true'></i></button>";
			      		send_msg +="<div class='col-11'>";
				      	
				      	//가격 입력창 띄우는 버튼
						if(user_role == 1){
					      	send_msg +="<button title='견적보내기' id='price_btn' type='button' class='btn btn-secondary'>";
					      	send_msg +="<svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-calculator' viewBox='0 0 16 16'>";
					      	send_msg +="<path d='M12 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h8zM4 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H4z'></path>";
					      	send_msg +="<path d='M4 2.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-.5.5h-7a.5.5 0 0 1-.5-.5v-2zm0 4a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm0 3a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm0 3a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm3-6a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm0 3a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm0 3a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm3-6a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm0 3a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v4a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-4z'></path>";
					      	send_msg +="</svg>";
					      	send_msg +="</button>";
						}				      	
					      	send_msg +="<textarea class='write_msg form-control' autofocus maxlength='800' placeholder='&nbsp;메세지를 입력해주세요.&#13;&#10;&nbsp;800자까지 전송 가능합니다.'></textarea>";
					      	send_msg +="<button class='msg_send_btn' type='button'><i class='fa fa-paper-plane-o' aria-hidden='true'></i></button>";
					      	send_msg +="</div>";
					      	
					      	send_msg +="<div class='modal_price_input'>";
					      	send_msg +="<div style='display: none' id='price_modal' data-backdrop='static' class='modal'>";
						      	send_msg +="<select class='escrow_lesson_title' name='lesson_num' size='1' required='required'></select>";
						      	send_msg +="<label class='escrow_start_lb' for='escrow_start'>꿀TIP 전수할 날짜:</label>";
						      	send_msg +="<input max='2123-12-31' type='date' id='escrow_start' class='escrow_start' required='required'>";
						      	send_msg +="<div class='price_input_div'>";
						      	send_msg +="<div class='price_send_div'>";
						      	send_msg +="<p class='price_p'>아래 입력란에 제시할 허니페이를<br>입력해주세요.</p>";
						      	send_msg +="</div>";
						      	send_msg +="<input onKeyup='this.value=this.value.replace(/[^-0-9]/g,&#39;&#39;)' autofocus id='price_modal_input' class='price_input' placeholder='&nbsp;숫자만 입력 가능합니다.'>";
						      	send_msg +="<button id='price_send_btn' type='button'><i class='fa fa-paper-plane-o' aria-hidden='true'></i></button>";
						      	send_msg +="</div>";
						      	send_msg +="<button class='modal_close' type='button'><i class='fa fa-close' aria-hidden='true'></i></button>";
					      	send_msg +="</div>";
				      	send_msg +="</div>";
						

					      	
// 					      	send_msg +="<div class='col-1'>";
// 					      	send_msg +="<button class='msg_send_btn' type='button'><i class='fa fa-paper-plane-o' aria-hidden='true'></i></button>";
// 					      	send_msg +="</div>";
			      	}
			      	send_msg +="</div>";
			      	send_msg +="</div>";
			      	
			    
					// 메세지 입력, 전송 칸을 보인다.
					$('.send_message').html(send_msg);
					$('.write_msg').focus();
					

					// 일반회원과 admin인 경우 메세지입력창 키움
					if(user_role == 0 || user_role == 2){
			      		var isMobile = /Android|webOS|iPhone|iPad|iPod|BlackBerry/i.test(navigator.userAgent) ? true : false;

							if(isMobile) {
								$('.write_msg').width('240px');
								$(".msg_history").scrollTop($(".msg_history")[0].scrollHeight);
							}else{
								$('.write_msg').width('350px');
								$(".msg_history").scrollTop($(".msg_history")[0].scrollHeight);
							}
					}
					
					$('.write_msg').focus(function(){
						var isMobile = /Android|webOS|iPhone|iPad|iPod|BlackBerry/i.test(navigator.userAgent) ? true : false;
						if(isMobile) {
// 							$('.msg_history').css('height', '48%');	
							$(".msg_history").scrollTop($(".msg_history")[0].scrollHeight);
						}
					});
					
					// 메세지 전송버튼을 눌렀을 때
					$('.msg_send_btn').on('click',function(){
						// 메세지 전송 함수 호출
						SendMessage(message_room, other_user_id, send_btn);
					});
					
					$('#price_send_btn').on('click',function(){
						SendPrice(message_room, other_user_id, send_btn);
					});
					
					$('#price_btn').on('click',function(){
						select_lesson(message_room, other_user_id, send_btn);
					});
					
					$('.msg_list_reload').click(function(){
						MessageList(message_room, other_user_id, send_btn);
					});
					
					// 메세지 내용을 불러오는 함수 호출
					MessageContentList(message_room, other_user_id, send_btn);
				});
			}
		});
	};
	
	
	$(document).ready(function(){
		FirstMessageList(3);
		
		var isMobile = /Android|webOS|iPhone|iPad|iPod|BlackBerry/i.test(navigator.userAgent) ? true : false;

		$('.write_msg').focus(function(){
			if(isMobile) {
// 				$('.msg_history').css('height', '48%');	
				$(".msg_history").scrollTop($(".msg_history")[0].scrollHeight);
			}
		});
	});
	
	$('.chat_list_box').click(function(){
		$('.mesgs').show(400);
		$('.inbox_people').hide(400);
	});
	
	$('.bi-arrow-left-square-fill').click(function(){
		$('.mesgs').hide(400);
		$('.inbox_people').show(400);
	});
	
	
  	
	</script>
	<!-- 외부 js -->
	<script src="${pageContext.request.contextPath}/front/message.js"></script>
</body>
</html>