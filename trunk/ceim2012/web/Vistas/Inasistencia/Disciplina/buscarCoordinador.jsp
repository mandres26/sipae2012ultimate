<%--
    Document   : buscarDocente
    Created on : 22/11/2011, 09:57:02 AM
    Author     : root
--%>
<%@page import="MPAsistencia.*" %>
<%@page import="Conceptos.Asistencia.*" %>
<%
    String parametroIdCoordinador = (String)request.getParameter("idCoor");
    Coordinador coor;
    coor = controlCoordinador.consultar(Integer.parseInt(parametroIdCoordinador));
    out.println(coor.getNombre());
%>
