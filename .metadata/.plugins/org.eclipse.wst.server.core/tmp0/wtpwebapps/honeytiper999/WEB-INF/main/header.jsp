<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!-- Bootstrap CDN -->
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />

<!--  메세지관련 css파일 -->
<link href="front/message_list.css" rel="stylesheet">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css" />
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="script.js"></script>
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<title>Document</title>

<style>
/* # General
================================ */
body {
	font-family: "Open Sans", Helvetica, sans-serif;
}

/* # Header, Main Menu
================================ */
.navbar {
	opacity: 0.8;
	margin-bottom: 0;
	background-color: #fff;
	transition: all 0.2s ease-out;
}

.navbar-container {
	position: relative;
	margin: 0 auto;
}

.navbar .navbar-nav {
	margin-left: -100px;
}

.navbar .navbar-nav li a {
	font-size: 14px;
	text-transform: uppercase;
	color: #2e1c05;
	transition: all 0.2s ease-out;
}

.navbar-brand {
	font-size: 25px;
	transition: all 0.2s ease-out;
	padding: 5px;
}

.navbar-brand img {
	width: 50px;
}

.navbar-scroll {
	opacity: 1;
}

#top-social-menu {
	display: none;
}

/*헤더 넓이 조정 css*/
/* @media (min-width: 1300px) {
  .navbar-container {
    margin:0 auto;
    width:100%;
    max-width:1300px;
  }
  
}  */
@media ( min-width : 1500px) {
	.navbar-container {
		width: 100%;
		margin: 0 auto;
		max-width: 90%;
	}
}

@media ( min-width : 768px) {
	#open {
		opacity: 0;
	}
	.navbar {
		height: 120px;
	}
	.navbar-nav>li>a {
		padding: 0;
		margin-top: 35px;
		margin-left: 50px;
		line-height: 70px;
	}
	.navbar-brand {
		font-size: 20px;
		height: 120px;
		line-height: 120px;
	}
	.navbar-brand img {
		transform: translateX(0px);
	}
	#top-social-menu {
		display: initial;
	}

	/* Navbar when scrolled */
	.navbar-scroll {
		height: 70px;
	}
	.navbar-scroll #top-social-menu {
		display: none;
		transition: all 0.2s ease-out;
	}
	.navbar-scroll .navbar-nav>li>a {
		opacity: 1;
		padding: 0;
		margin-top: 0;
	}
}

/* # Hover Link Effect
================================ */
@media ( min-width : 768px) {
	.navbar-nav>li>a::after {
		text-decoration: none;
		position: absolute;
		top: 80%;
		left: 0;
		width: 100%;
		height: 1px;
		background: #2e1c05;
		content: "";
		opacity: 0;
		transition: height 0.3s, opacity 0.3s, transform 0.3s;
		transform: translateY(-10px);
	}
	.navbar-nav>li>a:hover::after, .navbar-nav>li>a:focus::after {
		text-decoration: none;
		height: 2px;
		opacity: 1;
		transform: translateY(0px);
	}
}

/* # Social menu
================================ */
#top-social-menu {
	position: absolute;
	top: 7px;
	right: 0;
	font-size: 12px;
	z-index: 101;
	padding-right: 0px;
	list-style: none;
	color: #2e1c05;
	transition: all 0.2s ease-out;
}

#top-social-menu li {
	float: left;
	padding: 10px 15px;
}

#top-social-menu li:last-child {
	padding-right: 0;
}

#top-social-menu li a {
	text-decoration: none;
	color: #2e1c05;
}

#top-social-menu li a:hover {
	text-decoration: none;
	color: #543a1a;
}

#top-social-menu i {
	font-size: 16px;
	transition: all 0.2s ease-in;
}

#top-social-menu i:hover {
	text-decoration: none;
	color: #543a1a;
}

.open {
	position: absolute;
	display: block;
	color: red;
	font-size: 3rem;
	top: 5px;
	right: 5%;
	cursor: pointer;
	opacity: 1;
	transition: 0.3s;
}

.nav1 {
	position: absolute;
	top: 0;
	right: 0;
	text-align: center;
	width: 0%;
	overflow-x: hidden;
	height: 100vh;
	z-index: 1;
	position: fixed;
	background: #eee;
	transition: 0.3s;
}

.nav1 a {
	color: black;
	font-size: 1rem;
	text-decoration: none;
	display: block;
	padding: 20px;
	transition: 0.3s;
	clear: both;
}

