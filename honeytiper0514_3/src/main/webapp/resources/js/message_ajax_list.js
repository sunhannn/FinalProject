$('.list_img').click(function(event){
    event.stopPropagation();
    $(this).siblings("div").toggle();
});

$(document).click(function(){
	$('.list_img').siblings("div").hide();
});