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
		color: #FF7F50;
	}
	body{
		background-image: url("../upload/carrot.jpg");
		background-repeat: repeat;
		opacity: 0.9;
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
	input[type="text"], input[type="password"]{
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
</style>
<script type="text/javascript">
	var cp = '${currentPage}';
	function login(f){
		f.action = "../UserController";
		f.submit();
	}
	function view_all(){
		location.href='../BBSController?cmd=allList&currentPage=' + cp;
	}
</script>
</head>
<body>
	<div>
		<h2>로그인</h2>
		<form method="post">
			<table>
				<tbody>
					<tr>
						<th>아이디</th>
						<td><input type="text" name="id"></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" name="pw" ></td>
					</tr>
					<tr>
						<td colspan="2" id="btn">
							<input type="button" value="로그인" onclick="login(this.form)">&nbsp;&nbsp;
							<input type="button" value="메인 페이지" onclick="view_all()">
							<input type="hidden" name="cmd" value="login">
							<input type="hidden" name="currentPage" value="${currentPage }">
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</body>
</html>