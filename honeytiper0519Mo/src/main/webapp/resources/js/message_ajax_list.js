$('.list_img').click(function(event){
    event.stopPropagation();
    $(this).siblings("div").toggle();
    $(this).siblings("div").css("display", "flex");
    
});

$(document).click(function(){
	$('.list_img').siblings("div").hide();
});



var isMobile = /Android|webOS|iPhone|iPad|iPod|BlackBerry/i.test(navigator.userAgent) ? true : false;

	$('.chat_list_box').click(function(){
		if(isMobile) {
			$('.inbox_people').hide(400);
			$('.mesgs').show(400);
			$('.write_msg').focus();
			$(".msg_history").scrollTop($(".msg_history")[0].scrollHeight);
		}
	});
	
	$('.bi-arrow-left-square-fill').click(function(){
		if(isMobile) {
			$('.inbox_people').show(400);
			$('.mesgs').hide(400);
		}
	});
	
