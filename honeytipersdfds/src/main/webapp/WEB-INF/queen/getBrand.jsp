<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>꿀TIPer - 꿀TIPer란?</title>
</head>
<link href="${pageContext.request.contextPath}/front/getBrand.css" rel="stylesheet">
<%@include file="../main/header.jsp"%>


<body>

	<div class="container-fluid">
		<div class="container">
			<!-- 브랜드소개 시작-->
			
			<div class="row">
				<!-- 줄 시작 -->

				<div class="col-lg-5">
					<!--  첫째칸 시작 -->
					<div class="company_intro">
						<!-- 브랜드정보 시작 -->
						<br><br><br><br><br>
							<p class="brand_intro1"><span style="color:#FDB933">꿀</span>TIPer란?</p>
							<br>
							<p class="brand_intro2">이곳에서 <span style="color:#FDB933">'꿀'</span>과 같은 <span style="color:#FDB933">'TIP'</span>을 얻을 수 있습니다.</p>
							<br>
							<p class="brand_intro3">안녕하세요. 꿀TIPer입니다.</p>
							<br>
							<p class="brand_intro3">꿀TIPer는 누구나 <span style="color:#FDB933; font-weight: bold;">TIPer</span><small>(강사)</small>가 되어</p>
							<p class="brand_intro3">자신의 취미와 재능 즉, <span style="color:#FDB933; font-weight: bold;">꿀TIP</span><small>(강의)</small>을 공유하는 플랫폼입니다.</p>			
							<br>
							<p class="brand_intro3">쪽지를 통한 빠른 커뮤니케이션, 안전한 에스크로 결제,</p>
							<p class="brand_intro3"><span style="color:#FDB933; font-weight: bold;">당도</span><small>(평점)</small>를 통한 강의 선별, 전문가의 경험을 살린 각 분야 팁까지</p>
							<p class="brand_intro3">지금 내게 필요한 모든 전문가를 꿀TIPer에서 만나보세요!</p>

					</div>
					<!-- 브랜드정보 끝 -->
				</div>
				
				
				<div class="col-lg-7" style="text-align:right;">
					<!--  이미지 시작 -->
					<img onerror="this.src='${pageContext.request.contextPath}/front/default.png'" src="${pageContext.request.contextPath}/front/brandintro_1.png"	id="BrandImg" alt="Brand img">	
				</div>

				<!--  이미지 종료 -->
				<!--  첫째칸 종료 -->

			</div>
			<!-- 줄 종료 -->

		</div>
		<!-- 찾아오시는 길 종료 -->
</div>


	<div class="container-fluid ImgDiv">
		<div class="container">
			<!-- 찾아오시는 길 시작-->
			<br>
			<h3>찾아오시는 길</h3>
			<div class="row">
				<!-- 줄 시작 -->
				<!-- 		<div class="company_left"> -->

				<div class="col-lg-7">
					<!--  첫째칸 시작 -->
					<div id="map" style="height: 350px; margin-top:17px;"></div>

					<script type="text/javascript"
						src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8e4a79d5a1357bdcd52d923b2064fb9d"></script>
					<script>
						var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
						mapOption = {
							center : new kakao.maps.LatLng(37.4001515,
									126.9209602), // 지도의 중심좌표
							level : 3
						// 지도의 확대 레벨
						};

						var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

						// 마커가 표시될 위치입니다 
						var markerPosition = new kakao.maps.LatLng(37.4001515,
								126.9209602);

						// 마커를 생성합니다
						var marker = new kakao.maps.Marker({
							position : markerPosition
						});

						// 마커가 지도 위에 표시되도록 설정합니다
						marker.setMap(map);

						// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
						// marker.setMap(null);
					</script>
				</div>
				<!--  첫째칸 종료 -->


				<div class="col-lg-5" style="text-align:left;">
					<!--  둘째칸 시작 -->
					<div class="company_right">
						<!-- 지도 시작 -->
						<ul class="company_right_text">
							<li class="map-li"><p style="letter-spacing: -.5px;">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"	fill="#212a30" class="bi bi-map" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M15.817.113A.5.5 0 0 1 16 .5v14a.5.5 0 0 1-.402.49l-5 1a.502.502 0 0 1-.196 0L5.5 15.01l-4.902.98A.5.5 0 0 1 0 15.5v-14a.5.5 0 0 1 .402-.49l5-1a.5.5 0 0 1 .196 0L10.5.99l4.902-.98a.5.5 0 0 1 .415.103zM10 1.91l-4-.8v12.98l4 .8V1.91zm1 12.98 4-.8V1.11l-4 .8v12.98zm-6-.8V1.11l-4 .8v12.98l4-.8z" />
