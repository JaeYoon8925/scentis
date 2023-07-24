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
<link rel="stylesheet" href="resources/css/mylog.css">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>

<body>
<!--  user에 사용자정보
      Mylog에 내 로그 
      RecP에 랜덤퍼퓸  -->
	<nav>
		<a href="${cpath}/" class="logo">Scentit</a>
		<div class="menuBar">
			<a href="goMusicPerfume">My Perfume</a>
			<a href="MixP">Scent Perfume</a>
			<a href="AllP">All Perfume</a>
			<span>|</span>
            <a href="logout" class="logoutButton">Logout</a>
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
        <section class="section4">
            <p class="title1">Search Music</p>
            <div class="logbox">
    <!-- 
				<table>
				<tr>
				<c:forEach var="log" items="${log}" varStatus="status">
				<c:if test="${status.index%2==0}">
				</tr>
				<tr>
				</c:if>
				    <td><img src="${log.m_IMG}" height="200px" width="200px">
				    	<p class="title2" onclick="mid(${log.m_ID}, ${log.p_NUM1}, ${log.p_NUM2}, ${log.p_NUM3})"> ${log.m_ARTIST} <br> ${log.m_TITLE}</p>
				    </td>
				</c:forEach>
				</tr>
				</table> 
           -->
				<table>
					<tr>
						<c:forEach var="log" items="${log}" varStatus="status">
							<c:if test="${status.index%2==0}">
					</tr>
					<tr>
						</c:if>
						<td
							onclick="mid('${log.m_ID}', '${log.p_NUM1}', '${log.p_NUM2}', '${log.p_NUM3}')">
							<img src="${log.m_IMG}" height="200px" width="200px">
							<p class="title2">
								${log.m_ARTIST} <br> ${log.m_TITLE}
							</p>
						</td>
						</c:forEach>
					</tr>
				</table>


				<div class="modal">
				
			</div>
                
            </div>
        </section>
        


        <section class="section3">
            <div class="log">
               	<p class="title1">Recommend Perfume</p>
				<img src="resources/img/${RecP.p_BRAND}/${RecP.p_MODEL}.jpg"height="300px" width="250px">
				<p class="perfume">	${RecP.p_BRAND} <br> ${RecP.p_MODEL}</p>
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
                        <a href="">For Artists</a>
                        <a href="">Developers</a>
                        <a href="">Advertising</a>
                        <a href="">Investors</a>
                        <a href="">Vendors</a>
                    </div>
                    <div class="column">
                        <div class="sub-title">USEFUL LINKS</div>
                        <a href="">Support</a>
                        <a href="">Web player</a>
                        <a href="">Free Mobile App</a>
                    </div>
                </div>
                <div class="second-box">
                    <div class="icon-box">
                        <i class="fab fa-instagram icon"></i>
                    </div>
                    <div class="icon-box">
                        <i class="fab fa-twitter icon"></i>
                    </div>
                    <div class="icon-box">
                        <i class="fab fa-facebook-f icon"></i>
                    </div>
                </div>
            </div>
            <div class="KOREA">
                KOREA
            </div>
        </div>
    </footer>
    
    <script type="text/javascript">
    	
    	//$('.title2').on('click', function () {
			
    		function mid(a, b, c, d) {
    			let M_ID = a;
    			let P_NUM1 = b;
    			let P_NUM2 = c;
    			let P_NUM3 = d;
    			
    			var jsonData = {
       			    m_ID : M_ID,
        		};
        		
        		$.ajax({
        			type : 'POST',
        			url : '${cpath}/sendDataToFlask4',
        			data : JSON.stringify(jsonData),
        			contentType : 'application/json',
        			success : function(res) {
        				console.log("json 통신 성공");
        				console.log(res);
        			},
        			error : function() {
        				console.log("json 통신 실패");
        			}
        		});
        		
    		}
    		
		//})
    
    
    
    
    
    </script>
    
    


</body>

</html>
