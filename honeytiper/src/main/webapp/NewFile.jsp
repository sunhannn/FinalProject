<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	div { display:none; }
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(function(){
    $("div").slice(0, 1).show(); // 초기갯수
    $("#load").click(function(e){ // 클릭시 more
        e.preventDefault();
        $("div:hidden").slice(0, 1).show(); // 클릭시 more 갯수 지저정
        if($("div:hidden").length == 0){ // 컨텐츠 남아있는지 확인
            alert("게시물의 끝입니다."); // 컨텐츠 없을시 alert 창 띄우기 
        }
    });
});
</script>
</head>
<body>
<div>Content</div>
<div>Content</div>
<div>Content</div>
<div>Content</div>
<div>Content</div>
<div>Content</div>
<div>Content</div>
<div>Content</div>
<div>Content</div>
<div>Content</div>
<a href="#" id="load">더 보기</a>
</body>
</html>