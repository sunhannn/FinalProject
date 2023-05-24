<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
		form {
			border: 2px solid;
			background-color: #FFF;
			padding: 20px;
			border-radius: 4px;
			box-shadow: 0 0 10px rgba(0,0,0,0.1);
			margin-top: 50px;
			max-width: 100%;
			margin: 0 auto;
		}
		
		table {
			width: 100%;
		}
		
		td {
			padding: 10px;
		}
		
		faq_question:focus, faq_answer:focus{
			border:2px solid gray;
			outline: none;
		}
		textarea {
			width: 100%;
			height: 6.25em;
			resize: none;
			border: 1px solid #CCC;
			padding: 5px;
			border-radius: 4px;
			font-size: 14px;
			margin-bottom: 10px;
		}
		
		#answerUpdate{
			width: 100%;
			height: 25.25em;
			resize: none;
			border: 1px solid #CCC;
			padding: 5px;
			border-radius: 4px;
			font-size: 14px;
			margin-bottom: 10px;
		}
		
		.allButton{
			border-style: none;
		    background: #FFD400;
		    color: #5c3b0c;
		    margin: 5px;
		    padding: 5px 18px;
		    cursor: pointer;
		    font-size: 12pt;
		    font-weight: bolder;
		    border-radius: 5px;
		}
		
		.tdFaq{
			font-size: 24px;
    		font-weight: bolder;
    		text-align: center;
			vertical-align: top;
    		padding-top: 40px;
		}
		#akwls0dhxh{
			text-align: center;
		}
</style>
<script>
	function goBack(){
		  history.back();
	}
</script>
<body>
	<div style="width:65%; margin: 0 auto;">
		<h2 style="margin:40px 0px;">F A Q 관리</h2>
		<form action="insertFaq" method="post">
			<table>
				<tr>
					<td class="tdFaq">Q.</td>
					<td><textarea name="faq_question"></textarea> </td>
				</tr>
				<tr>
					<td class="tdFaq">A.</td>
					<td><textarea name="faq_answer" id="answerUpdate"></textarea> </td>
				</tr>
			</table>
			<div id="akwls0dhxh">
				<input type="submit" value="FAQ등록" class="allButton">
				<button type="button" class="allButton" onclick="goBack()">목록으로 돌아가기</button>
			</div>
		</form>
	</div>
</body>
</html>