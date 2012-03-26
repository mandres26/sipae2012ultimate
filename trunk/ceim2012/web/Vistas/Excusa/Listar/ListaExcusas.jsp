<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.LinkedList,java.sql.SQLException,com.modelo.Estudiante,com.modelo.Excusa,com.controlador.ControlEstudiante,com.controlador.ControladorExcusa" session="true" %>
<%
    String idestudiante;
    try {
        idestudiante = request.getParameter("id");
    } catch (Exception ex) {
        idestudiante = null;
    }
    out.print("<span style='margin: 0 0 0 23px;'><a id='volver' href=''><img src='images/ICONS/back.png'>Volver</a></span><script type='text/javascript'>revExcusa.ready();</script>");
    if (idestudiante != null) {
        try {
            Estudiante estudiante = ControlEstudiante.consultarClienteID(idestudiante);
            LinkedList<Integer> listaId = ControladorExcusa.listaIdExcusas(estudiante);
            if (!listaId.isEmpty()) {
%>
<table  class='tablaEstuduante' style="margin: 0 0 0 33px">
    <thead>
        <tr>
            <th>Fecha Registro</th><th>Fecha Inicio</th><th>Fecha Final</th><th>Motivo</th><th>Opciones</th>
        </tr>
    </thead>
    <tbody>
        <%
            for (int i = 0; i < listaId.size(); i++) {
                int id = listaId.get(i);
                Excusa excusa = ControladorExcusa.consultarExcusaId(id);
                String style = "";
                if (excusa.getEstado() == 1) {
                    style = "style='background-color: yellowgreen;' title='Excusa aceptada.'";
                } else if (excusa.getEstado() == 2) {
                    style = "style='background-color: #f54949;' title='Excusa no aceptada.'";
                }
        %>
        <tr <%=style%> ><td><%=excusa.getFechaExcusa()%></td><td><%=excusa.getFechaInicio()%></td><td><%=excusa.getFechaFinal()%></td><td><%=excusa.getMotivo()%></td><td><% if (excusa.getEstado() == 0) {%><a href="" id="aceptar" title="Aceptar excusa." onclick="revExcusa.aceptar(<%=excusa.getIdExcusa()%>)"><img src="images/ICONS/Green_Ball.png" /></a>&nbsp;<a href="" id="rechazar"  title="No aceptar excusa" onclick="revExcusa.rechazar(<%=excusa.getIdExcusa()%>)"><img src="images/ICONS/Red_Ball.png"/></a><%}%></td></tr>
                    <%
                            }
                        } else {
                            out.print("<script type='text/javascript'>alert('Error, no hay excusas registradas para el estudiante " + estudiante.getNombre() + " " + estudiante.getApellido() + "');$('#volver').click();</script>");
                        }
                    %>
    </tbody>
</table>
<%
        } catch (SQLException ex) {
            out.print("<script type='text/javascript'>alert(\"Error SQL: " + ex.getMessage() + "\");</script>");
        }
    } else {
        out.print("<script type='text/javascript'>alert('Error, debe selecionar algun estudiante.')</script>");
    }
%>