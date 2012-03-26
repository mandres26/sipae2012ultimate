<%-- 
    Document   : buscarTodosLosEstudiantes
    Created on : 24/11/2011, 11:02:47 PM
    Author     : root
--%>
<%@page import="MPAsistencia.*" %>
<%@page import="Conceptos.Asistencia.*" %>
<%
Estudiante est[100];
est = controlEstudiante.consultarTodos();
out.println(est[1].getNombre());
%>
