<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../main/header.jsp"%>
<%
String user_idd = (String) session.getAttribute("user_id");
int lesson_num = Integer.parseInt(request.getParameter("lesson_num"));
%>



<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<style>
html {
	scroll-behavior: smooth;
}

body {
	margin: 0;
	padding: 0;
}

pre {
	white-space: pre-wrap !important;
	background-color: transparent !important;
	border-style: none !important;
	font-family: "Open Sans", Helvetica, sans-serif !important;
	font-weight: lighter !important;
	font-size: 1.5rem !important;
}

p {
	margin-bottom: 0 !important;
}

h3 {
	font-weight: bold;
	margin-top: -15px;
	padding-bottom: 15px;
}

h4 {
	font-weight: bold;
	margin: 50px 0 15px 0;
	font-size: 22px;
	s
}

h6 {
	font-weight: bold;
	display: inline;
}

hr {
	margin: 0 !important;
}

select {
	margin: 10px;
	padding: 7px;
}

a {
	color: black;
}

#container_box1 {
	margin: 0 auto;
}

#contbox0 {
	background-color: #F7F7F7;
	height: 180px;
}

#contbox0 img {
	width: 100vw;
	height: 180px;
}

#contbox1 {
	margin: 0 auto;
	width: 85vw;
	vertical-align: middle;
	display: flex;
	flex-direction: column;
}

.profile_img_box {
	width: 50%;
	position: absolute;
	top: 180px;
	display: inline;
	text-align: center;
	margin-left: 18%;
}

.profile_img_box img {
	width: 120px;
	height: 120px;
	border-radius: 70%;
	overflow: hidden;
}

#contbox1_text_wrapper {
	margin-bottom: 44px;
	display: flex;
	flex-direction: column;
}

#contbox1_text {
	display: flex;
	flex-direction: column;
	flex-wrap: wrap;
	align-content: center;
	margin-top: 100px;
}

#cont1_lesson_title {
	grid-column: 1/span 3;
}

#msg_button_escrow {
	width: 150px;
	height: 30px;
	background-color: #ffdf48;
	color: #5c3b0c;
	border-style: none;
	font-size: 1.2rem;
}

#sugar_img {
	width: 30px;
	height: 30px;
}

.cont1 {
	width: 280px;
	height: 20px;
	font-size: 10px;
	display: inline;
	text-align: center;
	padding-top: 6px;
}

#button_box {
	text-align: center;
	margin-top: 13px;
}

.cont2 {
	display: inline-block;
}

#contbox2 {
	margin: 50px auto;
	margin-top: 17px !important;
	width: 85vw;
	display: flex;
	flex-direction: column;
	flex-wrap: wrap;
	align-content: flex-start;
}

#contbox3 {
	margin: 50px auto;
	width: 85vw;
	display: flex;
	flex-direction: column;
	flex-wrap: wrap;
	align-content: space-around;
}

#contbox3_titleholder {
	display: flex;
	flex-direction: row;
	justify-content: space-evenly;
	margin: 20px 0px;
	width: 100%;
}

#contbox3_titleholder h6 {
	padding-bottom: 3px;
	border-bottom: 3px solid #FFDF48;
}

.cont1-group-prepend {
	display: flex;
	justify-content: flex-start;
	margin: 0 5px;
	padding: 3px;
	align-items: center;
}

.cont1-group-title {
	background-color: white !important;
	font-weight: bold !important;
	font-size: 1.5rem !important;
	display: inline;
	text-align: center !important;
	vertical-align: middle !important;
	padding-top: 8px !important;
}

.cont1-group-prepend .cont1-group-title {
	background-color: #f7f7f7 !important;
	font-weight: bold !important;
	width: 120px;
	height: 45px;
	font-size: 1.25rem !important;
	border-style: none !important;
	display: inline;
	text-align: center !important;
	vertical-align: middle !important;
	color: #5c3b0c;
	line-height: 31px;
}

.cont1-group-prepend #cont1-group-title-img {
	background-color: white !important;
	font-weight: bold !important;
	width: 120px;
	height: 100px;
	line-height: 100px;
	font-size: 0.95rem !important;
	border-style: none !important;
	align-items: center !important;
	vertical-align: middle !important;
	color: #5c3b0c;
	margin-left: 40px
}

