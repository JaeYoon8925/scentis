<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<!--  Trend Perfume : DB에서 가장 많이 cnt+된것 3개 가져오기

	  user → user(id,nickname,생년월일 담겨있음)
	  
	   -->
	<nav>
        <div class="logo">
            Scentit
        </div>
        <div class="menuBar">
            <a href="">My Perfume</a>
            <a href="">Music Chart</a>
            <span>|</span>
            <a href="">Sign up</a>
            <a href="">Login</a>
            <a href="">My Log</a>
        </div>
    </nav>

    <section class="section1">
        <section class="section2">
            <div class="log">
                <p class="title">MY LOG</p>
                <img class="pro" src="./image/프사.png" alt="">
                <div class="idnick">
                    <p>ID</p>
                    <p>Nickname</p>
                </div>
            </div>
        </section>
        <section>
            <div>
                <p class="title1">Search Music</p>
                <p class="title2">Singer - Music</p>
                <div class="imgbox">
                    <div>
                        <img src="./image/블랑쉬.jpg" height="330px" width="250px">
                        <p class="title3">바이레도 <br> 블랑쉬</p>
                    </div>
                    <div>
                        <img src="./image/17 도손 오 드 뚜왈렛.jpg" height="330px" width="250px">
                        <p class="title3">딥디크 <Br> 도손</p>
                    </div>
                    <div>
                        <img src="./image/아쿠아 디 콜로니아 - 가데니아.jpg" height="330px" width="250px">
                        <p class="title3">산타마리아노벨라 <br> 아쿠아 디 콜로니아</p>
                    </div>
                </div>
            </div>
        </section>
        <section class="section3">
            <div class="log">
                <p class="title1">Trend Perfume</p>
                <img src="./image/블랙베리 앤 베이 코롱.webp" height="300px" width="250px">
                <p class="perfume">조말론 <br> 블랙베리 앤 베이</p>
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


</body>

</html>
