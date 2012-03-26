<%-- 
    Document   : RegistroPrueva
    Created on : 31/08/2011, 08:10:32 PM
    Author     : Dario A
--%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="Manejadores.ControlEstudiante"%>
<%@page import="Conceptos.Estudiante"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String identificacion=request.getParameter("identificacion");
            String nombre=request.getParameter("nombre");
            String apellido=request.getParameter("apellido");
            String telefono=request.getParameter("telefono");
            
            Estudiante est=new Estudiante();
            est.setId(identificacion);
            est.setNombre(nombre);
            est.setApellido(apellido);
            est.setTelefono(telefono);
            
            if(!ControlEstudiante.existeEstudiante(identificacion))
            {
                ControlEstudiante.registrarEstudiante(est);
                out.println("Estudiante Registrado<br/><br/>");
                out.println("<form action='FormEvalDocente.jsp' method='POST'>"
                                +"Elija Profesor a evaluar:"
                                +"<select name='profesor'>"
                                      +"<option>Profesor1</option>"
                                      + "<option>Profesor2</option>"
                                +"</select>"
                                
                                +"<br/><br/><input type = 'submit' value = 'Evaluar Docente' />"
                            +"</form>"
                            );
            }
            else
                out.print("Estudiante Ya existe");
            
        
        %>
        
        
        
        <br/><a href="FormEstudiante.jsp">Regresar Formulario Estud</a>
        
    </body>
</html>
