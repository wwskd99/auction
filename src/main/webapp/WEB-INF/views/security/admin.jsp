<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자만 접근하는 페이지</title>
</head>
<body>
	<h1>/security/admin 페이지</h1>

	<p>
		principal :
		<sec:authentication property="principal" />
	</p>
	<p>
		MemberVO :
		<sec:authentication property="principal.member" />
	</p>
	<p>
		사용자이름 :
		<sec:authentication property="principal.member.userName" />
	</p>
	<p>
		사용자아이디 :
		<sec:authentication property="principal.username" />
	</p>
	<p>
		사용자 권한 리스트 :
		<sec:authentication property="principal.member.authList" />
	</p>

	<a href="/customLogout">Logout</a>
</body>
</html>