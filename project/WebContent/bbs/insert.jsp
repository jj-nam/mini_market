<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:choose>
		<c:when test="${result gt 0 }">
			<script type="text/javascript">
				alert("등록되었습니다.");
				location.href='BBSController?cmd=allList';
			</script>
		</c:when>
		<c:otherwise>
			<script type="text/javascript">
				alert("등록을 실패했습니다.");
				history.back();
			</script>
		</c:otherwise>
	</c:choose>
</body>
</html>