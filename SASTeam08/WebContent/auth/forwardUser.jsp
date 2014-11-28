<%@page language="java" 
        contentType="text/html; charset=ISO-8859-1" 
        pageEncoding="ISO-8859-1"
        errorPage="/logout.jsp"%>
         
<%@page import="dao.DAOFactory"%>

<%@page import="database.DBUtil"%>

<%@include file="/global.jsp" %>

<%

if(request.getUserPrincipal() != null) {
	
	String username = request.getUserPrincipal().getName();
	
	if (request.isUserInRole("patient") || request.isUserInRole("admin")) {
		response.sendRedirect("index.jsp");
		return;
	} 
	else if(!validSession) {
		session.invalidate();
		response.sendRedirect("/SASTeam08/");
	}
	else {
		
		response.sendRedirect("errors/noaccess.jsp");
	}
}

%>
