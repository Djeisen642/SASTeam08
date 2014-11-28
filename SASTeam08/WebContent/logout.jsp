<%@include file="/global.jsp" %>

<%
session.invalidate();
validSession = false;
response.sendRedirect("/SASTeam08");
%>
