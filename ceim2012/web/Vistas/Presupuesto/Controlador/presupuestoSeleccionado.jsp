<%@page import="java.sql.SQLException,java.util.LinkedList,controlador.ManejadorPresupuesto,modelo.Presupuesto, controlador.ManejadorPresupuestoIngreso,modelo.PresupuestoIngreso,controlador.ManejadorPresupuestoGastos,modelo.PresupuestoGastos,controlador.ManejadorInsMatPen,modelo.InsMatPen,controlador.ManejadorDiaFamilia,modelo.DiaFamilia,controlador.ManejadorDiaCometa,modelo.DiaCometa,controlador.ManejadorRubro,modelo.Rubro" session="true" %>
<%
    String op = request.getParameter("op");
    String script = "";
    if (op.equals("listar")) {
        script = "<script type='text/javascript'>listarPresupuesto.seleccionar();</script>";
    } else {
        script = "<script type='text/javascript'>consultarPresupuesto.seleccionar();</script>";
    }
    int idPresupuesto = 0;
    try {
        idPresupuesto = Integer.parseInt(request.getParameter("id"));
    } catch (Exception ex) {
        idPresupuesto = 0;
    }
    out.print("<input id='idpresupuesto' name='idpresupuesto' type='hidden' value='" + idPresupuesto + "'/><br><a id='volver' href='' title='Volver a la lista de presupuesto'><img src='images/back.gif' alt='regresar a la lista'/>Volver a la Lista.</a><br><br>" + script);
    if (idPresupuesto > 0) {
        try {
            Presupuesto presupuesto = ManejadorPresupuesto.consultarPresupuestoID(idPresupuesto);
            if (presupuesto != null) {
                if (!op.equals("listar")) {
                    if (presupuesto.getSeleccionado() != 1) {
                        out.print(" <fieldset><legend>OPCIONES</legend><a id='seleccionar' href='' title='Seleccionar presupuesto para el Año: .'>Seleccionar</a><br><a id='eliminar' href='' title='Eliminar presupuesto.'>Eliminar</a><br><a id='modificar' href='' title='Modificar presupuesto.'>Modificar</a></fieldset><br><br>");
                    }
                }
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

                    if (preing.getCompletadofam() == 1) {
                        LinkedList<DiaFamilia> listaFam = ManejadorDiaFamilia.listarPresupuestoDiaFamilia(preing.getIdPresupuesto(), preing.getIdPresupuestoIngreso());
                        if (listaFam.size() != 0) {
                            DiaFamilia fam = new DiaFamilia();
                            double totalFam = 0;
                            String tablaFam = "<label class='titulo'>CEDULA PRESUPUESTAL DEl DIA DE LA FAMILIA</label><table class='tablaimp'><thead class='thead'><tr><th>NIVEL</th><th class='cantidad'>CANTIDAD</th><th class='insc'>VALOR</th><th class=''>SUBTOTAL</th></tr></thead><tbody>";
                            int tamLisFam = listaFam.size();
                            for (int i = 0; i < tamLisFam; i++) {
                                fam = listaFam.get(i);
                                tablaFam += "<tr><td class='nivel'>" + fam.getNivel() + "</td><td>" + fam.getCantidad() + "</td><td>" + fam.getValor() + "</td><td>" + fam.getSubTotal() + "</td></tr>";
                                totalFam += fam.getSubTotal();
                            }
                            tablaFam += "<tr><td></td><td></td><th style='text-align: center;'>TOTAL:</th><td>" + totalFam + "</td></tr></tbody></table>";
                            out.print(tablaFam);
                        } else {
                            out.print("<label class='no'>No se han Registrados Ingresos del dia de la Familia.</label><br>");
                        }
                    } else {
                        out.print("<label class='no'>No se han Registrados Ingresos del dia de la Familia.</label><br>");
                    }

                    if (preing.getCompletadocom() == 1) {
                        LinkedList<DiaCometa> listaCom = ManejadorDiaCometa.listarPresupuestoDiaCometa(preing.getIdPresupuesto(), preing.getIdPresupuestoIngreso());
                        if (listaCom.size() != 0) {
                            DiaCometa com = new DiaCometa();
                            double totalCom = 0;
                            String tablaCom = "<label class='titulo'>CEDULA PRESUPUESTAL DEl DIA DE LA COMETA</label><table class='tablaimp'><thead class='thead'><tr><th>NIVEL</th><th class='cantidad'>CANTIDAD</th><th class='insc'>VALOR</th><th class=''>SUBTOTAL</th></tr></thead><tbody>";
                            int tamLisCom = listaCom.size();
                            for (int i = 0; i < tamLisCom; i++) {
                                com = listaCom.get(i);
                                tablaCom += "<tr><td class='nivel'>" + com.getNivel() + "</td><td>" + com.getCantidad() + "</td><td>" + com.getValor() + "</td><td>" + com.getSubTotal() + "</td></tr>";
                                totalCom += com.getSubTotal();
                            }
                            tablaCom += "<tr><td></td><td></td><th style='text-align: center;'>TOTAL:</th><td>" + totalCom + "</td></tr></tbody></table>";
                            out.print(tablaCom);
                        } else {
                            out.print("<label class='no'>No se han Registrados Ingresos del dia de la Cometa.</label><br>");
                        }
                    } else {
                        out.print("<label class='no'>No se han Registrados Ingresos a este Presupuesto.</label><br>");
                    }
                } else {
                    out.print("<label class='no'>No se han Registrados Ingresos a este Presupuesto.</label><br>");
                }
                if (pregastos != null) {
                    if (pregastos.getCompletadorubro() == 1) {
                        LinkedList<Rubro> listaRub = ManejadorRubro.listarRubro(pregastos.getIdPresupuesto(), pregastos.getIdPresupuestoGastos());
                        if (listaRub.size() != 0) {
                            Rubro rub = new Rubro();
                            double totalRub = 0;
                            String tablaRub = "<label class='titulo'>CEDULA PRESUPUESTAL DE GASTOS</label><table class='tablaimp'><thead class='thead'><tr><th>CONCEPTO</th><th class='cantidad'>VALOR</th></tr></thead><tbody>";
                            int tamLisRub = listaRub.size();
                            for (int i = 0; i < tamLisRub; i++) {
                                rub = listaRub.get(i);
                                tablaRub += "<tr><td class='nivel'>" + rub.getConcepto() + "</td><td>" + rub.getValor() + "</td></tr>";
                                totalRub += rub.getValor();
                            }
                            tablaRub += "<tr><th style='text-align: center;'>TOTAL:</th><td>" + totalRub + "</td></tr></tbody></table>";
                            out.print(tablaRub);
                        } else {
                            out.print("<label class='no'>No se han Registrados Gastos a este Presupuesto.</label><br>");
                        }
                    } else {
                        out.print("<label class='no'>No se han Registrados Gastos a este Presupuesto.</label><br>");
                    }
                } else {
                    out.print("<label class='no'>No se han Registrados Gastos a este Presupuesto.</label><br>");
                }
            } else {
                out.print("<label class='noexito'>Error debe Seleccionar algún Presupuesto.</label><br>");
            }
        } catch (SQLException ex) {
            out.print("<label class='noexito'>" + ex.getMessage() + ".</label><br>");
        }
    } else {
        out.print("<label class='noexito'>Error debe Seleccionar algún Presupuesto.</label><br>");
    }
%>