<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	div{
		width: 500px;
		margin: auto;
	}
	h2{
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
		padding: 15px;
	}
	th{
		width: 40%;
		background-color: #FF7F50;
		color: #fff;
		text-align: center;
	}
	input[type="text"], input[type="password"],input[type="number"]{
		height: 20px;
		width: 95%;
	}
	#btn{
		text-align: center;
	}
	#btn input{
		text-decoration: none;
		color: #B86824;
		font-weight: bold;
	}
	.back-ground{
		background-image: url("../upload/carrot.jpg");
		background-repeat: repeat;
		opacity: 0.9;
	}
</style>
<script type="text/javascript">
	var cp = '${currentPage}';
	function join(f){
		
		// 아이디 정규식
		var regId = /^[0-9a-z]{8,16}$/;		 
		// 비밀번호 정규식
		var regPw = /^[0-9a-zA-Z]{8,16}$/;	
		// 성함 정규식 
		var regName = /^[가-힣]{2,6}$/;	 
		// 주민등록번호 정규식(앞자리)
		var regPid1 = /^\d{6}$/;
		
		if(!regId.exec(f.id.value)){
			alert("아이디를 8~16자 소문자+숫자로 입력하세요.");
			f.id.focus();
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
		if(!regName.exec(f.name.value)){
			alert("이름을 다시 적어주세요 (한글 2~6자)");
			f.name.focus();
			return;
		}
		if(f.nickname.value == ''){
			alert("닉네임을 입력하세요");
			f.nickname.focus();
			return;
		}
		if(!regPid1.exec(f.birth_d.value)){
			alert("생년월일을 입력하세요");
			f.birth_d.focus();
			return;
		}
		if(f.phone.value == ''){
			alert("핸드폰 번호를 입력하세요");
			f.phone.focus();
			return;
		}
		if(f.addr1.value == '1'){
			alert("주소를 선택하세요");
			f.addr1.focus();
			return;
		}
		if(f.addr2.value == ''){
			alert("주소를 입력하세요");
			f.addr2.focus();
			return;
		}
		if(f.addr3.value == ''){
			alert("상세주소를 입력하세요");
			f.addr3.focus();
			return;
		}
		
		f.action = "../UserController";
		f.submit();
	}
	function view_all(){
		location.href='../BBSController?cmd=allList';
	}
</script>
</head>
<body class="back-ground">
	<div>
		<h2 style="color:#FF7F50">회원가입</h2>
		<form method="post">
			<table>
				<tbody>
					<tr>
						<th>아이디</th>
						<td colspan="3"><input type="text" name="id" placeholder="※8~16자 소문자+숫자로 입력하세요."></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td colspan="3"><input type="password" name="pw" placeholder="※8~16자 대문자+소문자+숫자로 입력하세요."></td>
					</tr>
					<tr>
						<th>비밀번호 확인</th>
						<td colspan="3"><input type="password" name="pwCk" placeholder="비밀번호를 다시 입력해주세요."></td>
					</tr>
					<tr>
						<th>이름</th>
						<td colspan="3"><input type="text" name="name"></td>
					</tr>
					<tr>
						<th>닉네임</th>
						<td colspan="3"><input type="text" name="nickname"></td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td colspan="3"><input type="number" name="birth_d" placeholder="YYMMDD"></td>
					</tr>
					<tr>
						<th>핸드폰 번호</th>
						<td colspan="3"><input type="text" name="phone" placeholder="※ 하이픈(-)없이 입력하세요"></td>
					</tr>
					<tr>
						<th>주소</th>
						<td colspan="3"><select name="addr1" style="width: 80px;">
							<option value="1">지역 선택</option>
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
						<input type="text" name="addr2" style="width: 169px;" placeholder="예: 화곡1동, 우장산동"></td>
					</tr>
					<tr>
						<th>상세 주소</th>
						<td colspan="3"><input type="text" name="addr3" placeholder="A아파트 101동 101호"></td>
					</tr>					
					<tr>
						<td colspan="2" id="btn">
							<input type="button" value="회원 가입" onclick="join(this.form)">&nbsp;&nbsp;
							<input type="reset" value="다시 작성">&nbsp;&nbsp;
							<input type="button" value="메인페이지" onclick="view_all()">
							<input type="hidden" name="cmd" value="join">
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</body>
</html>