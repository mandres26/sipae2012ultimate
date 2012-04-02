<%-- 
    Document   : GuardarActividad
    Created on : 2/04/2012, 06:39:10 AM
    Author     : Usuario
--%>

<%@page import="ManejadorSEvaluacion.ControladorLogro"%>
<%@page import="ManejadorSEvaluacion.ControladorLogroActividad"%>
<%@page import="Conceptos.LogroActividad"%>
<%@page import="ManejadorSEvaluacion.ControlActividades"%>
<%@page import="ManejadorHorario.ControlAsignatura"%>
<%@page import="Utilidades.GeneradorFecha"%>
<%@page import="java.sql.Date"%>
<%@page import="Conceptos.Actividades"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
         <%
    
           Actividades actividad=new Actividades();
           actividad.setVar_codigo_actividad("idActividad");
           actividad.setVar_nombre_actividad("nombre");
           actividad.setVar_porcentaje_actividad("porcentaje");
           actividad.setVar_periodo_actividad("periodo");
           actividad.setVar_fecha_creacion_actividad("fi");
           actividad.setVar_fecha_ejecucion_actividad("ff");
           actividad.setVar_asignatura(ControlAsignatura.consultarAsignatura("codigoasignatura"));
           actividad.setVar_estado("estado");
           actividad.setVar_descripcion("descripcion");
          
           ControlActividades.registrarActividades(actividad);
           
           LogroActividad logact=new LogroActividad();
           logact.setVar_codigo_actividad(ControlActividades.consultarActividades("idActividad"));
           logact.setVar_codigo_logro(ControladorLogro.ConsultarLogro("listlogro"));
           logact.setVar_consecutivo("1");

           ControladorLogroActividad.registrarLogroAct(logact);                     

           response.sendRedirect("GestionDocente.jsp"); 
           
           
            
      %>
    </body>
</html>
