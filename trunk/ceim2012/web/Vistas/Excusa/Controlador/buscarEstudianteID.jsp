<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.LinkedList,java.sql.SQLException,com.modelo.Estudiante,com.controlador.ControlEstudiante" session="true"%>
<%
    String campo = request.getParameter("campo");
    String valor = request.getParameter("valor");

    try {
        Estudiante estudiante;
        LinkedList<Estudiante> listaEstudiante = ControlEstudiante.buscarEstudiante(campo, valor);
        if (!listaEstudiante.isEmpty()) {
            int tamList = listaEstudiante.size();
            String table = "<table><thead><tr><th>Nomre</th><th>Apellido</th><th>Cedula</th><th>Seleccionar</th></tr></thead><tbody>";
            for (int i = 0; i < tamList; i++) {
                estudiante = listaEstudiante.get(i);
                table += "<tr><td>"+estudiante.getNombre()+"</td><td>"+estudiante.getApellido()+"</td><td>"+estudiante.getIdentificacion()+"</td><td></td></tr>";
            }
            table += "</tbody></table>";
            out.print("<script type='text/javascript'>$('#resultEstudiante').html('" + table + "');</script>");
        } else {
            out.print("<script type='text/javascript'>alert('Error, encontraron " + listaEstudiante.size() + " conincidencias para " + campo + " Estudiante con " + valor + ".');</script>");
        }
    } catch (SQLException ex) {
        out.print(ex.getMessage());
        out.print("<script type='text/javascript'>alert('"+ex.getMessage()+".');</script>");
    }
%>