<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<style>
.menu-bar {
  position: fixed;
  left: -190px;
  top: 0;
  width: 230px;
  height: 100%;
  background-color: #333;
  overflow: auto;
  transition: left 0.3s ease-in-out; 
}
.menu-bar a {
  display: block;
  color: white;
  text-decoration: none;
  margin-bottom: 20px;
  transition: 0.3s;
  padding: 5px; 
  margin:20px;
}

.menu-bar a:hover {
  color: #f1f1f1;
  background-color: #555;
  border-radius: 5px;
  
}
.menu-bar p{
color: #ffd400;
font-size: 15px;
 margin:20px;
}
.menu-bar h2{
color: #ffd400;
 margin:20px;
}

.sub-menu {
  display: none;
}
.menu-bar.active {
  left: 0;
}
.menu-icon {
  display: block;
  position: absolute;
  top: 50%;
  right: 10px;
  transform: translateY(-50%);
}
.menu-icon i {
  font-size: 36px;
  color: white;
}
</style>
</head>
<body>
<div class="menu-bar">
<a href="index" ><img src="${pageContext.request.contextPath}/front/LOGOy.png" style="width:140px; hight: auto;" title="꿀팁홈페이지로가기"></a>
<p>관리자님 반갑습니다</p>
<br>
<h3><a href="goChart">메인으로가기</a></h3>
  <a href="getUserListUser">회원리스트</a>
  <a href="getLessonListLesson">강의리스트</a>
  <a href="getReportList">블랙리스트관리</a>
  <a href="getPotentialTiperList">승급요청처리</a>
  <a href="adminNoticeList">공지사항 관리</a>
  <a href="adminFaqList">F A Q 관리</a>
  <a href="adminUpdateGo">관리자정보수정</a>
  <a href="callEscrowList">에스크로내역</a>
<a href="getDisputeResolutionList">티퍼-회원 분쟁조정</a>
<div class="menu-icon">
    <i class="fas fa-angle-right"></i>
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