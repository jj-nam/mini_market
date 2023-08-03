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
	body{
		background-image: url("./upload/carrot.jpg");
		background-repeat: repeat;
		opacity: 0.9;
	}
	.sell{
		text-align: right;
		margin: 0 0 20px 0;
		
	}
	.sell input[type="submit"]{
		text-decoration: none;
		color: #FF3232;
		font-weight: bold;
	}
	table {
		width: 800px;
		border-collapse: collapse;
		background-color: white;
	}
	
	td, th {
		border : 1px solid #FF7F50;
		padding: 10px;
	}
	
	th:nth-of-type(1) {
		width:50px;
	}
	
	th:nth-of-type(2) {
		width:300px;
	}
	
	th:nth-of-type(3) {
		width:100px;
	}
	
	th:nth-of-type(4) {
		width:100px;
	}	
	
	th:nth-of-type(5) {
		width:50px;
	}	
	a.view {
		text-decoration: none;
		color : black;
	}
	a.view:hover {
		transform: scale(1.4);
	}
	img:hover {
		transform: scale(1.2);
	}
	ul.paging {
		list-style-type: none;
		overflow: hidden;
		margin: auto;
		width:350px;
	}
	ul.paging li {
		float: left;
		margin:20px;
		color: #FF7F50;
	
	}
	ul.paging li a{
		font-weight: bold;
		display : block;
		text-decoration: none;
		color:  #FF7F50;
	}
	ul.paging a:hover {
		 background: #FF7F50;
		 color: white;		 
	}
	ul.paging li.disable {
		color: silver;
	}
	ul.paging li.now{
		color: tomato;
		font-weight: bold;
	}
	tfoot tr {
		margin: auto;
	}
	.disable {
		color: silver;
	}
	.now{
		color: tomato;
		font-weight: bold;
	}
	.header-menu{
		text-align: right;
	}
	.header-menu button{
		text-decoration: none;
		color: #B86824;
		font-weight: bold;
	}
	#viewSize{
		height: 20px;
	}
	#titleSize{
		height: 50px;
		table-layout:fixed;
	}
</style>
<script type="text/javascript">
	function goLoginPage(){
		location.href='UserController?cmd=loginPage';
	}
	function goJoinPage(){
		location.href='UserController?cmd=joinPage';
	}
	function goLogout(){
		location.href='UserController?cmd=logout';
	}
	function goMyPage(){
		var id = '${user.id}';
		location.href='UserController?cmd=myPage&id='+id;
	} 
</script>
</head>
<body>
	<div class="wrap">
		<div class="header-menu">
			<c:if test="${not empty user }">
				<button onclick="goMyPage()">개인 정보</button>
			</c:if>
			<c:if test="${empty user }">
				<button onclick="goJoinPage();">회원가입</button>
			</c:if>
			
			<c:if test="${not empty user }">
				<button onclick="goLogout();">로그아웃</button>
			</c:if>
			<c:if test="${empty user }">
				<button onclick="goLoginPage();">로그인</button>
			</c:if>
		</div>
		<h1><span style="color: #EB0000;">번</span><span style="color: #FFAF00">당</span><span style="color:#3c3c3c">마켓</span></h1>
		<form action="/project/BBSController">
			<p class="sell">
				<input type="hidden" name="cmd" value="insertPage">
				<input type="hidden" name="currentPage" value="${pvo.nowPage }">
				
				<c:if test="${not empty user }">
					<input type="submit" value="판매하기">
				</c:if>
			</p>
			<table>
				<tbody>
					<c:choose>
						<c:when test="${empty list}">
							<tr>
								<td colspan="5">게시물이 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="vo" items="${list }">
								<tr id="titleSize" height="96px">
									<td rowspan="2" style="height:91px; width:90px; padding:0; margin:0">
										<label><a href="BBSController?cmd=view&b_idx=${vo.b_idx }&currentPage=${pvo.nowPage}"><img src="./upload/${vo.filename}" width="100%" height="100%" style="object-fit: cover"></a></label>
									</td>
									<td colspan="4">
										<label><a class="view" href="BBSController?cmd=view&b_idx=${vo.b_idx }&currentPage=${pvo.nowPage}" style="display:block">${vo.title }</a></label>
									</td>
								</tr>
								<tr id="viewSize">
									<td>판매자 : ${vo.writer }</td>
									<td>가격 : ${vo.price} 원</td>
									<td>조회수 : ${vo.hit }</td>
									<td>등록일 : ${vo.reg_date }</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="5">
							<%-- 페이징 처리예정 --%>		
							<%-- 1. 이전 버튼 --%>				
							<c:choose>
								<c:when test="${pvo.beginBlock <= pvo.pagePerBlock }">
										<span class ="disable"> ◀ &nbsp; </span>
								</c:when>
								<c:otherwise>
										<a class="view" href="BBSController?cmd=allList&currentPage=${pvo.beginBlock - 1 }"> ◀ &nbsp; </a>
								</c:otherwise>
							</c:choose>		
							<%-- 2. 페이지 번호 --%>			
							<c:forEach var="p" begin="${pvo.beginBlock }" end="${pvo.endBlock }" step="1">
								<c:choose>
									<c:when test="${p eq pvo.nowPage }">
										<span class="now">${p }&nbsp;</span>
									</c:when>
									<c:otherwise>
										 <a class="view" href="BBSController?cmd=allList&currentPage=${p}"> ${p }&nbsp;</a>
									</c:otherwise>
								</c:choose>	
							</c:forEach>		
							<%-- 3. 다음 버튼 --%>						
							<c:choose>
								<c:when test="${pvo.endBlock >= pvo.totalPage  }">
									<span class ="disable"> &nbsp;▶ </span>
								</c:when>
								<c:otherwise>
									<a class="view" href="BBSController?cmd=allList&currentPage=${pvo.beginBlock + pvo.pagePerBlock }" > &nbsp;▶ </a>
								</c:otherwise>
							</c:choose>	
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
</body>
</html>