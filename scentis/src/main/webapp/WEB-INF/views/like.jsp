<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	            <table>
	               <tr>
	                  <c:forEach var="p" items="${p}" varStatus="status">
	                     <c:if test="${status.index%6==0}">
	               </tr>
	               <tr>
	                  </c:if>
	                  <td class="a" onclick="heartclick('\${p.p_MODEL}', event)">
	                     <img src="resources/img/${p.p_BRAND}/${p.p_MODEL}.jpg" height="200px" width="200px">
	                     <span class="heart" onclick="heartclick('\${p.p_MODEL}', event)">🧡</span>
	                     <p class="title2">${p.p_BRAND} <br> ${p.p_MODEL}
	                     </p>
	                  </td>
	                  </c:forEach>
	               </tr>
	            </table>
		
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
	
    // 찜하기
    function heartclick(model, event) {
  		  $.ajax({
  			  url : "like",
  			  type : "post",
  			  data : { 'P_MODEL' : model},
  			  success : function (res) {
  				  if (res == 1) {
  					  alert('찜 저장 완료');
  					  event.target.textContent = '🧡';
  				} else if(res == -1) {
  					alert('찜 취소 완료');
  					event.target.textContent = '🤍';
  				}else alert('오류');
  			},
  			error : function (e) {
  				alert('에러');
  			}
  			});
 		}
    
	    
	</script>
	
	
</body>
</html>