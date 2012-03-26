<%-- 
    Document   : buscarDocente
    Created on : 22/11/2011, 09:57:02 AM
    Author     : root
--%>
<%@page import="MPAsistencia.*" %>
<%@page import="Conceptos.Asistencia.*" %>
<%
String parametroIdEstudiante = (String)request.getParameter("idEst");
Estudiante est;
est = controlEstudiante.consultar(Integer.parseInt(parametroIdEstudiante));
out.println(est.getNombre());
%>

