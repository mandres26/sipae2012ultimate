<%-- 
    Document   : FormEstudiante
    Created on : 31/08/2011, 05:20:47 PM
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
        <h1>Prueva Registro Estudiante</h1>
        <form action="RegistroPrueva.jsp" method="POST">
            
            Identificacion:<input type="text" name="identificacion" value="" /><br/>
            Nombre:<input type="text" name="nombre" value="" /><br/>
            Apellido:<input type="text" name="apellido" value="" /><br/>
            Telefono:<input type="text" name="telefono" value="" /><br/>
            <input type="submit" value="Registrar" />
            
        </form>
    </body>
</html>
