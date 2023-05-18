<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의리스트</title>
<style>
.container {
	width: 65%;
	margin: 0 auto;
}
/* 나머지 요소들은 기본값인 z-index: 1로 설정 */
table {
	border-collapse: collapse;
	width: 100%;
	z-index: 1;
	font-size: 14px;
}

th, td {
	text-align: center;
	vertical-align: middle;
	border-bottom: 1px solid #ddd;
	padding: 5px 15px;
	z-index: 1;
	height: 38px;
}

th {
	height: 21px;
	background: #f2f2f2;
}

#view-all-button, #search-button {
	border-style: none;
	background: #FFD400;
	color: #5c3b0c;
	margin: 5px;
	padding: 5px 18px;
	cursor: pointer;
	border-radius: 5px;
	font-size: 12pt;
	font-weight: bolder;
}

#sel3 {
	border-style: none;
	background: #FFD400;
	color: #5c3b0c;
	margin-left: 5px;
	cursor: pointer;
	border-radius: 5px;
	font-size: 12pt;
	font-weight: bolder;
}

#view-all-button:hover, #search-button:hover, #sel3:hover {
	background-color: #E6B800;
}

.pagination-row {
	background-color: #e8f0fe;
}

.pagination-row th {
	font-size: 12pt;
}

#pagingul {
	margin-top: 20px;
	list-style: none;
	display: flex;
	justify-content: center;
}

#pagingul li {
	margin-right: 5px;
}

#pagingul li a {
	display: block;
	padding: 5px 10px;
	border: 1px solid #ddd;
	background-color: #fff;
	color: #333;
	text-decoration: none;
}

#pagingul li.on a {
	background-color: #FFD400;
	color: #fff;
}

#lesson-search {
	width: 200px;
	height: 17.5px;
	padding: 5px;
	font-size: 14px;
	padding: 5px;
}

#search_wrapper {
	display: flex;
	flex-wrap: wrap;
	virtical-align: middle;
}

#search_wrapper select {
	margin: 0 5px;
	height: 31.5px;
	font-size: 13px;
}
</style>
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<%@include file="../queen/adminNavbar.jsp"%>

<body>
	<div class="container">
		<h2 style="margin: 40px 0px;">강의 리스트</h2>
		<button id="view-all-button"
			onclick="location.href='getLessonListLesson';">전체목록보기</button>
		<br> <br>
		<div id="search_wrapper">
			<select class="form-control" id="sel1" name="lesson_condition"
				style="display: inline-block !important; margin-right: 10px;">

				<option value="lesson_title">강의명</option>
				<option value="tiper_user_id">강사아이디</option>
			</select> <input class="search002" type="text" name="lesson_search" id="sel2"
				placeholder="검색어를 입력해주세요.">
			<button class="btn btn-success" type="button" id="sel3"
				class="search002"
				style="outline: none; border: none; background: transparent;">
				<i class="fa fa-search" style="font-size: 24px; color: #FFD400;"></i>
			</button>
		</div>

		<hr class="hrFirst">
		<br>
		<span id="displayCount"></span>
		<table class="cont1_table" style="table-layout: fixed;">
			<thead class="btn-primary">
				<tr class="pagination-row">
					<th style="width: 20%">강의명</th>
					<th style="width: 10%">강의등록일</th>
					<th style="width: 40%">강의정보</th>
					<th style="width: 12%">강사아이디</th>
					<th style="width: 18%">강사소개</th>
				</tr>
			</thead>
			<tbody id="dataTableBody">

			</tbody>
		</table>

		<ul id="pagingul">
		</ul>
	</div>
</body>




