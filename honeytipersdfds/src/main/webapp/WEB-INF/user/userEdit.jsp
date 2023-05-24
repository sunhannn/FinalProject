<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@include file="../main/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>꿀TIPer - 회원정보 수정</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
   src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
   <link rel="stylesheet" media="screen and (min-width:769px)" href="${pageContext.request.contextPath}/front/user.css">
   <link rel="stylesheet" media="screen and (max-width:768px)" href="${pageContext.request.contextPath}/front/userJoinMobile.css">
   <script src="${pageContext.request.contextPath}/front/userCertification.js"></script>
</head>
<body>
   <script>
      function sample6_execDaumPostcode() {
         new daum.Postcode(
               {
                  oncomplete : function(data) {
                     // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                     // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                     // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                     var addr = ''; // 주소 변수
                     var extraAddr = ''; // 참고항목 변수
                     //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                     if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                     } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                     }
                     // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                     if (data.userSelectedType === 'R') {
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if (data.bname !== ''
                              && /[동|로|가]$/g.test(data.bname)) {
                           extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if (data.buildingName !== ''
                              && data.apartment === 'Y') {
                           extraAddr += (extraAddr !== '' ? ', '
                                 + data.buildingName
                                 : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if (extraAddr !== '') {
                           extraAddr = ' (' + extraAddr + ')';
                        }
                        // 조합된 참고항목을 해당 필드에 넣는다.
                        document.getElementById("sample6_extraAddress").value = extraAddr;
                     } else {
                        document.getElementById("sample6_extraAddress").value = '';
                     }
                     // 우편번호와 주소 정보를 해당 필드에 넣는다.
                     document.getElementById('sample6_postcode').value = data.zonecode;
                     document.getElementById("sample6_address").value = addr;
                     // 커서를 상세주소 필드로 이동한다.
                     document.getElementById("sample6_detailAddress")
                           .focus();
                  }
               }).open();
      }

      window.onload = function() {
         $(".edit_email").hide();
         $(".edit_tel").hide();
         $(".edit_pw").hide();
         $(".info_ptag").hide();
         $(".telSubmit_info").hide();
         
      }
      
      function editEmailBtn() {
         $(".edit_email").slideDown();
         $(".edit_email").addClass("editRequired");
         $(".editEmailBtn_edit").hide();
      }
      
      function editTelBtn() {
         $(".edit_tel").slideDown();
         $(".edit_tel").addClass("editRequired");
         $(".editTelBtn_edit").hide();
      }
      
      function editPwBtn() {
         $(".edit_pw").slideDown();
         $(".edit_pw").addClass("editRequired");
         $(".editPwBtn_edit").hide();
      }
      
      function close_tel() {
    	  $(".edit_tel").slideUp();
    	  $(".edit_tel").removeClass("editRequired");
    	  $(".editTelBtn_edit").show();
      }
      
      function close_pw() {
    	 $(".edit_pw").slideUp();
    	 $(".edit_pw").removeClass("editRequired");
         $(".editPwBtn_edit").show();
      }
      
      function close_email() {
    	 $(".edit_email").slideUp();
    	 $(".edit_email").removeClass("editRequired");
         $(".editEmailBtn_edit").show();
      }
      
      $(function(){
    	  var val = '${edit.user_cate}'
    		  if ($(".enter").val() == val) {
    			  $(".enter").attr("checked", true);
    		  }else if ($(".made").val() == val) {
    			  $(".made").attr("checked", true);
    		  }else if ($(".off").val() == val) {
    			  $(".off").attr("checked", true);
    		  }else if ($(".lifest").val() == val) {
    			  $(".lifest").attr("checked", true);
    		  }else if ($(".IT").val() == val) {
    			  $(".IT").attr("checked", true);
    		  }else if ($(".etc").val() == val) {
    			  $(".etc").attr("checked", true);
    		  }
      });
      
      
   </script>
   
   <section id="body_css">
      <section id="writeForm">
         <div class="contents_join">
            <form name="joinform" action="userEdit" method="post" class="form_section_join">

            <table class="join_info_table edit_info_table">

               <tr>
                  <td colspan="2"><h3 style="text-align: left;">개인정보 수정</h3><br></td>
               </tr>
               <tr>
                  <td class="td_left"><label for="user_id">아이디</label></td>
                  <td class="td_right">
                     <input type="text" name="user_id" id="user_id" class="do_not_change" value="${edit.user_id}" readonly>
                     <p class="info_ptag"></p>
                  </td>
               </tr>

               <tr>
                  <td class="td_left"><label for="user_name">이름</label></td>
                  <td class="td_right">
                     <input type="text" name="user_name" id="user_name" class="do_not_change" value="${edit.user_name}" readonly>
                     <p class="info_ptag"></p>
                  </td>
               </tr>
               
               <tr>
                  <td class="td_left"><label for="user_pw">비밀번호</label></td>
                  <td class="td_right">
                  		<input type="hidden" name="show_pw" value="${edit.user_pw }">
                  		<div class="pwBtn">
                  			<button type="button" onclick="editPwBtn()" class="editPwBtn_edit">비밀번호 변경</button>
                  		</div>
						<div class="edit_pw edit_class">
		                  	<div>
								<input name="user_pw" type="password" id="user_pw" class="check" placeholder="비밀번호를 입력해주세요.">
			                    <p class="info_ptag"></p>
							</div>
							<div>
								<input name="user_pw2" type="password" id="user_pw2" class="check" placeholder="비밀번호를 다시 입력해주세요.">
			                  	<button type="button" class="no_edit" onclick="close_pw()">취소</button>
			                    <p class="info_ptag"></p>
		                  	</div>
						</div>
                  </td>
               </tr> 

               <tr>
                  <td class="td_left"><label for="user_addr">주소</label></td>
                  <td class="td_right">
                     <input type="text" id="sample6_postcode" name="user_addr1" value="${edit.user_addr1}" readonly class="join_id_input" required>
                     <button type="button" style="border-radius: 3px; margin: auto;" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">우편번호찾기</button>
                     <input type="text" id="sample6_address" name="user_addr2" value="${edit.user_addr2}" readonly required>
                     <input type="text" id="sample6_detailAddress" name="user_addr3" value="${edit.user_addr3}">
                     <input type="text" id="sample6_extraAddress" name="user_addr4" value="${edit.user_addr4}">
                  </td>
               </tr>

               <tr>
                  <td class="td_left"><label for="user_tel">전화번호</label></td>
                  <td class="td_right">
                     <div class="show_tel">
                        <input type="text" id="show_user_tel" name="show_user_tel" class="do_not_change join_id_input" value="${edit.user_tel}" readonly>
                        <button type="button" onclick="editTelBtn()" class="editTelBtn_edit">전화번호 변경</button>
                     </div>
                     <div class="edit_tel edit_class">
                        <input name="user_tel" type="text" id="user_tel" placeholder="(- 제외)숫자만 입력해주세요" class="check required_edit_tel join_id_input">
                        <button type="button" id="telCheck" class="btn_recive_num" onclick="smsSend()" disabled>인증번호받기</button>
                        <p class="info_ptag"></p>
                        <div class="certification_cover">
	                        <input type="text" id="certificationTel" name="certificationTel" class="check required_edit_tel join_id_input" placeholder="핸드폰 인증번호" readonly>
	                        <span class="time"></span>
							<button type="button" id="telConfirmBtn" class="btn_chk" onclick="smsConfirm()">인증하기</button>
							<p class="info_ptag"></p>
                            <p class="telSubmit_info"></p>
                            <button type="button" class="no_edit" onclick="close_tel()">취소</button>
                        </div>
                     </div>
                  </td>
               </tr>
               <tr>
                  <td class="td_left">
                     <label for="user_email">이메일</label>
                  </td>
                  <td class="td_right">
                     <div class="show_email">
                        <input type="text" id="show_user_email" name="show_user_email" value="${edit.user_email}" class="do_not_change join_id_input" readonly>
                        <button type="button" class="editEmailBtn_edit" onclick="editEmailBtn()">이메일 변경</button>
                     </div>
                     <div class="edit_email edit_class">
                        <input name="user_email" type="text" id="emailText" placeholder="(@)포함 주소" class="check required_edit_email join_id_input">
                        <button type="button" id="emailCheck" class="btn_recive_num" onclick="emailSend()">인증번호받기</button>
                        <p class="info_ptag"></p>
                     	<div class="certification_cover">
	                        <input type="text" id="certificationEmail" name="certificationEmail" class="check required_edit_email join_id_input" placeholder="이메일 인증번호">
	                        <span class="time"></span>
	                        <button type="button" id="emailConfirmBtn" class="btn_chk" onclick="mailConfirm()">인증하기</button>
                        <div>
                           <input type="hidden" id="checkEmail" value="false">
                        </div>
                        <p class="info_ptag"></p>
                        <button type="button" class="no_edit" onclick="close_email()">취소</button>
	                    </div>
                     </div>
                  </td>
               </tr>
              <tr class="join_radio_tr">
                  <td class="td_left">관심있는 분야</td> 
                  <td class="td_right join_radio">
                  	<div class="row" style="text-align: left;">
                  		<div class="col-xs-5 col-md-4 coldiv" style="padding-left: 27px;">
		                     <input type="radio" name="user_cate" class="user_cate enter" value="예체능" required>예체능
                  		</div>
                  		<div class="col-xs-4 col-md-4 coldiv">
		                     <input type="radio" name="user_cate" class="user_cate made" value="공예">공예
                  		</div>
                  		<div class="col-xs-3 col-md-4 coldiv">
		                     <input type="radio" name="user_cate" class="user_cate off" value="사무">사무
                  		</div>
                  		<div class="col-xs-5 col-md-4 coldiv" style="padding-left: 27px;">
		                     <input type="radio" name="user_cate" class="user_cate lifest" value="라이프스타일">라이프스타일
                  		</div>
                  		<div class="col-xs-4 col-md-4 coldiv" id="id_div">
		                     <input type="radio" name="user_cate" class="user_cate IT" value="IT">&nbspIT
                  		</div>
                  		<div class="col-xs-3 col-md-4 coldiv">
		                     <input type="radio" name="user_cate" class="user_cate etc" value="기타">기타
                  		</div>
                  	</div>
                  </td>
               </tr>

            </table>
            <br> <br>

            <section id="commandCell">
               <button class="editBtn_submit">수정</button>
               <button type="button" onclick="location.href='userMyPageGo'" class="goBackToMyPage">취소</button>
            </section>

         </form>         
         </div>
      </section>
   </section>

         <script>
       //preventDefault
         document.addEventListener('submit', function(event){
            console.log("prevent");
            event.preventDefault();
               if($("#checkBoxId").val() == ""){
                  alert("아이디중복확인 필요");
               }
               
               if($("#submitCode").val() != ""){
                  console.log("p태그 값 출력 : " , $("p").text());
                  if( $("#info_ptag").text() == "" ){
                     console.log("p태그 값 없음");
                     if( $("#checkBoxId").val() != "") {
                     	if($(".telSubmit_info").text != "") {
                     		if(!($(".edit_email").hasClass("editRequired"))){
	                     		if(!($(".edit_tel").hasClass("editRequired"))){
    		                 		if(!($(".edit_pw").hasClass("editRequired"))){
			                           console.log("submit");
			                           event.target.submit();
		                     		}else{
		                     			alert("변경하실 비밀번호를 입력해주세요. 변경을 원하지 않으실 경우 확장된 변경란의 '취소'를 눌러주세요.");
		                     		}
	                     		}else{
	                     			alert("변경하실 핸드폰번호의 인증절차를 완료해주세요. 변경을 위치 않으실 경우 확장된 변경란의 '취소'를 눌러주세요.")
	                     		}
                     		}else{
                     			alert("변경하실 이메일의 인증절차를 완료해주세요. 변경을 위치 않으실 경우 확장된 변경란의 '취소'를 눌러주세요.");
                     		}
                     	}
                     }
                  }
               } 
         }); 
         
       //sms 전송 함수
         var smsData = '';
         
         function smsSend(){
            $("#submitCode").removeAttr("readonly");
            let clientTel = $("#user_tel").val();
            console.log('입력 이메일' + clientTel);
            
               $.ajax({
                  type : "POST",
                  url : "sendSMS",
                  async : false,
                  data : {
                     "user_tel" : clientTel
                  },
                  success : function(data) {
                     console.log("data", data);
                     smsData = data;
                     console.log("인증번호가 전송되었습니다.");
                     $("#certificationTel").attr("readonly", false);
                     $("#certificationTel").focus();
                  },
                  error : function(e) {
                     alert('오류입니다. 잠시 후 다시 시도햐주세요');
                  }
               });
            } 
         
         //sms 인증번호 확인함수
         function smsConfirm() {
            var confirmNum = $("#certificationTel").val();
            var sendNum = smsData;
            console.log('confirmNum',confirmNum);
            console.log('sendNum',sendNum);
            
            $.ajax({
               type : "POST",
               url : "confirmNum",
               data: {
                  "confirmNum" : confirmNum,
                  "sendNum" : smsData
               },
               cache : false,
               success: function(data) {
                  if (data.check == "success") { //controller에서 넘겨준 성공여부 코드
                 	 if(confirmNum == "" && sendNum == ""){
                      	alert("인증번호를 전송해주세요");
                      }else if(confirmNum == "" && sendNum != "") {
                      	alert("인증번호가 입력되지 않았습니다.");
                      }else {
	                        console.log("성공");
	                     	$(".telSubmit_info").html("인증되었습니다.");
	                     	$(".edit_tel").removeClass("editRequired");
	                     	alert("인증되었습니다.");
	                     	clearInterval(timer);
	                 		$(".time").html("");
	                     	$("#certificationTel").attr("readonly", true);
                      }
                  } else {
                  	alert("인증에 실패했습니다. 인증번호를 요청한 번호나 입력한 인증번호에 오차가 없는지 확인해주세요.");
                  }
               },
               error: function(request, status) {
                  alert("오류가 발생했습니다.");
               }
            });
            mailData = "";
         }
         
         //이메일 전송함수
         function emailSend() {
        	 let clientEmail = $("#emailText").val();
        	 
        	 $.ajax({
					type : "POST",
					url : "sendEmail",
					async : false,
					data : {
						"user_email" : clientEmail
					},
					success : function(data) {
						console.log("data : ", data);
						mailData = data;
					},
					error : function(e) {
						alert('오류입니다. 잠시 후 다시 시도햐주세요');
					}
				});
         }
         
         //이메일 인증번호 확인함수
         function mailConfirm() {
			var confirmNum = $("#certificationEmail").val();
			var sendNum = mailData;
			console.log('confirmNum',confirmNum);
			console.log('sendNum',sendNum);
			
			$.ajax({
	               type : "POST",
	               url : "confirmNum",
	               data: {
	                  "confirmNum" : confirmNum,
	                  "sendNum" : sendNum
	               },
	               cache : false,
	               success: function(data) {
	                  if (data.check == "success") { //controller에서 넘겨준 성공여부 코드
	                 	 if(confirmNum == "" && sendNum == ""){
	                      	alert("인증번호를 전송해주세요");
	                      }else if(confirmNum == "" && sendNum != "") {
	                      	alert("인증번호가 입력되지 않았습니다.");
	                      }else {
		                        console.log("성공");
		                     	$(".telSubmit_info").html("인증되었습니다.");
		                     	$(".edit_email").removeClass("editRequired");
		                     	alert("인증되었습니다.");
		                     	clearInterval(timer);
		                 		$(".time").html("");
		                     	$("#certificationEmail").attr("readonly", true);
	                      }
	                  } else {
	                  	alert("인증에 실패했습니다. 인증번호를 요청한 이메일이나 입력한 인증번호에 오차가 없는지 확인해주세요.");
	                  }
	               },
	               error: function(request, status) {
	                  alert("오류가 발생했습니다.");
	               }
	            });
			mailData = "";
		}
         
            $(".check").keyup (function(){
               var checkText = "";
                 var thisVal = $(this).val();
                 var idRegex = /^[0-9A-Za-z]{6,12}$/;
                 var codeRegex = /^[0-9]{6}$/;
                 var nameRegex = /^[가-힣]{2,4}$/;
                 var passwordRegex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
                 var telRegex = /^010\d{4}\d{4}$/;
                 var emailRegex =  /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
                 
                    switch($(this).attr("name")){
                    case "certificationTel":
                       if(thisVal.length != 0 && codeRegex.test(thisVal) == false){
                          checkText = "숫자 6자리를 입력해주세요.";
                       }
                       break;
                       
                    case "certificationEmail":
                       if(thisVal.length != 0 && codeRegex.test(thisVal) == false){
                          checkText = "숫자 6자리를 입력해주세요.";
                       }
                       break;
                       
                    case "user_tel":
                        if(thisVal.length != 0 && telRegex.test(thisVal) == false){
                             checkText = "(-)제외 010포함 11자리를 입력해주세요";
                            document.getElementById("telCheck").disabled = true;
                        }else if(thisVal.legth == 0){
                        	checkText = "핸드폰번호를 입력해주세요";
                            document.getElementById("telCheck").disabled = true;
                        }else{
                            document.getElementById("telCheck").disabled = false;
                        }
                        break;
                        
                    case "user_email":
                        if(thisVal.length != 0 && emailRegex.test(thisVal) == false) {
                           	checkText = "이메일이 형식에 맞지 않습니다.";
                        	document.getElementById("emailCheck").disabled = true;
                        }else if(thisVal.length == 0){
                        	checkText = "이메일을 입력해주세요.";
                        	document.getElementById("emailCheck").disabled = true;
                        }else {
                        	document.getElementById("emailCheck").disabled = false;
                        }
                        break;
                        
                    case "user_pw":
                        if(thisVal.length != 0 && passwordRegex.test(thisVal) == false) {
                            checkText = "영문 대소문자, 숫자, 특수문자의 조합으로 최소 8자를 입력해주세요";
                            if(!($(".edit_pw").hasClass("editRequired"))) {
                               $(".edit_pw").addClass("editRequired");
                            }
                         }else if(thisVal.length == 0) {
                            checkText = "비밀번호를 입력해주세요.";
                            if(!($(".edit_pw").hasClass("editRequired"))) {
                               $(".edit_pw").addClass("editRequired");
                            }
                         }else if(thisVal.length != 0 && $("#user_pw2").val() != thisVal){
                         checkText = "비밀번호가 일치하지 않습니다.";
                         if(!($(".edit_pw").hasClass("editRequired"))) {
                                $(".edit_pw").addClass("editRequired");
                         }else{
                                $(".edit_pw").removeClass("editRequired");
                         }
                      }else{
                            $(".edit_pw").removeClass("editRequired");
                         }
                         break;
                         
                      case "user_pw2":
                         if(thisVal.length != 0 && $("#user_pw").val() != thisVal) {
                              checkText = "비밀번호가 일치하지 않습니다.";
                              if(!($(".edit_pw").hasClass("editRequired"))) {
                                 $(".edit_pw").addClass("editRequired");
                              }
                              
                        }else if(thisVal.length != 0 && passwordRegex.test(thisVal) == false) {
                             checkText = "영문 대소문자, 숫자, 특수문자의 조합으로 최소 8자를 입력해주세요";
                             if(!($(".edit_pw").hasClass("editRequired"))) {
                                $(".edit_pw").addClass("editRequired");
                             }
                        }else if(thisVal.length == 0){
                           checkText = "비밀번호를 입력해주세요.";
                              if(!($(".edit_pw").hasClass("editRequired"))) {
                                 $(".edit_pw").addClass("editRequired");
                              }
                     }else{
                                 $(".edit_pw").removeClass("editRequired");
                           }
                         break;
                        
                 }
                 if(checkText != ""){
                	 if($(this).attr("id")=="user_pw"){
               		  $("#user_pw2").siblings(".info_ptag").html(checkText);
   	                  $("#user_pw2").addClass("vali");
   	                  $("#user_pw2").siblings(".info_ptag").slideDown();
   	                   $("#user_pw2").css({
   	                      "borderColor":"red"
   	                   });
               	 	 }else{
	                     $(this).siblings(".info_ptag").html(checkText);
	                     $(this).siblings(".info_ptag").addClass("vali");
	                     $(this).siblings(".info_ptag").slideDown();
	                      $(this).css({
	                         "borderColor":"red"
	                      });
               	 	 }
                 } else {
                	 if($(this).attr("id")=="user_pw"){
 						$("#user_pw2").siblings(".info_ptag").slideUp();
 						$("#user_pw2").siblings(".info_ptag").empty();
 						$("#user_pw2").removeClass("vali");
             	  	}else{
						$(this).siblings(".info_ptag").slideUp();
						$(this).siblings(".info_ptag").empty();
						$(this).removeClass("vali");
						if($(this).val() != $("#user_id").val()){
	                         $(this).css({
	                            "borderColor":"#009900"
	                         });
						}else{
	                         $(this).css({
	                            "borderColor":"black"
	                         });
	                         
	                      }
	                  }
                 }
	            });
         </script>
   <%@include file="../main/footer.jsp"%>
</body>
</html>