<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
String user = request.getParameter("j_username");
String pass = request.getParameter("j_password");
if(user != null && !"true".equals(request.getParameter("loginError"))) {
	session.setAttribute("loginFlag", "true");
	response.sendRedirect("/SASTeam08/j_security_check?j_username=" + user + "&j_password=" + pass);
}

if(request.getParameter("loginError") != null) {
	response.sendRedirect("/SASTeam08/authenticate.jsp");
}
%>