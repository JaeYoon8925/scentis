<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<head>
<title>Bootstrap Example</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<style>
.id_input_re_1 {
	color: green;
	display: none;
}

.id_input_re_2 {
	color: red;
	display: none;
}
</style>


<body>

	<div class="container">
		<h2>Scentit 회원가입</h2>
		<form action="login" method="get">
			<div class="form-group">
				<label for="id">아이디</label> <input type="text"
					class="form-control id_input" id="id" placeholder="Enter id" name="id">
			</div>
				<span class="id_input_re_1">사용 가능한 아이디입니다.</span>
				<span class="id_input_re_2">아이디가 이미 존재합니다.</span>
			<div class="form-group">
				<label for="pwd">비밀번호</label> <input type="password"
					class="form-control" id="pw" placeholder="Enter password" name="pw"
					required>
			</div>
			<div class="form-group">
				<label for="pwCheck">비밀번호 확인</label> <input type="password"
					class="form-control" id="pwCheck" placeholder="password Check"
					name="pwCheck" required>
			</div>
			<div class="form-group">
				<label for="name">이름</label> <input type="text" class="form-control"
					id="name" placeholder="Enter name" name="name">
			</div>
			<div class="form-group">
				<label for="nickname">닉네임</label> <input type="text" class="form-control"
					id="nickname" placeholder="Enter nickname" name="nickname">
			</div>
			<div class="form-group">
				<label for="birthdate">생년월일</label> <input type="date"
					class="form-control" id="birthdate" name="birthdate">
			</div>
			<div class="form-group">
				<label for="gender">성별</label> <input type="text" class="form-control"
					id="gender" placeholder="Enter gender" name="gender">
			</div>
			<button type="submit" class="btn btn-primary">Sign In</button>
		</form>
	</div>

</body>
<script type="text/javascript">
//아이디 중복검사
$('.id_input').on("propertychange change keyup paste input", function(){
	var id = $('.id_input').val();
	var data = {id : id}
	
	$.ajax({
		type : "post",
		url : "/scentis/dupCheck", // 경로 수정 필요
		data : data,
		success : function(result){
			 console.log("성공 여부" + result);
			 if(result != 'fail'){
				$('.id_input_re_1').css("display","inline-block");
				$('.id_input_re_2').css("display", "none");				
			} else {
				$('.id_input_re_2').css("display","inline-block");
				$('.id_input_re_1').css("display", "none");				
			}
		}
	});
	
	
});
</script>

<script type="text/javascript">
	// 비밀번호 재입력 확인
	var password = document.getElementById("pw"), confirm_password = document
			.getElementById("pwCheck");

	function validatePassword() {
		if (pw.value != pwCheck.value) {
			confirm_password.setCustomValidity("비밀번호가 일치하지 않습니다.");
		} else {
			pwCheck.setCustomValidity('');
		}
	}

	pw.onchange = validatePassword;
	pwCheck.onkeyup = validatePassword;
</script>

</html>