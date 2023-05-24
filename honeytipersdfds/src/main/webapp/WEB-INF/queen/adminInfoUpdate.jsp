<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../queen/adminNavbar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>꿀TIPer 관리자 - 정보 수정</title>
<link href="${pageContext.request.contextPath}/front/adminInfoUpdate.css" rel="stylesheet">
</head>
<body>

   <script
      src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <script type="text/javascript"
      src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>


   <div class="jumbotron"></div>
   <nav id="searchNav" class="navbar navbar-expand-sm navbar-dark">
   </nav>
   <div id="container003">
      <div id="table003">
         <div id="top_bar"></div>
         <div class="container">
            <h2 style="margin: 40px 0px;">관리자 정보수정</h2>
            <hr class="hrFirst">
            <form action="adminUpdateAction" method="post"
               class="needs-validation" novalidate>
               <table>
                  <tr>
                     <td class="td_left"><label for="user_pw">비밀번호</label></td>
                     <td class="td_right"><input name="user_pw" type="password"
                        id="user_pw" required>
<!--                            <div class="invalid-feedback">필수 정보입니다.</div></td> -->
                  </tr>

                  <tr>
                     <td class="td_left"><label for="user_pw2">비밀번호 확인</label></td>
                     <td class="td_right"><input name="user_pw2" type="password"
                        id="user_pw2" placeholder="이메일을 입력해주세요" required>
<!--                         <div class="invalid-feedback">필수 정보입니다.</div></td> -->
                  </tr>

                  <tr>
                     <td><span class="tab_span">이메일</span></td>
                     <td><input type="text" name="user_email"
                        placeholder=""></td>
                  </tr>


               </table>
               <br>
               <button id="submit-button" type="submit">수정완료</button>
               <button id="reset-button" type="reset">취소</button>
            </form>
         </div>

      </div>
   </div>


   <script>
      //유효성 확인
      (function() {
         'use strict';
         window.addEventListener('load',
               function() {
                  var forms = document
                        .getElementsByClassName('needs-validation');
                  var validation = Array.prototype.filter.call(forms,
                        function(form) {
                           form.addEventListener('submit', function(
                                 event) {
                              if (form.checkValidity() === false) {
                                 event.preventDefault();
                                 event.stopPropagation();
                              }
                              form.classList.add('was-validated');
                              valChk(event);
                           }, false);
                        });
               }, false);
      })();
      function valChk(e) {
         e.preventDefault();
         var passwordRegex = /^[0-9A-Z_a-z]+$/, email = $("#emailText"), password = $("#user_pw"), passwordre = $("#user_pw2");
         var valid = true;
         valid = valid
               && checkMatch(password.val(), passwordre.val(), passwordre);
         valid = valid
               && checkRegexp(password, passwordRegex,
                     "비밀번호 입력 형식이 잘못되었습니다.");
         valid = valid && checkLength(password, "비밀번호", 5, 16);



         //비밀번호 매칭
         function checkMatch(p, pre, passre) {
            let pval = p;
            console.log(pval);
            let pvalre = pre;
            console.log(pvalre);
            let res = true;
            if (pval != pvalre) {
               passre.nextAll("div.invalid-feedback").text(
                     "비밀번호가 일치하지 않습니다.").show();
               passre.nextAll("div.valid-feedback").hide();
               res = false;
            } else {
               passre.nextAll("div.valid-feedback").text("비밀번호가 일치합니다.")
                     .show();
               passre.nextAll("div.invalid-feedback").hide();
            }
            return res;
         }
         //정규식 일치 여부 확인
         function checkRegexp(o, regexp, n) {
            let cnt = $("#" + o.attr('id') + " ~ div.invalid-feedback").length;
            console.log('o: ', o);
            console.log('cnt: ', cnt);
            console.log('o.val(): ', o.val());
            console.log('regexp.test( o.val() ): ', regexp.test(o.val()));
            if (!(regexp.test(o.val()))) {
               if (cnt == 0) {
                  o.closest("div.row").nextAll("div.invalid-feedback")
                        .eq(0).text(n).show();
               } else {
                  o.nextAll("div.invalid-feedback").eq(0).text(n).show();
                  o.nextAll("div.valid-feedback").eq(0).hide();
               }
               return false;
            } else {
               if (cnt == 0) {
                  o.closest("div.row").nextAll("div.invalid-feedback")
                        .eq(0).text(n).hide();
               } else {
                  o.nextAll("div.invalid-feedback").eq(0).text(n).hide();
               }
               return true;
            }
         }

         function checkLength(o, n, min, max) {
            if (o.val().length > max || o.val().length < min) {
               return false;
            } else {
               return true;
            }
         }
         if (valid)
            e.target.submit();
      }
   </script>


</body>
</html>