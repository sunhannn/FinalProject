<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>꿀TIPer 관리자 - FAQ 수정 완료</title>
	<link href="${pageContext.request.contextPath}/front/adminFaqUpdateSuccess.css" rel="stylesheet">
	<script>
		function BtnClose(){
			close1();
 			self.close();
 		}
		
		function close1() {
		    opener.location.reload();
		    window.close();
		}
		</script>

</head>

<body>
	<h1>수정이 완료되었습니다.</h1>
	<button type="button" onclick="BtnClose()">닫기</button>
</body>
</html>