<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>꿀TIPer - 꿀TIP 살펴보기</title>
<%@include file="../main/header.jsp"%>
</head>
<link href="${pageContext.request.contextPath}/front/searchAll.css" rel="stylesheet">
<body>
	<div class="container searchAll">
		<br>
		<div class="divLeft" style="width: 150px; text-align: left;">
			<span id="spnList" style="text-align: left;">      꿀TIP 리스트</span>
		</div>
		<div id="searchBox" style="margin-top: 0px;">
			<div class="searchForm1">
				<label for="lesson_cate"></label> <select name="lesson_cate"
					id="lesson_cate" required>
					<option value="" disabled>카테고리</option>
					<option value="예체능">예체능</option>
					<option value="공예">공예</option>
					<option value="사무">사무</option>
					<option value="라이프스타일">라이프스타일</option>
					<option value="IT">IT</option>
					<option value="기타">기타</option>
				</select>
			</div>
			<div class="searchForm2">
				<label for="search_detail"></label> <select name="search_detail"
					id="search_detail" required>
					<option value="선택" disabled>선택</option>
					<option value="lesson_title">꿀TIP</option>
					<option value="lesson_user_name">TIPer</option>
					<option value="tiper_addr">지역</option>
				</select>
			</div>
			<div class="searchForm3">
				<label for="search_keyword"></label> <input type="text"
					name="search_keyword" id="search_keyword" placeholder="검색어 입력해주세요" />
			</div>
			<div class="searchFormButton">
				<button type="submit" id="search-button"
					style="outline: none; border: none; background: transparent;">
					<i class="fa fa-search searchBtn"
						style="font-size: 24px; color: #FFD400; margin-top: 20px;"></i>
				</button>
			</div>
			<div style="clear: both;"></div>
		</div>
		
		
<!-- 		<div name="lesson_choice" id="lesson_choice"> -->
<!-- 			<label><input  -->
<!-- 			type="checkbox" name="sorting" value="random">랜덤</label> -->
<!-- 			<label><input type="checkbox" name="sorting" value="sweetness">당도높은순</label> -->
<!-- 			<label><input type="checkbox" name="sorting" value="latest">최신등록순</label> -->
<!-- 		</div> -->

		<div id="container_top"></div>
		<div id="super_container">
			<h4>
				<button class="lessonDetail" type="button" id="searchListBtn"
					onclick="location.href='allSearch';">전체 리스트</button>
			</h4>
			<table class="cont1_table">
				<thead class="btn-primary">
					<tr class="cont1_th">
						<th class="thCenter1 th1">&nbsp;&nbsp;꿀TIP 정보</th>
						<th class="thCenter1 th2"></th>
						<th class="thCenter1 th3">&nbsp;&nbsp;꿀TIP 상세</th>
					</tr>
				</thead>
				<tbody id="dataTableBody">
				</tbody>
			</table>
			<ul id="pagingul">
			</ul>
		</div>
	</div>
