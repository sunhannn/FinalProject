var timer = null;
         var isRunning = false;
         $(function(){

         	    $(".btn_recive_num").click(function(e){
             	var display = $('.time');
             	var leftSec = 120;
             	// 남은 시간
             	// 이미 타이머가 작동중이면 중지
             	if (isRunning){
             		clearInterval(timer);
             		display.html("");
             		startTimer(leftSec, display);
             	}else{
             	startTimer(leftSec, display);
             		
             	}
             });
         })

             
         function startTimer(count, display) {
                     
             		var minutes, seconds;
                     timer = setInterval(function () {
                     minutes = parseInt(count / 60, 10);
                     seconds = parseInt(count % 60, 10);
              
                     minutes = minutes < 10 ? "0" + minutes : minutes;
                     seconds = seconds < 10 ? "0" + seconds : seconds;
              
                     display.html(minutes + ":" + seconds);
              
                     // 타이머 끝
                     if (--count < 0) {
             	     clearInterval(timer);
             	     display.html("인증번호 만료");
             	    $(display).css({
                        "color":"red"
                     });
             	     $('.btn_chk').attr("disabled","disabled");
             	     $("#certificationTel").attr("readonly", true);
             	     isRunning = false;
                     }else{
             	    $(display).css({
                        "color":"black"
                     });
                     }
                 }, 1000);
                      isRunning = true;
         }