.cont1-group-prepend #cont1-group-title-img img {
	vertical-align: middle;
	width: 80px;
	height: 80px;
}

.cont1-group-text {
	background-color: white !important;
	font-weight: bold !important;
	border-style: none;
	font-size: 1.45rem;
	text-align: center !important;
	vertical-align: middle !important;
	padding: 0.375rem 0.75rem;
	padding-bottom: 0.7rem !important;
	height: 45px;
	line-height: 40px;
}

#contbox2_img .cont1-group-prepend .cont1-group-text {
	font-size: 1.55rem !important;
	line-height: 31px;
}

.data_list {
	padding: 20px;
}

.sugar_point {
	display: inline;
}

#contbox2_noimg {
	width: 100%;
	display: flex;
	flex-direction: column;
	flex-wrap: wrap;
	align-content: center;
}

#contbox2_img {
	width: 100%;
	text-align: center;
	margin-left: -20px;
}

#pagingul {
	margin: 0 auto;
	border-right: 0;
	padding-left: 0;
}

ul li {
	text-align: center;
	float: left;
	list-style: none;
}

ul li .a_tag {
	display: block;
	font-size: 14px;
	color: black;
	padding: 9px 12px;
	border-right: solid 1px #ccc;
	box-sizing: border-box;
	text-decoration-line: none;
}

ul li.on {
	background: #FFD400;
}

ul li.on .a_tag {
	color: #fff;
} 

#page_box {
	margin: 0 auto;
}

#display_count {
	display: block;
}

#btnbox {
	display: flex;
	flex-direction: row;
	flex-wrap: wrap;
	align-content: space-around;
}

img {
	max-width: 100% !important;
}

.anchor {
	display: block;
	height: 80px;
	margin-top: -80px;
	visibility: hidden;
}

#review_wrapper {
	display: flex;
	align-items: flex-end;
	justify-content: space-between;
}

#review_wrapper select {
	width: 180px;
	height: 30px;
	font-size: 1.2rem;
}

#msg_button{
	outline: none;
	border-style: none;
	background: #fff;
	width: 50px;
	height: 50px;
}

@media ( min-width : 768px) {
	/*=======================================================*/
	select {
		padding: 5px;
		margin: 10px;
	}
	#contbox1 {
		width: 60vw;
		vertical-align: middle;
		margin-bottom: 50px;
	}
	.profile_img_box {
		width: 50%;
		position: absolute;
		top: 211px;
		display: inline;
		text-align: center;
		margin-left: 5%;
	}
	.profile_img_box img {
		width: 150px;
		height: 150px;
		border-radius: 70%;
		overflow: hidden;
		margin: 20px 50px;
	}
	#contbox1_text_wrapper {
		width: 50%;
		margin: 0 auto;
	}
	#contbox2 {
		margin: 0 auto;
		margin-top: 17px !important;
		width: 75vw;
		display: flex;
		flex-direction: row;
		justify-content: space-around;
	}
	#contbox2_noimg {
		width: 45%;
		margin: 0 -20% !important;
		display: flex;
		flex-direction: column;
		flex-wrap: wrap;
		margin-left: 10% !important;
	}
	#contbox2_img {
		width: 55%;
		margin: auto 10px !important;
	}
	.cont1-group-prepend #cont1-group-title-img img {
		vertical-align: middle;
		width: 75px;
		height: 75px;
	}
	.cont1-group-prepend {
		display: flex;
		justify-content: flex-start;
		margin: 0 5px;
		padding: 3px;
	}
	.cont2 {
		display: inline-block;
	}
	#contbox3 {
		width: 45vw;
		vertical-align: middle;
		display: flex;
		justify-content: space-around;
	}
	img {
		max-width: 100% !important;
	}
	#cont3_noreview {
		margin: 50px auto;
		text-align: center;
	}
	
	#cont3_noreview span{
		font-weight: bold;
		font-size: 1.65rem;
	}
	
	@media ( max-width : 576px) {
		/*=======================================================*/
		select {
			padding: 2px;
		}
		.profile_img_box {
			position: absolute;
			text-align: center;
			left: 50%;
			top: 50%;
		}
		#contbox1 {
			width: 95vw;
			vertical-align: middle;
			display: flex;
			justify-content: center;
		}
		#contbox2 {
			width: 95vw;
			vertical-align: middle;
		}
		#contbox2_noimg {
			width: 100%;
			display: flex;
			flex-direction: column;
			flex-wrap: wrap;
			align-content: center;
		}
		#contbox2_img {
			width: 100%;
			text-align: center;
			margin-left: -20px;
		}
		.cont2 {
			display: inline-block;
		}
		#contbox3 {
			width: 95vw;
			vertical-align: middle;
			display: flex;
			justify-content: space-around;
		}
		.cont1-group-prepend .cont1-group-title {
			margin: 0 20px;
		}
		.cont1-group-prepend #cont1-group-title-img img {
			vertical-align: middle;
			width: 70px;
			height: 70px;
		}
		img {
			max-width: 100% !important;
		}
	}
}
</style>


