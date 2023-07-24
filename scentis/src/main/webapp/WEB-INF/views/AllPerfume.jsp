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
<link rel="stylesheet" href="resources/css/allperfume.css">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>
   <!-- 향수 종류별 보는 페이지 Pdata에 perfume정보 다 담겨있음 -->
   <nav class="nav1">
      <a href="${cpath}/" class="logo">Scentit</a>
      
		<div class="menuBar">
			<a href="goMusicPerfume">My Perfume</a>
			<a href="ScentP">Scent Perfume</a>
			<span>|</span>
			<a href="goLogPage">My Log</a>
            <a href="logout" class="logoutButton">Logout</a>
      </div>
   </nav>

   <nav class="nav2">
      <div class="perfumemenu">
         <div class="menu1">
            <span class="name">구찌</span>
            <span>|</span>
            <span class="name">끌로에</span>
            <span>|</span>
            <span class="name">논픽션</span>
            <span>|</span>
            <span class="name">디올</span>
            <span>|</span>
            <span class="name">딥디크</span>
            <span>|</span>
            <span class="name">랄프로렌</span>
            <span>|</span>
            <span class="name">메종마르지엘라</span>
            <span>|</span>
            <span class="name">바이레도</span>
            <span>|</span>
            <span class="name">불가리</span>
            <span>|</span>
            <span class="name">산타마리아노벨라</span>
            <span>|</span>
         </div>

         <div class="menu1">
            <span class="name">아쿠아디파르마</span>
            <span>|</span>
            <span class="name">아틀리에 코롱</span>
            <span>|</span>
            <span class="name">입생로랑</span>
            <span>|</span>
            <span class="name">조말론</span>
            <span>|</span>
            <span class="name">지방시</span>
            <span>|</span>
            <span class="name">캐롤리나 헤레라</span>
            <span>|</span>
            <span class="name">크리드</span>
            <span>|</span>
            <span class="name">페라리</span>
            <span>|</span>
            <span class="name">펜할리곤스</span>
         </div>
      </div>
   </nav>

   <section>
      <div class="perfumebox">
            <!--<div>
               <img class="perfumeimg" src="resources/img/${d.p_BRAND}/${d.p_MODEL}.jpg" height="100px" width="100px">
               <p class="perfume">
                  ${d.p_BRAND} <br> ${d.p_MODEL}
               </p>
            </div>-->
      </div>   
 
			<div class="modal">
			</div>
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
   
   <script type="text/javascript">
      $('.name').on('click', function (e) {
         //console.log($(e.target).text())
         let name = $(e.target).text()
         //console.log(name)
         $('.perfumebox').toggle();
      
      $.ajax({
            url : 'BrandP',
            type : 'get',
            data : {
               "name" : name
            },
            success : function (res) {
               //console.log(res);
               let perfumeHTML ="";
               let perfume = [];
               for (let i = 0; i < res.length; i++){
               //console.log(res[i].p_BRAND)
               //console.log(res[i].p_MODEL)
               let brand = res[i].p_BRAND
               let model = res[i].p_MODEL
               perfume.push(brand)
               perfume.push(model)
               //console.log(perfume)
               //console.log(brand)              
            
               let src1 = "resources/img/"+brand+"/"+model+".jpg";
               let alt1 = "resources/img/"+brand+"/"+model+".png";
               
               perfumeHTML+=`<div class="box" onclick="selectperfume('\${res[i].p_BRAND}','\${res[i].p_MODEL}','\${(res[i].p_INFO).replaceAll("\n"," ")}')">
                        <img class="perfumeimg" src="\${src1}" alt="\${alt1}" height="100px" width="100px"/>
                       
                        <p class="perfume">
                           \${brand} <br> \${model}
                        </p>
                     </div>`
               }
               $('.perfumebox').html(perfumeHTML);
            },
            error : function (e) {
               alert("요청 실패");
            },
         });

      });
      
      // selectperfume 클릭 시 관련된 정보 보여주는 함수
      function selectperfume(B,M,I){
    	  let perfumeInfo ="";
    	  url = "resources/img/"+B+"/"+M+".jpg";
    	  perfumeInfo+=`
    	  <div class="modal_content">
    	  <div class="Perfumeimg">
    	  <img src='\${url}'; height="300px" width="250px">
    	  <strong><p id="perfume">\${B} <br> \${M} <br>\${I} </p></strong>
    	  </div>
    	  </div>`
       $('.modal').html(perfumeInfo);
    	  console.log('추가완');

		$('.modal').fadeIn();
		$('.perfumebox').hide();
       }
  	
  	$('.name').on('click', function() {
  	$('.modal').hide();
        })
   </script>
   
   
</body>
</html>