<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div id="chating" class="chating">
	<c:forEach var="chat" items="${chat_log}" varStatus="status">
		<c:choose>
			<c:when test="${chat.user_id == sessionScope.userid}">
				<div class="chatting_me_box_wrap">
					<div class="chatting_me_box_date">
						<p>${chat_date[status.index]}</p>
					</div>
					<div class="chatting_me_box">
						<p class='me'>${chat.chat}</p>
					</div>
					
				</div>
			</c:when>
			<c:otherwise>
				<div class="chatting_others_box_wrap">
					<div class="user_icon_div">
						<img class="user_icon_img"
							src="../../resources/img/chatting/user_icon.jpg">
					</div>
					<div class="chatting_others_box">
						<div class="others_chat">${chat.user_id}</div>
						<div class="others_chat_chat">
							<p class='others'>${chat.chat}</p>
						</div>
					</div>
				</div>
			</c:otherwise>
		</c:choose>
	</c:forEach>
</div>