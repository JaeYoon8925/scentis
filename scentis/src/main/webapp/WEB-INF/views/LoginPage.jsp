<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath}"/>	
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>Document</title>
<link rel="stylesheet" href="resources/css/login.css">
</head>

<body>


	<div id="title">
		<h1>
			<a href="${cpath}/"> SCENTIT </a>
		</h1>
	</div>
	<form action="Login" method="POST">
		<div id="text">
			<input type="text" cursor="pointer" id="ID" maxlength="11"
				placeholder="아이디" name="ID"> <img id="img"
				src="resources/img/1.1.jpg" alt="person">
		</div>

		<div id="text">
			<input type="password" cursor="pointer" id="PW" maxlength="11"
				placeholder="비밀번호" name="PW"> <img id="img"
				src="resources/img/2.2.jpg" alt="lock">
			<!-- <a id="link" href="">Forgot Password?</a> -->
		</div>

		<div>
			<button type="submit" id="btn">로그인</button>
		</div>
	</form>
	<a href="findId" class="ignore-style">비밀번호 찾기</a>




</body>

</html>