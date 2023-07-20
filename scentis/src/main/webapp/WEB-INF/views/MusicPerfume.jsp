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
			<a href="MixP">Scent Perfume</a>
			<a href="AllP">All Perfume</a>
			<span>|</span>
			<a href="goLogPage">My Log</a>
            <a href="logout" class="logoutButton">Logout</a>

		</div>
	</nav>


	<section class="section1">
		<section class="section2">
			<div class="log">
				<a href="${cpath}/" class="title">HOME</a>
				<p class="title">SEARCH</p>
			</div>
		</section>
		<section class="search">
			<div class="searchbox">
				<p class="title1">Search Perfume</p>
				<div>
					<div class="Box1">
						<p class="title3">제목을 입력하세요</p>
						<input class="inputbox" type="text" id="m_TITLE" name="m_TITLE">
						<button id="selectbtn" class="btn">검색하기</button>
					</div>
				</div>
			</div>


			<div class="modal">
				<div class="modal_content">
					<div class="musicimg">
						<img src="resources/img/앨범커버1.png" height="200px" width="200px"> <a
							href="#" class="selectmusic1">
							<p class="title3 musicname1">
								비틀즈 <br> 제목
							</p>
						</a>
					</div>

					<div class="musicimg">
						<img src="resources/img/앨범커버2.jpg" height="200px" width="200px">
						 <a href="#" class="selectmusic2">
							<p class="title3 musicname2"> 에스파 <br> 제목
							</p>
						</a>
					</div>

					<div class="musicimg">
						<img src="resources/img/앨범커버3.jpg" height="200px" width="200px"> <a
							href="#" class="selectmusic3">
							<p class="title3 musicname3">
								가수 <br> 제목
							</p>
						</a>
					</div>
				</div>
			</div>

			<div id="loading">
				<img src="resources/img/Spinner.gif" alt="loading">
			</div>
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
		$('.title').on('click', function () {
		     $('.searchbox').toggle(); })
	</script>	     
	<script>	     
		$('.modal_content').click(function() {
			$('.modal').fadeOut();
			$('#loading').show();
		})
	</script>
	<script>
		// 검색하기 버튼 클릭할 때 ajax로 앨범, 가수 받아오기
		$('#selectbtn').on('click', function() {
			// 사용자로부터 입력된 데이터 가져오기
			var m_TITLE = $('#m_TITLE').val();
			// JSON 데이터 생성
			var jsonData = {
				m_TITLE : m_TITLE
			};
			
			let albumimg;
			let title;
			let track_id;
			let artist;
			
			$.ajax({
				type : 'POST',
				url : '${cpath}/sendDataToFlask',
				data : JSON.stringify(jsonData),
				contentType : 'application/json',
				success : function(res) {
					console.log("json 통신 성공");
					console.log(res);
					for (i=0; i<res.length; i++){
						albumimg=res.Album_img_list[i]
						title=res.title_list[i]
						track_id=res.track_id_list[i]
						artist=res.artist_list[i]
						$('.musicimg')[i].append(`
						<img src=\${albumimg} height="200px" width="200px">
						<a href="#" class="selectmusic2">
							<p class="title3 musicname2"> \${title} <br> \${artist}
							</p>
						</a>
						`)
					}
					$('.modal').fadeIn();
					$('.searchbox').hide();
				},
				error : function() {
					console.log("json 통신 실패");
				}
			});
		})
	</script>

	<script>
		$(window).load(function() {
			$('#loading').hide();
		});
	</script>






</body>
</html>