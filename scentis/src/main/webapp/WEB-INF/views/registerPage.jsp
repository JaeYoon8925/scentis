<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<%--


 --%>
 
<html>
<style>


select {
  position: absolute;
  top: 0;
  right: 0;
  padding: 20px;
}
</style>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Effective PM | <spring:message code="regi"/> </title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="${path}/pms/plugins/fontawesome-free/css/all.min.css">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="${path}/pms/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="${path}/pms/dist/css/adminlte.min.css">
</head>
<body class="hold-transition register-page">
<select class="selLang" id="selLan">
	<option value=""><spring:message code="chLang"/></option>
	<option value="ko"><spring:message code="ko"/></option>
	<option value="en"><spring:message code="en"/></option>
</select>
<form id="selLang" class="form-inline" method="post">
	<input type="hidden" name="lang" value=""/>
</form>
<div class="register-box">
  <div class="card card-outline card-primary">
    <div class="card-header text-center">
      <a class="h1"><b>Effective</b>PM</a>
    </div>
    <div class="card-body">
      <p class="login-box-msg"><spring:message code="reg"/></p>

      <form id="register" action="register.do" method="post">
        <input type="hidden" id="email_yn" name="email_yn" value="N"/>
        <div class="input-group mb-3">
          <input type="text" name="name" id="name" class="form-control" placeholder="<spring:message code="name"/>">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-user"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="email" name="email" id="email" class="form-control" placeholder="<spring:message code="email"/>">
          <div class="col-4">
          	<button type="button" id="dupCheck" class="btn btn-danger col fileinput-button"><spring:message code="dupcheck"/></button>
          </div>
          <div class="input-group-append">
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="date" name="birthdate" id="birthdate" class="form-control" value="1994-01-26">
          <div class="input-group-append">
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="number" name="phonenumber" id="phonenumber" class="form-control" placeholder="<spring:message code="pn"/>">
          <div class="input-group-append">
          </div>
        </div>
        <div class="row">
          <!-- /.col -->
          <div class="col-12" style="text-align:center">
            <button type="button" class="btn btn-primary btn-block" onclick="fnSubmit(); return false;"><spring:message code="regcomp"/></button>
          </div>
          <!-- /.col -->
        </div>
        <p class="mt-3 mb-1">
        <a href="${path}/login.do" class="text-center"><spring:message code="login"/></a>
        </p>
      </form>
    </div>
    <!-- /.form-box -->
  </div><!-- /.card -->
</div>
<!-- /.register-box -->

<!-- jQuery -->
<script src="${path}/pms/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="${path}/pms/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="${path}/pms/dist/js/adminlte.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#dupCheck").click(function(){
			$.ajax({
				url:"${path}/dupCheck.do",
				data:"email="+$("#email").val(),
				dataType:"json",
				success:function(data){
					console.log(data)
					if(data.dupCheck){
						alert("<spring:message code="edupcheckf"/>")
						$("#email_yn").val("N");
						$("[name=email]").val("").focus();	
					}else{
						alert("<spring:message code="edupcheckp"/>")
						$("#email_yn").val("Y");
					}
				},
				error:function(err){
					console.log(err)
				}
			});
		})
	});
	
		function fnSubmit() {
			
			var email_rule =  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			
			if ($("#name").val() == null || $("#name").val() == "") {
				alert("<spring:message code="namecheck"/>");
				$("#name").focus();
			 
				return false;
			}
			 
			if ($("#email").val() == null || $("#email").val() == "") {
				alert("<spring:message code="emailcheck"/>");
				$("#email").focus();
				 
				return false;
			}
			
			if ($("#birthdate").val() == null || $("#birthdate").val() == "") {
				alert("<spring:message code="bdaycheck"/>");
				$("#birthdate").focus();
				 
				return false;
			}
			
			if ($("#phonenumber").val() == null || $("#phonenumber").val() == "") {
				alert("<spring:message code="pnumbercheck"/>");
				$("#phonenumber").focus();
				 
				return false;
			}
			 
			if ($("#email_yn").val() != 'Y') {
				alert("<spring:message code="confdupcheck"/>");
				$("#email_yn").focus();
				 
				return false;
			}
			
	         if (confirm("<spring:message code="confcheck"/>")) {
	             $("#register").submit();
	             alert("<spring:message code="compreg"/>")
	             return false;
	             
	        }

		}
		$(document).ready(function(){
			<%-- 
			
			--%>	
			$("#selLan").val("${param.lang}")
			$("#selLan").change(function(){
				if($(this).val()!=""){
					$("[name=lang]").val($(this).val())
					$("#selLang").submit();
				}
			});
		});
</script>
</body>
</html>