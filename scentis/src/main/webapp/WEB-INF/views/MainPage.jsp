<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Scentit 당신의 향기에 즐거움을 선사하세요</title>
<link rel="stylesheet" href="resources/css/main.css">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>

<body>
	<nav>
	<c:choose>
	<c:when test="${user eq null}">
		<a href="${cpath}/" class="logo">Scentit</a>
		<div class="menuBar">
			<a href="Login">Music to Perfume</a>
			<a href="Login">Scent to Perfume</a>
			<a href="Login">All Perfume</a>
			<span>|</span>
			<a href="Join">Sign up</a>
			<a href="Login">Login</a>
	</c:when>
	<c:otherwise>
		<a href="${cpath}/" class="logo">Scentit</a>
		<div class="menuBar">
			<a href="goMusicPerfume">Music to Perfume</a>  <!-- 음악으로 향수 만들기 -->
			<a href="ScentP">Scent to Perfume</a>         <!-- 향으로 향수 만들기 -->
			<a href="AllP">All Perfume</a>           <!-- 모든 향수 보기 -->
			<span>|</span>
			<a href="goLogPage">My Log</a>           <!-- 내 로그 보기 -->
            <a href="logout" class="logoutButton">Logout</a>
	</c:otherwise>
	</c:choose>
		</div>
	</nav>

	<section>
		<video autoplay loop muted>
			<source src="resources/img/메인.mp4"
				type="video/mp4">
		</video>
	</section>

	<footer>
		<div class="container">
			<div class="footer-menu">
				<div class="first-box">
					<div class="column">
						<div class="sub-title">COMPANY</div>
						<a href="">About</a>
					</div>
					<div class="column">
						<div class="sub-title">COMMUNITIES</div>
						<a href="">Instagram</a>
						<a href="">Twitter</a>
						<a href="">Youtube</a>
					</div>

				</div>

			</div>
			<div class="KOREA">
				KOREA
			</div>

		</div>
	</footer>


</body>

</html>
