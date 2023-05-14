<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>꿀TIPer Message</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">
<!-- CSS File -->
<link href="front/message.css" rel="stylesheet">
<!-- <link href="./resources/css/navbar.css" rel="stylesheet"> -->

<!-- 메세지 전송 아이콘(종이비행기) 때문에 필요 -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"
	type="text/css" rel="stylesheet" />

</head>

<body>
	<script src="http://code.jquery.com/jquery-latest.js"></script>

	<!-- 메뉴바 
       현재페이지 뭔지 param.thisPage에 넣어서 navbar.jsp에  던짐 -->
	<%-- 	<jsp:include page="../include/navbar.jsp"> --%>
	<%-- 		<jsp:param value="message" name="thisPage" /> --%>
	<%-- 	</jsp:include> --%>

	<!-- 	<input type='button' value='open' onclick='call_parent()' /> -->
	<div class="msg-container">

		<div class="messaging">
			<div class="inbox_msg">
				<!-- 메세지 목록 영역 -->
				<div class="inbox_people">
					<div class="headind_srch">
						<div class="recent_heading">
							<h4>Message</h4>
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
					<!-- 메세지 내용 목록 -->
					<div class="msg_history" name="contentList">
						<!-- 메세지 내용이 올 자리 -->
					</div>
					<div class="modal_price_input">
						<div style='display: none' id='price_modal' data-backdrop='static'
							class='modal'>
							<select class="escrow_lesson_title" name="lesson_num" size="1" required="required">
							</select>
							<button class="modal_close" type="button">
								<i class="fa fa-close" aria-hidden="true"></i>
							</button>
							<p class='price_p'>아래 입력란에 협의된 포인트를 입력해주세요.</p>
							<input autofocus id='price_modal_input' class='price_input' type='number'
								placeholder='&nbsp;숫자만 입력 가능합니다.'>
							<button class='price_send_btn' type='button'>
								<i class='fa fa-paper-plane-o' aria-hidden='true'></i>
							</button>
						</div>
					</div>
					<div class="send_message">
						<!-- 메세지 입력란이 올자리 -->
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
	var child_value;

    function child_function(){
		let other_user_id = child_value_id; //**ohter-nick
		let message_room = child_value_room;
		let send_btn = child_value_send_btn;
		console.log("other_user_id",other_user_id);
        FirstMessageList(message_room, other_user_id, send_btn);
    }
    
    // opener 로 부모창에 접근하여 popup이라는 자식창 속성을 주입
    // (부모창에 popup 변수 선언 안해도 사용 가능) 
    opener.popup = this;
	

	// 가장 처음 메세지 리스트를 가져온다.
	const FirstMessageList = function(message_room, other_user_id, send_btn){
		$.ajax({
			url:"message_ajax_list",
			method:"get",
			data:{
				message_room : message_room,
				other_user_id : other_user_id,
				send_btn : send_btn
			},
			success:function(data){
				
				console.log("메세지 리스트 리로드 성공");
				console.log('data: ',data);
				
				$('.inbox_chat').html(data);
				let message_room = $('.chat_list').attr('message_room');
				let user_role = $('.chat_list').attr('user_role');
				
				console.log("user_role?",user_role);
				
				console.log("메세지룸?:",message_room);
				console.log("아이디?:",other_user_id);
				console.log("보내기버튼?:",send_btn);
				
					// 선택한 메세지빼고 나머지는 active 효과 해제하기
					$('.chat_list_box').not('.chat_list_box.chat_list_box'+message_room).removeClass('active_chat');
					// 선택한 메세지만 active 효과 주기
					$('.chat_list_box'+message_room).addClass('active_chat');
					
					let send_msg = "";
					send_msg +="<div class='type_msg'>";
			      	send_msg +="<div class='input_msg_write row'>";
			      	if($(this).attr('other-user_id')== 'admin'){
				      	send_msg +="<div class='col-11'>";
				      	send_msg +="<textarea class='write_msg form-control' maxlength='800' color='red' readonly='readonly'>&nbsp;여왕벌은 메세지를 받을 수 없어요.</textarea>";
				      	send_msg +="</div>";
				      	send_msg +="<div class='col-1'>";
				      	send_msg +="<button class='msg_send_btn' disabled='disabled' type='button'><i class='fa fa-paper-plane-o' aria-hidden='true'></i></button>";
				      	send_msg +="</div>";
			      	}else{
							send_msg +="<div class='col-11'>";
				      	
				      	//가격 입력창 띄우는 버튼
						if(user_role == 1){
					      	send_msg +="<button id='price_btn' type='button' class='btn btn-secondary'>";
					      	send_msg +="<svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-calculator' viewBox='0 0 16 16'>";
					      	send_msg +="<path d='M12 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h8zM4 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H4z'></path>";
					      	send_msg +="<path d='M4 2.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-.5.5h-7a.5.5 0 0 1-.5-.5v-2zm0 4a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm0 3a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm0 3a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm3-6a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm0 3a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm0 3a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm3-6a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm0 3a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v4a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-4z'></path>";
					      	send_msg +="</svg>";
					      	send_msg +="</button>";
						}				      	
					      	send_msg +="<textarea class='write_msg form-control' maxlength='800' autofocus placeholder='&nbsp;메세지를 입력해주세요.&#13;&#10;&nbsp;800자까지 전송 가능합니다.'></textarea>";
					      	send_msg +="</div>";
					      	send_msg +="<div class='col-1'>";
					      	send_msg +="<button class='msg_send_btn' type='button'><i class='fa fa-paper-plane-o' aria-hidden='true'></i></button>";
					      	send_msg +="</div>";
			      	}
			      	send_msg +="</div>";
			      	send_msg +="</div>";

			          
					// 메세지 입력, 전송 칸을 보인다.
					$('.send_message').html(send_msg);
					$('.write_msg').focus();

					// 일반회원인 경우 메세지입력창 키움
			      	if(user_role == 0){
						$('.write_msg').width('350px');
					}
					
					
					// 메세지 전송버튼을 눌렀을 때
					$('.msg_send_btn').on('click',function(){
						// 메세지 전송 함수 호출
						SendMessage(message_room, other_user_id, send_btn);
					});
					
					$('.price_send_btn').on('click',function(){
						SendPrice(message_room, other_user_id, send_btn);
					});
					
					$('#price_btn').on('click',function(){
						select_lesson(message_room, other_user_id, send_btn);
					});
					
					// 메세지 내용을 불러오는 함수 호출 ***
					MessageContentList(message_room, other_user_id, send_btn);

					
					// 메세지 리스트중 하나를 클릭했을 때 
					$('.chat_list').on('click', function(){
						//alert('room : '+ $(this).attr('message_room'));
						$('.chat_ib svg').remove();
						let message_room = $(this).attr('message_room');
						let other_user_id = $(this).attr('other-user_id'); //**ohter-nick
						let user_role = $(this).attr('user_role');
						
						console.log("선택후 방",message_room+other_user_id);
						
						// 선택한 메세지빼고 나머지는 active 효과 해제하기
						$('.chat_list_box').not('.chat_list_box.chat_list_box'+message_room).removeClass('active_chat');
						
						// 선택한 메세지만 active 효과 주기
						$('.chat_list_box'+message_room).addClass('active_chat');
						
						let send_msg = "";
						send_msg +="<div class='type_msg'>";
				      	send_msg +="<div class='input_msg_write row'>";
				      	if($(this).attr('other-user_id') == 'admin'){
					      	send_msg +="<div class='col-11'>";
					      	send_msg +="<textarea class='write_msg form-control' maxlength='800' color='red' readonly='readonly'>&nbsp;여왕벌은 메세지를 받을 수 없어요.</textarea>";
					      	send_msg +="</div>";
					      	send_msg +="<div class='col-1'>";
					      	send_msg +="<button class='msg_send_btn' disabled='disabled' type='button'><i class='fa fa-paper-plane-o' aria-hidden='true'></i></button>";
					      	send_msg +="</div>";
				      	}else{
				      		send_msg +="<div class='col-11'>";
					      	
					      	//가격 입력창 띄우는 버튼
							if(user_role == 1){
						      	send_msg +="<button id='price_btn' type='button' class='btn btn-secondary'>";
						      	send_msg +="<svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-calculator' viewBox='0 0 16 16'>";
						      	send_msg +="<path d='M12 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h8zM4 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H4z'></path>";
						      	send_msg +="<path d='M4 2.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-.5.5h-7a.5.5 0 0 1-.5-.5v-2zm0 4a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm0 3a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm0 3a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm3-6a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm0 3a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm0 3a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm3-6a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm0 3a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v4a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-4z'></path>";
						      	send_msg +="</svg>";
						      	send_msg +="</button>";
							}				      	
						      	send_msg +="<textarea class='write_msg form-control' maxlength='800' autofocus placeholder='&nbsp;메세지를 입력해주세요.&#13;&#10;&nbsp;800자까지 전송 가능합니다.'></textarea>";
						      	send_msg +="</div>";
						      	send_msg +="<div class='col-1'>";
						      	send_msg +="<button class='msg_send_btn' type='button'><i class='fa fa-paper-plane-o' aria-hidden='true'></i></button>";
						      	send_msg +="</div>";
				      	}
				      	send_msg +="</div>";
				      	send_msg +="</div>";

				          
						// 메세지 입력, 전송 칸을 보인다.
						$('.send_message').html(send_msg);
						$('.write_msg').focus();
						
						// 일반회원인 경우 메세지입력창 키움
				      	if(user_role == 0){
							$('.write_msg').width('350px');
						}
						
						// 메세지 전송버튼을 눌렀을 때
						$('.msg_send_btn').on('click',function(){
							// 메세지 전송 함수 호출
							SendMessage(message_room, other_user_id, send_btn);
						});
						
						$('.price_send_btn').on('click',function(){
							SendPrice(message_room, other_user_id, send_btn);
						});
						
						$('#price_btn').on('click',function(){
							select_lesson(message_room, other_user_id, send_btn);
						});
						
						// 메세지 내용을 불러오는 함수 호출
						MessageContentList(message_room, other_user_id, send_btn);
					});
			}
		});
	}

	
	</script>
	<!-- 외부 js -->
	<script src="front/message.js"></script>
</body>
</html>