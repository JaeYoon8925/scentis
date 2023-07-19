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
         <a href="goPerfume">Mix Perfume</a>
         <span>|</span>
         <c:if test="${user ne null}">
            <a href="goLogPage">My Log</a>
            <a href="logout" class="logoutButton">Logout</a>
         </c:if>
      </div>
   </nav>

   <nav class="nav2">
      <div class="perfumemenu">
         <div class="menu1">
            <span class="gu">구찌</span>
            <span>|</span>
            <a href="">끌로에</a>
            <span>|</span>
            <a href="">논픽션</a>
            <span>|</span>
            <a href="">디올</a>
            <span>|</span>
            <a href="">딥디크</a>
            <span>|</span>
            <a href="">랄프로렌</a>
            <span>|</span>
            <a href="">메종마르지엘라</a>
            <span>|</span>
            <a href="">바이레도</a>
            <span>|</span>
            <a href="">불가리</a>
            <span>|</span>
            <a href="">산타마리아노벨라</a>
            <span>|</span>
         </div>

         <div class="menu1">
            <a href="">아쿠아디파르마</a>
            <span>|</span>
            <a href="">아틀리에 코롱</a>
            <span>|</span>
            <a href="">입생로랑</a>
            <span>|</span>
            <a href="">조말론</a>
            <span>|</span>
            <a href="">지방시</a>
            <span>|</span>
            <a href="">캐롤리나 헤레라</a>
            <span>|</span>
            <a href="">크리드</a>
            <span>|</span>
            <a href="">페라리</a>
            <span>|</span>
            <a href="">펜할리곤스</a>
         </div>
      </div>
   </nav>

   <section>
      <div class="perfumebox">
         <c:forEach items="${Pdata}" var="d">
         <c:choose>
            <c:when test="${d.p_BRAND eq 'gucci'}">
            <div>
               <img class="perfumeimg" src="resources/img/${d.p_BRAND}/${d.p_MODEL}.jpg" height="100px" width="100px">
               <p class="perfume">
                  ${d.p_BRAND} <br> ${d.p_MODEL}
               </p>
            </div>
            </c:when>
            <c:otherwise>
               <c:if test="${d.p_BRAND eq '끌로에'}">
                  <div>
                     <img class="perfumeimg" src="resources/img/${d.p_BRAND}/${d.p_MODEL}.jpg" height="100px" width="100px">
                     <p class="perfume">
                        ${d.p_BRAND} <br> ${d.p_MODEL}
                     </p>
                  </div>
               </c:if>
            </c:otherwise>
         </c:choose>
         </c:forEach>
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
      $('.gu').on('click', function () {
         console.log($('.gu').text())
         let gucci = $('.gu').text();
      })
      
	function Perfume () {
	      var value = $(this).val();
	      console.log(value);
	      $.ajax({
	         url : 'AllP',
	         type : 'get',
	         data : {
	            "P_BRAND" : value
	         },
	         success : function (res) {
	            console.log(res);
	            var p = $('#result');
	            p.html('성공'
	            ); //성공했을때 foreach문으로 꺼내오기
	            } 
	         error : function (e) {
	            alert("요청 실패");
	         },
	      });
	   }
   
   </script>
   
   
</body>
</html>