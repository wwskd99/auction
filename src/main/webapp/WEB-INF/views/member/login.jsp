<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.login {
	padding: 50px 0;
	width: 60%;
	max-width: 100%;
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
</body>
</html>