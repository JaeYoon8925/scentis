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
			<div class="e4_332">
				<div class="form-group email-form">
					<label for="id" style="margin-right: 10px;">아이디</label> <input
						type="text" class="form-control" name="userId" id="userId"
						placeholder="아이디"> <label for="email"
						style="margin-right: 10px;">이메일</label>
					<div class="input-group" style="display: flex;">
						<input type="email" class="form-control" name="EMAIL" id="EMAIL"
							placeholder="example@gmail.com">
					</div>
					<div class="input-group-addon">
						<button type="button" class="btn btn-primary" id="mail-Check-Btn"
							style="margin-top: 0px; margin-bottom: 5px;">본인인증</button>
					</div>
				</div>



				<div class="mail-check-box">
					<input class="form-control mail-check-input" name="email_Key"
						id="email_KeyCheck" placeholder="인증번호 6자리를 입력해주세요!" maxlength="6"
						disabled="disabled">
					<button type="button" class="btn mail-check-input"
						id="emailKeyCheck-Btn" disabled="disabled"
						style="margin-top: 0px; margin-bottom: 5px;">인증하기</button>
				</div>

				<span id="mail-check-warn"></span>

			</div>
		</form>

		<div class="modal" style="display: none;">
			<form action="ChangePw" method="POST">
				<input type="hidden" id="ID" name="ID" value="">
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

				<button type="submit" id="change" onclick="location.href ='Login'">
					비밀번호 변경</button>

			</form>
		</div>

		<!-- footer -->
		<div class="member-footer">
			<div>
				<span>이용약관</span> <span>개인정보처리방침</span>
			</div>
			<span><a href="#">SCENTIT Corp.</a></span>
		</div>
	</div>

	<!-- 이메일 인증 -->
	<script>
		$('#mail-Check-Btn').click(function() {
			const id = $('#userId').val()
			const email = $('#EMAIL').val() // 이메일 주소값 
			console.log('입력된 아이디 : ' + id); // 완성된 이메일 확인
			console.log('완성된 이메일 : ' + email); // 완성된 이메일 확인
			const checkInput = $('.mail-check-input') // 인증번호 입력하는곳 

			$.ajax({
				type : 'get',
				url : 'createMailKey',
				data : {
					id : id,
					email : email
				},
				success : function(data) {
					console.log("data : " + data);
					if (data == "전송성공") {
						alert('인증번호가 전송되었습니다. 3분 이내에 입력해주세요.')
						checkInput.attr('disabled', false);
					} else if (data == "확인요망") {
						alert("일치하는 ID와 Email이 없습니다.");
					} else if (email === "") {
						alert("이메일 형식이 올바르지 않습니다. example@gmail.com");
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
			const id = $('#userId').val()
			const email = $('#EMAIL').val() // 이메일 주소값 
			const email_key = $('#email_KeyCheck').val();
			console.log('매핑된 id : ' + id);
			console.log('입력한 인증키 : ' + email_key);
			const change = $('#change')

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
						change.attr('disabled', false);
						
					    // 아이디(input type="hidden" id="id" name="id")의 value를 email_key로 설정
					    $('#ID').val(id);
					    
						$('.modal').fadeIn();
						$('.searchbox').hide();

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
</body>
</html>