<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<head>
  <title>Bootstrap Example</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>


<body>

<div class="container">
  <h2>id정보 ${account.id}</h2>
  <form action="otpInput"	method="get">
    <div class="form-group">
      <label for="email">OTP:</label>
      <input type="text" placeholder="Enter otp" name="otpCode">
      <input type="hidden" name="id" value=${account.id}>
    </div>
    <button type="submit" class="btn btn-primary">Submit</button>
  </form>
</div>

</body>

</html>