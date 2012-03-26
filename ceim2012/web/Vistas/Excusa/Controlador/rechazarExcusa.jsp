<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.SQLException,com.modelo.Excusa,com.controlador.ControladorExcusa" session="true" %>
<%
    int idexcusa;
    try {
        idexcusa = Integer.parseInt(request.getParameter("idexcusa"));
    } catch (Exception ex) {
        idexcusa = 0;
    }
    if (idexcusa != 0) {
        try {
            Excusa excusa = ControladorExcusa.consultarExcusaId(idexcusa);
            if (excusa.getEstado()==0){
                ControladorExcusa.rechazarExcusa(excusa);
                out.print("<script type='text/javascript'>alert('Excusa Rechazada.');$('#volver').click();</script>");
            } else if(excusa.getEstado()==1){
                out.print("<script type='text/javascript'>alert('Error, Excusa ya ha sido Aceptada.')</script>");
            } else if(excusa.getEstado()==2){
                out.print("<script type='text/javascript'>alert('Error, Excusa ya ha sido Rechazada.')</script>");
            }
        } catch (SQLException ex) {
            out.print("<script type='text/javascript'>alert(\"Error SQL: " + ex.getMessage() + "\");</script>");
        }
    } else {
        out.print("<script type='text/javascript'>alert('Error, debe selecionar alguna excusa.')</script>");
    }
%>