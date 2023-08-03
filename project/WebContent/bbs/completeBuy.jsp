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
	<script type="text/javascript">
	alert("구매 완료 되었습니다.");
	// 구매내역, 판매내역으로 이동 후 게시물 삭제 후 메인 페이지로
	location.href='BBSController?cmd=allList';
	</script>
</body>
</html>