<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>
	<script type="text/javascript">
		$().ready(function() {
			Swal.fire({
				icon : 'error', // Alert 타입
				title : '로그인 실패', // Alert 제목
				text : '로그인 페이지로 이동합니다.'
			}).then(function() {
				location.href = "Login";
			})
		});
	</script>
</body>
</html>