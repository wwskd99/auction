<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="../includes/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="EUC-KR">
<title></title>
</head>
<body>

<c:forEach items="${room}" var="ro" varStatus = "status">
	<div>경매 번호 : ${ro.product_id}번</div>
	<div>아이디 : ${room_chat[status.index].user_id}</div>
	<div>채팅 번호 : ${ro.roomName}</div>
	<div>이미지주소 : ${room_pic[status.index].picture_name}</div>
	<div>마지막 채팅 로그 : ${room_chat[status.index].chat}</div>
	<div>마지막 채팅 날짜 : ${room_chat[status.index].chat_date}</div>
	<br>
</c:forEach>


</body>
</html>