<body>

	<div id="container_box1">

		<input type="hidden" name="lesson_num" id="lesson_num"
			value=<%=lesson_num%>>

		<div id="contbox0">
			<c:if test="${lessonDetail.lesson_cate eq 'IT' }">
				<img src="${pageContext.request.contextPath}/front/ITdefault.jpg"
					alt="IT카테고리">
			</c:if>
			<c:if test="${lessonDetail.lesson_cate eq '예체능' }">
				<img src="${pageContext.request.contextPath}/front/Musicdefault.jpg"
					alt="예체능카테고리">
			</c:if>
			<c:if test="${lessonDetail.lesson_cate eq '공예' }">
				<img src="${pageContext.request.contextPath}/front/Craftdefault.jpg"
					alt="공예카테고리">
			</c:if>
			<c:if test="${lessonDetail.lesson_cate eq '사무' }">
				<img
					src="${pageContext.request.contextPath}/front/Officedefault.jpg"
					alt="사무카테고리">
			</c:if>
			<c:if test="${lessonDetail.lesson_cate eq '라이프스타일' }">
				<img
					src="${pageContext.request.contextPath}/front/Lifestyledefault.jpg"
					alt="라이프스타일카테고리">
			</c:if>
		</div>


		<div id="contbox1">
			<div class="profile_img_box">
				<img
					src="${pageContext.request.contextPath}/front/${lessonDetail.tiper_img}"
					alt="기본이미지" />
			</div>

			<div id="contbox1_text_wrapper">
				<div id="contbox1_text">

					<div class="cont1 mb-3" id="cont1_lesson_title">
						<h3 class="cont1-group-title1">${lessonDetail.lesson_title}</h3>
					</div>

					<div class="cont1 mb-3">
						<span class="cont1-group-title">${lessonDetail.user_name}</span>
						 <span
							class="cont1-group-title" id="cont1-group-text">@${lessonDetail.tiper_user_id}</span>
					</div>

					<div id="button_box">
						<button type="button" id="msg_button_escrow" class="cont1_button"
							onclick="location.href='/insertEscrow?escrow_lesson_num=${lessonDetail.lesson_num}&escrow_tiper_code=${lessonDetail.tiper_code}&escrow_user_id=<%=user_idd%>'">수강신청</button>
							<button type="button" id="msg_button" onclick="open_popup()">
							
							<svg xmlns="http://www.w3.org/2000/svg" width="50px" height="50px" fill="#FFD400" class="bi bi-send-plus" viewBox="0 0 10 10">
  <path d="M15.964.686a.5.5 0 0 0-.65-.65L.767 5.855a.75.75 0 0 0-.124 1.329l4.995 3.178 1.531 2.406a.5.5 0 0 0 .844-.536L6.637 10.07l7.494-7.494-1.895 4.738a.5.5 0 1 0 .928.372l2.8-7Zm-2.54 1.183L5.93 9.363 1.591 6.602l11.833-4.733Z"/>
  <path d="M16 12.5a3.5 3.5 0 1 1-7 0 3.5 3.5 0 0 1 7 0Zm-3.5-2a.5.5 0 0 0-.5.5v1h-1a.5.5 0 0 0 0 1h1v1a.5.5 0 0 0 1 0v-1h1a.5.5 0 0 0 0-1h-1v-1a.5.5 0 0 0-.5-.5Z"/>
</svg>

