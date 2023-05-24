<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- <title>Insert title here</title> -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="${pageContext.request.contextPath}/front/adminNavbar.css" rel="stylesheet">
<style>


</style>
</head>
<body>
<div class="menu-bar">
<a href="index" style="margin:0px 20px;"><img onerror="this.src='${pageContext.request.contextPath}/front/default.png'" src="${pageContext.request.contextPath}/front/LOGOy.png" style="width:140px; hight: auto;" title="꿀TIP 홈페이지로가기"></a>
<p class="p"style="margin-bottom:40px;">관리자님 반갑습니다</p>
<h3 class="h3"><a style="font-size:18.72px; font-weight:bold;" href="goChart">메인으로가기</a></h3>
  <a href="listuser">회원리스트</a>
  <a href="listlesson">강의리스트</a>
  <a href="getReportList">블랙리스트관리</a>
  <a href="getPotentialTiperList">승급요청처리</a>
  <a href="adminNoticeList">공지사항 관리</a>
  <a href="adminFaqList">F A Q 관리</a>
  <a href="callEscrowList">에스크로내역</a>
  <a href="getDisputeResolutionList">강의완료 및 취소</a>
  <a href="adminChkBtn">관리자정보수정</a>
  <a class="p" href="logOut"style="font-weight:bold;font-size:18px;">관리자 로그아웃</a>
<div class="menu-icon">
    <i class="fa fa-angle-right"></i>
  </div>
</div>

 <script>
 const menuBar = document.querySelector('.menu-bar');
 const subMenus = document.querySelectorAll('.sub-menu');
 const menuIcon = document.querySelector('.menu-icon');

 menuBar.addEventListener('mouseover', () => {
   menuBar.classList.add('active');
   subMenus.forEach(subMenu => subMenu.style.display = 'block');
   menuIcon.style.display = 'none';
 });

 menuBar.addEventListener('mouseout', () => {
   menuBar.classList.remove('active');
   subMenus.forEach(subMenu => subMenu.style.display = 'none');
   if (!menuBar.classList.contains('active')) {
     menuIcon.style.display = 'block';
   }
 });
</script> 
</body>
</html>