<%@page session="true" import="java.util.LinkedList,java.sql.SQLException,controlador.ManejadorPresupuesto,modelo.Presupuesto"%>
<%
    String fecha = request.getParameter("fecha");
    int idPresupuesto = 0;
    try {
        idPresupuesto = Integer.parseInt(request.getParameter("id"));
    } catch (Exception ex) {
        idPresupuesto = 0;
    }
    out.print("<input id='idpresupuesto' name='idpresupuesto' type='hidden' value='" + idPresupuesto + "'/><br><a id='volver' href='' title='Volver a la lista de presupuesto'><img src='images/back.gif' alt='regresar a la lista'/>Volver a la Lista.<script type='text/javascript'>consultarPresupuesto.seleccionar();</script></a><br><br>");
    if (idPresupuesto > 0) {
        try {
            Presupuesto presupuesto = ManejadorPresupuesto.consultarPresupuestoID(idPresupuesto);
            if (presupuesto != null) {
                if(!ManejadorPresupuesto.validarSeleccionPresupuesto(fecha)){
                if (presupuesto.getSeleccionado() != 1) {
                    if (presupuesto.getCompletadoIngreso() == 1 && presupuesto.getCompletadoGastos() == 1) {
                        ManejadorPresupuesto.seleccionarPresupuesto(presupuesto);
                        out.print("<label class='exito'>PRESUPUESTO SELECCIONADO.</label><br>");
                    } else {
                        out.print("<label class'no'>Error el registrado del Presupuesto no esta complatedo.</label><br>");
                    }
                } else {
                    out.print("<label class'no'>Error Presupuesto ya ha sido seleccionado para el año: " + presupuesto.getFecha().substring(0, 4) + ".</label><br>");
                }
                }
                else {
                    out.print("<label class'noexito'>Error ya existe un presupuesto seleccionado para este año.</label><br>");
                    }
            } else {
                out.print("<label class'noexito'>Error debe Seleccionar algún Presupuesto.</label><br>");
            }
        } catch (SQLException ex) {
            out.print("<label class'noexito'>" + ex.getMessage() + ".</label><br>");
        }
    } else {
        out.print("<label class'noexito'>Error debe Seleccionar algún Presupuesto.</label><br>");
    }
%>