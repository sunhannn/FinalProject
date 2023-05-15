<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>아임포트결제창</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <!-- modal -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<script>
    //<<<<<<<<<<<<<<아임포트결제코드>>>>>>>>>>>>>>>
    function requestPay() {
       var amount = $("#amount").val();
//        var amount = document.getElementById("amount").value;

             var IMP = window.IMP; 
        IMP.init("imp63414107"); 
      
        var today = new Date();   
        var hours = today.getHours(); // 시
        var minutes = today.getMinutes();  // 분
        var seconds = today.getSeconds();  // 초
        var milliseconds = today.getMilliseconds();
        var makeMerchantUid = hours +  minutes + seconds + milliseconds;
        

            IMP.request_pay({
                pg : 'danal_tpay.9810030929',
                pay_method : 'card',
                merchant_uid: "IMP"+makeMerchantUid, 
                name : '허니페이충전',
                amount : $("#amount").val(),
                buyer_email : 'Iamport@chai.finance',
                buyer_name : '아임포트 기술지원팀',
                buyer_tel : '010-1234-5678',
                buyer_addr : '서울특별시 강남구 삼성동',
                buyer_postcode : '123-456'
            }, 
            function (rsp) {
                console.log(rsp);
                if (rsp.success) {
                    var msg = '결제가 완료되었습니다.';
                    msg += '결제 금액 : ' + rsp.paid_amount;
                    $.ajax({
                       type: "POST", // 전송 방식 POST
                        url: "insertPoint", // 충전 금액값을 보낼 url
                        data: {
                            "point_price": $("#amount").val(), // 결제 금액
                            "point_history": "허니페이충전", // 결제 내용
                            "point_id": "<%= session.getAttribute("user_Id") %>" // 사용자 아이디 (세션에서 받아옴)
                        },
                       
                    });
                } else {
                    var msg = '결제에 실패하였습니다.';
                    msg += '실패원인 : ' + rsp.error_msg;
                   
                }
                alert(msg);
                document.location.href="goMyHoneypay"; //alert창 확인 후 결제 성공시에 목록으로 이동함
            })
        }
    
    </script>
    <script>
 // Get the modal
 var modal = document.getElementById('id01');

 // When the user clicks anywhere outside of the modal, close it
 window.onclick = function(event) {
   if (event.target == modal) {
     modal.style.display = "none";
   }
 }
 
</script>
<style>
.container {
position: relative; /*이만큼이 전체사이즈이다 알려주려고 넣은것*/ */
}
.warning {
   background-color: #ffd400;
   border: none;
   border-radius: 4px;
   padding: 12px 15px;
   cursor: pointer;
   border-radius: 4px;
   color: #5c3b0c;
   cursor: pointer;
   font-size:17px;
   font-weight:bold;
}
.info-button{
background-color: #ffd400;
   border: none;
   border-radius: 4px;
   color: #5c3b0c;
   cursor: pointer;
   font-size:17px;
   font-weight:bold;
   padding: 12px 15px;
}
.warning:hover {
   background-color: #e7c310;
   color:black;
}

input[type="number"]::-webkit-outer-spin-button, input[type="number"]::-webkit-inner-spin-button
   {
   -webkit-appearance: none;
   margin: 0;
}
.w3-modal {
  z-index: 9999;
}
.w3-container{
margin:40px 40px;

}
.w3-modal-content.w3-card-4 {
    width: 35%;
    border-radius: 4px;
}
@media (max-width: 768px) {
  #amount {
    width: 90%;
    padding: 10px;
  }
  .warning {
    display: block;
    margin: 10px auto 0;
  }
}
@media(min-width: 768px){
#amount{
width: 50%; padding: 10px;
}}
.end-hr{
margin-bottom: 230px;
}
</style>
</head>
<body>
   <%@include file="../main/header.jsp"%>
   <div class="container">
      <p style="font-size:27px; margin:50px 0px 50px 0px; font-weight:bold;">허니페이 충전하기</p>
      <br>
      <button onclick="document.getElementById('id01').style.display='block'" class="info-button">허니페이란</button>
      
<div class="w3-container">
  <div id="id01" class="w3-modal">
    <div class="w3-modal-content w3-card-4">
      <header class="container teal" style="background-color:#ffd400;"> 
        <span onclick="document.getElementById('id01').style.display='none'" 
        class="w3-button w3-display-topright">&times;</span>
        
      </header>
      <div class="w3-container">
        <h4><b>허니페이 안전결제는 </b></h4>
<h4><b>티퍼와 고객 간 거래시 사용하는 결제수단입니다</b></h4>
<br>
<h5><b>결제금액 안전하게 보호</b></h5>
<p>서비스가 완료될 때까지 꿀팁에서 안전하게 보호해요</p>
<br>
<h5><b>서비스 과정에서 문제가 생겼을 때 꿀팁이 도와드려요</b></h5>
<br>
<h5><b>원하는 방법으로 편하게 결제</b></h5>
<p>카드 결제부터 간편결제까지 원하는 방법으로 결제가 가능해요</p>
<br><br>
<hr>
<br>
<h4><b>서비스단계</b></h4>
<br>
<h5><b>허니페이충전</b></h5>
<p>서비스를 이용하기위해 허니페이를 충전합니다</p>
<br>
<h5><b>티퍼에게 강의를 신청하기</b></h5>
<p>원하시는 서비스를 신청하기 버튼을 누르고 채팅을 통해 금액을 협의하세요</p>
<p>금액을 확인후 서비스 확정을 누르시면 포인트를 사용하게됩니다</p>
<br>
<h5><b>거래확정</b></h5>
<p>서비스가 모두 종료되어 거래를 확정한 상태로, </p>
<p>티퍼에게 서비스 대금이 최종적으로 지급됩니다.</p>
      </div>
      <footer class="w3-container w3-teal">
      </footer>
    </div>
  </div>
</div>

      <hr>
      <br><br>
      <div class="form-group">
         <label class="col-sm-4 control-label"
            style="font-size: 25px; text-align: right;">충전 금액:</label>
         <div class="col-sm-8">
            <input type="number" id="amount" name="amount" class="payfull-input"
               placeholder="결제할 금액을 입력해주세요" >
            <button class="warning" onclick="requestPay()">결제하기</button>
         </div>
      </div>
      <br>
      <br> <br>
      <hr class="end-hr">
   </div>
<%@include file="../main/footer.jsp"%>

</body>