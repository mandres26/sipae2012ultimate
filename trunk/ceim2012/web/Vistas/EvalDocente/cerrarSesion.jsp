<%-- 
    Document   : cerrarSesion
    Created on : 1/09/2011, 06:12:21 PM
    Author     : Dario A
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
               HttpSession sesionOk = request.getSession();
                sesionOk.invalidate();
        %>
        <jsp:forward page="index.jsp"/>
        
    </body>
</html>
