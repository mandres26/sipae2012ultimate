<%@page import="java.sql.SQLException,controlador.ManejadorPresupuesto,controlador.ManejadorPresupuestoIngreso,controlador.ManejadorPresupuestoGastos,modelo.Presupuesto,modelo.PresupuestoIngreso,modelo.PresupuestoGastos" %>
<%

    int idpresupuesto = 0;
    int idpresupuestoIngreso = 0;
    int idpresupuestoGastos = 0;
    int presupuestoCompletadoIngreso = 0;
    int presupuestoCompletadoGastos = 0;
    int presupuestoIngCompletadoma = 0;
    int presupuestoIngCompletadocom = 0;
    int presupuestoIngCompletadofam = 0;

    String fecha = request.getParameter("fecha");

    String descripcion = request.getParameter("descripcion");

    Presupuesto presupuesto = null;
    try {
        presupuesto = (Presupuesto) session.getAttribute("presupuesto");

    } catch (Exception ex) {
        presupuesto = null;
    }
    PresupuestoIngreso preing = null;
    try {
        preing = (PresupuestoIngreso) session.getAttribute("preing");
    } catch (Exception ex) {
        preing = null;
    }
    PresupuestoGastos pregastos = null;
    try{
    pregastos = (PresupuestoGastos) session.getAttribute("pregastos");
    }catch(Exception ex){
        pregastos = null;
    }
    if (presupuesto != null) {

        try {

            if (preing != null) {
                preing.setCompletadocom(1);
                preing.setCompletadofam(1);
                preing.setCompletadoma(1);
                ManejadorPresupuestoIngreso.modificarPresupuestoIngreso(preing, preing.getIdPresupuestoIngreso());
            } else {
                idpresupuestoIngreso = ManejadorPresupuestoIngreso.consultarIdPresupuestoIngresoDisponible();
                preing = new PresupuestoIngreso(presupuesto.getIdPresupuesto(), (idpresupuestoIngreso + 1), 0);
                preing.setCompletadocom(1);
                preing.setCompletadofam(1);
                preing.setCompletadoma(1);
                ManejadorPresupuestoIngreso.registrarPresupuestoIngreso(preing);
            }

            if (pregastos != null) {
                pregastos.setCompletadorubro(1);
                ManejadorPresupuestoGastos.modificarPresupuestoGastos(pregastos);
            } else {
                idpresupuestoGastos = ManejadorPresupuestoGastos.consultarIdPresupuestoGastosDisponible();
                pregastos = new PresupuestoGastos((idpresupuestoGastos + 1), presupuesto.getIdPresupuesto(), 0);
                pregastos.setCompletadorubro(1);
                ManejadorPresupuestoGastos.registrarPresupuestoGastos(pregastos);
            }
            presupuesto.setCompletadoIngreso(1);
            presupuesto.setCompletadoGastos(1);
            ManejadorPresupuesto.modificarPresupuesto(presupuesto, presupuesto.getIdPresupuesto());

            session.removeAttribute("presupuesto");
            session.removeAttribute("preing");
            session.removeAttribute("pregastos");

            out.print("<script type='text/javascript'>$('#container').html('');$('#finReg').hide();</script>");

        } catch (SQLException ex) {
            out.println("<label class='noexito'> Error... " + ex.getMessage() + "</label>");
        }
    } else {
        out.println("<label class='noexito'> Error... No hay presupuesto.</label>");
    }
%>