</button>
					</div>
					<%-- 					<div id="button_box"><button type="button" id="msg_button" onclick="location.href='/insertEscrow?escrow_lesson_num=${lessonDetail.lesson_num}&escrow_tiper_code=${lessonDetail.tiper_code}&escrow_user_id=<%=user_idd%>>쪽지</button></div> --%>
				</div>

			</div>
		</div>

		<div id="contbox2">

			<div id="contbox2_noimg">
				<div class="cont2 mb-3">
					<div class="cont1-group-prepend">
						<div class="cont1-group-title">강의가능 지역</div>
						<div class="cont1-group-text">${lessonDetail.tiper_addr}</div>
					</div>
				</div>

				<div class="cont2 mb-3">
					<div class="cont1-group-prepend">
						<div class="cont1-group-title">카테고리</div>
						<div class="cont1-group-text">${lessonDetail.lesson_cate}</div>
					</div>
				</div>


				<div class="cont2 mb-3">
					<div class="cont1-group-prepend">
						<div class="cont1-group-title">강의등록일</div>
						<div class="cont1-group-text">${lessonDetail.lesson_date}</div>
					</div>
				</div>

			</div>

			<div id="contbox2_img">
				<div class="cont2 mb-3">
					<div class="cont1-group-prepend">
						<div class="cont1-group-title" id="cont1-group-title-img">
							<img src="${pageContext.request.contextPath}/front/sugar.png">
						</div>
						<div class="cont1-group-text">
							<c:if test="${sugarAvg eq 98.98 }">
								<c:out value="평점이 없어요!" />
							</c:if>
							<c:if test="${sugarAvg ne 98.98 }">
								<c:out value="${sugarAvg}/5점" />
							</c:if>
						</div>
					</div>
				</div>
			</div>

		</div>


		<div id="contbox3">
			<hr>
			<div id="contbox3_titleholder">
				<a href="#tiperinfo_h4">강사정보</a> <a href="#lessoninfo_h4">강의정보</a> <a
					href="#review_h4">리뷰</a>
			</div>

			<span class="anchor" id="tiperinfo_h4"></span>


			<h4>강사정보</h4>
			<div>
				<pre>${lessonDetail.tiper_info}</pre>
			</div>
			<br> <br> <span class="anchor" id="lessoninfo_h4"></span>
			<h4>강의정보</h4>
			<div>
				<pre>${lessonDetail.lesson_info}</pre>
			</div>
			<br> <br> <span class="anchor" id="review_h4"></span>

			<div id="review_wrapper">
				<h4>리뷰</h4>
				<select name="select_keyword" id="select_keyword">
					<option value="review_num">최신순으로 보기</option>
					<option value="review_num_asc">오래된 순으로 보기</option>
					<option value="review_sugar">점수별로 보기(높은순)</option>
					<option value="review_sugar_asc">점수별로 보기(낮은순)</option>
				</select>
			</div>

			<div id="data_table_body"></div>

			<div id="page_box">
				<ul id="pagingul"></ul>
				<span id="display_count"></span>
			</div>
		</div>
	</div>
	
	<%@include file="../main/footer.jsp"%>


