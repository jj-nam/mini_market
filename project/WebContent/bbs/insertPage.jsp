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
	body{
		background-image: url("./upload/carrot.jpg");
		background-repeat: repeat;
		opacity: 0.9;
	}
</style>
<script type="text/javascript">
	function insert(f){
		if(f.title.value ==''){
			alert("제목을 입력하세요.");
			f.title.focus();
			return;
		}
		if(f.content.value ==''){
			alert("내용을 입력하세요.");
			f.content.focus();
			return;
		}
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
		<h1 style="color:#FF7F50">판매 하기</h1>
		<form action="/project/BBSController" method="post" enctype="multipart/form-data">
			<table>
				<tbody>
					<tr>
						<th>작성자</th>
						<td>
							<input type="text" name="writer" size="80" value="${user.nickname }" class="readonly" readonly >
						</td>
					</tr>
					<tr>
						<th>제목</th>
						<td><input type="text" name="title" size="80" style="border-color : #FFAF00;"></td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td><input type="file" name="filename"></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea rows="10" cols="82" name="content" placeholder="*서로가 믿고 거래 할 수 있도록, 자세한 정보와 상품의 사진을 올려주세요."></textarea></td>
					</tr>
					<tr>
						<th>금액</th>
						<td><input type="number" name="price" size="80" style="border-color : #FFAF00;"> 원</td>
					</tr>
					
					<tr>
						<td colspan="2" id="btn">
							<input type="button" value="판매하기" onclick="insert(this.form)">&nbsp;&nbsp;
							<input type="button" value="취소" onclick="view_all()">
							<input type="hidden" name="cmd" value="insertBBS">
							<input type="hidden" name="currentPage" value="${currentPage }">
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</body>
</html>