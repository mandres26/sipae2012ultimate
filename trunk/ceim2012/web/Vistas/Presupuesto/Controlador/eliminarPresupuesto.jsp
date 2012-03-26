<%@page import="java.sql.SQLException,java.util.LinkedList,controlador.ManejadorPresupuesto,modelo.Presupuesto, controlador.ManejadorPresupuestoIngreso,modelo.PresupuestoIngreso,controlador.ManejadorPresupuestoGastos,modelo.PresupuestoGastos,controlador.ManejadorInsMatPen,modelo.InsMatPen,controlador.ManejadorDiaFamilia,modelo.DiaFamilia,controlador.ManejadorDiaCometa,modelo.DiaCometa,controlador.ManejadorRubro,modelo.Rubro" session="true" %>
<%
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
                if (presupuesto.getSeleccionado() == 0) {
                    PresupuestoIngreso preing = null;
                    PresupuestoGastos pregastos = null;
                    if (presupuesto.getCompletadoIngreso() == 1) {
                        preing = ManejadorPresupuestoIngreso.consultarPresupuestoIngresoPresupuesto(idPresupuesto);
                    }
                    if (presupuesto.getCompletadoGastos() == 1) {
                        pregastos = ManejadorPresupuestoGastos.consultarPresupuestoGastosPresupuesto(idPresupuesto);
                    }
                    boolean eliminadoma = false;
                    boolean eliminadofam = false;
                    boolean eliminadocom = false;
                    boolean eliminadoPreIng = false;
                    boolean eliminadorubro = false;
                    boolean eliminadoPreGastos = false;
                    boolean eliminadoPresupuesto = false;

                    if (preing != null) {
                        eliminadoma = ManejadorInsMatPen.elimiarPresupuestoInsMatPen(preing.getIdPresupuesto(), preing.getIdPresupuestoIngreso());
                        if (!eliminadoma) {
                            out.print("<label class='no'>No se elimino el ingreso de Inscripciones, Matricula y Pensión.</label><br>");
                        }
                        eliminadofam = ManejadorDiaFamilia.elimiarPresupuestoDiaFamilia(preing.getIdPresupuesto(), preing.getIdPresupuestoIngreso());
                        if (!eliminadofam) {
                            out.print("<label class='no'>No se elimino el ingreso del Dia de la Familia.</label><br>");
                        }
                        eliminadocom = ManejadorDiaCometa.elimiarPresupuestoDiaCometa(preing.getIdPresupuesto(), preing.getIdPresupuestoIngreso());
                        if (!eliminadocom) {
                            out.print("<label class='no'>No se elimino el ingreso del Dia de la Cometa.</label><br>");
                        }
                        eliminadoPreIng = ManejadorPresupuestoIngreso.elimiarPresupuestoIngreso(preing);
                        if (!eliminadoPreIng) {
                            out.print("<label class='no'>No se elimino el Presupuesto de Ingreso.</label><br>");
                        }
                    } else {
                        out.print("<label class='no'>No se han Registrados Ingresos a este Presupuesto.</label><br>");
                    }

                    if (pregastos != null) {
                        eliminadorubro = ManejadorRubro.elimiarRubro(pregastos.getIdPresupuesto(), pregastos.getIdPresupuestoGastos());
                        if (!eliminadorubro) {
                            out.print("<label class='no'>No se elimino el Gasto.</label><br>");
                        }
                        eliminadoPreGastos = ManejadorPresupuestoGastos.elimiarPresupuestoGastos(pregastos.getIdPresupuestoGastos(), pregastos.getIdPresupuesto());
                        if (!eliminadoPreGastos) {
                            out.print("<label class='no'>No se elimino el Presupuesto de Gastos.</label><br>");
                        }
                    } else {
                        out.print("<label class='no'>No se han Registrados Gastos a este Presupuesto.</label><br>");
                    }

                    if (eliminadoma && eliminadofam && eliminadocom && eliminadoPreIng && eliminadorubro && eliminadoPreGastos) {
                        eliminadoPresupuesto = ManejadorPresupuesto.elimiarPresupuesto(presupuesto.getIdPresupuesto());
                        if (eliminadoPresupuesto) {
                            out.println("<label class='exito'>Presupuesto eliminado con exito.</label>");
                        }
                    }
                } else {
                    out.print("<label class='no'>Error no se puede eliminar presupuesto por que esta seleccionado para el año " + presupuesto.getFecha().substring(0, 4) + ".</label>");
                }
            } else {
                out.print("<label class='no'>Error debe seleccionar algún Presupuesto.</label>");
            }
        } catch (SQLException ex) {
            out.print("<label class='noexito'>" + ex.getMessage() + ".</label><br>");
        }
    } else {
        out.print("<label class='noexito'>Error debe Seleccionar algún Presupuesto.</label><br>");
    }
%>