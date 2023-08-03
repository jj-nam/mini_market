<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*,java.text.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	div {
		width: 800px;
		margin: auto;
		text-align: center;
	}
	table {
		width: 800px;
		text-align: left;
		border-collapse: collapse;
		background-color: white;
	}
	
	td,th {
		border : 1px solid #FF7F50;
		padding: 10px;	
	}
	th {
		width: 130px;
		text-align: center;
		background-color: #FF7F50;
		color: white;
	}
	
	#menu{
		width: 100px;
		background-color:#FF7F50; 
		text-align: center;
		color : white;
		font-weight: bold;
	}
	#btn {
	text-align: center;
	}
	input[type=button]{
		text-decoration: none;
		color: #B86824;
		font-weight: bold;
	}
	h1 {
		color : #FF7F50;	
	}
		
	.header-menu button{
		text-decoration: none;
		color: #B86824;
		font-weight: bold;
	}
	#btn input[type="button"]{
		text-decoration: none;
		color: #B86824;
		font-weight: bold;
	}
	.topleft_button{
		text-align: center;
		position : relative;
		left: -282px;
	}
	.topright_button1{
		text-align: center;
		position : relative;
		left: 273px;
	}
	.topright_button2{
		text-align: center;
		position : relative;
		left: 273px;
	}
	body{
		background-image: url("./upload/carrot.jpg");
		background-repeat: repeat;
		opacity: 0.9;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	function view_all(){
		var cp = '${currentPage}';
		location.href='BBSController?cmd=allList&currentPage=' + cp;
	}
	function confirmCk(f){
		alert("판매가 되었습니다.");
		var b_idx = '${bvo.b_idx}'
		f.action = 'BBSController?cmd=removeBBS&b_idx=' + b_idx;
		f.submit();
	}
	function goMyPage(){
		location.href='UserController?cmd=myPage';
	}
	function goLogout(){
		location.href='UserController?cmd=logout';
	}
</script>
</head>
<body>
	<div class="wrap">
		<div class="header-menu">
			<button class="topleft_button" onclick="view_all()">메인 페이지</button>
			<button class="topright_button1" onclick="goMyPage();">개인 정보</button>
			<button class="topright_button2" onclick="goLogout();">로그아웃</button>
		</div>
		<br><br>
		<h1>구매자 정보</h1>
		<div>
			<form method="post">
				<table class="bbs">
					<tbody>
						<tr>
							<td id="menu"> 판매 상품</td>
							<td>${bvo.title }</td>
						</tr>
						<tr>
							<td id="menu">구매자 이름</td>
							<td>${uvo.name }</td>
						</tr>
						<tr>
							<td id="menu">주소</td>
							<td>${uvo.addr1} ${uvo.addr2 } ${uvo.addr3 } </td>
						</tr>
						<tr>
							<td id="menu">핸드폰 번호</td>
							<td>${uvo.phone.substring(0,3) }-${uvo.phone.substring(3,7) }-${uvo.phone.substring(7) }</td>
						</tr>
						
						<tr>
							<td id="menu">금액</td>
							<td>${bvo.price }원</td>
						</tr>
						<tr>
						<td colspan="4" id="btn">
							<input type="button" value="확인" onclick="confirmCk(this.form)">&nbsp;&nbsp;
							<input type="button" value="취소" onclick="history.go(-1)">&nbsp;&nbsp;
							<input type="hidden" name="currentPage" value="${currentPage }">
							<input type="hidden" name="b_idx" value="${bvo.b_idx }">
						</td>
					</tr>
					</tbody>
				</table>
			</form>
			</div>
	</div>
</body>
</html>