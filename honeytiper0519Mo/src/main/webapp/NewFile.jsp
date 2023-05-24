<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <script>
    function toggleImg() {
      document.getElementById("img").src = "front/error_img.png";
    }
  </script>
</head>
<body>
  <div class="container">
    <img id="img" src="front/LOGO.png" />
    <button onclick="toggleImg()">toggle</button>
  </div>
</body>
</html>