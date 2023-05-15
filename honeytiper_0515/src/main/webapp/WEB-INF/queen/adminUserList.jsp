<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원리스트</title>
<style>
body {
	margin: 0;
	padding: 0;
}

h3 {
	margin: 0 auto;
	margin-left: 16%;
	font-size: 26px;
	margin-bottom: 25px;
}

ul {
	margin: 10px auto;
	border-right: 0;
	padding-left: 0;
}

ul li {
	text-align: center;
	float: left;
	list-style: none;
}

ul li a {
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

ul li.on a {
	color: #fff;
}

tr {
	height: 24px;
	padding: 18px 0px;
}

#super_container {
	margin: 0 auto;
	margin-top: 120px;
	margin-left: 200px;
}

.table_wrapper {
	display: flex;
	flex-direction: column;
}

.cont1_table {
	width: 65vw;
	margin: 0 auto;
	border-spacing: 0px !important;
}

.cont1_th {
	background-color: #F0F0F0;
}

.thCenter1 {
	margin: 10px 5px;
	text-align: center;
	padding: 12px 0;
	border-bottom: 1px solid lightgray;
	font-size: 0.85rem;
}

.tdCenter1 {
	margin: 10px 5px;
	text-align: center;
	padding: 12px 0;
	border-bottom: 1px solid lightgray;
	font-size: 0.9rem;
}

.tdCenter1_btn1 {
	border-style: none;
	background: #ffdf48;
	color: #5c3b0c;
	margin: 5px;
	padding: 5px 18px;
}

.tdCenter1_btn2 {
	border-style: none;
	background: #E9E9E9;
	color: #5c3b0c;
	margin: 5px;
	padding: 5px 18px;
}

#top_bar {
	width: 63vw;
	margin: 0 auto;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

#top_bar h3 {
	/* 	margin : 0 auto; */
	margin-left: 0 !important;
	float: left;
	font-size: 26px;
	margin: 25px 5px;
}

#search_wrapper {
	width: 75%;
	display: flex;
	justify-content: flex-end;
	flex-wrap: wrap;
	align-items: flex-end;
	margin-bottom: -15px;
}

#search_wrapper select {
	margin: 0 5px;
	height: 30px;
	font-size: 13px;
}

#sel2 {
	height: 24px !important;
}

#search_wrapper button {
	margin: 0 5px;
	width: 60px;
	height: 30px;
	font-size: 13px;
}

#if_undefined {
	margin: 30 auto;
	padding: 20px;
	text-align: left;
}
}
</style>
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<%@include file="../queen/adminNavbar.jsp"%>
<body>
	<div class="jumbotron"></div>
	<nav id="searchNav" class="navbar navbar-expand-sm navbar-dark">
	</nav>

	<div id="container_top"></div>
	<div id="super_container">
			<div class="table_wrapper">
			
			<div id="top_bar">
	<h3>회원리스트</h3>
	
			<div id="search_wrapper">		
				<select class="search002" id="sel1" name="user_condition"
					style="display: inline-block !important; margin-right: 10px;">

					<option value="user_id">아이디</option>
					<option value="user_name">이름</option>
				</select> <input class="search002" type="text" name="user_search"
					id="sel2" placeholder="검색어를 입력하세요.">
				<button class="btn btn-success" type="button" id="sel3" class="search002">검색</button>
			</div>
		</div>



		<table class="cont1_table">
			<thead class="btn-primary">
				<tr class="cont1_th">
					<th class="thCenter1">아이디</th>
					<th class="thCenter1">이름</th>
					<th class="thCenter1">주소</th>
					<th class="thCenter1">전화번호</th>
					<th class="thCenter1">이메일</th>
					<th class="thCenter1">관심TIP</th>
				</tr>
			</thead>
			<tbody id="dataTableBody">

			</tbody>
		</table>
		<br>
		<br>

		<ul id="pagingul">
		</ul>
	</div>

	<div id="footer"></div>
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
 dataPerPage = 5;
 
 
 $.ajax({ // ajax로 데이터 가져오기
   method: "POST",
   url: "getUserListUserAjax",
   dataType: "json",
   async:false,
   success: function (data) {
      //alert("data: " + JSON.stringify(d));
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
               console.log("error : " + dataList[i].user_id);
              chartHtml +=
            	  '<tr><td class="tdCenter1">' +
                dataList[i].user_id +
                '</td><td class="tdCenter1">' +
                dataList[i].user_name +
                '</td><td class="tdCenter1">' +
                (dataList[i].user_addr2 +  dataList[i].user_addr3 + dataList[i].user_addr4)+
                '</td><td class="tdCenter1">' +
                (dataList[i].user_tel  || "") +
                '</td><td class="tdCenter1">' +
                (dataList[i].user_email  || "") +
                '</td><td class="tdCenter1">' +
                (dataList[i].user_cate  || "") +
                '</td><td class="tdCenter1">';
            } 
         
     
  }else{ 
   
   for (
     var i = (currentPage - 1) * dataPerPage;
     i < (currentPage - 1) * dataPerPage + dataPerPage;
     i++
   ) {
      chartHtml +=
    	  '<tr><td class="tdCenter1">' +
          dataList[i].user_id +
          '</td><td class="tdCenter1">' +
          dataList[i].user_name +
          '</td><td class="tdCenter1">' +
          (dataList[i].user_addr2 +  dataList[i].user_addr3 + dataList[i].user_addr4)+
          '</td><td class="tdCenter1">' +
          (dataList[i].user_tel  || "") +
          '</td><td class="tdCenter1">' +
          (dataList[i].user_email  || "") +
          '</td><td class="tdCenter1">' +
          (dataList[i].user_cate  || "") +
          '</td><td class="tdCenter1">';
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
   
      var user_condition=$('#sel1').val();
      var user_search=$('#sel2').val();
      
      $.ajax({ // ajax로 데이터 가져오기
         method: "POST",
         url: "getUserListPostSearch",
          data: {userSearch:user_search, userCondition:user_condition},
         dataType: "json",
         async:false,
         success: function (data) {
//              alert("data: " + JSON.stringify(data));
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
       
      
   });
   
</script>

</html>