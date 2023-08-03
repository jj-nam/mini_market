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
	}
	#btn, h1{
		text-align: center;
	}
	input[type=button]{
		text-decoration: none;
		color: #B86824;
		font-weight: bold;
	}
	textarea{
		resize:none;
	}
	body{
		background-image: url("./upload/carrot.jpg");
		background-repeat: repeat;
		opacity: 0.9;
	}
	
</style>
<script type="text/javascript">
	function update(f){
		if(f.content.value == ''){
			alert("댓글을 입력하세요");
			return;
		}
		if(f.c_price.value == ''){
			alert("금액을 입력하세요");
			return;
		}
		f.action = '/project/BBSController?cmd=updateComment&b_idx=${cvo.b_idx}&c_idx=${cvo.c_idx}';
		f.submit();
	}
	function view_all(){
		location.href='BBSController?cmd=view&b_idx=${cvo.b_idx}';
	}
</script>
</head>
<body>
	<div>
		<h1 style="color: #FF7F50">댓글 수정</h1>
		<form method="post">
			<table>
				<tbody>
					<tr>
						<th>댓글</th>
						<td>
							<textarea rows="10" cols="80" name="content" style="border-color : #FFAF00;">${cvo.content }</textarea>
						</td>
					</tr>
					<tr>
						<th>금액</th>
						<td><input type="number" name="c_price" value="${cvo.c_price}" size="80" style="border-color : #FFAF00;">원</td>
					</tr>
					<tr>
						<td colspan="2" id="btn">
							<input type="button" value="수정하기" onclick="update(this.form)">&nbsp;&nbsp;
							<input type="button" value="취소" onclick="view_all()">
							<input type="hidden" name="c_idx" value="${cvo.c_idx }">
							<input type="hidden" name="b_idx" value="${cvo.b_idx }">
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</body>
</html>