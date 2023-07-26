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
<link rel="stylesheet" href="resources/css/mixperfume.css">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>
	<!-- 향수 종류별 보는 페이지 Pdata[0]:탑, Pdata[1]:미들, Pdata[2]:베이스 담겨있음  -->
	<nav>
		<a href="${cpath}/" class="logo">Scentit</a>
		<div class="menuBar">
			<a href="goMusicPerfume">My Perfume</a> <a href="AllP">All
				Perfume</a> <span>|</span> <a href="goLogPage">My Log</a> <a
				href="logout" class="logoutButton">Logout</a>
		</div>
	</nav>



	<section class="section1">
		<section class="section2">
            <div class="log">
                <p class="title">MY LOG</p>
                <img class="pro" src="resources/img/프사.png">
                <div class="idnick">
                    <p>${user.ID}</p>
                    <p>${user.NICKNAME}</p>
                </div>
            </div>
        </section>
		<section class="search">
			<div class="searchbox">
				<p class="title1">Search Perfume</p>
				<div>
					<div class="Box1">
						<p class="title3">TOP NOTE</p>
						<select class="p1" id="top_note">
							<option value="0">TOP NOTE SELECT</option>
							<c:forEach items="${Ptop}" var="d">
								<option class="p2" value="${d.p_TOP}">${d.p_TOP}</option>
							</c:forEach>
						</select>
						<p class="title3">MIDDLE NOTE</p>
						<select class="p1" id="mid_note">
							<option value="0">MIDDLE NOTE SELECT</option>
							<c:forEach items="${Pmid}" var="d">
								<option class="p2" value="${d.p_MIDDLE}">${d.p_MIDDLE}</option>
							</c:forEach>
						</select>
						<p class="title3">BASE NOTE</p>
						<select class="p1" id="base_note">
							<option value="0">BASE NOTE SELECT</option>
							<c:forEach items="${Pbase}" var="d">
								<option class="p2" value="${d.p_BASE}">${d.p_BASE}</option>
							</c:forEach>
						</select>
						<!--  <input class="inputbox" type="text" id="m_TITLE" name="m_TITLE">-->
					</div>
						<button id="selectbtn" class="btn">검색하기</button>
				</div>
			</div>


			<div class="modal">
				
			</div>
				<button class="backbtn">뒤로가기</button>
				


			<div id="loading">
				<img src="resources/img/Spinner.gif" alt="loading">
			</div>
		</section>
		
		<section class="section3">
         <div class="log">
            <p class="title1">Recommend Perfume</p>
            <img src="resources/img/${RecP.p_BRAND}/${RecP.p_MODEL}.jpg" alt="resources/img/${RecP.p_BRAND}/${RecP.p_MODEL}.png" height="300px" width="250px">
            <p class="perfume">   ${RecP.p_BRAND} <br> ${RecP.p_MODEL}</p>
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

			</div>
			<div class="KOREA">KOREA</div>
		</div>
	</footer>


	<script type="text/javascript">
	
	// 검색하기 버튼 클릭할 때 ajax로 탑, 미들, 베이스 받아오기
	$('#selectbtn').on('click', function() {
		// 사용자로부터 입력된 데이터 가져오기
		var top_note = $('#top_note').val();
		var mid_note = $('#mid_note').val();
		var base_note = $('#base_note').val();
		console.log(top_note);
		console.log(mid_note);
		console.log(base_note);
		// JSON 데이터 생성
		var jsonData = {
		    p_TOP : top_note,
			p_MIDDLE : mid_note,
			p_BASE : base_note
		};
		
		//let top;
		//let mid;
		//let base;
		
		$.ajax({
			type : 'POST',
			url : '${cpath}/sendDataToFlask3',
			data : JSON.stringify(jsonData),
			contentType : 'application/json',
			success : function(res) {
				console.log("json 통신 성공");
				console.log(res);
				
	               let perfumeHTML="";
	               
	               
	               for (let i=0; i<3; i++){
	            	   
	                  let brand = res[i].p_BRAND
	                  let model = res[i].p_MODEL
	                  
	                  perfumeHTML+=`
	                	  <div class="modal_content">
	                		<div class="musicimg">
	                			<div class="card">
	                				<div class="side">
		                  			<img src="resources/img/\${brand}/\${model}.jpg" height="200px" width="200px">
									<a href="#" class="selectmusic1">
									<p class="title3" id="musicname1">
										\${brand} <br> \${model}
									</p>
									</a>
									</div>
									
                                    <div class="side back"> 
                                    <p>\${res[i].p_INFO}</p>
                                    <p><a href="\${res[i].p_PATH}" target="_blank">
                                        상품 보러 가기 
                                    </a></p>
                                 </div>
								
								
								</div>
							</div>
						</div>
	                  `
	               }
	            $('.modal').html(perfumeHTML);
	            
	            //$('#loading').show();
				$('.modal').fadeIn();
				$('.searchbox').hide();
				$('.backbtn').show();
				
				$('.backbtn').on('click', function() {
				$('.modal').hide();
				$('.searchbox').show();
				$('.backbtn').hide();
				
			});
				
				
			},
			error : function() {
				console.log("json 통신 실패");
			}
		});
	});
	
	
	$(window).load(function () {
		$('#loading').hide();
	});
	
	
	</script>






</body>
</html>