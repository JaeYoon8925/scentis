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
   <nav class="nav1">
      <c:choose>
         <c:when test="${user eq null}">
            <a href="${cpath}/" class="logo">Scentit</a>
            <div class="menuBar">
               <a href="Login">Music to Perfume</a> <a href="Login">Scent to Perfume</a> <span>|</span>
               <a href="Join">Sign up</a> <a href="Login">Login</a>
         </c:when>
         <c:otherwise>
            <a href="${cpath}/" class="logo">Scentit</a>
            <div class="menuBar">
               <a href="goMusicPerfume">Music to Perfume</a> <a href="ScentP">Scent to
                  Perfume</a> <span>|</span> <a href="goLogPage">My Log</a> <a
                  href="logout" class="logoutButton">Logout</a>
         </c:otherwise>
      </c:choose>
   </nav>

   <nav class="nav2">
      <div class="perfumemenu">
         <div class="menu1">

            <span class="name">겔랑</span> <span>|</span> <span class="name">구찌</span>
            <span>|</span> <span class="name">끌로에</span> <span>|</span> <span
               class="name">나르시소 로드리게즈</span> <span>|</span> <span class="name">논픽션</span>
            <span>|</span> <span class="name">니샤네</span> <span>|</span> <span
               class="name">디올</span> <span>|</span> <span class="name">딥디크</span>
            <span>|</span> <span class="name">랄프로렌</span> <span>|</span> <span
               class="name">메종마르지엘라</span> <span>|</span> <span class="name">바이레도</span>
            <span>|</span> <span class="name">반클리프 앤 아펠</span> <span>|</span> <span class="name">베르사체</span>
            <span>|</span> <span class="name">불가리</span> <span>|</span> <span class="name">산타마리아노벨라</span>
            <span>|</span> <span class="name">시티리듬</span> <span>|</span>

         </div>

         <div class="menu1">
            <span class="name">아무아쥬</span> <span>|</span> <span class="name">아쿠아디파르마</span>
            <span>|</span> <span class="name">아틀리에 코롱</span> <span>|</span> <span
               class="name">에르메스</span> <span>|</span> <span class="name">오디딸리</span>
            <span>|</span> <span class="name">이솝</span> <span>|</span> <span
               class="name">입생로랑</span> <span>|</span> <span class="name">제르조프</span>
            <span>|</span> <span class="name">조말론</span> <span>|</span> <span
               class="name">존바바토스</span> <span>|</span> <span class="name">지방시</span>
            <span>|</span> <span class="name">캐롤리나 헤레라</span> <span>|</span> <span
               class="name">케네스콜</span> <span>|</span> <span class="name">크리드</span>
            <span>|</span> <span class="name">클린리저브</span> <span>|</span>

         </div>

         <div class="menu1">
            <span class="name">킬리안</span> <span>|</span> <span class="name">탬버린즈</span>
            <span>|</span><span class="name">톰포드</span> <span>|</span><span class="name">트루사르디</span>
             <span>|</span><span class="name">퍼퓸 드 말리</span> <span>|</span> <span class="name">페라리</span>
            <span>|</span> <span class="name">펜할리곤스</span> <span>|</span> <span class="name">포맨트</span>
             <span>|</span><span class="name">프라고나르</span> <span>|</span> <span class="name">프라다</span>
            <span>|</span> <span class="name">프란체스카 비앙키</span> <span>|</span> <span
               class="name">프레데릭 말</span> <span>|</span> <span class="name">프로소디 런던</span> 
               <span>|</span> <span class="name">플로리스 런던</span>
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

      <div class="modal"></div>
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
         <div class="KOREA">
            <i class="fas fa-globe-africa"></i> KOREA
         </div>

      </div>
   </footer>

   <script type="text/javascript">
   let Llist = '${Llist}';
   Llist = Llist.replaceAll("[","").replaceAll("]","").split(",");
	//	console.log('${Llist}');
	//	console.log('${Llist[0]}');
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
               let perfumeHTML ="";
               let perfume = [];
               for (let i = 0; i < res.length; i++){
               let brand = res[i].p_BRAND
               let model = res[i].p_MODEL
               perfume.push(brand)
               perfume.push(model)
               let src1 = "resources/img/"+brand+"/"+model+".jpg";
	               perfumeHTML+=`
	                      	<div class="box">
	       		            <img class="perfumeimg" src="\${src1}" height="200px" width="200px" onclick="selectperfume('\${res[i].p_BRAND}','\${res[i].p_MODEL}','\${(res[i].p_INFO).replaceAll("\n"," ")}')"/>
	       		         	<span class="heart" onclick="heartclick('\${model}', event)">🤍</span>
	       		            <p class="perfume"> \${brand} </p>
	       		            <p class="perfumename">\${model}</p>
	       		            </div>`
            	}
		       $('.perfumebox').html(perfumeHTML);
		       
		       for (let item of Llist) {
		    	   for(let i = 0; i< res.length; i++){
		    		   //console.log(res[i].p_MODEL)
		    		   if(res[i].p_MODEL == item.trim()){
		    			   //document.getElementsByClassName('test_class')[i].innerText('🧡')
            		   	$('.heart').eq(i).text('🧡');
		    		   }
		    	  	 }
            	   }
            },
            error : function (e) {
               alert("요청 실패");
            },
         });

      });

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
      
      // selectperfume 클릭 시 관련된 정보 보여주는 함수
      function selectperfume(B,M,I){
         let perfumeInfo ="";
         url = "resources/img/"+B+"/"+M+".jpg";
         perfumeInfo+=`
         <div class="modal_content">
         <div class="Perfumeimg">
            <img src='\${url}'; height="300px" width="250px">
            <p id="perfume">\${B} </p>
            <p id="perfume">\${M} </p>
            <p id="perfume">\${I} </p>
         </div>
         </div>`
       $('.modal').html(perfumeInfo);
         console.log('추가완');

      $('.modal').fadeIn();
      $('.perfumebox').hide();
       }
     
        $('.name').on('click', function () {
           $('.modal').hide();
           $('.perfumebox').show();
        })
   </script>

</body>
</html>