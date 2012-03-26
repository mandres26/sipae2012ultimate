<%-- 
    Document   : formModificar
    Created on : 27/10/2011, 02:18:59 PM
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
        
        
        <form id="form1" name="form1" method="post" action="AMEpeval.jsp?cod=<%request.getParameter("cod");%>">
            <legend>
            Modificar Criterio
            <input name="user" type="text" id="user" size="50" />
            <input type="submit" name="mod" id="mod" value="Aceptar" />
            </legend>
            </form>
            
            <%out.print(request.getParameter("cod"));%>
    </body>
</html>
