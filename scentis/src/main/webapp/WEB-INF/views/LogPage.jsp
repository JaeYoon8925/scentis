<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Scentit 당신의 향기에 즐거움을 선사하세요</title>
<link rel="stylesheet" href="resources/css/mylog.css">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

</head>

<body>
<!--  user에 사용자정보
      Mylog에 내 로그 
      RecP에 랜덤퍼퓸  -->
   <nav>
      <a href="${cpath}/" class="logo">Scentit</a>
      <div class="menuBar">
         <a href="goMusicPerfume">MUSIC TO PERFUME</a>
         <a href="ScentP">SCENT TO PERFUME</a>
         <a href="AllP">ALL PERFUME</a>
         <span>|</span>
            <a href="logout" class="logoutButton">LOGOUT</a>
      </div>
   </nav>

    <section class="section1">
        <section class="section2">
            <div class="log">
                <p class="title">MY PROFILE</p>
                <img class="pro" src="resources/img/프사.png">
                <div class="idnick">
                    <p>${user.ID}</p>
                    <p>${user.NICKNAME}</p>
                    <a href="likep"><p class="wish">WISH LIST</p></a>
                </div>
            </div>
        </section>
        <section class="section4">

            <p class="title1">MY LOG</p>
            <div class="logbox">

	            <table>
	               <tr>
	                  <c:forEach var="log" items="${log}" varStatus="status">
	                     <c:if test="${status.index%2==0}">
	               </tr>
	               <tr>
	                  </c:if>
	                  <td class="a" onclick="mid('${log.m_ID}','${log.p_NUM1}','${log.p_NUM2}','${log.p_NUM3}')">
	                     <img src="${log.m_IMG}" height="200px" width="200px">
	                     <p class="title2">${log.m_ARTIST} <br> ${log.m_TITLE}
	                     </p>
	                  </td>
	                  </c:forEach>
	               </tr>
	            </table>
	            
	            
            </div>
            
            <!--css 파일에 넣어뒀습니다. ctrl+f 페이징 버튼 -->
			<div class="paging">
				<c:forEach var="pageNum" begin="1" end="${totalPage}">
					<a class="page" href="goLogPage?PageNo=${pageNum}">${pageNum}</a>
				</c:forEach>
			</div>
         	
         	<div class="info">
         		<div class="info1">
	            	<div class="chart">
	           		<canvas id="myChart"></canvas>
	         		</div>
	         	
	         		<div class="info2">
		         		<p>acusticness : 어쿠스틱 장르인 정도</p>
		         		<p>danceability : 춤 추기에 어울리는 정도</p>
		         		<p>energy : 빠르거나 시끄러운 음악인 정도</p>
		         		<p>valence : 곡이 긍정적인 감정인지의 정도</p>
		         		<p>tempo : 곡의 빠르기</p>
		         		<p>time signature : 박자</p>
	         		</div>
         		</div>
         		
         	</div>
         	
            <div class="modal">
            </div>
            
            <button class="backbtn">다른 노래 확인하기</button>
        </section>
        


        <section class="section3">
			<iframe width="400" height="873"
			src="https://www.youtube.com/embed/i52Rbuu0kdQ?showinfo=0&modestbranding=0&rel=0&amp;autoplay=1&mute=1&controls=0&amp;loop=1&playlist=i52Rbuu0kdQ"
			frameborder="0"></iframe>
        </section>
        
        
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
						<a href="">About</a>
					</div>
					<div class="column">
						<div class="sub-title">COMMUNITIES</div>
						<a href="">Instagram</a>
						<a href="">Twitter</a>
						<a href="">Youtube</a>
					</div>

				</div>

			</div>
            <div class="KOREA">
                KOREA
            </div>
        </div>
    </footer>
    
    <script type="text/javascript">
    
    	function resetCanvas(){
    	   $('#myChart').html();
    	   $('.chart').html('<canvas id="myChart"></canvas>');
    	   }
    	
		    let k =[];
		    let v = [];
		function makechart(k, v){
		   let ctx = document.getElementById('myChart');
		   let data = {
		           labels: k,
		           datasets: [{
		             label: 'Music Data',
		             data: v,
		             fill: true,
		             backgroundColor: 'rgba(255, 159, 64, 0.2)',
		             borderColor: 'rgba(255, 159, 64, 0.6)',
		             pointBackgroundColor: 'rgba(255, 159, 64, 0.2)',
		             pointBorderColor: '#fff',
		             pointHoverBackgroundColor: '#fff',
		             pointHoverBorderColor: 'rgba(255, 159, 64, 0.2)'
		           }]
		         };
		     new Chart(ctx, {
		       type: 'radar',
		       data: data,
		       options: {
		         scales: {
		           y: {
		             beginAtZero: true,
		        	 display: false,
		           }
		         }
		       }
		     });
		}
       
          function mid(a, num1, num2, num3) {
              //let M_ID = a;
              //let P_NUM1 = b;
              //let P_NUM2 = c;
              //let P_NUM3 = d;
              //console.log(M_ID)
              //console.log(P_NUM1)
              //console.log(P_NUM2)
              //console.log(P_NUM3)
              
              var jsonData = {
                     m_ID : a
               };
               
               $.ajax({
                  type : 'POST',
                  url : '${cpath}/sendDataToFlask4',
                  data : JSON.stringify(jsonData),
                  contentType : 'application/json',
                  success : function(res) {
                     console.log("json 통신 성공");
                     console.log(Object.keys(res));
                     console.log(Object.values(res));
                     k=[];
                     v=[];
                     for(let i = 0; i <6; i++){
                        k.push(Object.keys(res)[i]);
                        if ((Object.values(res)[i])<1){
                           v.push((Object.values(res)[i])*100);
                        }else if (Object.values(res)[i]>1){
                        v.push(Object.values(res)[i]);
                        }
                         }
                     makechart(k,v);
                     
                  },
                  error : function() {
                     console.log("json 통신 실패");
                  }
               });


        	  $.ajax({
        		  url : 'LogP',
        		  type: 'post',
        		  data : {
        			  "num1":num1,
        			  "num2":num2,
        			  "num3":num3
        		  },
        		   success : function(res) {
        			   let logHTML = "";
        				console.log('logP성공');
        				//console.log(res[0].p_BRAND);
        				//console.log(res[0].p_MODEL);
        				for (let i = 0; i<3; i++) {
        					let brand = res[i].p_BRAND
        					let model = res[i].p_MODEL
        					//console.log(brand)
        					//console.log(model)
        					let src1 = "resources/img/"+brand+"/"+model+".jpg";
        					logHTML += `
        					<div class="modal_content">
        						<img  src="\${src1}" height="200px" width="200px">
        	       		        <span class="heart" onclick="heartclick('\${model}', event)">🤍</span>
                            	<p class="title3" id="musicname1">\${brand} <br> \${model} </p>
                            </div>
                            `}
        				$('.modal').html(logHTML);
        				
        				$('.modal').fadeIn();
        				$('.chart').fadeIn();
        				$('.backbtn').fadeIn();
        				$('.info').fadeIn();
        				$('.logbox').hide();
        				$('.title1').hide();
        				$('.paging').hide();
        				
        				$('.backbtn').on('click', function () {
        					 resetCanvas();
							$('.modal').hide();
							$('.chart').hide();
							$('.info').hide();
							$('.backbtn').hide();
        					$('.logbox').show();
        					$('.title1').show();
        					$('.paging').show();
						});
        				
        				
        				},
        				error : function() {
        					console.log('실패')
        					}
             });
        	  }
     // 찜하기
        function heartclick(model, event) {
      		  $.ajax({
      			  url : "like",
      			  type : "post",
      			  data : { 'P_MODEL' : model},
      			  success : function (res) {
      				  if (res == 1) {
      					  //alert('찜 저장 완료');
      					  event.target.textContent = '🧡';
      				} else if(res == -1) {
      					//alert('찜 취소 완료');
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