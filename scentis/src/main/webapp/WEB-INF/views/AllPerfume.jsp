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
	<!-- 향수 종류별 보는 페이지 Pdata에 perfume정보 다 담겨있음 -->
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
		</div>
	</nav>
	<div>
		<c:forEach items="${Pdata}" var="d">
			<div>
				<img src="resources/img/${d.p_BRAND}/${d.p_MODEL}.jpg"
					height="150px" width="150px">
			</div>
			<div>
				<p class="perfume">
					${d.p_BRAND} <br> ${d.p_MODEL}
				</p>
			</div>

		</c:forEach>
	</div>

	<footer>
		<div class="container">
			<div class="footer-menu">
				<div class="first-box">
					<div>
						<img src="Spotify_Logo_RGB_White.png" alt="">
					</div>
					<div class="column">
						<div class="sub-title">COMPANY</div>
						<a href="">About</a> <a href="">Jobs</a> <a href="">For the
							Record</a>
					</div>
					<div class="column">
						<div class="sub-title">COMMUNITIES</div>
						<a href="">For Artists</a> <a href="">Developers</a> <a href="">Advertising</a>
						<a href="">Investors</a> <a href="">Vendors</a>
					</div>
					<div class="column">
						<div class="sub-title">USEFUL LINKS</div>
						<a href="">Support</a> <a href="">Web player</a> <a href="">Free
							Mobile App</a>
					</div>
				</div>
				<div class="second-box">
					<div class="icon-box">
						<i class="fab fa-instagram icon"></i>
					</div>
				</div>
			</div>
			<div class="KOREA">
				<i class="fas fa-globe-africa"></i> KOREA
			</div>

		</div>
	</footer>
</body>
</html>