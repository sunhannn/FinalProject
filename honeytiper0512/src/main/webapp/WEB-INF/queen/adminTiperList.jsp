<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
#searchNav{-webkit-justify-content: flex-end; justify-content: flex-end; }


body{
   padding: 0;
   margin: 0;

}

ul{
   margin : 0 auto;
   border-right: 0;
   padding-left: 0;
}

ul li {
   text-align: center;
   float:left;
   list-style : none;
   margin: 0 auto;
}

ul li a{
   margin: 0 auto;
   text-align: center;
   display: block;
   font-size: 14px;
   color: black;
   padding : 9px 12px;
   border-right: solid 1px #ccc;
   box-sizing: border-box;
   text-decoration-line: none;
}

ul li.on{
   background: #FFD400;
}

ul li.on a{
   color:#fff;
}

#container003{
   margin: 0 auto;   
   display: flex;
   flex-direction: column;
   justify-content: center;
   margin-left: 200px;
   margin-top: 120px;
}



#sel1{
   height: 38px !important;
   width: 100%;
   margin-bottom: 0px;
   
}

#sel2{
   height: 38px !important;
   width: 100%;
}


#sel3{
   height: 38px !important;
   width: 100%;
}

#table003{
   width: 95vw;
   margin: 0 auto;

}

#top_bar{
   display:flex;
   flex-direction: column;

}

.tdCenter_wrapper{
    display: flex;
    flex-wrap : wrap;
    justify-content: space-around;
}

.tdCenter_name_date{
   display: flex;
   flex-direction: column;
   flex-wrap: wrap;
   justify-content: center;
}

.tdCenter_name_id{
   display: flex;
}

.tdCenter{
   display: inline;
    margin: 10px 5px;;
}

.tdCenter_wrapper #name003{
   font-weight: bold;
}

.tdCenter_wrapper #cate003{
   display: inline;
    margin: 20px 30px;
    vertical-align: middle;
    padding-top: 26px;
}

.tdCenter_cate003_img_name{
   display: flex;
}

.tdCenter_wrapper #cate003 span{
   vertical-align: middle;
}

.tdCenter_name_id #name003{
   margin: 10px 0px;
   margin-left: 5px;
}

.tdCenter_name_id #id003{
   margin: 10px 0px;
   font-weight: lighter;
}

.tdCenter img{
   height: 100px;
   width: 100px;
}

#btn_wrapper{
   display: flex;
   flex-direction: column;
   margin-top: 5px;
}

#btn_wrapper button{
   width: 150px;
   height: 30px;
   background-color: #ffdf48;
   color: #5c3b0c;
   border-style: none;
   font-size:0.9rem;
   
   margin: 10px;
}

#btn_wrapper .button_box_reject{
   width: 150px;
   height: 30px;
   background-color: #E9E9E9;
   color: #5c3b0c;
   border-style: none;
   font-size:0.9rem;
   
   margin: 10px;
}

#paging_wrapper{
   margin: 0 auto;
}

@media ( min-width : 768px) {      /*=======================================================*/

#table003{
   width: 65vw;
   margin: 0 auto;
}

.tdCenter_wrapper #cate003{
    margin: 20px 5px;
    text-align: center;
    width: 60px;
}

#top_bar{
   display:flex;
   flex-direction: row;
}

#top_bar h3{
   width: 25%;
   margin-bottom: 10px;
}

#search_wrapper{
   width: 75%;
   display:flex;
   justify-content: flex-end;
   flex-wrap: wrap;
   align-items: flex-end;
   margin-bottom: 3px;
}
#search_wrapper select{
   width: 20%;
}

#search_wrapper input{
   width: 40%;
   margin-right: 5px !important;
}
#search_wrapper button{
       width: 60px;
    font-size: 13px;
}
.form-control #sel2{
   margin-right:5px !important;
}



}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript"  src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

<body>
<div class="jumbotron">
</div>
<%@include file="../queen/adminNavbar.jsp"%>
<nav id="searchNav" class="navbar navbar-expand-sm navbar-dark">
</nav>
<div id="container003">
  <div id="table003">
   <h2 style="margin:40px 0px;">강의리스트</h2>
               <hr class="hrFirst">
        <div id="search_wrapper">
     <select class="form-control" id="sel1" name="lesson_condition" style="display:inline-block!important;margin-right:10px;">

      <option value="lesson_title">강의명</option>
      <option value="tiper_user_id">강사아이디</option>
    </select>
    
    <input class="form-control mr-sm-2" type="text" name="lesson_search" id="sel2" placeholder="검색어를 입력하세요.">
<!--     <button class="btn btn-success" type="submit">검색</button> -->
    <button class="btn btn-success" type="button" id="sel3">검색</button>
    
<!--   </form> -->
  

<div class="container-fluid">
  <table class="table table-hover">
    <thead class="btn-primary">
      <tr>
        <th>강의명</th>
        <th>강의등록일</th>
        <th>강의정보</th>
        <th>강사아이디</th>
        <th>강사소개</th>
      </tr>
    </thead>
    <tbody id="dataTableBody">
    
<%-- <c:forEach items="${lessonList}" var="lesson"> --%>
<!--    <tr> -->
<%--      <td class="tdCenter">${lesson.lesson_title}</td> --%>
<%--      <td class="tdCenter">${lesson.lesson_date}</td> --%>
<%--      <td class="tdCenter">${lesson.lesson_info}</td> --%>
<%--      <td class="tdCenter">${lesson.tiper_lesson_id}</td> --%>
<%--      <td class="tdCenter">${lesson.tiper_info}</td> --%>
<%--      <td class="tdCenter">${lesson.review_sugar}</td> --%>
<!--    </tr> -->
<%-- </c:forEach> --%>
    </tbody>
  </table><br><br>
    <ul id="pagingul">
   </ul>
   </div>
   </div>
   </div>
   </div>
   
  <div id="footer">
<!--      <button type="button" id="conWrite" class="btn btn-primary">글쓰기</button> -->
  </div>




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
                "<tr><td>" +
                dataList[i].lesson_title +
                "</td><td>" +
                dataList[i].lesson_date +
                "</td><td>" +
                dataList[i].lesson_info +
                "</td><td>" +
                dataList[i].tiper_user_id +
                "</td><td>" +
                dataList[i].tiper_info +
                "</td><td>" 
            } 
         
     
  }else{ 
   
   for (
     var i = (currentPage - 1) * dataPerPage;
     i < (currentPage - 1) * dataPerPage + dataPerPage;
     i++
   ) {
      chartHtml +=
          "<tr><td>" +
          dataList[i].lesson_title +
          "</td><td>" +
          dataList[i].lesson_date +
          "</td><td>" +
          dataList[i].lesson_info +
          "</td><td>" +
          dataList[i].tiper_user_id +
          "</td><td>" +
          dataList[i].tiper_info +
          "</td><td>" 
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

</body>
</html>