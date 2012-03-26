<%-- 
    Document   : listadoMatricula
    Created on : 4/11/2011, 04:38:44 AM
    Author     : idadyou
--%>


<%@page import="ManejadoreaOtros.TablaEstudiantes"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%=TablaEstudiantes.getListadoEstudianteByMatricula()%>
    </body>
</html>
