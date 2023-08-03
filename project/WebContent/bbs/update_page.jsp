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
	#btn input[type=button]{
		text-decoration: none;
		color: #B86824;
		font-weight: bold;
	}
	textarea{
		resize:none;
	}
	body{
		background-image: url("../upload/carrot.jpg");
		background-repeat: repeat;
		opacity: 0.9;
	}
</style>
<script type="text/javascript">
	function update(f){
		if(f.title.value == ''){
			alert("제목을 입력하세요");
			return;
		}
		if(f.content.value == ''){
			alert("내용을 입력하세요");
			return;
		}
		if(f.price.value == ''){
			alert("금액을 입력하세요");
			return;
		}
		f.action = '/project/BBSController';
		f.submit();
	}
	function view_all(){
		var cp = '${currentPage}';
		location.href='BBSController?cmd=allList&currentPage=' + cp;
	}
</script>
</head>
<body>
	<div>
		<h1 style="color:#FF7F50">게시글 수정</h1>
		<form method="post" enctype="multipart/form-data">
			<table>
				<tbody>
					<tr>
						<th>첨부파일</th>
						<td>
							<img src="../upload/${bvo.filename}" width="300">
							<input type="file" name="filename">
							<c:choose>
								<c:when test="${bvo.filename eq null }">
									<input type="hidden" name="oldfile" value="${bvo.filename }">
								</c:when>
								<c:otherwise>
									<input type="hidden" name="oldfile" value="${bvo.filename }">
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
					<tr>
						<th>판매자</th>
						<td>${bvo.writer }<input type="hidden" name="writer" value="${bvo.writer }"></td>
					</tr>
					<tr>
						<th>제목</th>
						<td ><input type="text" name="title" value="${bvo.title}" size="80" style="border-color : #FFAF00;"></td>
					</tr>
					<tr>
						<th>내용</th>
						<td>
							<textarea rows="10" cols="82" name="content" style="border-color : #FFAF00;">${bvo.content }</textarea>
						</td>
					</tr>
					<tr>
						<th>금액</th>
						<td><input type="number" name="price" value="${bvo.price}" size="80" style="border-color : #FFAF00;"> 원</td>
					</tr>
					<tr>
						<td colspan="2" id="btn">
							<input type="button" value="수정하기" onclick="update(this.form)">&nbsp;&nbsp;
							<input type="button" value="이전 페이지" onclick="history.go(-1)">
							<input type="hidden" name="b_idx" value="${bvo.b_idx }">
							<input type="hidden" name="currentPage" value="${currentPage }">
							<input type="hidden" name="cmd" value="update">
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</body>
</html>