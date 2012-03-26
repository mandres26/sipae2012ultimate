<%-- 
    Document   : Boletin
    Created on : 13/09/2011, 03:36:12 AM
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Manejadores.ControlEstudiante"%>
<%@page import="personas.Estudiante"%>
<%@page errorPage = "ErrorPage.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>.:GestionBoletin:.</title>
    </head>
    <body>
        <h1>.:GestionBoletin:.</h1>
        <%
        int codest1=Integer.parseInt(request.getParameter("codest"));

        Estudiante estudiante=ControlEstudiante.consultarEstudiante(codest1);

        int codest2=estudiante.getCodigo();
        String nombreest=estudiante.getNombres();
        String apellidos=estudiante.getApellidos();


        %>
        CodEstudiante<input  type="text" name="codcurso" value="<%=codest2%>"  disabled="true"/>
        Estudiante:Nombre  <input type="text" name="nombre"value="<%=nombreest%>" disabled="true"/>
        Apellidos<input type="text" name="jornada" value="<%=apellidos%>" disabled="true" />
    </body>
</html>
