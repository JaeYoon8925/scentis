<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>.
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/like.css">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>

	<nav>
			<a href="${cpath}/" class="logo">Scentit</a>
			<div class="menuBar">
				<a href="goMusicPerfume">Music to Perfume</a>
				<a href="ScentP">Scent to Perfume</a>
				<a href="AllP">All Perfume</a>
				<span>|</span> 
				<a href="goLogPage">My Log</a>
				<a href="logout" class="logoutButton">Logout</a>
		</div>
	</nav>

	<section>
	<div class ="perfumebox">
	</div>
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
						<a href="">Instagram</a> <a href="">Twitter</a> <a href="">Youtube</a>
					</div>

				</div>

			</div>
			<div class="KOREA">KOREA</div>

		</div>
	</footer>







	<script type="text/javascript">
	let perfumeHTML ="";

    console.log('${p[0].p_BRAND}');
    for (let i = 0; i < ${p.size()}; i++){
    	let brand = '\${p[i].p_BRAND}';
    	let model = '\${p[i].p_MODEL}';
    let src1 = "resources/img/"+'\${p[i].p_BRAND}'+"/"+'\${p[i].p_MODEL}'+".jpg";
      perfumeHTML+=`
    	  <div class="box">
      	  <img class="perfumeimg" src="\${src1}" height="100px" width="100px" onclick="selectperfume('\${p[i].p_BRAND}','\${p[i].p_MODEL}','\${(p[i].p_INFO).replaceAll("\n"," ")}')"/>
          <p class="perfume"> \${brand} </p>
          <p class="perfumename">\${model}</p>
          <span class="heart" onclick="heartclick('\${model}', event)">🤍</span>
            </div>`
 	}
    $('.perfumebox').html(perfumeHTML);
	</script>
</body>
</html>