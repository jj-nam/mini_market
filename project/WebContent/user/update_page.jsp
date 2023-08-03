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
	body{
		background-image: url("../upload/carrot.jpg");
		background-repeat: repeat;
		opacity: 0.9;
	}
</style>
<script type="text/javascript">
	function view_all(){
		location.href='../BBSController?cmd=allList';
	}
	function update(f){
		// 비밀번호 정규식
		var regPw = /^[0-9a-zA-Z]{8,16}$/;	
		// 성함 정규식 
		var regName = /^[가-힣]{2,6}$/;	 
		// 주민등록번호 정규식(앞자리)
		var regPid1 = /^\d{6}$/;
		
		var pw = '${uvo.pw}';
		if(f.oldpw.value != pw){
			alert("비밀번호가 틀렸습니다.");
			f.oldpw.focus();
			return;
		}
		if(f.pw.value == pw){
			alert("새로운 비밀번호를 입력해주세요");
			f.pw.focus();
			return;
		}
		if(!regPw.exec(f.pw.value)){
			alert("비밀번호를 8~16자 대문자+소문자+숫자로 입력하세요.");
			f.pw.focus();
			return;
		}
		if(f.pw.value != f.pwCk.value){
			alert("비밀번호가 동일하지 않습니다.");
			f.pwCk.focus();
			return;
		}
		
		f.action = "../UserController?cmd=update_info";
		f.submit();
	}
	function goLogout(){
		location.href='../UserController?cmd=logout';
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
						<th>아이디</th>
						<td>${uvo.id }<input type="hidden" name="id" value="${uvo.id }"></td>
					</tr>
					<tr>
						<th>현재 비밀번호</th>
						<td colspan="3"><input type="password" name="oldpw" placeholder="현재 비밀번호를 입력하세요"></td>
					</tr>
					<tr>
						<th>새로운 비밀번호</th>
						<td colspan="3"><input type="password" name="pw" placeholder="※8~16자 대문자+소문자+숫자로 입력하세요."></td>
					</tr>
					<tr>
						<th>새로운 비밀번호 확인</th>
						<td colspan="3"><input type="password" name="pwCk" placeholder="비밀번호를 다시 입력해주세요."></td>
					</tr>
					<tr>
						<th>이름</th>
						<td>${uvo.name }<input type="hidden" name="name" value="${uvo.name }"></td>
					</tr>
					<tr>
						<th>닉네임</th>
						<td>${uvo.nickname }<input type="hidden" name="nickname" value="${uvo.nickname }"></td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td>${uvo.birth_d }<input type="hidden" name="birth_d" value="${uvo.birth_d }"></td>
					</tr>
					<tr>
						<th>핸드폰 번호</th>
						<td colspan="3"><input type="text" name="phone" value="${uvo.phone }"placeholder="※ 하이픈(-)없이 입력하세요"></td>
					</tr>
					<tr>
						<th>주소</th>
						<td colspan="3"><select name="addr1" style="width: 80px;">
							<option value="${uvo.addr1 }">${uvo.addr1 }</option>
							<option value="서울">서울</option>
							<option value="경기도">경기도</option>
							<option value="인천">인천</option>
							<option value="강원도">강원도</option>
							<option value="대전">대전</option>
							<option value="대구">대구</option>
							<option value="울산">울산</option>
							<option value="부산">부산</option>
							<option value="광주">광주</option>
							<option value="제주">제주</option>
							<option value="세종특별자치시">세종특별자치시</option>
						</select>
						<input type="text" name="addr2" value="${uvo.addr2 }" style="width: 169px;" placeholder="예: 화곡1동, 우장산동"></td>
					</tr>
					<tr>
						<th>상세 주소</th>
						<td colspan="3"><input type="text" name="addr3" value=${uvo.addr3 } placeholder="예) A아파트 101동 101호"></td>
					</tr>
					<tr>
						<td colspan="2" id="btn">
							<input type="button" value="수정" onclick="update(this.form)">&nbsp;&nbsp;
							<input type="button" value="취소" onclick="history.go(-1)">
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</body>
</html>