<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE HTML>
<head>
<title>Scentit 당신의 향기에 즐거움을 선사하세요</title>
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


	<div id="title">
		<h1>
			<a href="${cpath}/">SCENTIT</a>
		</h1>
	</div>

	<div class="member">

		<!-- 필드 -->
		<form action="Join" method="POST">
			<div class="field">
				<b>아이디</b> <span class="placehold-text"><input id="idcheck"
					type="text" name="ID"></span>
				<p id="result"></p>
				<!-- 아이디 중복체크 결과를 출력하기 -->

			</div>

			<div class=e4_332>
				<div class="form-group email-form">
					<label for="email">이메일</label>
					<div class="input-group">
						<input type="text" class="form-control" name="userEmail1"
							id="userEmail1" placeholder="이메일"> <select
							class="form-control" name="userEmail2" id="userEmail2">
							<option>@naver.com</option>
							<option>@daum.net</option>
							<option>@gmail.com</option>
							<option>@hanmail.com</option>
							<option>@yahoo.co.kr</option>
						</select>
						<div class="input-group-addon">
							<button type="button" class="btn btn-primary" id="mail-Check-Btn">본인인증</button>
						</div>
					</div>
					<div class="mail-check-box">
						<input class="form-control mail-check-input" name="email_Key"
							id="email_KeyCheck" placeholder="인증번호 6자리를 입력해주세요!" maxlength="6"
							disabled="disabled">
						<button type="button" class="btn mail-check-input"
							id="emailKeyCheck-Btn" disabled="disabled">인증하기</button>
					</div>
					<span id="mail-check-warn"></span>
				</div>
			</div>


			<div class="field">
				<b>비밀번호</b> <input id="userpw" class="userpw" type="password"
					name="PW">
			</div>
			<div class="field">
				<b>비밀번호 재확인</b> <input id="userpw-confirm" class="userpw-confirm"
					type="password">
				<p id="pwresult"></p>
				<!-- 비밀번호 재확인 결과를 출력하기 -->
			</div>
			<div class="field">
				<b>이름</b> <input type="text" name="NAME">
			</div>

			<div class="field tel-number">
				<b>닉네임</b>
				<div>
					<input id="phoneNum" type="text" name="NICKNAME">
				</div>
			</div>

			<div class="field tel-number">
				<b>생년월일</b>
				<div>
					<input id="phoneNum" type="date" name="BIRTHDATE">
				</div>
			</div>

			<div class="field tel-number">
				<b>성별</b>
				<div class="form_toggle">
					<div class="form_radio_btn radio_male">
						<input id="radio-1" type="radio" name="GENDER" value="M" checked>
						<label for="radio-1">남자</label>
					</div>

					<div class="form_radio_btn">
						<input id="radio-2" type="radio" name="GENDER" value="F">
						<label for="radio-2">여자</label>
					</div>
				</div>
			</div>

			<button type="submit" id="join" onclick="location.href ='Login'"
				disabled="disabled">가입하기</button>


		</form>
		<!-- footer -->
		<div class="member-footer">
			<div>
				<span>이용약관</span> <span>개인정보처리방침</span>
			</div>
			<span><a href="#">SCENTIT Corp.</a></span>
		</div>
	</div>

	<script>
		// id 중복확인 → 아이디 중복체크 후 alert창 띄우기
		$(document).ready(function() {
			var input = $('#idcheck');
			input.on('input', idCheck);
		});
		function idCheck() {
			var value = $(this).val();
			console.log(value);
			$.ajax({
				url : 'idcheck',
				type : 'get',
				data : {
					"id" : value
				},
				success : function(res) {
					console.log(res);
					// 만약 사용 가능하다면  p태그 안에 사용 가능한 이메일입니다
					var p = $('#result');
					if (res == "true") {
						p.html("사용 가능한 아이디입니다.").css("color", "green");

					} else {
						p.html("중복된 아이디입니다.").css("color", "red");

					}
				},
				error : function(e) {
					alert("요청 실패");
				},
			});
		}

		// 비밀번호 재확인
		$(document).ready(function() {
			var pwinput = $('#userpw-confirm');
			pwinput.on('input', pwCheck);
		});

		function pwCheck() {

			var userpw = $('#userpw').val();
			var confirmpw = $('#userpw-confirm').val();
			var pwresult = $('#pwresult');

			if (userpw == confirmpw) {
				pwresult.html("비밀번호가 같습니다.").css("color", "green");
			} else {
				pwresult.html("비밀번호가 다릅니다.").css("color", "red");
			}

		};
	</script>
	<!-- 이메일 인증 -->
	<script>
		$('#mail-Check-Btn').click(function() {
			const email = $('#userEmail1').val() + $('#userEmail2').val(); // 이메일 주소값 
			console.log('완성된 이메일 : ' + email); // 완성된 이메일 확인
			const checkInput = $('.mail-check-input') // 인증번호 입력하는곳 

			$.ajax({
				type : 'get',
				url : 'createMailKey',
				data : {
					email : email
				},
				success : function(data) {
					console.log("data : " + data);
					checkInput.attr('disabled', false);
					if (data == "전송성공") {
						alert('인증번호가 전송되었습니다. 3분 이내에 입력해주세요.')
					} else {
						alert('인증번호 발급에 실패했습니다. 이메일주소를 확인해주세요.')
					}

				},
				error : function(error) {
					// 그냥 오류
					console.log('이메일 인증 요청 실패');
				},
			}); // end ajax
		}); // end send eamil

		$('#emailKeyCheck-Btn').click(function() {
			const email = $('#userEmail1').val() + $('#userEmail2').val();
			const email_key = $('#email_KeyCheck').val();
			console.log('입력한 인증키 : ' + email_key);
			const join = $('#join')

			$.ajax({
				type : 'get',
				url : 'checkMailKey',
				data : {
					email : email,
					email_key : email_key
				},
				success : function(data) {

					if (data == 'true') {
						console.log("email_Key : " + email_key);
						console.log("data : " + data);
						join.attr('disabled', false);
						alert('인증되었습니다.')
					}

					if (data == 'false1') {
						alert('인증키를 다시 확인해주세요..')
					}
					if (data == 'false2') {
						alert('인증키 유효시간이 지났습니다. 인증키 발급을 다시 진행해주세요.')
					}

				},
				error : function(error) {
					// 그냥 오류
					console.log('인증 실패. 인증 번호를 다시 확인해주세요.');
				},
			}); // end ajax
		}); // end send eamil
	</script>
</body>
</html>