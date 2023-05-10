	
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
	const MessageList = function(message_room, send_btn){
		$.ajax({
			url:"message_ajax_list",
			method:"get",
			data:{
				message_room : message_room,
				send_btn : send_btn
			},
			success:function(data){
				console.log("메세지 리스트 리로드 성공");
				
				$('.inbox_chat').html(data);
				
				// 메세지 리스트중 하나를 클릭했을 때
				$('.chat_list').on('click', function(){
				$('.chat_ib svg').remove();
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
				console.log("메세지 내용 가져오기 성공");
				
				// 메세지 내용을 html에 넣는다
				$('.msg_history').html(data);
				
				// 이 함수로 메세지 내용을 가져올때마다 스크롤를 맨아래로 가게 한다.
				$(".msg_history").scrollTop($(".msg_history")[0].scrollHeight);
				$('.lesson_title').prepend('<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-receipt-cutoff" viewBox="0 0 16 16"><path d="M3 4.5a.5.5 0 0 1 .5-.5h6a.5.5 0 1 1 0 1h-6a.5.5 0 0 1-.5-.5zm0 2a.5.5 0 0 1 .5-.5h6a.5.5 0 1 1 0 1h-6a.5.5 0 0 1-.5-.5zm0 2a.5.5 0 0 1 .5-.5h6a.5.5 0 1 1 0 1h-6a.5.5 0 0 1-.5-.5zm0 2a.5.5 0 0 1 .5-.5h6a.5.5 0 0 1 0 1h-6a.5.5 0 0 1-.5-.5zm0 2a.5.5 0 0 1 .5-.5h6a.5.5 0 0 1 0 1h-6a.5.5 0 0 1-.5-.5zM11.5 4a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1zm0 2a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1zm0 2a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1zm0 2a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1zm0 2a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1z"/><path d="M2.354.646a.5.5 0 0 0-.801.13l-.5 1A.5.5 0 0 0 1 2v13H.5a.5.5 0 0 0 0 1h15a.5.5 0 0 0 0-1H15V2a.5.5 0 0 0-.053-.224l-.5-1a.5.5 0 0 0-.8-.13L13 1.293l-.646-.647a.5.5 0 0 0-.708 0L11 1.293l-.646-.647a.5.5 0 0 0-.708 0L9 1.293 8.354.646a.5.5 0 0 0-.708 0L7 1.293 6.354.646a.5.5 0 0 0-.708 0L5 1.293 4.354.646a.5.5 0 0 0-.708 0L3 1.293 2.354.646zm-.217 1.198.51.51a.5.5 0 0 0 .707 0L4 1.707l.646.647a.5.5 0 0 0 .708 0L6 1.707l.646.647a.5.5 0 0 0 .708 0L8 1.707l.646.647a.5.5 0 0 0 .708 0L10 1.707l.646.647a.5.5 0 0 0 .708 0L12 1.707l.646.647a.5.5 0 0 0 .708 0l.509-.51.137.274V15H2V2.118l.137-.274z"/></svg>');
				
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
		
		if(message_cont == ""){
			alert("저희는 텔레파시를 사용할 수 없어요!");
		}else{
			$.ajax({
				url:"message_send_inlist",
				method:"GET",
				data:{
					message_room: message_room,
					other_user_id: other_user_id,
					message_cont: message_cont,
					send_btn : send_btn
				},
				success:function(data){
					console.log("메세지 전송 성공");
					
					// 메세지 입력칸 비우기
					$('.write_msg').val("");
					
					// 메세지 내용  리로드
					MessageContentList(message_room, other_user_id, send_btn);
					
					// 메세지 리스트 리로드
					MessageList(message_room, send_btn);
					
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
					
					$('.escrow_lesson_title').empty();
					
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
	let escrow_tiper_code = $('.tiper_code').val();
	let lesson_title = $('.escrow_lesson_title option:selected').text();
			console.log("escrow_price?",escrow_price);
			console.log("escrow_lesson_num?",escrow_lesson_num);
			console.log("escrow_tiper_code?",escrow_tiper_code);
	
			$.ajax({
			url:"update_price",
			method:"GET",
			data:{
				message_room: message_room,
				escrow_user_id: other_user_id,
				escrow_price: escrow_price,
				escrow_lesson_num: escrow_lesson_num,
				escrow_tiper_code: escrow_tiper_code,
				lesson_title: lesson_title
			},
			success:function(data){
				console.log("가격 전송 성공");
				
				
				// 가격모달창 입력칸 비우기
				$('#price_modal_input').val("");
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
};	
	
	// 가격 수락 함수
	const AcceptPrice = function(lesson_num){
		let escrow_price = $('#price_modal_input').val();
		let escrow_lesson_num = lesson_num;
		let escrow_tiper_code = $('.escrow_tiper_code').val();
		let lesson_title = $('.lesson_title').text();
		console.log("escrow_lesson_num====",escrow_lesson_num);
		if (confirm("수락 후에는 견적이 확정됩니다.\n신중히 결정해주세요.") == true){
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
					
	
					if(data==0){
						alert('이미 처리되었어요.');
					}else{
						alert('수락이 완료되었어요.');
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


	

