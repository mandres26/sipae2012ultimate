<%-- 
    Document   : registroCompleto
    Created on : 25/11/2011, 12:17:43 AM
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String nombre=request.getParameter("nombre");
            int valor=Integer.parseInt(request.getParameter("valor"));
            Articulo art=new Articulo();
            art.setNombre(nombre);
            art.setValor(valor);
            ControlArticulo.registrarArticulo(art);
        %>
    </body>
</html>
