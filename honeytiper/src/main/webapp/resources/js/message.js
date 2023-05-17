	
	// 메세지함 아이디 검색
	$(document).ready(function(){
		  $("#search_id").on("keyup", function() {
		    var value = $(this).val().toLowerCase();
		    $(".chat_list > .chat_people").filter(function() {
		    	console.log();
			      $(this).parent().parent(".chat_list_box").toggle($(this).children(".chat_ib").children("h5").text().toLowerCase().indexOf(value) > -1);
		    });
		  });
	});
	
	// 메세지 리스트를 다시 가져온다.
	const MessageList = function(message_room, other_user_id, send_btn){
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
				//console.log("data메세지리스트->",data);
				//$('.inbox_chat').html(data.replaceAll("[<@강의명>]", "<pre class='lesson_title'><svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-receipt-cutoff' viewBox='0 0 16 16'><path d='M3 4.5a.5.5 0 0 1 .5-.5h6a.5.5 0 1 1 0 1h-6a.5.5 0 0 1-.5-.5zm0 2a.5.5 0 0 1 .5-.5h6a.5.5 0 1 1 0 1h-6a.5.5 0 0 1-.5-.5zm0 2a.5.5 0 0 1 .5-.5h6a.5.5 0 1 1 0 1h-6a.5.5 0 0 1-.5-.5zm0 2a.5.5 0 0 1 .5-.5h6a.5.5 0 0 1 0 1h-6a.5.5 0 0 1-.5-.5zm0 2a.5.5 0 0 1 .5-.5h6a.5.5 0 0 1 0 1h-6a.5.5 0 0 1-.5-.5zM11.5 4a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1zm0 2a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1zm0 2a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1zm0 2a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1zm0 2a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1z'/><path d='M2.354.646a.5.5 0 0 0-.801.13l-.5 1A.5.5 0 0 0 1 2v13H.5a.5.5 0 0 0 0 1h15a.5.5 0 0 0 0-1H15V2a.5.5 0 0 0-.053-.224l-.5-1a.5.5 0 0 0-.8-.13L13 1.293l-.646-.647a.5.5 0 0 0-.708 0L11 1.293l-.646-.647a.5.5 0 0 0-.708 0L9 1.293 8.354.646a.5.5 0 0 0-.708 0L7 1.293 6.354.646a.5.5 0 0 0-.708 0L5 1.293 4.354.646a.5.5 0 0 0-.708 0L3 1.293 2.354.646zm-.217 1.198.51.51a.5.5 0 0 0 .707 0L4 1.707l.646.647a.5.5 0 0 0 .708 0L6 1.707l.646.647a.5.5 0 0 0 .708 0L8 1.707l.646.647a.5.5 0 0 0 .708 0L10 1.707l.646.647a.5.5 0 0 0 .708 0L12 1.707l.646.647a.5.5 0 0 0 .708 0l.509-.51.137.274V15H2V2.118l.137-.274z'/></svg>견적서<br>").replaceAll("[<@/강의명>]", "</pre>").replaceAll("[<@가격>]", "<br><p class='lesson_price'>").replaceAll("[<@/가격|버튼>]", "</p><button type='button' class='accept_btn'>수락하기</button><input class='escrow_lesson_num' type='hidden' value='").replaceAll("[<@/버튼|코드>]", "'><input class='escrow_tiper_code' type='hidden' value='").replaceAll("[<@/코드>]", "'><input class='escrow_status' value='").replaceAll("[<@status>]","' style='display: none;'>"));
				//$('.lesson_title').prepend('<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-receipt-cutoff" viewBox="0 0 16 16"><path d="M3 4.5a.5.5 0 0 1 .5-.5h6a.5.5 0 1 1 0 1h-6a.5.5 0 0 1-.5-.5zm0 2a.5.5 0 0 1 .5-.5h6a.5.5 0 1 1 0 1h-6a.5.5 0 0 1-.5-.5zm0 2a.5.5 0 0 1 .5-.5h6a.5.5 0 1 1 0 1h-6a.5.5 0 0 1-.5-.5zm0 2a.5.5 0 0 1 .5-.5h6a.5.5 0 0 1 0 1h-6a.5.5 0 0 1-.5-.5zm0 2a.5.5 0 0 1 .5-.5h6a.5.5 0 0 1 0 1h-6a.5.5 0 0 1-.5-.5zM11.5 4a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1zm0 2a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1zm0 2a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1zm0 2a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1zm0 2a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1z"/><path d="M2.354.646a.5.5 0 0 0-.801.13l-.5 1A.5.5 0 0 0 1 2v13H.5a.5.5 0 0 0 0 1h15a.5.5 0 0 0 0-1H15V2a.5.5 0 0 0-.053-.224l-.5-1a.5.5 0 0 0-.8-.13L13 1.293l-.646-.647a.5.5 0 0 0-.708 0L11 1.293l-.646-.647a.5.5 0 0 0-.708 0L9 1.293 8.354.646a.5.5 0 0 0-.708 0L7 1.293 6.354.646a.5.5 0 0 0-.708 0L5 1.293 4.354.646a.5.5 0 0 0-.708 0L3 1.293 2.354.646zm-.217 1.198.51.51a.5.5 0 0 0 .707 0L4 1.707l.646.647a.5.5 0 0 0 .708 0L6 1.707l.646.647a.5.5 0 0 0 .708 0L8 1.707l.646.647a.5.5 0 0 0 .708 0L10 1.707l.646.647a.5.5 0 0 0 .708 0L12 1.707l.646.647a.5.5 0 0 0 .708 0l.509-.51.137.274V15H2V2.118l.137-.274z"/></svg>');
				$('.inbox_chat').html(data.replaceAll("[<@전수일>]","<p class='start_date'>꿀TIP 전수일<br>").replaceAll("[<@강의명>]", "</p><pre class='lesson_title'><svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-receipt-cutoff' viewBox='0 0 16 16'><path d='M3 4.5a.5.5 0 0 1 .5-.5h6a.5.5 0 1 1 0 1h-6a.5.5 0 0 1-.5-.5zm0 2a.5.5 0 0 1 .5-.5h6a.5.5 0 1 1 0 1h-6a.5.5 0 0 1-.5-.5zm0 2a.5.5 0 0 1 .5-.5h6a.5.5 0 1 1 0 1h-6a.5.5 0 0 1-.5-.5zm0 2a.5.5 0 0 1 .5-.5h6a.5.5 0 0 1 0 1h-6a.5.5 0 0 1-.5-.5zm0 2a.5.5 0 0 1 .5-.5h6a.5.5 0 0 1 0 1h-6a.5.5 0 0 1-.5-.5zM11.5 4a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1zm0 2a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1zm0 2a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1zm0 2a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1zm0 2a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1z'/><path d='M2.354.646a.5.5 0 0 0-.801.13l-.5 1A.5.5 0 0 0 1 2v13H.5a.5.5 0 0 0 0 1h15a.5.5 0 0 0 0-1H15V2a.5.5 0 0 0-.053-.224l-.5-1a.5.5 0 0 0-.8-.13L13 1.293l-.646-.647a.5.5 0 0 0-.708 0L11 1.293l-.646-.647a.5.5 0 0 0-.708 0L9 1.293 8.354.646a.5.5 0 0 0-.708 0L7 1.293 6.354.646a.5.5 0 0 0-.708 0L5 1.293 4.354.646a.5.5 0 0 0-.708 0L3 1.293 2.354.646zm-.217 1.198.51.51a.5.5 0 0 0 .707 0L4 1.707l.646.647a.5.5 0 0 0 .708 0L6 1.707l.646.647a.5.5 0 0 0 .708 0L8 1.707l.646.647a.5.5 0 0 0 .708 0L10 1.707l.646.647a.5.5 0 0 0 .708 0L12 1.707l.646.647a.5.5 0 0 0 .708 0l.509-.51.137.274V15H2V2.118l.137-.274z'/></svg>견적서<br>").replaceAll("[<@/강의명>]", "</pre>").replaceAll("[<@가격>]", "<br><p class='lesson_price'>").replaceAll("[<@/전수일>]", "<br>").replaceAll("[<@/가격|버튼>]", "</p><button type='button' class='accept_btn'>수락하기</button><input class='escrow_lesson_num' type='hidden' value='").replaceAll("[<@/버튼|코드>]", "'><input class='escrow_tiper_code' type='hidden' value='").replaceAll("[<@/코드>]", "'><input class='escrow_status' value='").replaceAll("[<@status>]","' style='display: none;'>"));
				//$('.inbox_chat').html(data);
				
				$('.write_msg').focus();
								
				// 메세지 리스트중 하나를 클릭했을 때
				$('.chat_list').on('click', function(){
					let message_room = $(this).attr('message_room');
					let other_user_id = $(this).attr('other-user_id');
					let user_role = $(this).attr('user_role');
					
					
					// 선택한 메세지빼고 나머지는 active 효과 해제하기
					$('.chat_list_box').not('.chat_list_box.chat_list_box'+message_room).removeClass('active_chat');
					// 선택한 메세지만 active 효과 주기
					$('.chat_list_box'+message_room).addClass('active_chat');
					
					let send_msg = "";
					send_msg += "<div class='type_msg'>";
					send_msg += "	<div class='input_msg_write row'>";
					if($(this).attr('other-user_id')== 'admin'){
				      	send_msg +="<div class='col-11'>";
				      	send_msg +="<textarea id='admin_msg' class='write_msg form-control' maxlength='800' color='red' readonly='readonly'>&nbsp;여왕벌은 메세지를 받을 수 없어요.</textarea>";
				      	send_msg +="</div>";
				      	send_msg +="<div class='col-1'>";
				      	//send_msg +="<button class='msg_send_btn' disabled='disabled' type='button'><i class='fa fa-paper-plane-o' aria-hidden='true'></i></button>";
				      	send_msg +="</div>";
			      	}else{
				      //	send_msg +="<button class='msg_send_btn' type='button'><i class='fa fa-paper-plane-o' aria-hidden='true'></i></button>";
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
							      	send_msg +="<button class='modal_close' type='button'><i class='fa fa-close' aria-hidden='true'></i></button>";
							      	send_msg +="<div class='price_send_div'>";
							      	send_msg +="<p class='price_p'>아래 입력란에 제시할 허니페이를<br>입력해주세요.</p>";
							      	send_msg +="<div class='price_input_div'>";
							      	send_msg +="<input onKeyup='this.value=this.value.replace(/[^-0-9]/g,&#39;&#39;)' autofocus id='price_modal_input' class='price_input' placeholder='&nbsp;숫자만 입력 가능합니다.'>";
							      	send_msg +="<button id='price_send_btn' type='button'><i class='fa fa-paper-plane-o' aria-hidden='true'></i></button>";
							      	send_msg +="</div>";
							      	send_msg +="</div>";
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
								//$('.msg_history').css('height', '48%');	
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
					
					
					// 메세지 내용을 불러오는 함수 호출
					MessageContentList(message_room, other_user_id, send_btn);
					
					
				});
				// 전송버튼을 누르면 메세지 리스트가 리로드 되면서 현재 열린 메세지의 선택됨 표시가 사라진다.
				// 이걸 해결하기 위해 메세지 전송버튼을 누르고 메세지 리스트가 리로드되면 메세지 리스트의 첫번째 메세지(현재 열린 메세지)가 선택됨 표시 되도록 한다.
				$('.chat_list_box:first').addClass('active_chat');
			}
			
				});
	};
    
	
	// 메세지 내용을 가져온다.
	// 읽지 않은 메세지들을 읽음으로 바꾼다.
	const MessageContentList = function(message_room, other_user_id, send_btn) {
		
		$.ajax({
			url:"message_content_list",
			method:"GET",
			data:{
				message_room : message_room,
				other_user_id: other_user_id,
				send_btn : send_btn
			},
			success:function(data){
				var isMobile = /Android|webOS|iPhone|iPad|iPod|BlackBerry/i.test(navigator.userAgent) ? true : false;
					if(!isMobile) {
						window.opener.parent_function();
					}
				console.log("메세지 내용 가져오기 성공");
				
				// 메세지 내용을 html에 넣는다
			//	$('.msg_history').html(data.replaceAll('&lt;','<').replaceAll('&gt;','>'));
				//$('.msg_history').html(data.replaceAll("[<@강의명>]", "<pre class='lesson_title'><svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-receipt-cutoff' viewBox='0 0 16 16'><path d='M3 4.5a.5.5 0 0 1 .5-.5h6a.5.5 0 1 1 0 1h-6a.5.5 0 0 1-.5-.5zm0 2a.5.5 0 0 1 .5-.5h6a.5.5 0 1 1 0 1h-6a.5.5 0 0 1-.5-.5zm0 2a.5.5 0 0 1 .5-.5h6a.5.5 0 1 1 0 1h-6a.5.5 0 0 1-.5-.5zm0 2a.5.5 0 0 1 .5-.5h6a.5.5 0 0 1 0 1h-6a.5.5 0 0 1-.5-.5zm0 2a.5.5 0 0 1 .5-.5h6a.5.5 0 0 1 0 1h-6a.5.5 0 0 1-.5-.5zM11.5 4a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1zm0 2a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1zm0 2a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1zm0 2a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1zm0 2a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1z'/><path d='M2.354.646a.5.5 0 0 0-.801.13l-.5 1A.5.5 0 0 0 1 2v13H.5a.5.5 0 0 0 0 1h15a.5.5 0 0 0 0-1H15V2a.5.5 0 0 0-.053-.224l-.5-1a.5.5 0 0 0-.8-.13L13 1.293l-.646-.647a.5.5 0 0 0-.708 0L11 1.293l-.646-.647a.5.5 0 0 0-.708 0L9 1.293 8.354.646a.5.5 0 0 0-.708 0L7 1.293 6.354.646a.5.5 0 0 0-.708 0L5 1.293 4.354.646a.5.5 0 0 0-.708 0L3 1.293 2.354.646zm-.217 1.198.51.51a.5.5 0 0 0 .707 0L4 1.707l.646.647a.5.5 0 0 0 .708 0L6 1.707l.646.647a.5.5 0 0 0 .708 0L8 1.707l.646.647a.5.5 0 0 0 .708 0L10 1.707l.646.647a.5.5 0 0 0 .708 0L12 1.707l.646.647a.5.5 0 0 0 .708 0l.509-.51.137.274V15H2V2.118l.137-.274z'/></svg>견적서<br>").replaceAll("[<@/강의명>]", "</pre>").replaceAll("[<@가격>]", "<br><p class='lesson_price'>").replaceAll("[<@/전수일>]", "<br>").replaceAll("[<@/가격|버튼>]", "</p><button type='button' class='accept_btn'>수락하기</button><input class='escrow_lesson_num' type='hidden' value='").replaceAll("[<@/버튼|코드>]", "'><input class='escrow_tiper_code' type='hidden' value='").replaceAll("[<@/코드>]", "'><input class='escrow_status' value='").replaceAll("[<@status>]","' style='display: none;'>"));
				$('.msg_history').html(data.replaceAll("[<@전수일>]","<p class='start_date'>꿀TIP 전수일<br>").replaceAll("[<@강의명>]", "</p><pre class='lesson_title'><svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-receipt-cutoff' viewBox='0 0 16 16'><path d='M3 4.5a.5.5 0 0 1 .5-.5h6a.5.5 0 1 1 0 1h-6a.5.5 0 0 1-.5-.5zm0 2a.5.5 0 0 1 .5-.5h6a.5.5 0 1 1 0 1h-6a.5.5 0 0 1-.5-.5zm0 2a.5.5 0 0 1 .5-.5h6a.5.5 0 1 1 0 1h-6a.5.5 0 0 1-.5-.5zm0 2a.5.5 0 0 1 .5-.5h6a.5.5 0 0 1 0 1h-6a.5.5 0 0 1-.5-.5zm0 2a.5.5 0 0 1 .5-.5h6a.5.5 0 0 1 0 1h-6a.5.5 0 0 1-.5-.5zM11.5 4a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1zm0 2a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1zm0 2a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1zm0 2a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1zm0 2a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1z'/><path d='M2.354.646a.5.5 0 0 0-.801.13l-.5 1A.5.5 0 0 0 1 2v13H.5a.5.5 0 0 0 0 1h15a.5.5 0 0 0 0-1H15V2a.5.5 0 0 0-.053-.224l-.5-1a.5.5 0 0 0-.8-.13L13 1.293l-.646-.647a.5.5 0 0 0-.708 0L11 1.293l-.646-.647a.5.5 0 0 0-.708 0L9 1.293 8.354.646a.5.5 0 0 0-.708 0L7 1.293 6.354.646a.5.5 0 0 0-.708 0L5 1.293 4.354.646a.5.5 0 0 0-.708 0L3 1.293 2.354.646zm-.217 1.198.51.51a.5.5 0 0 0 .707 0L4 1.707l.646.647a.5.5 0 0 0 .708 0L6 1.707l.646.647a.5.5 0 0 0 .708 0L8 1.707l.646.647a.5.5 0 0 0 .708 0L10 1.707l.646.647a.5.5 0 0 0 .708 0L12 1.707l.646.647a.5.5 0 0 0 .708 0l.509-.51.137.274V15H2V2.118l.137-.274z'/></svg>견적서<br>").replaceAll("[<@/강의명>]", "</pre>").replaceAll("[<@가격>]", "<br><p class='lesson_price'>").replaceAll("[<@/전수일>]", "<br>").replaceAll("[<@/가격|버튼>]", "</p><button type='button' class='accept_btn'>수락하기</button><input class='escrow_lesson_num' type='hidden' value='").replaceAll("[<@/버튼|코드>]", "'><input class='escrow_tiper_code' type='hidden' value='").replaceAll("[<@/코드>]", "'><input class='escrow_status' value='").replaceAll("[<@status>]","' style='display: none;'>"));
				
				//$('.lesson_title').prepend('<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-receipt-cutoff" viewBox="0 0 16 16"><path d="M3 4.5a.5.5 0 0 1 .5-.5h6a.5.5 0 1 1 0 1h-6a.5.5 0 0 1-.5-.5zm0 2a.5.5 0 0 1 .5-.5h6a.5.5 0 1 1 0 1h-6a.5.5 0 0 1-.5-.5zm0 2a.5.5 0 0 1 .5-.5h6a.5.5 0 1 1 0 1h-6a.5.5 0 0 1-.5-.5zm0 2a.5.5 0 0 1 .5-.5h6a.5.5 0 0 1 0 1h-6a.5.5 0 0 1-.5-.5zm0 2a.5.5 0 0 1 .5-.5h6a.5.5 0 0 1 0 1h-6a.5.5 0 0 1-.5-.5zM11.5 4a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1zm0 2a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1zm0 2a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1zm0 2a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1zm0 2a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1z"/><path d="M2.354.646a.5.5 0 0 0-.801.13l-.5 1A.5.5 0 0 0 1 2v13H.5a.5.5 0 0 0 0 1h15a.5.5 0 0 0 0-1H15V2a.5.5 0 0 0-.053-.224l-.5-1a.5.5 0 0 0-.8-.13L13 1.293l-.646-.647a.5.5 0 0 0-.708 0L11 1.293l-.646-.647a.5.5 0 0 0-.708 0L9 1.293 8.354.646a.5.5 0 0 0-.708 0L7 1.293 6.354.646a.5.5 0 0 0-.708 0L5 1.293 4.354.646a.5.5 0 0 0-.708 0L3 1.293 2.354.646zm-.217 1.198.51.51a.5.5 0 0 0 .707 0L4 1.707l.646.647a.5.5 0 0 0 .708 0L6 1.707l.646.647a.5.5 0 0 0 .708 0L8 1.707l.646.647a.5.5 0 0 0 .708 0L10 1.707l.646.647a.5.5 0 0 0 .708 0L12 1.707l.646.647a.5.5 0 0 0 .708 0l.509-.51.137.274V15H2V2.118l.137-.274z"/></svg>');
				
				
				// 이 함수로 메세지 내용을 가져올때마다 스크롤를 맨아래로 가게 한다.
				$(".msg_history").scrollTop($(".msg_history")[0].scrollHeight);
				
			},
			error : function() {
				alert('잠깐 문제가 발생했어요.');
			}
		})
		
		$('.unread'+message_room).empty();
	
	};
	
	
	
	// 메세지를 전송하는 함수
	const SendMessage = function(message_room, other_user_id, send_btn){
		
		let message_cont = $('.write_msg').val();
		message_cont = message_cont.trim();
		
		//let plainText = message_cont.replace(/<[^>]*>/g, '');
		//let decodedText = $("<div/>").html(plainText).text();
		//message_cont = decodedText;
				
		if(message_cont == ""){
			//alert("저희는 텔레파시를 사용할 수 없어요!");
			$('.write_msg').css('border','3px solid red');
			$('.write_msg').focus();
			
		}else{
			$.ajax({
				url:"message_send_inlist",
				method:"GET",
				data:{
					message_room: message_room,
					other_user_id: other_user_id,
					send_btn : send_btn,
					message_cont: message_cont
				},
				success:function(data){
					console.log("메세지 전송 성공");
					
					// 메세지 입력칸 비우기
					$('.write_msg').val("");
					
					// 메세지 내용  리로드
					MessageContentList(message_room, other_user_id, send_btn);
					
					// 메세지 리스트 리로드
					MessageList(message_room, other_user_id, send_btn);
					
				},
				error : function() {
					alert('서버 에러');
				}
			});
		}
		
	};
	
	
	
	// 강의 목록 가져오는 함수
	const select_lesson = function(message_room, other_user_id, send_btn){
			
			$.ajax({
				url:"select_escrow",
				method:"GET",
				data:{
					message_room: message_room,
					escrow_user_id: other_user_id
				},
				success:function(data){
					console.log("강의목록 조회 성공");
					console.log("강의목록data: ",data);
					$('.escrow_lesson_title').append(data);
					$('.escrow_lesson_title').prepend('<option value="" disabled selected>꿀TIP을 선택해주세요.</option>');
				},
				error : function() {
					alert('서버 에러');
				}
			});
		}
	
	
			// 가격 전송하는 함수
			const SendPrice = function(message_room, other_user_id, send_btn){
			let escrow_lesson_num = $('.escrow_lesson_title option:selected').val();
			let escrow_price = $('#price_modal_input').val();
			escrow_price = escrow_price.replaceAll(",", "");
			let escrow_tiper_code = $('.tiper_code').val();
			let lesson_title = $('.escrow_lesson_title option:selected').text();
			let escrow_status = $('.escrow_status').val();
			let startDate = $('.escrow_start').val();
					console.log("startDate?",startDate);
					console.log("escrow_lesson_num?",escrow_lesson_num);
					console.log("escrow_tiper_code?",escrow_tiper_code);
					console.log("escrow_status?",escrow_status);
			
			var messages = [
			  "지킬 수 없는 약속은 하지 않는게 좋다고 생각해요!",
			  "지금 당신이 계신곳은 지구가 맞나요?",
			  "혹시.. 타임머신이 출시되었나요?",
			  "우리의 기술과 재능의 끝은 어디일까요?"
			];
			
				if($('.escrow_lesson_title').val() == null){
					//alert("선택이 안되었습니다.");
					$('.escrow_lesson_title').css("border","2px solid red");
				}else if($('.escrow_start').val() == ''){
					$('.escrow_start').css('border','2px solid red');	
					$('.escrow_start').css('border-radius','5px');	
				}else if(escrow_price == "") {
					//alert("저희는 텔레파시를 사용할 수 없어요!");
					$('#price_modal_input').css("border","3px solid red");
					$('#price_modal_input').focus();
				}else if(escrow_price <= 0){
					$('#price_modal_input').css("border","3px solid red");
					$('#price_modal_input').focus();
				}else if(escrow_price >= 100000000){
					alert("1억미만으로 입력 가능합니다.");
					$('#price_modal_input').css("border","3px solid red");
					$('#price_modal_input').focus();
				}else{
					 if(escrow_price != ""){
					 	if ($('.escrow_start').val() >= '2040-01-01'){
				 		    var randomIndex = Math.floor(Math.random()*messages.length);

						    var randomMessage = messages[randomIndex];
						
						    alert(randomMessage);
					 		//alert("지킬 수 없는 약속은 하지 않는게 좋다고 생각해요!");
					 	}
						if (confirm("전송후 변경이 가능하지만 상대방이 수락하면 변경이 불가해요.\n전송할까요?") == true){
					$.ajax({
					url:"update_price",
					method:"GET",
					data:{
						message_room: message_room,
						escrow_user_id: other_user_id,
						escrow_price: escrow_price,
						escrow_lesson_num: escrow_lesson_num,
						escrow_tiper_code: escrow_tiper_code,
						lesson_title: lesson_title,
						escrow_status: escrow_status,
						startDate: startDate
					},
					success:function(data){
						console.log("가격 전송 성공");
						$('#price_modal').hide();
						
						// 가격모달창 입력칸 비우기
							$('#price_modal_input').val("");
							$('#escrow_start').val("");
							$('.escrow_lesson_title').empty();
						 	$('.inbox_people').css('pointer-events', 'auto');
						 	$('.mesgs').css('pointer-events', 'auto');
						// 메세지 내용  리로드
						MessageContentList(message_room, other_user_id, send_btn);
						
						// 메세지 리스트 리로드
						MessageList(message_room, other_user_id, send_btn);
						
					},
					error : function() {
						alert('서버 에러');
					}
				});
				}else{
				$('#price_modal').hide();
				$('#price_modal_input').val("");
				$('.escrow_start').val("");
				$('.inbox_people').css('pointer-events', 'auto');
				$('.mesgs').css('pointer-events', 'auto');
				$('.escrow_lesson_title').empty();
			}
		}
	}
};	
	
	// 가격 수락 함수
	const AcceptPrice = function(tiper_code, lesson_num, price, title){
		//let escrow_price = $('#price_modal_input').val();
		let escrow_tiper_code = tiper_code;
		let escrow_lesson_num = lesson_num;
		let escrow_price = price.replace(" 페이", "");
		let lesson_title = title;
		//let escrow_tiper_code = $('.escrow_tiper_code').val();
		//let escrow_status = status;
		console.log("tiper_code====",tiper_code);
		console.log("lesson_num====",lesson_num);
		console.log("price====",price);
		console.log("title====",title);
		//console.log("escrow_status====",escrow_status);
		
		if (confirm("수락 후에는 견적이 확정되며,\n마지막으로 제시받은 견적인 "+escrow_price+"가 차감됩니다.\n신중히 결정해주세요.") == true){
			$.ajax({
				url:"escrow_status",
				method:"GET",
				data:{
					escrow_price: escrow_price,
					escrow_lesson_num: escrow_lesson_num,
					escrow_tiper_code: escrow_tiper_code,
					lesson_title: lesson_title
				},
				success:function(data){
					console.log("data?",data);
					
					if(data == '1'){
						alert('수락이 완료되었어요.\n('+escrow_price+'가 차감되었어요.)');
					}else if(data == '2'){
						alert('이미 처리되었어요.');
					}else if(data == '3'){
						alert('허니페이가 부족해요!');
					}else{
						alert('알 수 없는 오류가 있어요. 고객센터로 문의 부탁드립니다.');
					}
				},
				error : function() {
					alert('서버 에러');
				}
			});
		}else{
			alert('취소하셨어요.\n언제든 다시 수락하실 수 있어요.');
		}
	};
	
	
	//팝업창 새로고침 방지
	function NotReload(){
    if((event.ctrlKey == true && (event.keyCode == 78 || event.keyCode == 82)) || (event.keyCode == 116) ) {
        event.keyCode = 0;
        event.cancelBubble = true;
        event.returnValue = false;
    } 
}
	document.onkeydown = NotReload;
	
	// 우클릭 방지
	$(document).ready(function(){
	 $(document).bind("contextmenu", function(e) {
	  return false;
	 });
	});
	$(document).bind('selectstart',function() {return false;}); 
	$(document).bind('dragstart',function(){return false;}); 
	
	var isMobile = /Android|webOS|iPhone|iPad|iPod|BlackBerry/i.test(navigator.userAgent) ? true : false;

	$('.chat_list_box').click(function(){
		if(isMobile) {
			$('.inbox_people').hide(400);
			$('.mesgs').show(400);
		}
	});
	
	$('.bi-arrow-left-square-fill').click(function(){
		if(isMobile) {
			$('.inbox_people').show(400);
			$('.mesgs').hide(400);
		}
	});

	$(".message_logo").on("click", function() {
      window.location.href = "/index";
    });

	