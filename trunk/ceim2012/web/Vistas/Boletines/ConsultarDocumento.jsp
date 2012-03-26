<%-- 
    Document   : ConsultarDocumento
    Created on : 22/09/2011, 01:24:02 AM
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Manejadores.ControlDocumento"%>
<%@page import="Manejadores.ControlDocumentoAcudiente"%>
<%@page import="Gestion.Documento"%>
<%@page errorPage = "ErrorPage.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>.:ConsultaDocumento:.</title>
    </head>
    <body>
        <h1>Consulta Documento!</h1>
        <%
        
        int coddoc1=Integer.parseInt(request.getParameter("coddoc2"));

        Documento doc=ControlDocumento.consultarDocumento(coddoc1);
String ban="";
        if(doc==null)
            ban = "no hay nada";
        else
            ban = "si hay algo";
       

        %>
       
        Codigo Documento<input type="text" name="codEst" value="<%=doc.getCodDocumento()%>"/>
        Tipo Documento<input type="text" name="td" value="<%=doc.getTipo()%>"/>
        Secretaria a cargo<br>
      <%--  C.C:<input type="text" name="cc" value="<%=doc.getPersona().getIdentificacion()%>"/>
        Nombre:<input type="text" name="nom" value="<%=doc.getPersona().getNombres()%>"/>--%>
        
Codigo Documento<input type="text" name="codEst" value="<%=ban%>"/>
</body>
</html>
