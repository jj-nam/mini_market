<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	div{
		width: 800px;
		margin: auto;
	}
	body{
		background-image: url("./upload/carrot.jpg");
		background-repeat: repeat;
		opacity: 0.9;
	}
	h1{
		text-align: center;
	}
	table{
		width: 100%;
		text-align: left;
		border-collapse: collapse;
		background-color: white;
	} 
	td,th{
		border: 1px solid #FF7F50;
		padding: 10px;
	}
	th{
		background-color: #FF7F50;
		color: #fff;
		text-align: center;
		width : 150px;
	}
	#btn{
		text-align: center;
	}
	.readonly{
		background-color: #FFAF00;
	}
	#btn input[type="button"]{
		color: #B86824;
		font-weight: bold;
	}
	textarea{
	border: 1px solid #FF7F50;
	resize:none;
	}
	.header-menu button{
		text-decoration: none;
		color: #B86824;
		font-weight: bold;
	}
	.topright_button2{
		text-align: center;
		position : relative;
		left: 635px;
	}
	#title{
	 	text-decoration-line: none;
	 	font-size: x-large;
	 	font-weight: bold;
	}
	a{
		text-decoration-line: none;
		font-weight: bold;
		color: white;
	}
	#menuBar{
		background-color:#F49551;
		border-style: none;
	}
</style>
<script type="text/javascript">
	function view_all(){
		var cp = '${currentPage}';
		location.href='BBSController?cmd=allList&currentPage=' + cp;
	}
	function update_info_page(f){
		f.action = 'UserController?cmd=update_info_page';
		f.submit();
	}
	function goLogout(){
		location.href='./UserController?cmd=logout';
	}
</script>
</head>
<body>
	<div class="wrap">
		<div class="header-menu">
			<button class="topleft_button" onclick="view_all()">메인 페이지</button>
			<button class="topright_button2" onclick="goLogout();">로그아웃</button>
		</div>
		<h1 style="color:#FF7F50">개인 정보</h1>
		<form action="" method="post">
			<table>
				<tbody>
					<tr>
						<th id="menuBar" rowspan="2">
						<a href="UserController?cmd=myPage&id=${uvo.id }" style="display:block">개인 정보</a>
						</th>
						<th>아이디</th>
						<td>${uvo.id }</td>
					</tr>
					<tr>
						<th>이름</th>
						<td>${uvo.name }</td>
					</tr>
					<tr>
						<th id="menuBar" rowspan="2">
						<a href="UserController?cmd=soldHis&id=${uvo.id }" style="display:block">판매 내역</a>
						</th>
						<th>닉네임</th>
						<td>${uvo.nickname }</td>
					</tr>
					<tr>
						<th>생년월일</th>
						<c:choose>
							<c:when test="${uvo.birth_d.substring(0,1) <= 2 }">
								<td>20${uvo.birth_d.substring(0,2) }년 ${uvo.birth_d.substring(2,4) }월 ${uvo.birth_d.substring(4) }일</td>
							</c:when>
							<c:otherwise>
								<td>19${uvo.birth_d.substring(0,2) }년 ${uvo.birth_d.substring(2,4) }월 ${uvo.birth_d.substring(4) }일</td>
							</c:otherwise>
						</c:choose>
					</tr>
					<tr>
						<th id="menuBar" rowspan="2">
						<a href="UserController?cmd=buyHis&id=${uvo.id }" style="display:block">구매 내역</a>
						</th>
						<th>핸드폰 번호</th>
						<td>${uvo.phone.substring(0,3) }-${uvo.phone.substring(3,7) }-${uvo.phone.substring(7) }</td>
					</tr>
					<tr>
						<th>주소</th>
						<td>${uvo.addr1 } ${uvo.addr2 } ${uvo.addr3 }</td>
					</tr>
					<tr>
						<td style="border-style: none; text-align: center">
						<a id="title" href="BBSController?cmd=allList&currentPage=${currentPage }"><span style="color: #EB0000;">번</span><span style="color: #FFAF00">당</span><span style="color:#3c3c3c">마켓</span></a>
						</td>
						<td colspan="2" id="btn">
							<input type="button" value="정보 수정" onclick="update_info_page(this.form)">&nbsp;&nbsp;
							<input type="button" value="이전 화면으로" onclick="history.go(-1)">
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</body>
</html>