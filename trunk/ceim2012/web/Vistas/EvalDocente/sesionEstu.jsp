<a<%-- 
    Document   : sesionEstu
    Created on : 31/08/2011, 09:42:34 PM
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
        <h1>INICIO SESION</h1>
        
            <form action="verificaUser.jsp" method="POST">
                Identificacion:<br><input type="text" name="id" value="" size="30%" /><br/>
                Contraseña:<br><input type="password" name="pass" value="" size="30%" /><br/>
                <input type="submit" value="Aceptar" />
                <%
                if(request.getParameter("error")!=null)
                out.println(request.getParameter("error"));
                out.println("<br/>");
                %>
            </form>
        
       
        
    </body>
</html>
