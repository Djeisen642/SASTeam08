<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@include file="/global.jsp" %>
<%@include file="/header.jsp" %>
<body>
	<div class="header"></div>
	<div class="splashLogo"></div>
	<div class="loginForm">
	<form method="post" action="/SASTeam08/authenticate.jsp">
		<input type="text" maxlength="10" class="loginBubble" name="j_username" placeholder="USERNAME">
		<br /> 
		<input type="password" maxlength="20" class="loginBubble" name="j_password" placeholder="PASSWORD">
		<br />
		<input type="submit" value="Login">
	</form>
	</div>
	<div class="footer"></div>
</body>
</html>