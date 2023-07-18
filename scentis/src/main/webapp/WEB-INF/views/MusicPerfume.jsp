<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
</head>
<body>
	<img src="resources/img/${test.p_BRAND}/${test.p_MODEL}.jpg" alt="${test.p_num}">
	<h1>t.p_BRAND</h1>>
	<h1>t.p_MODEL</h1>
</body>
</html>