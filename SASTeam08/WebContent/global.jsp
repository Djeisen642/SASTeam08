<%@page buffer="64kb" %>
<%@page import="dao.DAOFactory"%>
<%@page import="dao.AuthDAO"%>

<%
DAOFactory prodDAO = DAOFactory.getProductionInstance(); 
AuthDAO authDAO    = prodDAO.getAuthDAO();

String pageTitle    = null;
String loginMessage = null;
String userName     = null;
String fullName		= null;
String errorMessage = null;
String selectedPatientName = null;

boolean validSession = true;

Long loggedInMID = new Long(0L);
String userRole  = "";
try {
	userRole    = (String) session.getAttribute("userRole");

	if (userRole == null) {
		if (request.isUserInRole("user")) {
			userRole = "user";
		}
		else if (request.isUserInRole("admin")) {
			userRole = "admin";
		}
		session.setAttribute("userRole", userRole);
	}
	
} catch (IllegalStateException ise) {
	validSession = false;
}

%>
