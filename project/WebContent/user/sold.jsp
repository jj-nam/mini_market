<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	onload=function(){
		alert("준비 중인 기능입니다.");
		location.href = "../UserController?cmd=myPage&id=${uvo.id}"
	}
</script>
</head>
<body>
	
</body>
</html>