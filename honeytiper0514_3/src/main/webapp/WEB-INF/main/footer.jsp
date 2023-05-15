<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />


<style>

.foot_text {
   color: rgb(255, 255, 255);
   font-size: 13px;
   font-family: Arial, Helvetica, sans-serif;
}

.texthv span {
   transition: 0.35s ease-in-out;
   cursor: pointer;
}

.flex-container, .flex-container2 {
   height: 150px;
   display: flex;
   align-items: stretch;
   background-color: #212a30;
   text-align: center;
   margin-bottom: 0;
}

@media ( max-width : 767px) {
   .flex-container{
      display: none;      
   }
   
   .flex-container2{
      margin: 0 auto;
      height: 150px;
   }
}

@media ( min-width : 768px) {   

   .flex-container{
      margin: 0 auto;
      height: 150px
   }
   
   .flex-container2{
      display: none;
   }
}

</style>

<div class="flex-container" style="padding: 50px 0">
<!--    <div style="flex-grow: 1"></div> -->
   <div style="flex-grow: 9" class="foot_text">
      <p>
         장승무 오현민 김보영 양소연 이승희 정성현 한상현 해애언 <a href="adminLoginBtn">관리자로그인</a>
      </p>

      <p class="texthv">현재 사이트는 교육용으로 제작된 웹 사이트로 실제로 사용 불가</p>
      <p>Copyright © 2023 honeytiper</p>
   </div>
</div>

<div class="flex-container2" style="padding: 50px 0; align-items: center;">
<!--    <div style="flex-grow: 1"></div> -->
   <div style="flex-grow: 9" class="foot_text">
      <p>
         장승무 오현민 김보영 양소연 이승희 <br> 정성현 한상현 해애언  <a href="adminLoginBtn">관리자로그인</a>
      </p>
      <p class="texthv">교육용으로 제작된 웹 사이트로 실제 사용이 불가능</p>
      <p>Copyright © 2023 honeytiper</p>
   </div>
</div>