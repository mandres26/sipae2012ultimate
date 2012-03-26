<%-- 
    Document   : cerra
    Created on : 27-oct-2011, 10:20:16
    Author     : dell
--%>


<%@ page session="true" %>
<%
HttpSession sesionOk = request.getSession();
sesionOk.invalidate();
%>
<%
response.sendRedirect("index.jsp");
%>



