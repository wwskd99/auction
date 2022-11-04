<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원 가입</title>
</head>
<body>
	<form action="joinb" method="post">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="user_id" placeholder="아이디"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" placeholder="이름"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pw" placeholder="비밀번호"></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="tel" name="phone" placeholder="전화번호"></td>
			</tr>
			<tr>
				<td>생일</td>
				<td><input type="date" name="birth" placeholder="생일"></td>
			</tr>
			<tr>
				<td>
					<button type="submit">제출</button>
				</td>
			</tr>
		</table>
	</form>
	<c:if test="${!empty join_message}">
		<script>
			alert("${join_message}")
		</script>
	</c:if>
</body>
</html>