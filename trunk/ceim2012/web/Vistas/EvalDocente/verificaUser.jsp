<%-- 
    Document   : verificaUser
    Created on : 1/09/2011, 05:25:35 PM
    Author     : Dario A
--%>

<%@page import="Manejadores.ControlAdmin"%>
<%@page import="Manejadores.ControlEstudiante"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
<%	
            String codigo=request.getParameter("id");
            String clave=request.getParameter("pass");
            
	    if(ControlEstudiante.existeEstudiante(codigo)&&clave.equals(ControlEstudiante.consultarEstudiante(codigo).getId()))
            {
                HttpSession sesion = request.getSession();
                sesion.setAttribute("usuario",codigo);
%>        	<jsp:forward page="FormEvaluacion.jsp" />
       
<%            }
            else
            {
		if(ControlAdmin.existeAdministrador(codigo)&&clave.equals(ControlAdmin.consultarAdministrador(codigo).getId()))
            	{
                	HttpSession sesion = request.getSession();
                	sesion.setAttribute("usuario",codigo);
%>        		<jsp:forward page="AdminCriterios.jsp" />
<%              }
		else
		{
        
%>                	<jsp:forward page="index.jsp">
                	<jsp:param name="error" value="ID y/o Contraseña<br>
                	incorrectos."/>
               		</jsp:forward>
<%		}
       
            }
%>       
        
    </body>
</html>
