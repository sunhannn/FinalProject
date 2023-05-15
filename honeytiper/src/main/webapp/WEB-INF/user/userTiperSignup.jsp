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
<!-- <link rel="stylesheet" href="front/common.css"> -->
<!-- <link rel="stylesheet" href="front/bootstrap.css"> -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.js"></script>
<style type="text/css">
body {
	padding: 0;
	margin: 0 auto;
}

@media ( max-width : 768px) {
	#sin_sub1 {
		font-size: 24px;
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
		border-radius: 10px;
	}
	#div_btn1 {
		text-align: center;
	}
	#tiperUppreview {
		width: 100px;
		height: 100px;
	}
}

@media ( min-width : 769px) {
	#sin_sub1 {
		font-size: 27px;
	}
	#sin_sub2 {
		font-size: 20px;
		font-weight: bold;
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
		width: 65%;
		height: 250px;
		resize: none;
		border: 0;
	}
	#sin_info1:focus {
		border: 3px solid #FFD400;
		outline: none;
		border-radius: 10px;
	}
	#sin_cate1, #sin_cate2, #sin_cate3 {
		width: 180px;
		height: 40px;
		border: 0;
	}
	#sin_cate1:focus {
		border: 3px solid #FFD400;
		outline: none;
		border-radius: 10px;
	}
	#sin_cate2:focus {
		border: 3px solid #FFD400;
		outline: none;
		border-radius: 10px;
	}
	#sin_cate3:focus {
		border: 3px solid #FFD400;
		outline: none;
		border-radius: 10px;
	}
	#sin_btn1 {
		background-color: #FFD400;
		border: 0;
		width: 300px;
		height: 50px;
		border-radius: 10px;
		font-weight: bold;
		font-size: 16px;
	}
	#div_btn1 {
		text-align: center;
	}
	#sin_sub3 {
		font-size: 20px;
		font-weight: bold;
	}
	#sin_addr1 {
		width: 300px;
		height: 40px;
		border: 0;
	}
	#sin_addr1:focus {
		border: 3px solid #FFD400;
		outline: none;
		border-radius: 10px
	}
	#tiperUppreview {
		width: 250px;
		height: 250px;
		border-radius: 10px;
	}
}
</style>
</head>
<body>
	<%@include file="../main/header.jsp"%>
	<div class="container">
		<span id="sin_sub1">TIPer 신청</span> <br> <br> <span
			id="sin_sub2">카테고리 심사 후 TIPer 등록이 완료됩니다</span> <br>
		<hr>
	</div>
	<form action="tiperSignUp" enctype="multipart/form-data"
		id="sin_tipsign">
		<div class="container">
			<div id="sin_div1">
				<input type="file" id="sin_img1" accept=".jpg,.jpeg,.png"
					placeholder="눌러서 강사에 대한 img등록" name="tiper_img" required="required"
					onchange="previewImage(event)" style="display: none;"> <label
					for="sin_img1" id="sin_preview_label"> <img
					id="tiperUppreview" src="front/lessonimg.png" alt="강의사진을 올려주세요"
					onmouseover="changeCursor(this)" title="이미지를 클릭해서 사진을 선택해주세요!"></label>
			</div>
			<br>
			<textarea name="tiper_info" id="sin_info1" cols="30" rows="10"
				placeholder="TIPer소개를 작성해주세요 (경력, 수상내역, 취득자격증 등등)"
				required="required"></textarea>
		</div>
		<br> <br>
		<div class="container">
			<p id="sin_sub2">
				꿀TIP을 전수해줄 카테고리를 선택해주세요<span style="font-size: 12px; color: gray;">(최대
					3개)</span>
			</p>
			<br>
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
				</select>&nbsp;&nbsp;&nbsp; <select name="tiper_cate2" id="sin_cate2">
						<option selected disabled hidden>두번째 카테고리</option>
						<option value="">선택안함</option>
						<option value="예체능">예체능</option>
						<option value="공예">공예</option>
						<option value="사무">사무</option>
						<option value="라이프스타일">라이프스타일</option>
						<option value="IT">IT</option>
						<option value="기타">기타</option>
				</select>&nbsp;&nbsp;&nbsp; <select name="tiper_cate3" id="sin_cate3">
						<option selected disabled hidden>세번째 카테고리</option>
						<option value="">선택안함</option>
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
		<br> <br>
		<div class="container">
			<p id="sin_sub3">꿀TIP을 전수해줄 지역을 정확히 입력해주세요</p>
			<span style="font-size: 10px; color: gray;">(해당지역 검색에 노출됩니다)</span> <br>
			<br> <br> <input type="text" name="tiper_addr"
				id="sin_addr1" placeholder="활동지역(시)" required="required">
		</div>
		<br> <br>
		<div id="div_btn1">
			<button type="submit" id="sin_btn1">TIPer등록 신청하기</button>
		</div>
		<br> <br>
	</form>
	<%@include file="../main/footer.jsp"%>
	<script type="text/javascript">
		function hsh(fparam) {

			console.log($('#sin_img1 input[type=file]'), fparam);

			let formData = new FormData();
			formData.append('tiper_img', fparam);
			$.ajax({
				url : "/upload",
				type : "post",
				data : formData,
				contentType : false,
				processData : false,
				cache : false,
				success : function() {
					console.log('success');
				},
				error : function() {
					alert('error');
				}
			});
		}

		$(document).ready(function() {
			$('select option').hover(function() {
				$(this).css('background-color', '#FFD400');
			}, function() {
				$(this).css('background-color', '');
			});
		});

		function selectProfileImage() {
			document.getElementById('sin_img1').click();
		}

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
			hsh(event.target.files[0]);
		}

		function tiperInfoUpdateSubmit(event) {
			// form submit 이벤트를 중지합니다.
			event.preventDefault();
			console.log("작동");
			// 확인(confirm) 창을 띄웁니다.
			if (confirm("이대로 강사 신청을 하시겠습니까?")) {
				// 확인 버튼을 클릭한 경우 form을 submit합니다.
				event.target.submit();
			} else {
				// 취소 버튼을 클릭한 경우 아무런 작업을 하지 않습니다.
				return false;
			}
		}
		// 마우스를 올리면 pointer로 바뀌는 함수
		function changeCursor(img) {
			img.style.cursor = "pointer";
		}

		// form 요소를 선택합니다.
		const form = document.querySelector("#sin_tipsign");

		// form submit 이벤트를 처리하는 함수를 등록합니다.
		form.addEventListener("submit", tiperInfoUpdateSubmit);

		// img 요소를 클릭했을 때 파일 선택 창 활성화
		document.getElementById('tiperpreview-label').addEventListener('click',
				selectProfileImage);
	</script>
</body>
</html>