</body>
<script> 
  var totalData; //총 데이터 수
  var dataPerPage; //한 페이지에 나타낼 글 수
  var pageCount = 5; //페이징에 나타낼 페이지 수
  var globalCurrentPage= 1; //현재 페이지
  var dataList; //표시하려하는 데이터 리스트
  var select_key; //표시순서 (OrderBy)

  $(document).ready(function () {
 
 
  dataPerPage = 5;
 
  var lesson_num = $('#lesson_num').val();
   select_key = $('#select_key').val();
 
  console.log(select_key);
 	
 
  $.ajax({ // ajax로 데이터 가져오기
 	method: "POST",
 	url: "/getTotalReviewList",
 	data: {lesson_num:lesson_num, select_key:select_key},
 	dataType: "json",
 	async:false,
 	success: function (d) {
 	   //totalData(총 데이터 수) 구하기
 	   totalData = d.length;
        //데이터 대입
        dataList=d;
 		 }
  });		
	  
		
  //글 목록 표시 호출 (테이블 생성)
  displayData(1, dataPerPage);

  //페이징 표시 호출
  paging(totalData, dataPerPage, pageCount, 1);
 
 });

 //현재 페이지(currentPage)와 페이지당 글 개수(dataPerPage) 반영
  function displayData(currentPage, dataPerPage) {

    let chartHtml = "";

  //Number로 변환하지 않으면 아래에서 +를 할 경우 스트링 결합이 되어버림.. 
    currentPage = Number(currentPage);
    dataPerPage = Number(dataPerPage);
   
   
   if (totalData < (currentPage - 1) * dataPerPage + dataPerPage){
	
 	  for (
 		var i = (currentPage - 1) * dataPerPage;
 		    i < totalData;
 			     i++
 			   ) {
 		  chartHtml +=
		   	  "<div class='data_list'><h6>" +
 		      dataList[i].review_writer +
 		      "</h6><div class='sugar_point'><img src='${pageContext.request.contextPath}/front/sugar.png' id='sugar_img'/> " +
 		      dataList[i].review_sugar +
 		      "</div>" +"<p class='cont_text'>"+
 		      dataList[i].review_cont +
 		      "</p>" + "<p>" +
 		      moment(dataList[i].review_date).format('YYYY-MM-DD') +
 		      "</p>" + "</div><hr>";
 			   } 
   }else{ 
   
    for (
      var i = (currentPage - 1) * dataPerPage;
      i < (currentPage - 1) * dataPerPage + dataPerPage;
      i++){
 		  chartHtml +=
		   	  "<div class='data_list'><h6>" +
 		      dataList[i].review_writer +
 		      "</h6><div class='sugar_point'><img src='${pageContext.request.contextPath}/front/sugar.png' id='sugar_img'/> " +
 		      dataList[i].review_sugar +
 		      "</div>" +"<p class='cont_text'>"+
 		      dataList[i].review_cont +
 		      "</p>" + "<p>" +
 		      moment(dataList[i].review_date).format('YYYY-MM-DD') +
 		      "</p>" + "</div><hr>";
 			   } 
 	//dataList는 임의의 데이터임.. 각 소스에 맞게 변수를 넣어주면 됨...
   
 }
   
   console.log("chartHtml은"+ chartHtml);
   
   if( typeof chartHtml == "undefined"){ chartHtml +="<div id='cont3_noreview'>리뷰가 없어요</div>"}
 	console.log("chartHtml이 body에 입력되기 전에 : " + chartHtml);

 $("#data_table_body").html(chartHtml);
 }


function paging(totalData, dataPerPage, pageCount, currentPage) {

 	  var totalPage = Math.ceil(totalData / dataPerPage); //총 페이지 수
	  
 	  if(totalPage<pageCount){	//총 페이지 수가 한 페이지수에 보여줄 페이지 수보다 작으면 모든페이지를 한 페이지에 다 보여줌. 
 	    pageCount=totalPage;
 	  }
	  
 	  let pageGroup = Math.ceil(currentPage / pageCount); // 페이지 그룹
 	  let endPage = pageGroup * pageCount; //화면에 보여질 마지막 페이지 번호
	  
 	  if (endPage > totalPage) {
 	    endPage = totalPage;
 	  }

 	  let startPage = endPage - (pageCount - 1); //화면에 보여질 첫번째 페이지 번호
 	  let next = Number(currentPage)+1;
// 	  let next = endPage +1;
 	  let prev = Number(currentPage)-1;
// 	  let prev = startPage - 1;

 	  let pageHtml = "";

 	  if (prev > 0) {
 	    pageHtml += "<li><a href='javascript:void(0)' class='a_tag' id='prev'> 이전 </a></li>";
 	  }

 	 //페이징 번호 표시 
 	  for (var i = startPage; i <= endPage; i++) {
 	    if (currentPage == i) {
 	      pageHtml +=
 	        '<li class="on"><a href="javascript:void(0)" class="a_tag" id="' + i + '">' + i + '</a></li>';
// 	        '<li class="on"><a href="javascript:displayData('+2+',5)" id="' + i + '">' + i + '</a></li>';
 	    } else {
 	      pageHtml += "<li><a href='javascript:void(0)' class='a_tag' id='" + i + "'>" + i + "</a></li>";
 	    }
 	  }
	 	 
 	  if (next <= totalPage) {
 	    pageHtml += '<li><a href="javascript:void(0);" class="a_tag" id="next"> 다음 </a></li>';
 	  }

// 	  $("#pagingul").html(pageHtml);
// 	  let displayCount = "";
// 	  displayCount = "현재 1 - " + totalPage + " 페이지 / " + totalData + "건";
// 	  $("#displayCount").text(displayCount);


 	  //페이징 번호 클릭 이벤트 
 	  $("#pagingul li a").click(function () {
 	    let $id = $(this).attr("id");
 	    selectedPage = $(this).text();

 	    if ($id == "next") selectedPage = next;
 	    if ($id == "prev") selectedPage = prev;
	    
	    
 	    //전역변수에 선택한 페이지 번호를 담는다...
 	    globalCurrentPage = selectedPage;
	 
 	    console.log("클릭시 글로벌 "+globalCurrentPage);
    
 	    //글 목록 표시 재호출
 	    displayData(globalCurrentPage, dataPerPage);
 	    //페이징 표시 재호출
 	    paging(totalData, dataPerPage, pageCount, globalCurrentPage);
 	  });
 	}
	
