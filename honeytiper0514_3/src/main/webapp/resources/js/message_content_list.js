//대화창 프로필 모달
$('.content_img').click(function(event){
    event.stopPropagation();
    $(this).siblings("div").toggle();
});

$(document).click(function(){
	$('.content_img').siblings("div").hide();
});


//가격 입력 모달
$('#price_btn').click(function(event){
    event.stopPropagation();
    $('#price_modal').show();
    $('.inbox_people').css('pointer-events', 'none');
    $('.mesgs').css('pointer-events', 'none');
    $('#price_modal').css('pointer-events', 'auto');
});

//모달창 닫고 강의 목록 초기화
$('.modal_close').click(function(){
	$('#price_modal').hide();
	$('#price_modal_input').val("");
	$('.inbox_people').css('pointer-events', 'auto');
	$('.mesgs').css('pointer-events', 'auto');
});



$('.price_send_btn').click(function(){
	let price_modal_input = $('#price_modal_input').val();
	let escrow_lesson_title = $('.escrow_lesson_title').val();
	console.log("escrow_lesson_title??",escrow_lesson_title);
	
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

$('#price_modal_input').keydown(function(){
	$('#price_modal_input').css("border","2px solid #FFD400");
});



$('.accept_btn').click(function(){
	let lesson_num = $(this).siblings('.escrow_lesson_num').val();
	AcceptPrice(lesson_num);
});