</svg>&nbsp;&nbsp;주소
								</p></li>
							<p id="map-li-s">경기도 안양시 만안구 안양로 314번길 10
								광창빌딩 3층</p>
						</ul>
						<ul class="company_right_text">
							<li class="map-li"><p style="letter-spacing: -.5px;">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"	fill="#212a30" class="bi bi-train-lightrail-front" viewBox="0 0 16 16">
  									<path d="M6.5 0a.5.5 0 0 0 0 1h1v1.011c-1.525.064-3.346.394-4.588.655C1.775 2.904 1 3.915 1 5.055V13.5A2.5 2.5 0 0 0 3.5 16h9a2.5 2.5 0 0 0 2.5-2.5V5.055c0-1.14-.775-2.15-1.912-2.39-1.242-.26-3.063-.59-4.588-.654V1h1a.5.5 0 0 0 0-1h-3ZM8 3c1.497 0 3.505.356 4.883.644.653.137 1.117.722 1.117 1.411V13.5a1.5 1.5 0 0 1-1.072 1.438 75.999 75.999 0 0 1-.1-.792c-.092-.761-.2-1.752-.266-2.682A21.26 21.26 0 0 1 12.5 10c0-1.051.143-2.404.278-3.435.024-.187.048-.362.07-.522.112-.798-.42-1.571-1.244-1.697C10.644 4.199 9.136 4 8 4c-1.136 0-2.645.2-3.604.346-.825.126-1.356.9-1.244 1.697.022.16.046.335.07.522C3.357 7.596 3.5 8.949 3.5 10c0 .428-.024.933-.062 1.464a57.32 57.32 0 0 1-.266 2.682c-.038.31-.072.58-.1.792A1.5 1.5 0 0 1 2 13.5V5.055c0-.69.464-1.274 1.117-1.41C4.495 3.354 6.503 3 8 3Zm3.835 11.266c.034.28.066.53.093.734H4.072a62.692 62.692 0 0 0 .328-3h2.246c.36 0 .704-.143.958-.396a.353.353 0 0 1 .25-.104h.292a.35.35 0 0 1 .25.104c.254.253.599.396.958.396H11.6c.068.808.158 1.621.236 2.266ZM6 13.5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0Zm0 0a.5.5 0 1 1 1 0 .5.5 0 0 1-1 0Zm3.5.5a.5.5 0 0 0 .5-.5.5.5 0 1 0 1 0 .5.5 0 0 0-1 0 .5.5 0 1 0-.5.5Zm-5.03-3c.019-.353.03-.692.03-1 0-.927-.104-2.051-.216-3h7.432c-.112.949-.216 2.073-.216 3 0 .308.011.647.03 1H9.354a.353.353 0 0 1-.25-.104 1.354 1.354 0 0 0-.958-.396h-.292c-.36 0-.704.143-.958.396a.353.353 0 0 1-.25.104H4.47Zm-.315-5-.013-.096a.497.497 0 0 1 .405-.57C5.505 5.188 6.947 5 8 5s2.495.188 3.453.334a.497.497 0 0 1 .405.57L11.845 6h-7.69Z" />
</svg>&nbsp;&nbsp;지하철
								</p></li>
							<p id="map-li-s">1호선 안양역 1번 출구 방향 도보 5분</p>
						</ul>
						<ul class="company_right_text">
							<li class="map-li"><p style="letter-spacing: -.5px;">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"	fill="#212a30" class="bi bi-bus-front"	viewBox="0 0 16 16">
  <path d="M5 11a1 1 0 1 1-2 0 1 1 0 0 1 2 0Zm8 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0Zm-6-1a1 1 0 1 0 0 2h2a1 1 0 1 0 0-2H7Zm1-6c-1.876 0-3.426.109-4.552.226A.5.5 0 0 0 3 4.723v3.554a.5.5 0 0 0 .448.497C4.574 8.891 6.124 9 8 9c1.876 0 3.426-.109 4.552-.226A.5.5 0 0 0 13 8.277V4.723a.5.5 0 0 0-.448-.497A44.303 44.303 0 0 0 8 4Zm0-1c-1.837 0-3.353.107-4.448.22a.5.5 0 1 1-.104-.994A44.304 44.304 0 0 1 8 2c1.876 0 3.426.109 4.552.226a.5.5 0 1 1-.104.994A43.306 43.306 0 0 0 8 3Z" />
  <path d="M15 8a1 1 0 0 0 1-1V5a1 1 0 0 0-1-1V2.64c0-1.188-.845-2.232-2.064-2.372A43.61 43.61 0 0 0 8 0C5.9 0 4.208.136 3.064.268 1.845.408 1 1.452 1 2.64V4a1 1 0 0 0-1 1v2a1 1 0 0 0 1 1v3.5c0 .818.393 1.544 1 2v2a.5.5 0 0 0 .5.5h2a.5.5 0 0 0 .5-.5V14h6v1.5a.5.5 0 0 0 .5.5h2a.5.5 0 0 0 .5-.5v-2c.607-.456 1-1.182 1-2V8ZM8 1c2.056 0 3.71.134 4.822.261.676.078 1.178.66 1.178 1.379v8.86a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 11.5V2.64c0-.72.502-1.301 1.178-1.379A42.611 42.611 0 0 1 8 1Z" />
</svg>&nbsp;&nbsp;버스
								</p></li>
							<p id="map-li-s">100, 143, 150, 160, 161, 201, 270, 260</p>
						</ul>
						<ul class="company_right_text">
							<li class="map-li last-map-li"><p
									style="letter-spacing: -.5px;">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-headset" viewBox="0 0 16 16">
  <path d="M8 1a5 5 0 0 0-5 5v1h1a1 1 0 0 1 1 1v3a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V6a6 6 0 1 1 12 0v6a2.5 2.5 0 0 1-2.5 2.5H9.366a1 1 0 0 1-.866.5h-1a1 1 0 1 1 0-2h1a1 1 0 0 1 .866.5H11.5A1.5 1.5 0 0 0 13 12h-1a1 1 0 0 1-1-1V8a1 1 0 0 1 1-1h1V6a5 5 0 0 0-5-5z" />
</svg>고객센터
								</p></li>
							<p id="map-li-s">1577-7788</p>
							<p id="map-li-s">10:30~18:00 (점심시간 13:00~14:00)</p>
							<p id="map-li-s">주말, 공휴일 휴무</p>
						</ul>
					</div>
					<!-- 지도 끝 -->
				</div>
				<!--  둘째칸 종료 -->





			</div>
			<!-- 줄 종료 -->

		</div>
		<!-- 찾아오시는 길 종료 -->

	</div>
	<%@include file="../main/footer.jsp"%>


</body>
</html>