<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.LinkedList,java.sql.SQLException,com.controlador.ControlEstudiante,com.modelo.Estudiante,com.modelo.Acudiente" session="true" %>
<%
    try {
        Acudiente acudiente = (Acudiente) session.getAttribute("usuario");
        Estudiante estudiante;
        LinkedList<Estudiante> listaEstudiante = ControlEstudiante.listarEstudianteAcudiente(acudiente.getVar_id_acudiente().toString());
        if (!listaEstudiante.isEmpty()) {
            int tamList = listaEstudiante.size();
            String table = "<table><thead><tr><th>Nomre</th><th>Apellido</th><th>Cedula</th><th>Seleccionar</th></tr></thead><tbody>";
            for (int i = 0; i < tamList; i++) {
                estudiante = listaEstudiante.get(i);
                table += "<tr><td>" + estudiante.getNombre() + "</td><td>" + estudiante.getApellido() + "</td><td>" + estudiante.getIdentificacion() + "</td><td></td></tr>";
            }
            table += "</tbody></table>";
            out.print("<script type='text/javascript'>$('#resultEstudiante').html('" + table + "');</script>");
        } else {
            out.print("<script type='text/javascript'>alert('Error, no se encontraron estudiantes registrados por el Acudiente: " + acudiente.getVar_nombre_acudiente() + " " + acudiente.getVar_apellido_acudiente() + ".');</script>");
        }
    } catch (SQLException ex) {
        out.print("<script type='text/javascript'>alert('" + ex.getMessage() + ".');</script>");
    }
%>