</script>
<script>
	 var totalData; //총 데이터 수
	 var dataPerPage=5; //한 페이지에 나타낼 글 수
	 var pageCount = 5; //페이징에 나타낼 페이지 수
	 var globalCurrentPage= 1; //현재 페이지
	 var dataList; //표시하려하는 데이터 리스트
 	 var select_key; //표시순서 (OrderBy)

	 $("#select_keyword").change(function () {
	
		 var lesson_num = $('#lesson_num').val();
		 select_key = $('#select_keyword').val();
	
	 $.ajax({ // ajax로 데이터 가져오기
			method: "POST",
			url: "/getTotalReviewList",
			data: {lesson_num:lesson_num, select_key:select_key},
			dataType: "json",
			async:false,
			success: function (d) {
				//totalData(총 데이터 수) 구하기
			   totalData = d.length;
		       //데이터 대입
		       dataList=d;
				 }
		 });
	 
	 //글 목록 표시 호출 (테이블 생성)
	 displayData(1, dataPerPage);

	 //페이징 표시 호출
	 paging(totalData, dataPerPage, pageCount, 1);
	
	});

//현재 페이지(currentPage)와 페이지당 글 개수(dataPerPage) 반영
function displayData(currentPage, dataPerPage) {

  let chartHtml = "";

//Number로 변환하지 않으면 아래에서 +를 할 경우 스트링 결합이 되어버림.. 
  currentPage = Number(currentPage);
  dataPerPage = Number(dataPerPage);
  
  
 if (totalData < (currentPage - 1) * dataPerPage + dataPerPage){
	
	  for (
		var i = (currentPage - 1) * dataPerPage;
		    i < totalData;
			     i++
			   ) {
		   console.log("error : " + dataList[i].review_writer);
		   chartHtml +=
			   	  "<div class='data_list'><h6>" +
			      dataList[i].review_writer +
			      "</h6><div class='sugar_point'><img src='${pageContext.request.contextPath}/front/sugar.png' id='sugar_img'/> " +
			      dataList[i].review_sugar +
			      "</div>" +"<p class='cont_text'>"+
			      dataList[i].review_cont +
			      "</p>" + "<p>" +
			      moment(dataList[i].review_date).format('YYYY-MM-DD') +
			      "</p>" + "</div><hr>";
			   } 
 }else{ 
  
  for (
    var i = (currentPage - 1) * dataPerPage;
    i < (currentPage - 1) * dataPerPage + dataPerPage;
    i++
  ) {
	   console.log("error : " + dataList[i].review_writer);
	   chartHtml +=
		   	  "<div class='data_list'><h6>" +
		      dataList[i].review_writer +
		      "</h6><div class='sugar_point'><img src='${pageContext.request.contextPath}/front/sugar.png' id='sugar_img'/> " +
		      dataList[i].review_sugar +
		      "</div>" +"<p class='cont_text'>"+
		      dataList[i].review_cont +
		      "</p>" + "<p>" +
		      moment(dataList[i].review_date).format('YYYY-MM-DD') +
		      "</p>" + "</div><hr>";
  } //dataList는 임의의 데이터임.. 각 소스에 맞게 변수를 넣어주면 됨...
  
}
 
 console.log("chartHtml은"+ chartHtml);
 
 if( typeof chartHtml == "undefined" || chartHtml == ''){ chartHtml += "<div id='cont3_noreview'><span>리뷰가 없어요</span></div>"}
	console.log("chartHtml이 body에 입력되기 전에 : " + chartHtml);
$("#data_table_body").html(chartHtml);
}

