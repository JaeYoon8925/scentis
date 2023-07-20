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
			<a href="goMusicPerfume">My Perfume</a>
			<a href="AllP">All Perfume</a>
			<span>|</span>
			<a href="goLogPage">My Log</a>
            <a href="logout" class="logoutButton">Logout</a>
		</div>
	</nav>
			
			<div>
			<c:forEach items="#{Pdata}" var="d"> 
			<span>${d.p_TOP}</span><br><!--  TOP불러오기 -->
			</c:forEach>
			<c:forEach items="#{Pdata}" var="d"> 
			<span>${d.p_MIDDLE}</span><br><!--  MID불러오기 -->
			</c:forEach>
			<c:forEach items="#{Pdata}" var="d"> 
			<span>${d.p_BASE}</span><br><!--  BASE불러오기 -->
			</c:forEach>
			</div>
		</div>
	</nav>
</body>
</html>