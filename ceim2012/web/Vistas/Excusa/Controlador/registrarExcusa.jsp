<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.SQLException,java.util.*,java.text.SimpleDateFormat,com.modelo.Docente,com.modelo.Acudiente,com.modelo.Estudiante,com.modelo.Excusa,com.controlador.ControladorExcusa" session="true" %>
<%
    SimpleDateFormat formato = new SimpleDateFormat("dd-MM-yyyy");

    String fechaExcusa = formato.format(new Date());
    String fechaInicio;
    String fechaFinal;
    String motivoExcusa;

    try {
        fechaInicio = request.getParameter("fechaInicio");
    } catch (Exception ex) {
        fechaInicio = null;
    }

    try {
        fechaFinal = request.getParameter("fechaFinal");
    } catch (Exception ex) {
        fechaFinal = null;
    }

    try {
        motivoExcusa = request.getParameter("motivo");
    } catch (Exception ex) {
        motivoExcusa = null;
    }
    Docente docente;
    Acudiente acudiente;
    try {
        docente = (Docente) session.getAttribute("usuario");
    } catch (Exception ex) {
        docente = null;
    }
    try {
        acudiente = (Acudiente) session.getAttribute("usuario");
    } catch (Exception ex) {
        acudiente = null;
    }
    if (acudiente != null) {
        if (!fechaExcusa.isEmpty() && !fechaInicio.isEmpty() && !fechaFinal.isEmpty() && !motivoExcusa.isEmpty()) {
            Estudiante estudiante = (Estudiante) session.getAttribute("estudiante");
            try {
                int idexcusa = ControladorExcusa.consultarIdExcusa() + 1;
                Excusa excusa = new Excusa(idexcusa, fechaExcusa, fechaInicio, fechaFinal, motivoExcusa);
                ControladorExcusa.registrarExcusa(excusa);
                ControladorExcusa.registrarExcusaEstudiante(excusa, estudiante);
                out.print("<script type='text/javascript'>alert('Excusa registrada.');$('#reset').click();</script>");
            } catch (SQLException ex) {
                out.print("<script type='text/javascript'>alert(\"Error, " + ex.getMessage() + ".\")</script>");
            }
        } else {
            out.print("<script type='text/javascript'>alert('Faltan Datos.')</script>");
        }
    } else if (docente != null){
        if (!fechaExcusa.isEmpty() && !fechaInicio.isEmpty() && !fechaFinal.isEmpty() && !motivoExcusa.isEmpty()) {
            try {
                int idexcusa = ControladorExcusa.consultarIdExcusa() + 1;
                Excusa excusa = new Excusa(idexcusa, fechaExcusa, fechaInicio, fechaFinal, motivoExcusa);
                ControladorExcusa.registrarExcusa(excusa);
                ControladorExcusa.registrarExcusaDocente(excusa, docente);
                out.print("<script type='text/javascript'>alert('Excusa registrada.');$('#reset').click();</script>");
            } catch (SQLException ex) {
                out.print("<script type='text/javascript'>alert(\"Error, " + ex.getMessage() + ".\")</script>");
            }
        } else {
            out.print("<script type='text/javascript'>alert('Faltan Datos.')</script>");
        }
    }
%>