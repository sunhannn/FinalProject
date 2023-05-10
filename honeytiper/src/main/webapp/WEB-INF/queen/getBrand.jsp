<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Insert title here</title>
</head>
<style>
#container003 {
	margin: 0 auto;
	display: flex;
	flex-direction: column;
	justify-content: center;
	margin-left: 400px;
	margin-right: 400px;
	margin-top: 120px;
}

/* @media ( min-width : 1500px) { */
/*    .navbar-container { */
/*       width: 100%; */
/*       margin: 0 auto; */
/*       max-width: 90%; */
/*    } */
/* } */
</style>
<%@include file="../main/header.jsp"%>

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8e4a79d5a1357bdcd52d923b2064fb9d"></script>

<body>

	<div id="container003">
		<div id="table003">
			<br>
			<h2 style="margin: 40px 0px;">꿀Tiper 란</h2>
			<hr class="hrFirst">

			<div class="input-group mb-3">
				<img src="${pageContext.request.contextPath}/front/브랜드소개1.png"
					alt="Brand img">
			</div>
		</div>
<br><br><br>
<h3>찾아오시는 길</h3>
<h5>경기도 안양시 만안구 안양로 314번길 10 광창빌딩 3층</h5>

<div id="staticMap" style="width:800px;height:350px;"></div>    

</div>
<br><br><br><br><br><br><br><br>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=발급받은 APP KEY를 사용하세요"></script>
<script>
// 이미지 지도에서 마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(37.4001515, 126.9209602); 

// 이미지 지도에 표시할 마커입니다
// 이미지 지도에 표시할 마커는 Object 형태입니다
var marker = {
    position: markerPosition
};

var staticMapContainer  = document.getElementById('staticMap'), // 이미지 지도를 표시할 div  
    staticMapOption = { 
        center: new kakao.maps.LatLng(37.4001515, 126.9209602), // 이미지 지도의 중심좌표
        level: 3, // 이미지 지도의 확대 레벨
        marker: marker // 이미지 지도에 표시할 마커 
    };    

// 이미지 지도를 생성합니다
var staticMap = new kakao.maps.StaticMap(staticMapContainer, staticMapOption);
</script>


<%@include file="../main/footer.jsp"%>


</body>
</html>