<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath}"/>
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
	<nav>
		<a href="${cpath}/" class="logo">Scentit</a>
		<div class="menuBar">
			<a href="goMusicPerfume">My Perfume</a>
			<a href="AllP">Perfume</a>
			<a href="MixP">MixPerfume</a>
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

	<section>
		<video autoplay loop muted>
			<source src="resources/img/제목을-입력해주세요_.mp4"
				type="video/mp4">

		</video>
	</section>

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
