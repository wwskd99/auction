<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.login {
	position: absolute;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	background: #fff;
}

 .login-content {
    width: 420px;
    padding: 40px;
    height: 500px;
    top: 50%;
    left: 50%;
    -webkit-transform: translate(-50%, -50%);
    transform: translate(-50%, -50%);
    z-index: 1;
    position: absolute;
    background: #FFF;
    box-shadow: 0 0px 70px rgba(0, 0, 0, 0.1);
    border-top: 5px solid @green;
    float: left;
    -webkit-transition: all 0.2s ease-out;
    transition: all 0.2s ease-out;
    transition-delay: 0.2s;

   
     &.login-content-signin.ng-hide:not(.ng-hide-animate) {
      transition-delay: 0s;
      display: block!important;
      opacity: 0;
      z-index: -1;
      -webkit-transform: translate(-45%, -50%);
      transform: translate(-45%, -50%);
    }
    &.login-content-signup.ng-hide:not(.ng-hide-animate) {
      transition-delay: 0s;
      display: block!important;
      opacity: 0;
      z-index: -1;
      -webkit-transform: translate(-55%, -50%);
      transform: translate(-55%, -50%);
    }

form {
	padding: 10px;
}
</style>
<meta charset="EUC-KR">
<title>로그인</title>
</head>
<body>
	<div class=login>
	 <div class="login-content login-content-signin" ng-hide="showSignIn">
		<form action="loginb" method="post">
			<div class="input_box">
				<label for="userid">아이디 : </label><input type="text" name="user_id"
					placeholder="아이디">
			</div>
			<div class="input_box">
				<label for="pwd">비밀번호 : </label><input type="password" name="pw"
					placeholder="비밀번호">
			</div>
			<div>
				<button type="submit">제출</button>
			</div>
		</form>
		<c:if test="${!empty login_message}">
			<script>
				alert("${login_message}")
			</script>
		</c:if>
	</div>
	</div>
</body>
</html>