<%-- 
    Document   : ErrorPage
    Created on : 12/11/2011, 03:04:45 PM
    Author     : Usuario
--%>
<%@ page session="false" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.*" %>
<%@ page isErrorPage="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1><center>Se A Producido un Error .Por Favor Espere un Momento.!</center></h1>
       <h1><center>Estamos Trabajando Para Solucionarlo<br>Por Favor Actualize la Pagina</center></h1>
       <%--<center><a href="login.jsp"><input type="submit" value="Atras" /></a></center>--%>

    </body>
</html>
<%!
    private String normalize(String value){
        StringBuffer sb = new StringBuffer();
        if (value == null)
            return "Objeto Vacio";
        for(int i = 0; i < value.length(); i++){
            char c = value.charAt(i);
            if ((c=='|'))
                    sb.append("<br>");
            else
               sb.append(c);
        }
        return sb.toString();
    }
%>