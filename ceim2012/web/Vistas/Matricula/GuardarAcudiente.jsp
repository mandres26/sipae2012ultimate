<%-- 
    Document   : GuardarAcudiente
    Created on : 17-mar-2012, 12:57:53
    Author     : jose
--%>

<%@page import="Utilidades.GeneradorFecha"%>
<%@page import="java.sql.Date"%>
<%@page import="Conceptos.Acudiente"%>
<%@page import="ManejadorMatriculas.ControladorAcudiente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta http-equiv="refresh" content="3;URL=http://localhost:8080/SisAcademico/index.jsp"/>
        <title></title>
    </head>
    <body>
        <%
      if(!ControladorAcudiente.existeAcudiente(request.getParameter("id"))){
           Acudiente a=new Acudiente();
           a.setVar_id_acudiente(request.getParameter("id"));
           a.setVar_nombre_acudiente(request.getParameter("nombre"));
           a.setVar_apellido_acudiente( request.getParameter("apellido"));
           a.setVar_telefono_acudiente(request.getParameter("telefono"));
           a.setVar_direccion_acudiente(request.getParameter("direcion"));
           a.setVar_sexo_acudiente(request.getParameter("sexo"));
           a.setVar_email_acudiente( request.getParameter("email"));
           a.setVar_usuario(request.getParameter("usuario"));
           a.setVar_contrasena(request.getParameter("contrasena"));
           a.setVar_fecha_nacimiento(new Date(GeneradorFecha.getDateFechaFormate(request.getParameter("fn"))));
           
           ControladorAcudiente.registrarAcudiente(a);
           
            

           // response.sendRedirect("index.jsp"); 
           
           
            }
      %>
    </body>
</html>
