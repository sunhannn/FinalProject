<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../main/header.jsp"%>
<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.min.js" charset="utf-8"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<body>
   <div class="jumbotron">
      <h1>로그인</h1>
   </div>
   <%--    <%@ include file="menu.jsp"%> --%>
   <div class="container" align="center">
      <div class="col-md-4 col-md-offset-4">
         <h3 class="form-signin-heading">로그인</h3>
         <%
         if (request.getParameter("error") != null) {
            out.println("<div class='alert alert-danger'>");
            out.println("아이디와 비밀번호를 확인해 주세요");
            out.println("</div>");
         }
         %>
         <form class="form-signin" action="/login" method="post">
            <div class="form-group">
               <label for="user_id" class="sr-only">User Name</label> 
               <input type="text" class="form-control" placeholder="ID" name="user_id" id="user_id" required autofocus>
            </div>
            <div class="form-group">
               <label for="user_pw" class="sr-only">Password</label> 
               <input type="password" class="form-control" placeholder="Password" name="user_pw" id="user_pw" required>
            </div>
            <button class="btn btn btn-lg btn-success btn-block" id="login" type="submit">로그인</button>
            <button class="btn btn btn-lg btn-success btn-block" onclick="agreementBtn()" type="button">회원가입</button>
            <button type="button" onclick="loginWithKakao()">카카오 로그인</button>
         </form>
         <a href="find?find=id">아이디찾기</a> <a href="find?find=pw">비밀번호찾기</a>
      </div>
   </div>

   <script type="text/javascript">
      //회원가입 페이지 이동
      function agreementBtn() {
         document.location = "agreementBtn";
      }

      //초기화 시키기. 
      $(document).ready(function() {
         Kakao.init('e249d8f9f86e7dc7235a6fdf46fcc2f2');
         console.log(Kakao.isInitialized());
      });

      //카카오서버에 로그인
      function loginWithKakao() {
         Kakao.Auth.login({
            success : function(response) {
               Kakao.API.request({
                  url : '/v2/user/me',
                  success : function(response) {
                     let mail = response.kakao_account.email;
                     let id = response.id;
                     let name = response.kakao_account.profile.nickname;
                     
                     login = loginByKakao(mail, id);
                     console.log(login);

                        if (login == "true") {
                           console.log("로그인 성공");
                           location.href = "index";
                        }else {
                           console.log("회원가입 실행");
                           joinByKakao(mail, id , name);
                        }
                     }

                  });
               }
            });
         }

      $("#joinUser").click(function() {
         location.href = "join.jsp";
      });

      //이메일로 로그인 
      function loginByKakao(mail, id) {

         var login = "";

         console.log("카카오 이메일로 로그인 시도");
         $.ajax({
            type : "POST",
            url : "/loginByKakao",
            async : false,
            data : {
               "user_email" : mail,
               "user_id" : id
            },
            cache : false,
            success : function(data) {
               if (data.check == "success") {
                  console.log("true return");
                  login = "true";
               } else {
                  login = "false";
               }
            },
            error : function(request, status) {
               
               alert("오류가 발생했습니다.")
            }

         });
         return login;
      }
      
      //카카오 회원가입
      function joinByKakao(mail, id, name) {
         
         console.log("카카오 회원가입");
         $.ajax({
            type : "POST",
            url : "/joinByKakao",
            async : false,
            data : {
               "user_email" : mail,
               "user_id" : id,
               "user_pw" : id,
               "user_name" : name
            },
            cache : false,
            success : function(data) {
               if(data == "success") {
                  alert("회원가입 되었습니다");
                  
               }else{
                  alert("회원가입 실패");
               }
            },
            error : function(request, status){
               alert("오류가 발생했습니다.");
               
            }
         });
         document.location = "index";
      }
   </script>
</body>
</html>