<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<%
    session.removeAttribute("usuario");
    out.print("<script type='text/javascript'>location.href='index.jsp'</script>");
%>