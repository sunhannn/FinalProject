<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../queen/adminNavbar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자정보수정</title>

<style>
.container {
   width: 70%;
   margin: 0 auto;
   align:center;
}
/* 나머지 요소들은 기본값인 z-index: 1로 설정 */
table {
   width: 70%;
   margin-left:20%;
   margin-right:15%;
   border-collapse: collapse;
   width: 60%;
   z-index: 1;
}

th, td {
   text-align: center;
   vertical-align: middle;
   border: 1px solid #ddd;
   padding: 8px;
   z-index: 1;
}

th {
   background-color: #f2f2f2;
   font-weight: bold;
}

#submit-button {
   border: 0;
   border-radius: 4px;
   background-color: #FFD400;
   font-size: 12pt;
   padding: 5px;
   margin: 5px;
   cursor: pointer;
   color: #382407;
   float: right;
}

#reset-button {
   border: 0;
   border-radius: 4px;
   background-color: #e2e2e2;
   font-size: 12pt;
   padding: 5px;
   margin: 5px;
   cursor: pointer;
   color: #382407;
   float: right;
}

#submit-button:hover {
   background-color: #E6B800;
}

#reset-button:hover {
   background-color: #a2a2a2;
}

.pagination-row {
   background-color: #e8f0fe;
}

.pagination-row th {
   font-size: 12pt;
}

#pagingul {
   margin-top: 20px;
   list-style: none;
   display: flex;
   justify-content: center;
}

#pagingul li {
   margin-right: 5px;
}

#pagingul li a {
   display: block;
   padding: 5px 10px;
   border: 1px solid #ddd;
   background-color: #fff;
   color: #333;
   text-decoration: none;
}

#pagingul li.on a {
   background-color: #FFD400;
   color: #fff;
}

input {
   padding: 5px 150px 5px 10px;
   border-radius: 3px;
   border: 2px solid #ddd;
}

</style>
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
            <h2 style="margin: 40px 0px;">관리자정보수정</h2>
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