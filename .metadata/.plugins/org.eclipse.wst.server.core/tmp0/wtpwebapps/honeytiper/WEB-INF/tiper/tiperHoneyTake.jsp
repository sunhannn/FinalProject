<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>꿀TIPer - TIPer 허니페이 정산하기</title>
<!-- <link rel="stylesheet" href="front/common.css"> -->
<!-- <link rel="stylesheet" href="front/bootstrap.css"> -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.js"></script>
<link href="${pageContext.request.contextPath}/front/tiperHoneyTake.css" rel="stylesheet">
</head>
<body>
	<%@include file="../main/header.jsp"%>
	<div class="container">
		<p id="honeyTake_sub1" style="margin: 40px 0;">허니페이 정산하기</p>
		<br>
		<hr>
		<br>
	</div>
	<div class="container" id="honeyTake_div1">
		<form action="honeyTakeAction" id="honeyTake_form">
			<div id="honeyTake_div2">
				<p id="myhoney_span1">정산 받을 계좌번호 입력</p>
				<br> <br> <input type="text" id="honeyTake_point"
					name="point_history" required="required">
			</div>
			<br> <br>
			<div id="honeyTake_div3">
				<button type="submit" id="honeyTake_btn">정산하기</button>
			</div>
		</form>

	</div>
	<br>
	<br>
	<%@include file="../main/footer.jsp"%>

<script>
   document.getElementById("honeyTake_form").addEventListener("submit", function (event) {
        event.preventDefault();

        var inputValue = document.getElementById("honeyTake_point").value;
        var confirmed = confirm("입금될 계좌: " + inputValue + " 가 맞으신가요? 보유중인 모든 허니페이가 입금됩니다.");

        if (confirmed) {
          document.getElementById("honeyTake_form").submit();
        } else {
          alert("\uD83D\uDE0E좋아요! 허니페이로 여러 꿀TIP들을 들어보세요.");
        }
      });
    </script>
</body>

</html>