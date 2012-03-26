<%-- 
    Document   : listado
    Created on : 22-oct-2011, 13:48:50
    Author     : dell
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
       
        <%=TablaEstudiantes.getListadoEstudianteAcudiente(request.getParameter("id"))%>
 
    </body>
</html>
