<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../queen/adminNavbar.jsp"%>
    <%

if(request.getParameter("error")!=null){
	out.print("<script>");
	out.print("alert('수정되지 않았습니다.');");
	out.print("</script>");
}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>꿀TIPer 관리자 - 정보 수정</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" media="screen and (min-width:769px)" href="front/user.css">
   <link rel="stylesheet" media="screen and (max-width:768px)" href="front/userJoinMobile.css">
   <style>
      #commandCell button {
         margin-top : 20px;
      }
      
      #commandCell .editBtn_submit:hover {
         background-color: e6b800;
      }
      
   </style>
</head>
<body class="admin_edit_body">
<script>
   window.onload = function() {
       $(".edit_email").hide();
       $(".edit_pw").hide();
       $(".info_ptag").hide();
       $(".telSubmit_info").hide();
    }
    
    function editEmailBtn() {
       $(".edit_email").slideDown();
       $(".edit_email").addClass("editRequired");
       $(".editEmailBtn_edit").hide();
    }
    
    function editPwBtn() {
         $(".edit_pw").slideDown();
         $(".edit_pw").addClass("editRequired");
         $(".editPwBtn_edit").hide();
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
</script>

      <div id="writeForm" class="admin_formWrap">
         <div class="contents_join admin_editContent">
            <form name="joinform" action="adminEdit" method="post" class="form_section_join">
         <h3>관리자정보 수정</h3>
            <table class="join_info_table edit_info_table">
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
                        <button type="button" id="emailCheck" onclick="emailSend()">인증번호받기</button>
                        <p class="info_ptag"></p>
                        <input type="text" id="certificationEmail" name="certificationEmail" class="check required_edit_email join_id_input" placeholder="이메일 인증번호">
                           <button type="button" id="emailConfirmBtn" onclick="mailConfirm()">인증하기</button>
                        <div>
                           <input type="hidden" id="checkEmail" value="false">
                        </div>
                        <p class="info_ptag"></p>
                        <button type="button" class="no_edit" onclick="close_email()">취소</button>
                     </div>
                  </td>
               </tr>

            </table>

            <section id="commandCell">
               <button class="editBtn_submit">수정</button>
            </section>

         </form>         
         </div>
      </div>
      <script>
      
      //preventDefault
        document.addEventListener('submit', function(event){
           console.log("prevent");
           event.preventDefault();
              if($("#checkBoxId").val() == ""){
                 alert("아이디중복확인 필요");
              }
              
              if($("#submitCode").val() != ""){
                 if( $("#info_ptag").text() == "" ){
                    if( $("#checkBoxId").val() != "") {
                          if(!($(".edit_email").hasClass("editRequired"))){
                                if(!($(".edit_pw").hasClass("editRequired"))){
                                    console.log("submit");
                                    event.target.submit();
                              }else{
                                 alert("변경하실 비밀번호를 입력해주세요. 변경을 원하지 않으실 경우 확장된 변경란의 '취소'를 눌러주세요.");
                             }
                          }else{
                               alert("변경하실 이메일의 인증절차를 완료해주세요. 변경을 위치 않으실 경우 확장된 변경란의 '취소'를 눌러주세요.");
                          }
                       }
                    }
                 }
           }); 
      
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
                  $("#certificationEmail").focus();
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
      
      $(".check").keyup(function(){
            var checkText = "";
              var thisVal = $(this).val();
              
                 switch($(this).attr("name")){
                 
                case "user_pw":
                     if(thisVal.length != 0 && $("#user_pw2").val() != thisVal){
                        checkText = "비밀번호가 일치하지 않습니다.";
                        if(!($(".edit_pw").hasClass("editRequired"))) {
                               $(".edit_pw").addClass("editRequired");
                        }
                     }else if(thisVal.length == 0) {
                         checkText = "비밀번호를 입력해주세요.";
                         if(!($(".edit_pw").hasClass("editRequired"))) {
                            $(".edit_pw").addClass("editRequired");
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
                  $(this).addClass("vali");
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
                        $("#user_pw2").css({
                           "borderColor":"green"
                        });
                    }
               }
         });
      </script>
</body>
</html>