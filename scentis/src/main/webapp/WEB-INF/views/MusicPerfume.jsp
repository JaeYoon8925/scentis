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
<link rel="stylesheet" href="resources/css/musicperfume.css">
<link rel="stylesheet" href="resources/css/popup.css" />
<script type="text/javascript">
   function setCookie(name, value, expiredays) {
      var todayDate = new Date();
      todayDate.setDate(todayDate.getDate() + expiredays);
      document.cookie = name + "=" + escape(value) + "; path=/; expires="
            + todayDate.toGMTString() + ";"
   }
   function closePop() {
      if (document.pop_form.chkbox.checked) {
         setCookie("maindiv", "done", 1);
      }
      document.all['layer_popup'].style.visibility = "hidden";

   }
</script>
</head>
<body>
   <nav>
      <a href="${cpath}/" class="logo">Scentit</a>
      <div class="menuBar">
         <a href="ScentP">Scent Perfume</a>
         <a href="AllP">All Perfume</a>
         <span>|</span>
         <a href="goLogPage">My Log</a>
            <a href="logout" class="logoutButton">Logout</a>

      </div>
   </nav>
   
      <!-- 팝업 부분 -->
      <div class="layerPopup" id="layer_popup" style="visibility: visible;">
         <div class="layerBox">
            <h4 class="title10">SCENTIT</h4>
            <div class="cont">
               <p>
                  <img id="popImg" src="resources/img/popup.jpg" width=350 height=300 usemap="#popup"
                     alt="event page">
                     <br>검색하기 버튼 클릭 후 <br>노래를 선택해주세요.
               </p>
            </div>
            <form id="popBtn" name="pop_form">
               <div id="check">
                  <p id="todayBtn" for="chkbox">&nbsp&nbsp오늘 하루동안 보지 않기</label>
                  <input type="checkbox" name="chkbox" value="checkbox" id='chkbox'>
               </div>
               <div id="close">
                  <a id="closeBtn" onclick="closePop();">닫기</a>
               </div>
            </form>
         </div>
      </div>



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
                  <p class="title3">가수 또는 제목을 입력하세요</p>
                  <input class="inputbox" type="text" id="m_TITLE" name="m_TITLE">
                  <button id="selectbtn" class="btn">검색하기</button>
               </div>
            </div>
         </div>


         <div class="modal">
            
         </div>
         
         <div>
         	<button class="backbtn">다른 노래 검색하기</button>
         	<button class="logbtn" onclick="location.href='goLogPage'">음악 분석 결과 확인하기</button>
		 </div>

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
      
      let a;
      let b;
      let c;
      let d;
      
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
               //console.log(res);
               
                     let musicHTML="";
                     
                     //let track_id = [];
                     
                     for (let i=0; i<3; i++){
                        
                       // console.log(res.track_id_list[i])
                       
                        let albumimg=res.album_img_list[i]
                        let title=res.title_list[i]
                        let track_id = res.track_id_list[i]
                        let artist=res.artist_list[i]
                        
                        musicHTML+=`
                           <div class="modal_content">
                            <div class="musicimg" onclick="musicinfo('\${albumimg}', '\${title}', '\${artist}', '\${track_id}')">
                                 <img src=\${albumimg} height="200px" width="200px">
                           <a href="#" class="selectmusic1">
                           <p class="title3" id="musicname1">
                              \${title} <br> \${artist}
                           </p>
                           <p class="trackid"> \${track_id}</p>
                           </a>
                        </div>
                     </div>
                        `
                     }
                     $('.modal').html(musicHTML);

               $('.modal').fadeIn();
               $('.searchbox').hide();
               $('.backbtn').show();
               $('.logbtn').show();
               
               $('.musicimg').on('click', function () {
            	   $('#loading').show();
			})
               
               $('.backbtn').on('click', function() {
	               $('.modal').hide();
	               $('.searchbox').show();
	               $('#loading').hide();
	               $('.backbtn').hide();
	               $('.logbtn').hide();
               //trackid = $('.trackid').val();
               //track_id = trackid;
               //let text = $(this).text();
               //console.log(text);
            });
               
               
            },
            error : function() {
               console.log("json 통신 실패");
            }
         });
      });
      
      function musicinfo(e,f,g,h) {
         a = e; // 앨범이미지
         b = f; // 노래 제목
         c = g; // 가수
         d = h; // track_id
         perfumeHTML="";
//         console.log(a)
//         console.log(b)
//         console.log(c)
//         console.log(d)
         
         var jsonData2 = {
            m_IMG : a ,
            m_TITLE : b ,
            m_ARTIST : c ,
            track_id : d
            };
         // python으로 track_id 보내는 ajax
         $.ajax({
            type : 'POST',
            url : '${cpath}/sendDataToFlask2',
            data : JSON.stringify(jsonData2),
            contentType : 'application/json',
            success : function(res) {
               console.log(res)
               for(let i of res) {
                  perfumeimg = "resources/img/"+i.p_BRAND+"/"+i.p_MODEL+".jpg";
                  console.log(i.p_BRAND);
                  console.log(i.p_MODEL);
                  perfumeHTML+=`
                     <div class="modal_content">
                            <div class="musicimg">
                               <div class="card">
                               
                                    <div class="side">
                                       <img src="\${perfumeimg}" height="300px" width="200px">
                                 <a href="#" class="selectperfume">
                                 <p class="title3" id="musicname1">
                                    \${i.p_BRAND} <br> \${i.p_MODEL} </p>
                                 </a>
                                    
                                    </div>
                                    
                              
                                    <div class="side back"> 
                                       <p>\${i.p_INFO}</p>
                                       <p><a href="\${i.p_PATH}" target="_blank">
                                           상품 보러 가기 
                                       </a></p>
                                    </div>
                                    
                               </div>
                               
                           
                        </div>
                     </div>`
               }
                     $('#loading').hide();
                     $('.modal').html(perfumeHTML);
                     $('.modal').fadeIn();
            },
            error : function(){   
            }
         })
      }
      
      
      
      cookiedata = document.cookie;
      if (cookiedata.indexOf("maindiv=done") < 0) {
         document.getElementById('layer_popup').style.display = "block";
      } else {
         document.getElementById('layer_popup').style.display = "none";
      }
      
      $(window).load(function() {
         $('#loading').hide();
      });
   </script>



</body>
</html>