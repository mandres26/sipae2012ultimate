<%-- 
    Document   : listadoInscripcion
    Created on : 4/11/2011, 03:29:35 AM
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
        <%=TablaEstudiantes.getListadoEstudianteByInscripcion()%>
    </body>
</html>
