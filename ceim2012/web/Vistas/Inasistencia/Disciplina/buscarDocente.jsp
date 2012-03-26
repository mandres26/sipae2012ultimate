<%-- 
    Document   : buscarDocente
    Created on : 22/11/2011, 09:57:02 AM
    Author     : root
--%>
<%@page import="MPAsistencia.*" %>
<%@page import="Conceptos.Asistencia.*" %>
<%
String parametroIdDocente = (String)request.getParameter("idDoc");
Docente doc;
doc = controlDocente.consultar(Integer.parseInt(parametroIdDocente));
out.println(doc.getNombre());
%>

