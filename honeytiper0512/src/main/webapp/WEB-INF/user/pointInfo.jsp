<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
.container {
   position: relative; /*이만큼이 전체사이즈이다 알려주려고 넣은것*/
}
div.pagination{
width:300px;
margin: 20px auto;
}
.pagination a {
   color: black;
   float: left;
   padding: 8px 16px;
   text-decoration: none;
   border: 1px solid #ddd;
}

.pagination a.active {
   background-color: #ffd400;
   color: white;
   border: 1px solid #ffd400;
}

.pagination a:hover:not(.active) {
   background-color: #ddd;
}

.pagination a:first-child {
   border-top-left-radius: 5px;
   border-bottom-left-radius: 5px;
}

.pagination a:last-child {
   border-top-right-radius: 5px;
   border-bottom-right-radius: 5px;
}

.table tbody tr {
   display: none;
}

.table tbody tr.active {
   display: table-row;
}

.btn {
   background-color: #c8c8c8;
   display: block;
   position: absolute;
   left: 15px;
   border: none;
   color: white;
   padding: 12px 15px;
   cursor: pointer;
}

.warning {
   border-radius: 4px;
   background-color: #ffd400;
   position: absolute;
   display: block;
   right: 15px;
   border: none;
   color: white;
   padding: 12px 15px;
   cursor: pointer;
}

.warning:hover {
   background: #e7c310;
   color:black;
}

.totalPay {
/*    background-color: #ffd400; */
   position: absolute;
   left: 15px;
   color: black;
   display: block;
   font-size: 22px;
/*    border-radius: 250px; */
/*    width: 400px; */
/*    height: 50px; */
   magin: 0;
}
.end-hr{
margin-bottom: 230px;
}
</style>
</head>
<body>
<%@include file="../main/header.jsp" %>
   <input type="hidden" id="point_id" value="${point_id}">
   <div class="container">
      <h2 style="margin:140px 0px 70px 0px;">마이페이지</h2>
      <p style="font-size:23px;">MY허니페이</p>
      <br>
      <p class="totalPay">잔여허니페이: <fmt:formatNumber value="${totalPoint.user_point}" groupingUsed="true" /> point</p>
      <button class="warning" type="button"
         onclick="location.href='goPointCharge'">충전하러가기</button>
               <br> <br>
                     <br> <br>
      <hr>
      <table class="table table-bordered">
         <thead>
            <tr>
               <th style="width: 25%; text-align: center;">날짜</th>
               <th style="width: 55%; text-align: center;">내용</th>
               <th style="width: 20%; text-align: center;">허니페이</th>
            </tr>
         </thead>
         <tbody id="dataTableBody">
            <c:forEach items="${pointList}" var="point" varStatus="status">
               <tr class="pagination-row" data-row="${status.index}">
                  <td style="text-align: center;"><fmt:formatDate
                        value="${point.point_time}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                  <td style="text-align: center;">${point.point_history}</td>
                  <td style="text-align: center;"><fmt:formatNumber value="${point.point_price}" groupingUsed="true" /></td>
               </tr>
            </c:forEach>
         </tbody>
      </table>
      <div class="row">
         <div class="col-md-12 text-center">
            <div class="pagination" style="display: block;">
               <a href="javascript:void(0)" class="prev">&laquo;</a>
               <div id="pageNumbers"></div>
               <a href="javascript:void(0)" class="next">&raquo;</a>
            </div>
         </div>
      </div>
      <hr class="end-hr">
   </div>
   <script>
      $(document).ready(function() {
                     var rows = 10;//페이지당 나타낼 데이터수 
                     var totalRows = $('#dataTableBody tr').length;//전체 데이터의 줄수
                     var totalPages = Math.ceil(totalRows / rows);//전체 페이지수(전체데이터줄수나누기 10)
                     var pageNum = sessionStorage.getItem("pageNum") ? sessionStorage
                           .getItem("pageNum")
                           : 1;

                     if (totalRows <= rows) {  
                        $('.pagination').hide(); 
                     } else {
                        for (var i = 1; i <= totalPages; i++) {
                           $('#pageNumbers').append( 
                                 '<a href="javascript:void(0)" class="page" data-page="' + i + '">'
                                       + i + '</a> ');
                        }
                     }
                        //페이지 숫자 누르면 항상 가운데로 볼수있게 만듬 나중에 끝에가도 버튼숫자 없어지지않게
                     function updatePaginationButtons() {
                        var startPage = Math.max(1, pageNum - 2);
                        var endPage = Math.min(totalPages,
                              startPage + 4);
                        startPage = Math.max(1, endPage - 4);

                        $('.pagination a.page').hide();
                        $('.pagination a.page').slice(startPage - 1,
                              endPage).show();
                     }

                     showPage(pageNum);
                     updatePaginationButtons();

                     $('.pagination a.page').click(function() {
                        pageNum = $(this).data('page');
                        sessionStorage.setItem("pageNum", pageNum);
                        showPage(pageNum);
                        updatePaginationButtons();
                     });

                     $('.pagination a.prev').click(
                           function() {
                              pageNum = parseInt($(
                                    '.pagination a.active').data(
                                    'page')) - 1;
                              if (pageNum >= 1) {
                                 sessionStorage.setItem("pageNum",
                                       pageNum);
                                 showPage(pageNum);
                                 updatePaginationButtons();
                              }
                           });

                     $('.pagination a.next').click(
                           function() {
                              pageNum = parseInt($(
                                    '.pagination a.active').data(
                                    'page')) + 1;
                              if (pageNum <= totalPages) {
                                 sessionStorage.setItem("pageNum",
                                       pageNum);
                                 showPage(pageNum);
                                 updatePaginationButtons();
                              }
                           });

                     $('.pagination a.page[data-page="' + pageNum + '"]')
                           .addClass('active');
                     $('.pagination a.prev').addClass('disabled');

                     if (totalPages === 1) {
                        $('.pagination a.next').addClass('disabled');
                     }

                     function showPage(pageNum) {
                        var startRow = (pageNum - 1) * rows;
                        var endRow = startRow + rows - 1;

                        $('#dataTableBody tr').hide();
                        $('#dataTableBody tr').each(function(index) {
                           if (index >= startRow && index <= endRow) {
                              $(this).addClass('active').show();
                           } else {
                              $(this).removeClass('active');
                           }
                        });

                        $('.pagination a.page').removeClass('active');
                        $(
                              '.pagination a.page[data-page="'
                                    + pageNum + '"]').addClass(
                              'active');

                        if (pageNum === 1) {
                           $('.pagination a.prev')
                                 .addClass('disabled');
                        } else {
                           $('.pagination a.prev').removeClass(
                                 'disabled');
                        }

                        if (pageNum === totalPages) {
                           $('.pagination a.next')
                                 .addClass('disabled');
                        } else {
                           $('.pagination a.next').removeClass(
                                 'disabled');
                        }
                     }
                  });
      
   </script>
   <%@include file="../main/footer.jsp" %>
</body>
</html>