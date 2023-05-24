//대화창 프로필 모달
$('.content_img').click(function(event){
    event.stopPropagation();
    $(this).siblings("div").show();
	$(this).siblings("div").css("display", "flex");
});

$(document).click(function(){
	$('.content_img').siblings("div").hide();
});


//가격 입력 모달
$('#price_btn').click(function(event){
    $('#price_modal').show();
    $('.inbox_people').css('pointer-events', 'none');
    $('.mesgs').css('pointer-events', 'none');
    $('#price_modal').css('pointer-events', 'auto');
});

//모달창 닫고 강의 목록 초기화
$('.modal_close').click(function(){
	$('#price_modal').hide();
	$('#price_modal_input').val("");
	$('#escrow_start').val("");
	$('.inbox_people').css('pointer-events', 'auto');
	$('.mesgs').css('pointer-events', 'auto');
	$('#price_modal_input').css("border","2px solid #FFD400");
	$('.escrow_lesson_title').css("border","1px solid black");	
	$('.escrow_start').css("border","none");	
	$('.escrow_lesson_title').empty();
});


$('#escrow_start').click(function(event){
    $('#price_modal').focus();
});


$('#price_send_btn').click(function(){
	let price_modal_input = $('#price_modal_input').val();
	let escrow_lesson_title = $('.escrow_lesson_title').val();
	//console.log("escrow_lesson_title??",escrow_lesson_title);
	
	if(price_modal_input != ""){
		if(escrow_lesson_title != null){
				$('.inbox_people').css('pointer-events', 'auto');
				$('.mesgs').css('pointer-events', 'auto');
			}
	}
});


$('.escrow_lesson_title').click(function(){
	$('.escrow_lesson_title').css("border","1px solid black");	
});


$('.escrow_start').click(function(){
	$('.escrow_start').css("border","none");	
});


$('.write_msg').keydown(function(){
	$('.write_msg').css("border","2px solid #FFD400");	
});



$('#price_modal_input').keydown(function(){
	if(event.keyCode >= 48 && event.keyCode <= 57){
		$('#price_modal_input').css("border","2px solid #FFD400");
	}
});


$('.accept_btn').click(function(){
	let lesson_num = $(this).siblings('.escrow_lesson_num').val();
	let tiper_code = $(this).siblings('.escrow_tiper_code').val();
	let title = $(this).siblings('.lesson_title').text();
	//let status = $(this).siblings('.escrow_status').val();
	//let price = $(this).siblings('.lesson_price').text();
	let price;
	
	
	// lesson_num과 일치하는 .lesson_price 요소를 선택
  let matchedElement = $('.escrow_lesson_num').filter(function() {
    return $(this).val() === lesson_num;
  }).siblings('.lesson_price').last();

  if (matchedElement.length > 0) {
    price = matchedElement.text();
  } else {
    price = 'not found'; // 일치하는 요소를 찾지 못한 경우
  }
  
	AcceptPrice(tiper_code, lesson_num, price, title);
	//$('.accept_btn').prop('disabled', true);
});



document.getElementById("price_modal_input").addEventListener("keyup", function (e) {
    $(this).val($(this).val().replace(/\,/g, '').replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,'));
});


var isMobile = /Android|webOS|iPhone|iPad|iPod|BlackBerry/i.test(navigator.userAgent) ? true : false;

	$('.write_msg').keyup(function(){
		if(isMobile) {
			$(".msg_history").scrollTop($(".msg_history")[0].scrollHeight);
		}
	});
	
	$('.write_msg').click(function(){
		if(isMobile) {
			$(".msg_history").scrollTop($(".msg_history")[0].scrollHeight);
		}
	});
	
	$('.write_msg').focus(function(){
		if(isMobile) {
			//$('.msg_history').css('height', '48%');	
			$(".msg_history").scrollTop($(".msg_history")[0].scrollHeight);
		}
	});
	
	$('.write_msg').blur(function(){
		if(isMobile) {
			//$('.msg_history').css('height', '84%');	
			$(".msg_history").scrollTop($(".msg_history")[0].scrollHeight);
		}
	});
	$('#price_modal_input').focus(function(){
		if(isMobile) {
			$('#price_modal').css('height', '450px');	
			$('#price_modal').css('top', '-73px');	
		}
	});
	
	$('#price_modal_input').blur(function(){
		if(isMobile) {
			$('#price_modal').css('height', '55%');	
			$('#price_modal').css('top', '-35%');	
		}
	});
	
	$('.msg_send_btn').click(function(){
		if(isMobile) {
			$(".msg_history").scrollTop($(".msg_history")[0].scrollHeight);
			$('.write_msg').focus();
		}
	});
	
	
var today = new Date();
today.setDate(today.getDate() + 1);
var minDate = today.toISOString().split('T')[0];

$('input[type="date"]').attr('min', minDate);

$('input[type="date"]').on('input', function() {
    var selectedDate = new Date(this.value);
    var now = new Date();
    if (selectedDate < now) {
        this.value = minDate;
    }
});