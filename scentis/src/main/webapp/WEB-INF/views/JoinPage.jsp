<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<head>
<title>Bootstrap Example</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<link rel="stylesheet" href="resources/css/Join.css">
<link
	href="https://fonts.googleapis.com/css?family=DM+Sans&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Arimo+Hebrew Subset&display=swap"
	rel="stylesheet">

</head>
<body>

	<div class=e1_726>
		<span class="e1_727">Sign In</span>
	</div>

	<form action="join" method="POST" class=e1_688>
		<div class="container">




			<div class=e4_295>
				<span class="e4_296">아이디</span>
				<div class=e4_297>
					<div class=e4_298>
						<input type="text" name="id" class="e4_299">
					</div>
				</div>
			</div>
		</div>

		<div class=e1_698>
			<span class="e1_699">비밀번호</span>
			<div class=e1_700>
				<div class=e1_701>
					<input type="password" name="pw" class="e1_702">
				</div>
			</div>
		</div>


		<div class=e4_302>
			<span class="e4_303">비밀번호 확인</span>
			<div class=e4_304>
				<div class=e4_305>
					<input type="password" name="pw-confirm" class="e4_306">
				</div>
			</div>
		</div>

		<div class=e4_312>
			<span class="e4_313">이름</span>
			<div class=e4_314>
				<div class=e4_315>
					<input type="text" name="name" class="e4_316">
				</div>
			</div>
		</div>

		<div class=e4_322>
			<span class="e4_323">닉네임</span>
			<div class=e4_324>
				<div class=e4_325>
					<input type="text" name="nick" class="e4_326">
				</div>
			</div>
		</div>
		</div>

		<div class=e4_337>
			<span class="e4_338">생년월일</span>
			<div class=e4_339>
				<div class=e4_340>
					<input type="date" name="birth">
				</div>
			</div>
		</div>

		<div class=e4_332>
			<span class="e4_333">성별</span>
			<div class="form_toggle">
				<div class="form_radio_btn radio_male">
					<input id="radio-1" type="radio" name="userSex" value="male"
						checked> <label for="radio-1">남자</label>
				</div>

				<div class="form_radio_btn">
					<input id="radio-2" type="radio" name="userSex" value="female">
					<label for="radio-2">여자</label>
				</div>
			</div>

		</div>

		<button type="submit" class=e1_690>Sign In</button>
		</div>
	</form>

	</div>

	</div>
	<div class=e1_729>
		<div class=e1_730>

			<div class="e1_731"></div>
			<img alt="" src="resources/img/KakaoTalk_20230716_233001867.png">
			<div class=e1_732>
				<span class="e1_734">Scentit</span>
			</div>
		</div>
	</div>
	</div>


</body>
</html>