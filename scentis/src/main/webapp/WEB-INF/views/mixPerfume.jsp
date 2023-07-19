<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="resources/css/main.css">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>
	<!-- 향수 종류별 보는 페이지 Pdata[0]:탑, Pdata[1]:미들, Pdata[2]:베이스 담겨있음  -->
	<nav>
		<a href="${cpath}/" class="logo">Scentit</a>
		<div class="menuBar">
			<a href="goMusicPerfume">My Perfume</a> <a href="goPerfume">Perfume</a>
			<span>|</span>
			<c:if test="${user eq null}">
				<a href="Join">Sign up</a>
				<a href="Login">Login</a>
			</c:if>
			<c:if test="${user ne null}">
				<a href="goLogPage">My Log</a>
				<a href="logout" class="logoutButton">Logout</a>
			</c:if>
			
			<div>
			<c:forEach items="#{Pdata}" var="d"> 
			<span>${d.p_TOP}</span><!--  TOP불러오기 --><br>
			<span>${d.p_MIDDLE}</span><br>
			<span>${d.p_BASE}</span><br>
			</c:forEach>
			</div>
		</div>
	</nav>
</body>
</html>