<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@include file="../main/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>꿀TIPer - 회원가입</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
         $(".info_ptag").hide();
         $(".telSubmit_info").hide();
      }
      function idCheck() {

         var id = $("#user_id").val();
         console.log(id);

         $.ajax({
            type : "POST",
            url : "idCheck", 
            data : {
               "user_id" : id
            }, 
            cache : false, 
            success : function(data) { 
               console.log("data 찍어보기 : " + data.check)
               if (data.check == "success") { 
                  alert("사용가능한 아이디입니다.");
                  $("#checkBoxId").val("success");
               } else {
                  alert("사용불가한 아이디입니다.")
                  $("#checkBoxId").val("");
               }
            },
            error : function(request, status) {
               alert("오류가 발생했습니다.")
            }
         });
      }
   </script>

   <section id="body_css">
      <section id="writeForm">
         <div class="contents_join">
            <form name="joinform" action="userJoin" method="post" class="form_section_join">

            <table class="join_info_table">

               <tr>
                  <td colspan="2"><h3 style="text-align: left;">회원가입</h3> <hr><br></td>
               </tr>
               <tr>
                  <td class="td_left"><label for="user_id">아이디</label></td>
                  <td class="td_right">
                     <input type="text" name="user_id" id="user_id" class="check join_id_input" placeholder="아이디를 입력해주세요" required>
                     <button type="button" onclick="idCheck()">아이디 중복체크</button>
                     <input type="hidden" id="checkBoxId" value="">
                     <p class="info_ptag"></p>
                  </td>
               </tr>

               <tr>
                  <td class="td_left"><label for="user_pw">비밀번호</label></td>
                  <td class="td_right">
                     <input name="user_pw" type="password" id="user_pw" class="check" placeholder="비밀번호를 입력해주세요." required>
                     <p class="info_ptag"></p>
                  </td>
               </tr>

               <tr>
                  <td class="td_left"><label for="user_pw2">비밀번호 확인</label></td>
                  <td class="td_right">
                     <input name="user_pw2" type="password" id="user_pw2" class="check" placeholder="비밀번호를 다시 입력해주세요." required>
                     <p class="info_ptag"></p>
                  </td>
               </tr>

               <tr>
                  <td class="td_left"><label for="user_name">이름</label></td>
                  <td class="td_right">
                     <input name="user_name" type="text" id="user_name" class="check" placeholder="이름을 입력해주세요." required>
                     <p class="info_ptag"></p>
                  </td>
               </tr>

               <tr>
                  <td class="td_left"><label for="user_addr">주소</label></td>
                  <td class="td_right">
                     <input type="text" id="sample6_postcode" name="user_addr1" placeholder="우편번호" class="join_id_input" readonly required>
                     <button type="button" style="border-radius: 3px; margin: auto;" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">우편번호찾기</button>
                     <input type="text" id="sample6_address" name="user_addr2" placeholder="주소" readonly required>
                     <input type="text" id="sample6_detailAddress" name="user_addr3" placeholder="상세주소">
                     <input type="text" id="sample6_extraAddress" name="user_addr4" placeholder="참고항목">
                  </td>
               </tr>

               <tr>
                  <td class="td_left"><label for="user_tel">전화번호</label></td>
                  <td class="td_right">
                     <input name="user_tel" type="text" id="user_tel" placeholder="(- 제외)숫자만 입력해주세요" class="check join_id_input" required>
                     <button type="button" id="telCheck" class="btn_recive_num" onclick="smsSend()" disabled>인증번호받기</button>
                     <p class="info_ptag"></p>
                     <div class="certification_cover">
	                     <input type="text" id="certificationTel" name="certificationTel" class="check join_id_input" placeholder="인증번호" readonly required>
	                     <span class="time certi_time"></span>
                        <button type="button" id="telConfirmBtn" class="btn_recive_num btn_chk" onclick="smsConfirm()">인증하기</button>
                     <p class="info_ptag"></p>
                     <p class="telSubmit_info"></p>
                     </div>
                  </td>
               </tr>
               <tr>
                  <td class="td_left">
                     <label for="user_email">이메일</label>
                  </td>
                  <td class="td_right">
                     <input name="user_email" type="text" id="emailText" placeholder="(@)포함 주소" class="check" required>
                     <p class="info_ptag"></p>
                  </td>
               </tr>
               <tr class="join_radio_tr">
                  <td class="td_left">관심있는 분야</td> 
                  <td class="td_right join_radio">
                  	<div class="row" style="text-align: left;">
                  		<div class="col-xs-5 col-md-4 coldiv" style="padding-left: 27px;">
		                     <input type="radio" name="user_cate" class="user_cate" value="예체능" required>예체능
                  		</div>
                  		<div class="col-xs-4 col-md-4 coldiv">
		                     <input type="radio" name="user_cate" class="user_cate" value="공예">공예
                  		</div>
                  		<div class="col-xs-3 col-md-4 coldiv">
		                     <input type="radio" name="user_cate" class="user_cate" value="사무">사무
                  		</div>
                  		<div class="col-xs-5 col-md-4 coldiv" style="padding-left: 27px;">
		                     <input type="radio" name="user_cate" class="user_cate" value="라이프스타일">라이프스타일
                  		</div>
                  		<div class="col-xs-4 col-md-4 coldiv" id="id_div">
		                     <input type="radio" name="user_cate" class="user_cate" value="IT">&nbspIT
                  		</div>
                  		<div class="col-xs-3 col-md-4 coldiv">
		                     <input type="radio" name="user_cate" class="user_cate" value="기타">기타
                  		</div>
                  	</div>
                  </td>
               </tr>

            </table>
            <br> <br>

            <section id="commandCell">
               <button value="회원가입" class="userJoinBtn_join">회원가입</button>
               <button type="button" onclick="location.href='/'">취소</button>

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
	                           console.log("submit");
	                           event.target.submit();
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
                    	 
                    	 $(".telSubmit_info").css({
                             "borderColor":"#009900"
                          });
                    	 
                    	 if(confirmNum == "" && sendNum == ""){
                         	alert("인증번호를 전송해주세요");
                         }else if(confirmNum == "" && sendNum != "") {
                         	alert("인증번호가 입력되지 않았습니다.");
                         }else {
	                        console.log("성공");
	                     	$(".telSubmit_info").html("true");
	                     	alert("인증되었습니다.");
	                     	clearInterval(timer);
	                 		$(".time").html("");
                         }
                     } else {
                     	alert("인증에 실패했습니다. 입력된 전화번호나 인증번호에 오차가 없는지 확인해주세요.");
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
                 var idRegex = /^[0-9A-Za-z]{5,12}$/;
                 var codeRegex = /^[0-9]{6}$/;
                 var nameRegex = /^[가-힣]{2,4}$/;
                 var passwordRegex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
                 var telRegex = /^010\d{4}\d{4}$/;
                 var emailRegex =  /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
                 
                    switch($(this).attr("name")){
                    case "user_name":
                        if(thisVal.length != 0 && nameRegex.test(thisVal) == false){
                           checkText = "한글 2-4자로 입력해주세요.";
                        }
                        break;
                        
                    case "user_id":
                       if(thisVal.length != 0 && idRegex.test(thisVal) == false){
                          checkText = "영문 대소문자, 숫자의 조합으로 최소 6자, 최대 12자를 입력해주세요.";
                       }
                       break;
                       
                    case "certificationTel":
                       if(thisVal.length != 0 && codeRegex.test(thisVal) == false){
                          checkText = "숫자 6자리를 입력해주세요.";
                       }
                       break;
                       
                    case "user_tel":
                        if(thisVal.length != 0 && telRegex.test(thisVal) == false){
                             checkText = "(-)제외 010포함 11자리를 입력해주세요";
                            document.getElementById("telCheck").disabled = true;
                         }else{
                            document.getElementById("telCheck").disabled = false;
                         }
                        break;
                        
                    case "user_email":
                        if(thisVal.length != 0 && emailRegex.test(thisVal) == false) {
                           checkText = "이메일이 형식에 맞지 않습니다.";
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