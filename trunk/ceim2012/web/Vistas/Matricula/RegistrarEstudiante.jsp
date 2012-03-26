<%-- 
    Document   : RegistrarEstudiante
    Created on : 19/03/2012, 10:27:40 PM
    Author     : Usuario
--%>

<%@page import="java.sql.Date"%>
<%@page import="Utilidades.GeneradorFecha"%>

<%@page import="Conceptos.Estudiante"%>
<%@page import="ManejadorMatriculas.ControladorAcudiente"%>
<%@page import="Conceptos.Acudiente"%>
<%@page import="ManejadorMatriculas.ControlEstudiante"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    </head>
    <body>
     <%
    
            
        
            if(!ControlEstudiante.existeEstudiante(request.getParameter("id"))){
              
               String usuario=(String)request.getSession().getAttribute("usuario");
               String pass=(String)request.getSession().getAttribute("pass");
             
           
                 Acudiente a=ControladorAcudiente.isUsurioPass(usuario, pass);
           
                
                Estudiante est=new Estudiante();
              
                   //estudinate..                      
                 est.setVar_codigo_estudiante(request.getParameter("id"));
                 est.setVar_identificacion_estudiante(request.getParameter("id"));
                 est.setVar_nombres_estudiante(request.getParameter("nombre"));
                 est.setVar_apellidos_estudiante(request.getParameter("apellido"));
                 est.setVar_nombre_madre_estudiante(request.getParameter("nom_madre"));
                 est.setVar_sexo_estudiante((request.getParameter("sexo")));
                 est.setVar_foto(request.getParameter("foto"));
               //  est.setCursoTemporal(request.getParameter("curso""));
                 est.setVar_nombre_padre_estudiante(request.getParameter("nom_padre"));
                 est.setVar_direccion_estudiante(request.getParameter("barrio"));
                 est.setVar_numero_hermanos_estudiante(Integer.parseInt(request.getParameter("hermanos")));
                  est.setAcudiente(ControladorAcudiente.consultarAcudiente(a.getVar_id_acudiente()));
                     
                  est.setVar_fecha_nacimiento(new Date(GeneradorFecha.getDateFechaFormate(request.getParameter("fn"))));
                  
                  
                   
                  //para registrar los estudiantes...
                   ControlEstudiante.registrarEstudiante(est,a.getVar_email_acudiente());
                  
                  
                   response.sendRedirect("acudiente.jsp");
                   
            }
            
           
    %>
    </body>
</html>