</body>
<script>
    var totalData; //총 데이터 수
    var dataPerPage; //한 페이지에 나타낼 글 수
   var pageCount = 5; //페이징에 나타낼 페이지 수
    var globalCurrentPage= 1; //현재 페이지
   var dataList; //표시하려하는 데이터 리스트
   var contextPath;
   
   $(document).ready(function () {

     
    contextPath = getContextPath();  
      
 dataPerPage = 5;
 
 dataList= ${searchAllJSON};
 totalData = dataList.length;
 
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
                   '<tr>' +
                   '<td class="tdCenter1"><a href="getLessonDetail?lesson_num=' + dataList[i].lesson_num + '">' +
                   '<img alt="' + dataList[i].lesson_img + '" title="' + dataList[i].lesson_title + '" class="ImgBorder" src="${pageContext.request.contextPath}/front/lesson/' + dataList[i].lesson_img + '"></a></td>' +
                   '<td class="tdCenter1">' + '<span class="bold-text">[ ' + dataList[i].lesson_cate + ' ] </span>' + '<br>' +
                   dataList[i].lesson_user_name + '<br><a style="border-bottom: 1px solid black; text-decoration:none;" href="getLessonDetail?lesson_num=' + dataList[i].lesson_num + '">' + dataList[i].lesson_title + '</a></td>' +
                   '<td class="tdCenter1 td3">' + ' <img src="${pageContext.request.contextPath}/front/honeycomb.png' + '" width="20px" height="20px"> ' + (dataList[i].review_score !== 0 ? dataList[i].review_score + '&nbsp/&nbsp5.0' : '리뷰가 없어요') + '<br>' + 
                   '<img src="${pageContext.request.contextPath}/front/signature.png' + '" width="20px" height="20px">' + dataList[i].lesson_date + '<br>' +
                   '<button class="lessonDetail" onclick="location.href=\'getLessonDetail?lesson_num=' + dataList[i].lesson_num + '\'">자세히볼래요</button></td>'+
                   '</tr>' +
                   '<style>' +
                   '.bold-text { font-weight: bolder; }' +
                   '</style>';
            } 
   }else{ 
   
   for (
      var i = (currentPage - 1) * dataPerPage;
      i < (currentPage - 1) * dataPerPage + dataPerPage;
      i++
    ) {
       chartHtml +=
           '<tr>' +
           '<td class="tdCenter1"><a href="getLessonDetail?lesson_num=' + dataList[i].lesson_num + '">' +
           '<img alt="' + dataList[i].lesson_img + '" title="' + dataList[i].lesson_title + '" class="ImgBorder" src="${pageContext.request.contextPath}/front/lesson/' + dataList[i].lesson_img + '"></a></td>' +
           '<td class="tdCenter1">' + '<span class="bold-text">[ ' + dataList[i].lesson_cate + ' ] </span>' + '<br>' +
           dataList[i].lesson_user_name + '<br><a style="border-bottom: 1px solid black; text-decoration:none;" href="getLessonDetail?lesson_num=' + dataList[i].lesson_num + '">' + dataList[i].lesson_title + '</a></td>' +
           '<td class="tdCenter1 td3">' + ' <img src="${pageContext.request.contextPath}/front/honeycomb.png' + '" width="20px" height="20px"> ' + (dataList[i].review_score !== 0 ? dataList[i].review_score + '&nbsp/&nbsp5.0' : '리뷰가 없어요') + '<br>' + 
           '<img src="${pageContext.request.contextPath}/front/signature.png' + '" width="20px" height="20px">' + dataList[i].lesson_date + '<br>' +
           '<button class="lessonDetail" onclick="location.href=\'getLessonDetail?lesson_num=' + dataList[i].lesson_num + '\'">자세히볼래요</button></td>'+
           '</tr>' +
           '<style>' +
           '.bold-text { font-weight: bolder; }' +
           '</style>';
      }    
    }
   if( typeof chartHtml == "undefined" || chartHtml == ''){ chartHtml +="<tr><td colspan='3' style='text-align:center;' id='if_undefined'>찾고있는 꿀TIP이 없어요.\uD83D\uDE22</td></tr>"}
 $("#dataTableBody").html(chartHtml);
 }



 function paging(totalData, dataPerPage, pageCount, currentPage) {

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
//      let next = endPage +1;
     let prev = Number(currentPage)-1;
//      let prev = startPage - 1;

     let pageHtml = "";

     if (prev > 0) {
       pageHtml += "<li><a href='javascript:void(0)' id='prev'> 이전 </a></li>";
     }

     //페이징 번호 표시 
     for (var i = startPage; i <= endPage; i++) {
       if (currentPage == i) {
         pageHtml +=
           '<li class="on"><a href="javascript:void(0)" id="' + i + '">' + i + '</a></li>';
//            '<li class="on"><a href="javascript:displayData('+2+',5)" id="' + i + '">' + i + '</a></li>';
       } else {
         pageHtml += "<li><a href='javascript:void(0)' id='" + i + "'>" + i + "</a></li>";
       }
     }
    
     if (next <= totalPage) {
       pageHtml += '<li><a href="javascript:void(0);" id="next"> 다음 </a></li>';
     }

     $("#pagingul").html(pageHtml);
     

     //페이징 번호 클릭 이벤트 
      $("#pagingul li a").click(function () {
       let $id = $(this).attr("id");
       selectedPage = $(this).text();

       if ($id == "next") selectedPage = next;
       if ($id == "prev") selectedPage = prev;
       
       
       //전역변수에 선택한 페이지 번호를 담는다...
       globalCurrentPage = selectedPage;

       
       //글 목록 표시 재호출
       displayData(globalCurrentPage, dataPerPage);
       //페이징 표시 재호출
       paging(totalData, dataPerPage, pageCount, globalCurrentPage);
     });
 }
      function getContextPath() {
          var hostIndex = location.href.indexOf( location.host ) + location.host.length;
          return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
       };
    
       
       $("#search-button").click(function(){
     		console.log("onclick실행");
     		var search_cate=$('#lesson_cate').val();
     		var search_detail=$('#search_detail').val();
     		var search_keyword=$('#search_keyword').val();

     		
     		$.ajax({ // ajax로 데이터 가져오기
     			method: "POST",
     			url: "selectPartSearch",
     			data: {lesson_cate:search_cate, search_detail:search_detail, search_keyword:search_keyword},
     			dataType: "json",
     			async:false,
     			success: function (data) {
     				console.log("onclick실행2"+data);
     			   totalData = data.length;
     		       //데이터 대입
     		       dataList=data;

     		       if(typeof totalData == "undefined" || totalData == null || totalData == ""){ alert("\uD83E\uDD14검색결과가 없어요.");}
     				 }
     		 });		
     		
     		 //글 목록 표시 재호출
     	    displayData(1, 5);
     	    //페이징 표시 재호출
     	    paging(totalData, 5, pageCount, 1);
     		
     	}); 
       

</script>
<%@include file="../main/footer.jsp"%>