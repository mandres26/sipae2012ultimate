<%-- 
    Document   : AdminPuntosEval
    Created on : 14/09/2011, 07:30:20 PM
    Author     : Dario A
--%>

<%@page import="Conceptos.PuntoEval"%>
<%@page import="java.util.List"%>
<%@page import="Manejadores.ControlPuntoEval"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Admon Puntos a Evaluar</h1>
        <%
           List<PuntoEval> p=ControlPuntoEval.listarPuntoEval();
           out.print("<table border='1'>");
           for(int i=0; i<p.size(); i++)
           {
               out.print("<form action='AMEpeval.jsp?cod="+p.get(i).getCodigo() +"' method='POST'>");
               
               out.print("<tr><td width='400'>");
               out.print(p.get(i).getPeval());
               out.print("</td><td>");
               out.print("<input type='submit' value='Modificar' name='mod'/>");
               out.print("<input type='submit' value='Eliminar' name='eli'/>");
               out.print("</td></tr>");
               out.print("</form>");
           }
           out.print("</table>");
        %>
        <br/>
        <form action="AMEpeval.jsp" method="POST">
            Escriba aqui Nuevo Punto a Evaluar<br/>
            <input type="text" name="agregarp" size="50%" />   
            <input type="submit" value="Agregar" name="agr" />
        </form>
               
        <br/><a href="cerrarSesion.jsp">Regresar</a>
    </body>
</html>