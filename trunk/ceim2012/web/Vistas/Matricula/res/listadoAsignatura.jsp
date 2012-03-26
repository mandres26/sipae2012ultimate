<%-- 
    Document   : listadoAsignatura
    Created on : 3/11/2011, 09:39:50 PM
    Author     : sigi
--%>

<%@page import="com.res.TablaEstudiantes"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%=TablaEstudiantes.getListaAsignaturasEnHTML()%>
    </body>
</html>
