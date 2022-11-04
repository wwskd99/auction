<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 변경</title>
</head>
<body>
	<form action="updateb" method="post">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="user_id" placeholder="아이디"
					value="${sessionScope.userid}" readonly></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" value="${mVo.name}"
					placeholder="이름"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pw" value="${mVo.pw}"
					placeholder="비밀번호"></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="tel" name="phone" value="${mVo.phone}"
					placeholder="전화번호"></td>
			</tr>
			<tr>
				<td>생일</td>
				<td><input type="date" name="birth" value="${mVo.birth}"
					placeholder="생일"></td>
			</tr>
			<tr>
				<td>
					<button type="submit">제출</button>
				</td>
			</tr>
		</table>
	</form>
	<c:if test="${!empty update_message}">
		<script>
			alert("${update_message}")
		</script>
	</c:if>
</body>
</html>