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
<link
	href="https://fonts.googleapis.com/css?family=DM+Sans&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Arimo+Hebrew Subset&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link rel="stylesheet" href="resources/css/perfume.css">
</head>
<body>

	<nav>
		<a href="${cpath}/" class="logo">Scentit</a>
		<div class="menuBar">
			<a href="">Music Chart</a> <span>|</span> <a href="goLogPage">My
				Log</a>
		</div>
	</nav>

	<section class="section1">
		<section class="section2">
			<div class="log">
				<a href="${cpath}/" class="title">HOME</a>
				<p class="title">SEARCH</p>
			</div>
		</section>
		<section>
		<form action="sendDataToFlask" method="POST">
			<div class="searchbox">
				<p class="title1">Search Perfume</p>
				<div>
					<div class="Box1">
						<p class="title3">제목을 입력하세요</p>
						<input class="inputbox" type="text" id="m_title" name="m_title">
						<button id="selectbtn" class="btn">검색하기</button>
					</div>
				</div>
			</div>
		</form>

		</section>
		<section class="section3">
			<div class="log">
				<p class="title1">Trend Perfume</p>
				<img
					src="resources/img/${TrendP[0].p_BRAND}/${TrendP[0].p_MODEL}.jpg"
					height="300px" width="250px">
				<p class="perfume">
					${TrendP[0].p_BRAND} <br> ${TrendP[0].p_MODEL}
				</p>
			</div>
		</section>
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
			<div class="KOREA">KOREA</div>
		</div>
	</footer>

	<script>
		$('.title').on('click', function() {
			$('.searchbox').toggle();
		})

		$('#selectbtn').on('click', function() {
			// 검색하기 버튼 클릭할 때 ajax로 앨범, 가수 받아오기
		})
	</script>





</body>
</html>