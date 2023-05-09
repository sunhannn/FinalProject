<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.menu-bar {
  position: fixed;
  top: 0;
  left: 0;
  width: 200px;
  height: 100%;
  background-color: #333;
  overflow: auto;
  padding: 15px;
}

.menu-bar a {
  display: block;
  color: white;
  text-decoration: none;
  margin-bottom: 20px;
  transition: 0.3s;
  padding: 5px; /* 패딩 추가 */
}

.menu-bar a:hover {
  color: #f1f1f1;
  background-color: #555;
  border-radius: 5px;
}
.menu-bar p{
color: #ffd400;
font-size: 15px;
}
.menu-bar h2{
color: #ffd400;
}
</style>
</head>
<body>
<div class="menu-bar">
<a href="index" ><img src="${pageContext.request.contextPath}/front/LOGOy.png" style="width:140px; hight: auto;" title="꿀팁으로가기"></a>
<p>관리자님 반갑습니다</p>
<br>
  <h3><a href="goChart">메인으로가기</a></h3>
  <a href="getUserListUser">회원리스트</a>
  <a href="getLessonListLesson">강의리스트</a>
  <a href="getReportList">블랙리스트관리</a>
  <a href="getPotentialTiperList">승급요청처리</a>
  <a href="#">브랜드소개수정</a>
  <a href="#">메인이벤트수정</a>
  <a href="#">관리자정보수정</a>
  <a href="callEscrowList">에스크로내역</a>
</div>
</body>
</html>