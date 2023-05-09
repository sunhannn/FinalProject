<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Want 사진자랑하기</title>

<%-- <jsp:include page="../../../index.jsp"></jsp:include> --%>

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<!-- CSS File -->
<link href="front/message_list.css" rel="stylesheet">
<!-- <link href="./resources/css/navbar.css" rel="stylesheet"> -->

<!-- 메세지 전송 아이콘(종이비행기) 때문에 필요 -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" type="text/css" rel="stylesheet"/>

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
	                <input id="search_id" type="text" class="search-bar"  placeholder="ID검색" >
	                <span class="input-group-addon">
	                <i class="fa fa-search" aria-hidden="true"></i>
	                </span> 
	              </div>
	            </div>
	          </div>
	          
	          <!-- 메세지 리스트 -->
	          <div class="inbox_chat">
		          
	          </div>
	        </div>
	        
	        <!-- 메세지 내용 영역 -->
	        <div class="mesgs">
	          <!-- 메세지 내용 목록 -->
	          <div class="msg_history" name="contentList">
	            <!-- 메세지 내용이 올 자리 -->
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
        FirstMessageList(message_room, other_user_id, send_btn);
    }
    
    // opener 로 부모창에 접근하여 popup이라는 자식창 속성을 주입
    // (부모창에 popup 변수 선언 안해도 사용 가능) 
    opener.popup = this;
	

	// 가장 처음 메세지 리스트를 가져온다.
	const FirstMessageList = function(message_room, other_user_id, send_btn){
		$.ajax({
			url:"message_ajax_list.do",
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
				console.log("콘솔방번호?? 5?",message_room);
				
				
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
			      	if($(this).attr('other-user_id')== '여왕벌'){
				      	send_msg +="<div class='col-11'>";
				      	send_msg +="<textarea class='write_msg form-control' maxlength='800' color='red' readonly='readonly'>&nbsp;여왕벌은 메세지를 받을 수 없어요.</textarea>";
				      	send_msg +="</div>";
				      	send_msg +="<div class='col-1'>";
				      	send_msg +="<button class='msg_send_btn' disabled='disabled' type='button'><i class='fa fa-paper-plane-o' aria-hidden='true'></i></button>";
				      	send_msg +="</div>";
			      	}else{
				      	send_msg +="<div class='col-11'>";
				      	send_msg +="<textarea style='white-space: pre' class='write_msg form-control' maxlength='800' placeholder='&nbsp;메세지를 입력해주세요.&#13;&#10;&nbsp;800자까지 전송 가능합니다.'></textarea>";
				      	send_msg +="</div>";
				      	send_msg +="<div class='col-1'>";
				      	send_msg +="<button class='msg_send_btn' type='button'><i class='fa fa-paper-plane-o' aria-hidden='true'></i></button>";
				      	send_msg +="</div>";
			      	}
			      	send_msg +="</div>";
			      	send_msg +="</div>";

			          
					// 메세지 입력, 전송 칸을 보인다.
					$('.send_message').html(send_msg);
					
					// 메세지 전송버튼을 눌렀을 때
					$('.msg_send_btn').on('click',function(){
						// 메세지 전송 함수 호출
						SendMessage(message_room, other_user_id, send_btn);
						
// 						// 전송버튼을 누르면 메세지 리스트가 리로드 되면서 현재 열린 메세지의 선택됨 표시가 사라진다.
// 						// 이걸 해결하기 위해 메세지 전송버튼을 누르고 메세지 리스트가 리로드되면 메세지 리스트의 첫번째 메세지(현재 열린 메세지)가 선택됨 표시 되도록 한다.
// 						//$('.chat_list_box:first').addClass('active_chat');
					});
					
					
					// 메세지 내용을 불러오는 함수 호출 ***
					MessageContentList(message_room, other_user_id, send_btn);

					
					// 메세지 리스트중 하나를 클릭했을 때 
					$('.chat_list').on('click', function(){
						//alert('room : '+ $(this).attr('message_room'));
						let message_room = $(this).attr('message_room');
						let other_user_id = $(this).attr('other-user_id'); //**ohter-nick
						
						console.log("선택후 방",message_room+other_user_id);
						
						// 선택한 메세지빼고 나머지는 active 효과 해제하기
						$('.chat_list_box').not('.chat_list_box.chat_list_box'+message_room).removeClass('active_chat');
						
						// 선택한 메세지만 active 효과 주기
						$('.chat_list_box'+message_room).addClass('active_chat');
						
						let send_msg = "";
						send_msg +="<div class='type_msg'>";
				      	send_msg +="<div class='input_msg_write row'>";
				      	if($(this).attr('other-user_id')== '여왕벌'){
					      	send_msg +="<div class='col-11'>";
					      	send_msg +="<textarea class='write_msg form-control' maxlength='800' color='red' readonly='readonly'>&nbsp;여왕벌은 메세지를 받을 수 없어요.</textarea>";
					      	send_msg +="</div>";
					      	send_msg +="<div class='col-1'>";
					      	send_msg +="<button class='msg_send_btn' disabled='disabled' type='button'><i class='fa fa-paper-plane-o' aria-hidden='true'></i></button>";
					      	send_msg +="</div>";
				      	}else{
					      	send_msg +="<div class='col-11'>";
					      	
					      	//가격 입력창 띄우는 버튼
					      	send_msg +="<a href='#price_modal' rel='modal:open' class='price_btn'><i class='bi bi-calculator' aria-hidden='true'></i></a>";
					      	
					      	send_msg +="<textarea style='white-space: pre' class='write_msg form-control' maxlength='800' placeholder='&nbsp;메세지를 입력해주세요.&#13;&#10;&nbsp;800자까지 전송 가능합니다.'></textarea>";
					      	
					      	// 가격제시 모달창
					      	send_msg +="<div style='display:none' id='price_modal' class='price_modal'>"
					      	send_msg +="<p class='price_p'>아래 입력란에 협의된 포인트를 입력해주세요.</p>"
					      	send_msg +="<input id='price_modal_input' class='price_input' type='number' placeholder='&nbsp;숫자만 입력 가능합니다.'>";
					      	
					      	//가격보내는 버튼
					      	send_msg +="<button class='price_send_btn' type='button'><i class='fa fa-paper-plane-o' aria-hidden='true'></i></button>";
					      	
					      	send_msg +="</div>";
					      	send_msg +="<div class='col-1'>";
					      	send_msg +="<button class='msg_send_btn' type='button'><i class='fa fa-paper-plane-o' aria-hidden='true'></i></button>";
					      	

					      	send_msg +="</div>";
				      	}
				      	send_msg +="</div>";
				      	send_msg +="</div>";

				          
						// 메세지 입력, 전송 칸을 보인다.
						$('.send_message').html(send_msg);
						
						
// 						$('.price_send_btn').on('click',function(){
							
// 						});
						
						// 메세지 전송버튼을 눌렀을 때
						$('.msg_send_btn').on('click',function(){
							// 메세지 전송 함수 호출
							SendMessage(message_room, other_user_id, send_btn);
							
// 							// 전송버튼을 누르면 메세지 리스트가 리로드 되면서 현재 열린 메세지의 선택됨 표시가 사라진다.
// 							// 이걸 해결하기 위해 메세지 전송버튼을 누르고 메세지 리스트가 리로드되면 메세지 리스트의 첫번째 메세지(현재 열린 메세지)가 선택됨 표시 되도록 한다.
// 							//$('.chat_list_box:first').addClass('active_chat');
						});
						
						$('.price_send_btn').on('click',function(){
							$("#price_modal").show();
							// 메세지 전송 함수 호출
							SendMessage(message_room, other_user_id, send_btn);
							
// 							// 전송버튼을 누르면 메세지 리스트가 리로드 되면서 현재 열린 메세지의 선택됨 표시가 사라진다.
// 							// 이걸 해결하기 위해 메세지 전송버튼을 누르고 메세지 리스트가 리로드되면 메세지 리스트의 첫번째 메세지(현재 열린 메세지)가 선택됨 표시 되도록 한다.
// 							//$('.chat_list_box:first').addClass('active_chat');
						});
						
						
						// 메세지 내용을 불러오는 함수 호출
						MessageContentList(message_room, other_user_id, send_btn);
					});
			}
		})
	};
	
	// 아이디 검색
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
			url:"message_ajax_list.do",
			method:"get",
			data:{
				message_room : message_room,
				other_user_id : other_user_id,
				send_btn : send_btn
			},
			success:function(data){
				console.log("메세지 리스트 리로드 성공");
				
				$('.inbox_chat').html(data);
				
				// 메세지 리스트중 하나를 클릭했을 때
				$('.chat_list').on('click', function(){
					//alert('message_room : '+ $(this).attr('message_room'));
					console.log("버튼클릭번호??",send_btn);
					let message_room = $(this).attr('message_room');
					let other_user_id = $(this).attr('other-user_id');
					
					// 선택한 메세지빼고 나머지는 active 효과 해제하기
					$('.chat_list_box').not('.chat_list_box.chat_list_box'+message_room).removeClass('active_chat');
					// 선택한 메세지만 active 효과 주기
					$('.chat_list_box'+message_room).addClass('active_chat');
					
					let send_msg = "";
					send_msg += "<div class='type_msg'>";
					send_msg += "	<div class='input_msg_write row'>";
					if($(this).attr('other-user_id')== '여왕벌'){
				      	send_msg +="<div class='col-11'>";
				      	send_msg +="<textarea class='write_msg form-control' maxlength='800' color='red' readonly='readonly'>&nbsp;여왕벌은 메세지를 받을 수 없어요.</textarea>";
				      	send_msg +="</div>";
				      	send_msg +="<div class='col-1'>";
				      	send_msg +="<button class='msg_send_btn' disabled='disabled' type='button'><i class='fa fa-paper-plane-o' aria-hidden='true'></i></button>";
				      	send_msg +="</div>";
			      	}else{
				      	send_msg +="<div class='col-11'>";
				      	send_msg +="<textarea style='white-space: pre' class='write_msg form-control' maxlength='800' placeholder='&nbsp;메세지를 입력해주세요.&#13;&#10;&nbsp;800자까지 전송 가능합니다.'></textarea>";
				      	send_msg +="</div>";
				      	send_msg +="<div class='col-1'>";
				      	send_msg +="<button class='msg_send_btn' type='button'><i class='fa fa-paper-plane-o' aria-hidden='true'></i></button>";
				      	send_msg +="</div>";
			      	}
					send_msg += "	</div>";
					send_msg += "</div>";
			          
					// 메세지 입력, 전송 칸을 보인다.
					$('.send_message').html(send_msg);
					
					// 메세지 전송버튼을 눌렀을 때
					$('.msg_send_btn').on('click',function(){
						// 메세지 전송 함수 호출
						SendMessage(message_room, other_user_id, send_btn);
						
						// 전송버튼을 누르면 메세지 리스트가 리로드 되면서 현재 열린 메세지의 선택됨 표시가 사라진다.
						// 이걸 해결하기 위해 메세지 전송버튼을 누르고 메세지 리스트가 리로드되면 메세지 리스트의 첫번째 메세지(현재 열린 메세지)가 선택됨 표시 되도록 한다.
						//$('.chat_list_box:first').addClass('active_chat');
					});
					
					// 메세지 내용을 불러오는 함수 호출
					MessageContentList(message_room, other_user_id, send_btn);
					
				});
				
				// 전송버튼을 누르면 메세지 리스트가 리로드 되면서 현재 열린 메세지의 선택됨 표시가 사라진다.
				// 이걸 해결하기 위해 메세지 전송버튼을 누르고 메세지 리스트가 리로드되면 메세지 리스트의 첫번째 메세지(현재 열린 메세지)가 선택됨 표시 되도록 한다.
				$('.chat_list_box:first').addClass('active_chat');
			}
		})
	};
    
	
	// 메세지 내용을 가져온다.
	// 읽지 않은 메세지들을 읽음으로 바꾼다.
	const MessageContentList = function(message_room, other_user_id, send_btn) {
		
		$.ajax({
			url:"message_content_list.do",
			method:"GET",
			data:{
				message_room : message_room,
				other_user_id : other_user_id,
				send_btn : send_btn
			},
			success:function(data){
				// 메세지 내용을 html에 넣는다
				$('.msg_history').html(data);
				
				// 이 함수로 메세지 내용을 가져올때마다 스크롤를 맨아래로 가게 한다.
				$(".msg_history").scrollTop($(".msg_history")[0].scrollHeight);

			},
			error : function() {
				alert('잠깐의 문제가 발생하였습니다.');
			}
		})
		
		$('.unread'+message_room).empty();
	
	};
	
	
	// 메세지를 전송하는 함수
	const SendMessage = function(message_room, other_user_id, send_btn){
		
		let message_cont = $('.write_msg').val();
		let escrow_price = $('.price_input').val();
		console.log("escrow_price?",escrow_price);
		if(escrow_price != null){
			message_cont = $('.price_input').val();
		}
		
		message_cont = message_cont.trim();
		
		if(message_cont == "" && escrow_price == ""){
			alert("저희는 텔레파시를 사용할 수 없어요!");
		}else{
			$.ajax({
				url:"message_send_inlist.do",
				method:"GET",
				data:{
					message_room: message_room,
					other_user_id: other_user_id,
					message_cont: message_cont,
					escrow_price: escrow_price
// 					message_cont: message_cont.replace(/(\r\n|\n)/g,'<br>')
				},
				success:function(data){
					console.log("메세지 전송 성공");
					console.log("전송후?",message_room+other_user_id);
					
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
	
	
// 	$(document).ready(function(){
// 		// 메세지 리스트 리로드
// 		FirstMessageList();
// 	});
	
	
	
	
	</script>
</body>
</html>