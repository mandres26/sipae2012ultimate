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

                    if (preing != null) {
                        if (preing.getCompletadoma() == 1) {
                            LinkedList<InsMatPen> listaImp = ManejadorInsMatPen.listarPresupuestoInsMatPen(preing.getIdPresupuesto(), preing.getIdPresupuestoIngreso());
                            if (listaImp.size() != 0) {
                                InsMatPen imp = new InsMatPen();
                                double totalImp = 0;
                                String tablaImp = "<label class='titulo'>CEDULA PRESUPUESTAL DE INGRESOS POR INCRIPCIONES, MATRICULAS Y PENSIONES</label><table class='tablaimp'><thead class='thead'><tr><th>NIVEL</th><th class='cantidad'>CANTIDAD</th><th class='insc'>INSCRIPCION</th><th class='mat'>MATRICULA</th><th class='pension'>PENSION</th><th class=''>SUBTOTAL</th></tr></thead><tbody>";
                                int tamLisImp = listaImp.size();
                                for (int i = 0; i < tamLisImp; i++) {
                                    imp = listaImp.get(i);
                                    tablaImp += "<tr><td class='nivel'>" + imp.getNivel() + "</td><td>" + imp.getCantidad() + "</td><td>" + imp.getInscripcion() + "</td><td>" + imp.getMatricula() + "</td><td>" + imp.getPension() + "</td><td>" + imp.getSubTotal() + "</td></tr>";
                                    totalImp += imp.getSubTotal();
                                }
                                tablaImp += "<tr><td></td><td></td><td></td><td></td><th style='text-align: center;'>TOTAL:</th><td>" + totalImp + "</td></tr></tbody></table>";
                                out.print(tablaImp);
                            } else {
                                out.print("<label class='no'>No se han Registrados Ingresos de Inscripcion, Matricula y Pension.</label><br>");
                            }
                        } else {
                            out.print("<label class='no'>No se ha Registrado Ingreso de Inscripcion, Matricula y Pension.</label><br>");
                        }
                    } else {
                        out.print("<label class='no'>No se han Registrados Ingresos a este Presupuesto.</label><br>");
                    }
%>


<%
                } else {
                    out.print("<label class='no'>Error no se puede modificar presupuesto por que esta seleccionado para el año " + presupuesto.getFecha().substring(0, 4) + ".</label>");
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