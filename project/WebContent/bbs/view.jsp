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
	
	#btn {
	text-align: center;
	}
	
	h1 {
		color : #FF7F50;	
	}
		
	.insertComment th {
		border : 1px solid #FF7F50;
		width: 130px;
		text-align: center;
		background-color: #FF7F50;
		color: white;
	}

	.viewComment th {
		border : 1px solid #FF7F50;
		width: 130px;
		text-align: center;
		background-color: #FF7F50;
		color: white;
	}
	.viewComment td{
		text-align: center;
	} 
	
	.viewComment #num  {
		width:50px;
	}
	.viewComment #writer  {
		width:60px;
	}
	.viewComment #con  {
		width:250px;
	}
	.viewComment #date  {
		width:80px;
	}
	.viewComment #pri  {
		width:70px;
	}
	.viewComment #confirm, #del  {
		width:70px;
	}
	textarea {
		resize: none;
	}
	.readonly{
		background-color: #FFAF00;
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
	#first_col{
		width: 100px;
		text-align: center;
	}
	#picSpace{
		text-align: center;
	}
	#pic{
		width :400px;
		height: 300px;
	}
	.header-menu button{
		text-decoration: none;
		color: #B86824;
		font-weight: bold;
	}
	#aftLogin{
		text-decoration: none;
		color: #FF3232;
		font-weight: bold;
	}
	#btn input[type="button"]{
		text-decoration: none;
		color: #B86824;
		font-weight: bold;
	}
	body{
		background-image: url("./upload/carrot.jpg");
		background-repeat: repeat;
		opacity: 0.9;
	}
	a{
	 	text-decoration-line: none;
	}
	img:hover {
		transform: scale(1.4);
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	function after_login(){
		alert("로그인 후 구매 가능합니다.");
		return
	}
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

	function view_all(){
		var cp = '${currentPage}';
		location.href='BBSController?cmd=allList&currentPage=' + cp;
	}
	function update_page(f){
		var cmd = "<input type='hidden' name='cmd' value='updatePage'/>";
		$(f).append(cmd);
		f.action = 'BBSController';
		f.submit();
	}
	function remove_page(f){
		if(confirm("해당 게시글을 삭제하시겠습니까??")){
			var cmd = "<input type='hidden' name='cmd' value='removeBBS'/>";
			$(f).append(cmd);
			f.action = 'BBSController';
			f.submit();
		}
	}
	
	//------댓글
 	function insert_comment(f){
		if(f.content.value ==''){
			alert("댓글을 입력하세요");
			f.content.focus();
			return;
		}
		f.action='BBSController';
		f.submit();
	}
	
	// 댓글 판매
 	function confirm_comment(c_idx, b_idx){
		if(confirm("\"${user.nickname}\"에게 판매하시겠습니까?")){
			location.href = 'BBSController?cmd=confirmComment&c_idx=' + c_idx + "&b_idx=" + b_idx;
			f.submit();
		}
	}
	
	// 게시글 구매
	function buying_page(f){
		if(confirm("구매하시겠습니까?")){
			var cmd = "<input type='hidden' name='cmd' value='buyingbbs'/>";
			$(f).append(cmd);
			f.action = 'BBSController';
			f.submit();
		}
	}
		
	function remove_comment(c_idx){
		$.ajax({
			url : "BBSController?cmd=removeComment&c_idx="+ c_idx,
			dataType : "json",
			type : "post",
			success : function(data){
				getJSON();
			},
			error : function(){
				alert("실패")
			}
		})
	}
	function update_comment(c_idx, b_idx){
		location.href = 'BBSController?cmd=updateCommentPage&c_idx=' + c_idx + '&b_idx=' + b_idx ;
	}
	
	function getJSON(){
		
		var nickname = '${user.nickname}' || '';
		var writer = '${bvo.writer}';
		$.ajax({
			url : "BBSController?cmd=json&b_idx=${bvo.b_idx }",
			dataType : "json",
			type : "post",
			success : function(data){
				
				var resultc = "";
				for(var i=0; i<data.length; i++){
					resultc += "<tr>";
					resultc += "<td>" + data[i].reg_date + "</td>";
					resultc += "<td>" + data[i].writer + "</td>";
					resultc += "<td style=\"white-space: pre-line;\">" + data[i].content + "</td>";
					resultc += "<td>" + data[i].c_price  +  " 원</td>";
					if(writer == nickname){
						if(writer == data[i].writer){
							resultc += "<td><a href='javascript:update_comment(" + data[i].c_idx + "," + data[i].b_idx + ");'>수정</a> / ";
							resultc += "<a href='javascript:remove_comment(" + data[i].c_idx + ");'>삭제</a>"
						}else{
							resultc += "<td><a href='javascript:confirm_comment(" + data[i].c_idx + "," + data[i].b_idx + ");'>선택</a></td> / ";
						}
					}else if(nickname == data[i].writer){
						resultc += "<td><a href='javascript:update_comment(" + data[i].c_idx + "," + data[i].b_idx + ");'>수정</a> / ";
						resultc += "<a href='javascript:remove_comment(" + data[i].c_idx + ");'>삭제</a>"
					}else{
						resultc += "<td>수정 / 삭제</td>";
					}
					resultc += "</tr>";
					
				}
				$("#content").html(resultc);
			},
			error : function(){
				alert("새로 고침 할 수 없습니다.");
			}
		});
	}
	
	$(function(){
		getJSON();
	});
	
</script>
</head>
<body>
	<div class="wrap">
		<div class="header-menu">
			<button class="topleft_button" onclick="view_all()">메인 페이지</button>
			<c:if test="${not empty user }">
				<button class="topright_button1" onclick="goMyPage();">개인 정보</button>
			</c:if>
			<c:if test="${empty user }">
				<button class="topright_button1" onclick="goJoinPage();">회원가입</button>
			</c:if>
			
			<c:if test="${not empty user }">
				<button class="topright_button2" onclick="goLogout();">로그아웃</button>
			</c:if>
			<c:if test="${empty user }">
				<button class="topright_button2" onclick="goLoginPage();">로그인</button>
			</c:if>
		</div>
		<h1><a href="BBSController?cmd=allList&currentPage=${currentPage }"><span style="color: #EB0000;">번</span><span style="color: #FFAF00">당</span><span style="color:#3c3c3c">마켓</span></a></h1>
		<div>
			<form method="post">
				<table class="bbs">
					<tbody>
						<tr>
							<td colspan="3" id="picSpace">
								<img id="pic" src="./upload/${bvo.filename}" width="100%" height="100%">
							</td>
						</tr>
						<tr>
							<th id="first_col">닉네임</th>
							<td>${uvo.nickname }</td>
						</tr>
						<tr>
							<th id="first_col">지역</th>
							<td>${uvo.addr2 }</td>
						</tr>
						<tr>
							<th id="first_col">제목</th>
							<td colspan="3">${bvo.title }</td>
						</tr>
						<tr>
							<th id="first_col">개시 일자</th>
							<td>${bvo.reg_date }</td>
						</tr>
						<tr>
							<th id="first_col">내용</th>
							<td colspan="3" style="white-space: pre-line;">${bvo.content }</td>
						</tr>
						<tr>
							<th id="first_col">가격</th>
							<td colspan="3">${bvo.price }원</td>
						</tr>
						<tr>
						<td colspan="4" id="btn">
							<c:if test="${not empty user }">
								<c:if test="${user.nickname == uvo.nickname}">
									<input type="button" value="수정" onclick="update_page(this.form)">&nbsp;&nbsp;
									<input type="button" value="삭제" onclick="remove_page(this.form)">
								</c:if>
								<c:if test="${user.nickname != uvo.nickname}">
									<input type="button" value="구매하기" onclick="buying_page(this.form)">
								</c:if>		
							</c:if>
							<c:if test="${empty user }">
								<input type="button" id="aftLogin" value="로그인 후 구매하기" onclick="after_login(this.form)">
							</c:if>
							<input type="hidden" name="currentPage" value="${currentPage }">
							<input type="hidden" name="b_idx" value="${bvo.b_idx }">
							<input type="hidden" name="nickname" value="${user.nickname }">
						</td>
					</tr>
					</tbody>
				</table>
			</form>
			</div>
		<!-- 댓글 입력 폼 -->
		<form method="post">
			<table class="insertComment">
				<c:if test="${not empty user }">
				<br/><br/>
					<tbody>
						<tr>
							<th>댓글 작성자</th>
							<td ><input type="text" class="readonly" name="writer" value="${user.nickname }" readonly style="border-color : #FFAF00;"/></td>
						</tr>
						<tr>
							<th>댓글</th>
							<td colspan="3">
								<textarea rows="3" cols="80" name="content" placeholder="댓글을 입력하세요" style="border-color : #FFAF00;"></textarea>
							</td>
						</tr>
						<tr>
							<th>제안 가격</th>
							<td><input type="number" name="c_price" style="border-color : #FFAF00;" value="${bvo.price }"> 원</td>
						</tr>
						<tr>
							<td colspan="4" id="btn">
								<input type="button" value="댓글 등록" onclick="insert_comment(this.form)">&nbsp;&nbsp;
								<input type="hidden" name="b_idx" value="${bvo.b_idx }">
								<input type="hidden" name="currentPage" value="${currentPage }">
								<input type="hidden" name="cmd" value="insertComment">
							</td>
						</tr>
					</tbody>
				</c:if>
			</table>
		</form>
		
		<br/><br/>
		<!-- 댓글 출력 폼 -->
		
		<form method="post">
			<table class="viewComment">
				<thead>
					<tr>
						<th id="date">작성일</th>
						<th id="writer">작성자</th>
						<th id="con">댓글</th>
						<th id="pri">가격</th>
						<c:choose>
							<c:when test="${user.nickname == uvo.nickname }">
									<th id="confirm">선택</th>
							</c:when>
							<c:otherwise>
								<th id="del">수정 / 삭제</th>
							</c:otherwise>						
						</c:choose>
					</tr>
				</thead>
				<c:choose>
					<c:when test="${empty cList }">
						<tr>
							<td colspan="5">댓글이 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<tbody id="content">
					
					</c:otherwise>
					</c:choose>
				</tbody> 
			</table>
		</form>
	</div>
</body>
</html>