console.log("ajax밖에서"+JSON.stringify(dataList));

function paging(totalData, dataPerPage, pageCount, currentPage) {
	  console.log("currentPage : " + currentPage);
	  console.log("pageCount : " + pageCount);
	  console.log("totalData : " + totalData);

	  totalPage = Math.ceil(totalData / dataPerPage); //총 페이지 수
	  
	  if(totalPage<pageCount){
	    pageCount=totalPage;
	  }
	  
	  let pageGroup = Math.ceil(currentPage / pageCount); // 페이지 그룹
	  let endPage = pageGroup * pageCount; //화면에 보여질 마지막 페이지 번호
	  
	  if (endPage > totalPage) {
	    endPage = totalPage;
	  }

	  let startPage = endPage - (pageCount - 1); //화면에 보여질 첫번째 페이지 번호
	  let next = Number(currentPage)+1;
//	  let next = endPage +1;
	  let prev = Number(currentPage)-1;
//	  let prev = startPage - 1;

	  let pageHtml = "";

	  if (prev > 0) {
	    pageHtml += "<li><a href='javascript:void(0)' class='a_tag' id='prev'> 이전 </a></li>";
	  }

	 //페이징 번호 표시 
	  for (var i = startPage; i <= endPage; i++) {
	    if (currentPage == i) {
	      pageHtml +=
	        '<li class="on"><a href="javascript:void(0)" class="a_tag" id="' + i + '">' + i + '</a></li>';
//	        '<li class="on"><a href="javascript:displayData('+2+',5)" id="' + i + '">' + i + '</a></li>';
	    } else {
	      pageHtml += "<li><a href='javascript:void(0)' class='a_tag' id='" + i + "'>" + i + "</a></li>";
	    }
	  }
	 
	 	console.log("토탈 : "+ totalPage);
	 	console.log("엔드 : "+ endPage);
	 	console.log("지금 : "+ currentPage);
	 	console.log("다음 : "+ next);
	 
	  if (next <= totalPage) {
	    pageHtml += '<li><a href="javascript:void(0);" class="a_tag" id="next"> 다음 </a></li>';
	  }

	  $("#pagingul").html(pageHtml);
// 	  let displayCount = "";
// 	  displayCount = "현재 1 - " + totalPage + " 페이지 / " + totalData + "건";
// 	  $("#displayCount").text(displayCount);


	  //페이징 번호 클릭 이벤트 
	  $("#pagingul li a").click(function () {
	    let $id = $(this).attr("id");
	    selectedPage = $(this).text();

	    if ($id == "next") selectedPage = next;
	    if ($id == "prev") selectedPage = prev;
	    
	    
	    //전역변수에 선택한 페이지 번호를 담는다...
	    globalCurrentPage = selectedPage;
	 
	    console.log("클릭시 글로벌 "+globalCurrentPage);
	    
	    //글 목록 표시 재호출
	    displayData(globalCurrentPage, dataPerPage);
	    //페이징 표시 재호출
	    paging(totalData, dataPerPage, pageCount, globalCurrentPage);
	  });
	}




// 팝업창 띄우기 함수
var parent_value;
function open_popup(){
    popupWindow = window.open('message_list?send_btn=1', '_blank', 'width=940, height=620, resizeable');
    //팝업창 리사이즈 방지 함수
    popupWindow.onresize = (_=>{
	   	popupWindow.resizeTo(940,690);
		});
    
    popupWindow.onload = function (){
    	call_chlid();
    }
}


function call_chlid(){  //부모창에서 자식창에 값 전달
    try{
    	let tiper_id = $('#cont1-group-text').text();
    	tiper_id = tiper_id.replace("@", "");
    	console.log("tiper_id??======",tiper_id);
    	popup.child_value_id = tiper_id; // 현재 강의글에 있는 강사아이디값을 넣어야하는 곳
        popup.child_value_room = 0; // 방번호를 보내야할 곳
        popup.child_value_send_btn = 1;
        popup.child_function(); // 자식창 함수 호출
    }catch(e){} // 부모 자식간의 연결이 끊어졌을 경우 처리할게 있으면 기술
}

function parent_function(){}
	</script>
</html>
