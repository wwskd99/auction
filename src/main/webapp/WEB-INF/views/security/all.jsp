<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모든 사용자가 접근하는 페이지(all)</title>
</head>
<body>
<h1>/security/all 페이지</h1>

<sec:authorize access="isAnonymous()"><!-- 로그인하지 않은 경우 -->
  <a href="/customLogin">로그인</a>
</sec:authorize>

<sec:authorize access="isAuthenticated()"><!-- 인증(로그인)이 되었다면 -->
  <a href="/customLogout">로그아웃</a>
</sec:authorize>

</body>
</html>