.close {
	color: red !important;
	width: 40px;
	height: 40px;
	line-height: 3rem;
	margin: 20px;
	font-size: 20px !important;
	cursor: pointer;
	transform: translateY(30px);
}

.nav a:not(:first-child):hover {
	text-decoration: none;
	background: royalblue;
}

/* Styles for wrapping the search box */
.main {
	width: 65%;
	margin: 50px auto;
}

/* Bootstrap 4 text input with search icon */
.has-search .form-control {
	padding-left: 2.375rem;
}

.has-search .form-control-feedback {
	position: absolute;
	z-index: 2;
	display: block;
	width: 2.375rem;
	height: 2.375rem;
	line-height: 2.375rem;
	text-align: center;
	pointer-events: none;
	color: #aaa;
}

.btn-secondary {
	transform: translate(125px, -34px);
}

.dropdown:hover .dropdown-menu {
	display: block;
}
</style>
</head>

<body>
	<%
	String user_id = session.getAttribute("user_id") != null ? session.getAttribute("user_id").toString() : "";

// 	int user_role = 0; // 기본값으로 0을 설정
// 	Object userRoleObj = session.getAttribute("user_role");
// 	if (userRoleObj != null) {
// 		if (userRoleObj instanceof Integer) {
// 			user_role = (int) userRoleObj; // int 타입으로 형변환
// 		} else if (userRoleObj instanceof String) {
// 			user_role = Integer.parseInt((String) userRoleObj); // String을 int로 변환
// 		}
// 	}
	%>
	
	<header>
		<nav id="main-navbar" class="navbar navbar-default navbar-fixed-top">
			<div class="container navbar-container">
				<div class="navbar-header">
					<a class="navbar-brand" href="/"><img
						src="${pageContext.request.contextPath}/front/ggultiperLogo.png"
						alt="" title="Logo"></a> <span id="open" class="open"
						onclick="openNav()">≡</span>
				</div>
				<div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav navbar-left">
						<li class="dropdown"><a href="#" class="" data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">전체 카테고리<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="cateSearch?lesson_search=예체능">예체능</a></li>
								<li><a href="cateSearch?lesson_search=공예">공예</a></li>
								<li><a href="cateSearch?lesson_search=사무">사무</a></li>
								<li><a href="cateSearch?lesson_search=라이프스타일">라이프스타일</a></li>
								<li><a href="cateSearch?lesson_search=IT">IT</a></li>
								<li><a href="cateSearch?lesson_search=기타">기타</a></li>

							</ul></li>
						<li><a href="#portfolio">꿀TIPer</a></li>
						<li><a href="allSearch">클래스</a></li>
						<li><a href="listnotice">공지사항</a></li>
						<li><a href="faqList">FAQ</a></li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li>
							<div class="main">
								<form action="selectSearch" method="post" name="lesson_search">
									<div>
										<input type="text" name="lesson_search" id="lesson_search"
											placeholder="검색어를 입력해주세요" /> <input type="submit" value="검색" />
									</div>
								</form>
							</div>
						</li>
					</ul>
				</div>
				<div class="top-social">
					<ul id="top-social-menu">
						<c:choose>
							<c:when test='${user_id ne NULL}'>
								<li><a href="logOut">로그아웃</a></li>
								 <c:choose>
									    	<c:when test='${unread == 0}'>
									    		<li><img class="send_msg" src="front/message.png"></li>
									    	</c:when>
									    	<c:otherwise>
									    		<li><img class="send_msg" src="front/on-message.png"></li>
									    	</c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>
								<li><a href="loginBtn">로그인</a></li>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test='${user_id ne NULL and user_role == 0}'>
								<li class="dropdown"><a href="#" class=""
									data-toggle="dropdown" role="button" aria-haspopup="true"
									aria-expanded="false">${user_name}님 반갑습니다<span
										class="caret2"></span></a>
									<ul class="dropdown-menu">
										<li><a href="#">허니페이</a></li>
										<li><a href="userUpdateGo">회원정보수정</a></li>
										<li><a href="userMyPageGo">마이페이지</a></li>
										<li><a href="tiperSignUpMove">TIPer신청</a></li>
										<li>---------------------------</li>
										<li><a href="logOut">로그아웃</a></li>
									</ul></li>
							</c:when>
							<c:when test='${user_id ne NULL and user_role == 1}'>
								<li class="dropdown"><a href="#" class="" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${user_name}님 반갑습니다<span
										class="caret2"></span></a>
									<ul class="dropdown-menu">
										<li><a href="#">허니페이</a></li>
										<li><a href="userUpdateGo">회원정보수정</a></li>
										<li><a href="tiperMypage">마이페이지</a></li>
										<li><a href="tiperUpdateGo">TIPer관리</a></li>
										<li>---------------------------</li>
										<li><a href="logOut">로그아웃</a></li>
									</ul></li>
							</c:when>
							<c:when test='${user_id ne NULL and user_role == 3}'>
								<li class="dropdown"><a href="#" class=""
									data-toggle="dropdown" role="button" aria-haspopup="true"
									aria-expanded="false">${user_name}님 반갑습니다<span
										class="caret2"></span></a>
									<ul class="dropdown-menu">
										<li><a href="#">허니페이</a></li>
										<li><a href="userUpdateGo">회원정보수정</a></li>
										<li><a href="userMyPageGo">마이페이지</a></li>
										<li>---------------------------</li>
										<li><a href="logOut">로그아웃</a></li>
									</ul></li>
							</c:when>
							<c:otherwise>
								<li><a href="agreementBtn">회원가입</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</div>
		</nav>
	</header>
	
