<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
int check = (int) request.getAttribute("tiperCheck");

if (check == 1) {
	out.println("<script>");
	out.println("alert('승인 대기중입니다!')");
	out.println("location.href='../index';");
	out.println("</script>");

}
%>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Tiper신청</title>
<link rel="stylesheet" href="front/common.css">
<link rel="stylesheet" href="front/bootstrap.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.js"></script>

<style type="text/css">
body {
	padding: 0;
	margin: 0 auto;
}

@media ( max-width : 768px) {
	.container {
		width: 100%;
	}
	#sin_sub1 {
		font-size: 28px;
		background-color: #FFD400;
		border-radius: 10%;
	}
	#sin_sub2 {
		font-size: 20px;
	}
	#sin_div1 {
		width: 200px;
		height: 200px;
	}
	#sin_img1 {
		width: 80px;
		height: 80px;
	}
	#sin_info1 {
		width: 95%;
		border: 0;
		
	}
	#sin_info1:focus {
		border: 3px solid #FFD400;
		outline: none;
	}
	#sin_cate1:focus {
		border: 3px solid #FFD400;
		outline: none;
	}
	#sin_cate2:focus {
		border: 3px solid #FFD400;
		outline: none;
	}
	#sin_cate3:focus {
		border: 3px solid #FFD400;
		outline: none;
	}
	#sin_btn1 {
		background-color: #FFD400;
		border: 0;
		width: 200px;
		height: 30px;
		border-radius: 10%;
	}
	#div_btn1 {
		text-align: center;
	}
	
	#tiperUppreview {
		width: 200px;
		height: 200px;
	}
}

@media ( min-width : 769px) {
	.container {
		width: 100%;
	}
	#sin_sub1 {
		font-size: 38px;
		background-color: #FFD400;
		border-radius: 10%;
	}
	#sin_sub2 {
		font-size: 28px;
	}
	#sin_img1 {
		width: 300px;
		height: 80px;
	}
	#sin_div1 {
		width: 300px;
		height: 300px;
	}
	#sin_img1 {
		width: 300px;
		height: 50px;
	}
	#sin_info1 {
		width: 95%;
		height:
	}
	#sin_info1:focus {
		border: 3px solid #FFD400;
		outline: none;
		font-size: 20px;
	}
	#sin_cate1, #sin_cate2, #sin_cate3 {
		width: 180px;
		height: 40px;
	}
	#sin_cate1:focus {
		border: 3px solid #FFD400;
		outline: none;
	}
	#sin_cate2:focus {
		border: 3px solid #FFD400;
		outline: none;
	}
	#sin_cate3:focus {
		border: 3px solid #FFD400;
		outline: none;
	}
	#sin_btn1 {
		background-color: #FFD400;
		border: 0;
		width: 300px;
		height: 50px;
		border-radius: 10%;
	}
	#div_btn1 {
		text-align: center;
	}
	#sin_sub3 {
		font-size: 25px;
	}
	#sin_addr1 {
		width: 300px;
		height: 40px;
	}
	#sin_addr1:focus {
		border: 3px solid #FFD400;
		outline: none;
	}
	#tiperUppreview {
		width: 250px;
		height: 250px;
	}
}
</style>
</head>
<body>
	<div class="container">
		<span id="sin_sub1">TIPer 신청</span> <br> <br> <span
			id="sin_sub2">카테고리 심사 후 TIPer 등록이 완료됩니다</span> <br>
		<hr>

	</div>
	<form action="tiperSignUp" enctype="multipart/form-data">
		<div class="container">
			<div id="sin_div1">
				<input type="file" id="sin_img1" accept=".jpg,.jpeg,.png"
					placeholder="눌러서 강사에 대한 img등록" name="tiper_img" required="required"
					onchange="previewImage(event)"> <img id="tiperUppreview"
					src="#" alt="강의사진을 올려주세요">
			</div>


			<textarea name="tiper_info" id="sin_info1" cols="30" rows="10"
				placeholder="TIPer소개를 작성해주세요 (경력, 수상내역, 취득자격증 등등)"
				required="required"></textarea>




		</div>
		<br>
		<div class="container">

			<p id="sin_sub2">
				꿀TIP을 전수해줄 카테고리를 선택해주세요<span style="font-size: 12px; color: gray;">(최대
					3개)</span>
			</p>
			<div id="sin_sel1">
				<label for="category"> <select name="tiper_cate1"
					id="sin_cate1" required="required">
						<option selected disabled hidden>첫번째 카테고리</option>
						<option value="예체능">예체능</option>
						<option value="공예">공예</option>
						<option value="사무">사무</option>
						<option value="라이프스타일">라이프스타일</option>
						<option value="IT">IT</option>
						<option value="기타">기타</option>
				</select>&nbsp; <select name="tiper_cate2" id="sin_cate2">
						<option selected disabled hidden>두번째 카테고리</option>
						<option value="예체능">예체능</option>
						<option value="공예">공예</option>
						<option value="사무">사무</option>
						<option value="라이프스타일">라이프스타일</option>
						<option value="IT">IT</option>
						<option value="기타">기타</option>
				</select>&nbsp; <select name="tiper_cate3" id="sin_cate3">
						<option selected disabled hidden>세번째 카테고리</option>
						<option value="예체능">예체능</option>
						<option value="공예">공예</option>
						<option value="사무">사무</option>
						<option value="라이프스타일">라이프스타일</option>
						<option value="IT">IT</option>
						<option value="기타">기타</option>
				</select>

				</label>


			</div>


		</div>
		<br>

		<div class="container">
			<p id="sin_sub3">꿀TIP을 전수해줄 지역을 정확히 입력해주세요</p>
			<span style="font-size: 10px; color: gray;">(해당지역 검색에 노출됩니다)</span> <br>
			<input type="text" name="tiper_addr" id="sin_addr1"
				placeholder="활동지역(시)" required="required">

		</div>
		<br> <br>
		<div id="div_btn1">
			<button type="submit" id="sin_btn1">TIPer등록 신청하기</button>
		</div>


	</form>


	<script type="text/javascript">
		

	$(() => {
   $("#sin_img1 input[type=file]").change(function(){
      console.log($('#sin_img1 input[type=file]')[0].files);
      
      let formData = new FormData();
      formData.append('tiper_img', $('#sin_img1 input[type=file]')[0].files[0]);
      $.ajax({
         url : "/upload",
         type : "post",
         data : formData,
         contentType: false,
         processData: false,
         cache : false,
         success : function(sin_img1){
            console.log('success');
         },
         error : function(){
            alert('error');
         }
      });
   });
});
	
	function previewImage(event) {
		var reader = new FileReader();
		reader.onload = function() {
			var output = document.getElementById('tiperUppreview');
			output.src = reader.result;
		}
		reader.readAsDataURL(event.target.files[0]);
		// 파일 선택 후 input 요소 숨기기
		var input = document.getElementById('sin_img1');
		input.style.display = 'none';
		
	}
	
	
	
	</script>

</body>
</html>