<script>
 var totalData; //총 데이터 수
 var dataPerPage; //한 페이지에 나타낼 글 수
 var pageCount = 5; //페이징에 나타낼 페이지 수
 var globalCurrentPage= 1; //현재 페이지
 var dataList; //표시하려하는 데이터 리스트

 $(document).ready(function () {
//페이지 당 글 개수 
 dataPerPage = 10;
 
 
 $.ajax({ // ajax로 데이터 가져오기
   method: "POST",
   url: "getLessonListLessonAjax",
//    data: {lesson_num:lesson_num},
   dataType: "json",
   async:false,
   success: function (data) {
//       alert("data: " + JSON.stringify(d));
      //totalData(총 데이터 수) 구하기
      totalData = data.length;
       //데이터 대입
       dataList=data;
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
               console.log("error : " + dataList[i].lesson_title);
              chartHtml +=
                '</td><td class="tdCenter1" style="width:15%; text-overflow:ellipsis; overflow:hidden; white-space:nowrap;" title="' + dataList[i].lesson_title + '">' +
                dataList[i].lesson_title +
                '</td><td class="tdCenter1" style="width:15%; text-overflow:ellipsis; overflow:hidden; white-space:nowrap;" title="' + dataList[i].lesson_date + '">' +
                dataList[i].lesson_date +
                '</td><td class="tdCenter1" style="width:15%; text-overflow:ellipsis; overflow:hidden; white-space:nowrap;" title="' + dataList[i].lesson_info + '">' +
                dataList[i].lesson_info +
                '</td><td class="tdCenter1" style="width:15%; text-overflow:ellipsis; overflow:hidden; white-space:nowrap;" title="' + dataList[i].tiper_user_id + '">' +
                dataList[i].tiper_user_id +
                '</td><td class="tdCenter1" style="width:15%; text-overflow:ellipsis; overflow:hidden; white-space:nowrap;" title="' + dataList[i].tiper_info + '">' +
                dataList[i].tiper_info +
                '</td><td class="tdCenter1" style="width:15%; text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">' 
            } 
         
     
  }else{ 
   
   for (
     var i = (currentPage - 1) * dataPerPage;
     i < (currentPage - 1) * dataPerPage + dataPerPage;
     i++
   ) {
      chartHtml +=
    	  '<tr><td class="tdCenter1" style="width:15%; text-overflow:ellipsis; overflow:hidden; white-space:nowrap;" title="' + dataList[i].lesson_title + '">' +
          dataList[i].lesson_title +
          '</td><td class="tdCenter1" style="width:15%; text-overflow:ellipsis; overflow:hidden; white-space:nowrap;" title="' + dataList[i].lesson_date + '">' +
          dataList[i].lesson_date +
          '</td><td class="tdCenter1" style="width:15%; text-overflow:ellipsis; overflow:hidden; white-space:nowrap;" title="' + dataList[i].lesson_info + '">' +
          dataList[i].lesson_info +
          '</td><td class="tdCenter1" style="width:15%; text-overflow:ellipsis; overflow:hidden; white-space:nowrap;" title="' + dataList[i].tiper_user_id + '">' +
          dataList[i].tiper_user_id +
          '</td><td class="tdCenter1" style="width:15%; text-overflow:ellipsis; overflow:hidden; white-space:nowrap;" title="' + dataList[i].tiper_info + '">' +
          dataList[i].tiper_info +
          '</td><td class="tdCenter1" style="width:15%; text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">' 
   }    
}

$("#dataTableBody").html(chartHtml);
}



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
    
       console.log("토탈 : "+ totalPage);
       console.log("엔드 : "+ endPage);
       console.log("지금 : "+ currentPage);
       console.log("다음 : "+ next);
    
     if (next <= totalPage) {
       pageHtml += '<li><a href="javascript:void(0);" id="next"> 다음 </a></li>';
     }

     $("#pagingul").html(pageHtml);
     let displayCount = "";
     displayCount = "현재 1 - " + totalPage + " 페이지 / " + totalData + "건";
     $("#displayCount").text(displayCount);


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
   
$("#sel3").click(function(){
   
   var lesson_condition=$('#sel1').val();
   var lesson_search=$('#sel2').val();
   
   $.ajax({ // ajax로 데이터 가져오기
      method: "POST",
      url: "getLessonListPostSearch",
       data: {lessonSearch:lesson_search, lessonCondition:lesson_condition},
      dataType: "json",
      async:false,
      success: function (data) {
//             alert("data: " + JSON.stringify(data));
         //totalData(총 데이터 수) 구하기
         totalData = data.length;
          //데이터 대입
          dataList=data;
          }
    });      
   
    //글 목록 표시 재호출
    displayData(1, 5);
    //페이징 표시 재호출
    paging(totalData, 5, pageCount, 1);
    
    alert(totalData);
   
});

</script>


</html>