<%-- 		<input type="hidden" value="${user_id}" name="user_id"> --%>
	
	<nav class="nav1" id="nav1">
		<a href="#" id="close" class="close" onclick="closeNav()">☓</a> <a
			href="#">첫번째</a> <a href="#">두번쨰</a> <a href="#">세번째</a> <a href="#">네번째</a>
	</nav>
	
		<script>
		$(window).scroll(function() {
			var sc = $(window).scrollTop();
			if (sc > 150) {
				$("#main-navbar").addClass("navbar-scroll");
			} else {
				$("#main-navbar").removeClass("navbar-scroll");
			}
		});


		function openNav() {
			document.getElementById("open").style.display = "none";
			document.getElementById("nav1").style.width = "100%";
		}

		function closeNav() {
			document.getElementById("nav1").style.width = "0%";
			document.getElementById("open").style.display = "block";
		}
		
		// 메세지 전체리스트창 팝업창 띄우기
		$('.send_msg').on('click', function(){
			 popupWindow = window.open("message_list.do?send_btn=0", "_blank", "width=940, height=610, resizeable")
			 //팝업창 리사이즈 방지
			 popupWindow.onresize = (_=>{
		   	 popupWindow.resizeTo(940,680);
			});
			 
			 popupWindow.onload = function (){
		        	call_chlid2();
		        }
		 });
		 
		 var parent_value;
		 
		    // 메세지 팝업창 띄우기 함수 (강사에게 직접 보내기)
		    function open_popup(){
		        popupWindow = window.open('message_list.do?send_btn=1', '_blank', 'width=940, height=610, resizeable');
	            //팝업창 리사이즈 방지 함수
		        popupWindow.onresize = (_=>{
		   	   	popupWindow.resizeTo(940,680);
		   		});
		        
		        popupWindow.onload = function (){
		        	call_chlid();
		        }
		    }

			// 강사에게 직접 보낼때 호출하는 함수
		    function call_chlid(){  //부모창에서 자식창에 값 전달
		        try{
		            popup.child_value_id = "test2"; // 현재 강의글에 있는 강사아이디값을 넣어야하는 곳
		            popup.child_value_room = 0; // 방번호를 보내야할 곳
		            popup.child_value_send_btn = 1;
		            popup.child_function(); // 자식창 함수 호출
		        }catch(e){} // 부모 자식간의 연결이 끊어졌을 경우 처리할게 있으면 기술
		    }
		 
		 // 전체 메세지리스트 실행할때 호출
		 function call_chlid2(){  //부모창에서 자식창에 값 전달
		        try{
		            popup.child_value_send_btn = 0;
		            popup.child_function(); // 자식창 함수 호출
		        }catch(e){} // 부모 자식간의 연결이 끊어졌을 경우 처리할게 있으면 기술
		    }
		 
		 function parent_function(){}
		 
		 // 헤더에서 메세지 미열람 체크
		 const Message_chk = function(){
				
					$.ajax({
						url:"message_chk_on.do",
						method:"GET",
						success:function(data){
							console.log("메세지 체크 하기");
						},
						error : function() {
							alert('서버 에러');
						}
					});
					 if (self.name != 'reload') {
				         self.name = 'reload';
				         self.location.reload(true);
				     }
				     else {
				    	 self.name = ''; 
				     }
			};
		 
			$(document).ready(function(){
				Message_chk();
			});
	</script>

</body>
</html>
