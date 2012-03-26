<%@page import="java.util.LinkedList,java.sql.*,controlador.ManejadorPresupuesto,controlador.ManejadorPresupuestoGastos,controlador.ManejadorPresupuestoIngreso,controlador.ManejadorRubro,modelo.Rubro,modelo.Presupuesto,modelo.PresupuestoGastos,modelo.PresupuestoIngreso" session='true'%>
<%
    String concepto1 = request.getParameter("concepto1");
    double valor1 = 0;

    if (!request.getParameter("valor1").isEmpty()) {
        valor1 = Double.parseDouble(request.getParameter("valor1"));
    }

    String concepto2 = request.getParameter("concepto2");
    double valor2 = 0;

    if (!request.getParameter("valor2").isEmpty()) {
        valor2 = Double.parseDouble(request.getParameter("valor2"));
    }

    String concepto3 = request.getParameter("concepto3");
    double valor3 = 0;

    if (!request.getParameter("valor3").isEmpty()) {
        valor3 = Double.parseDouble(request.getParameter("valor3"));
    }

    String concepto4 = request.getParameter("concepto4");
    double valor4 = 0;

    if (!request.getParameter("valor4").isEmpty()) {
        valor4 = Double.parseDouble(request.getParameter("valor4"));
    }

    String concepto5 = request.getParameter("concepto5");
    double valor5 = 0;

    if (!request.getParameter("valor5").isEmpty()) {
        valor5 = Double.parseDouble(request.getParameter("valor5"));
    }

    String concepto6 = request.getParameter("concepto6");
    double valor6 = 0;

    if (!request.getParameter("valor5").isEmpty()) {
        valor6 = Double.parseDouble(request.getParameter("valor5"));
    }

    String concepto7 = request.getParameter("concepto7");
    double valor7 = 0;

    if (!request.getParameter("valor7").isEmpty()) {
        valor7 = Double.parseDouble(request.getParameter("valor7"));
    }

    String concepto8 = request.getParameter("concepto8");
    double valor8 = 0;

    if (!request.getParameter("valor8").isEmpty()) {
        valor8 = Double.parseDouble(request.getParameter("valor8"));
    }

    String concepto9 = request.getParameter("concepto9");
    double valor9 = 0;

    if (!request.getParameter("valor9").isEmpty()) {
        valor9 = Double.parseDouble(request.getParameter("valor9"));
    }

    String concepto10 = request.getParameter("concepto10");
    double valor10 = 0;

    if (!request.getParameter("valor10").isEmpty()) {
        valor10 = Double.parseDouble(request.getParameter("valor10"));
    }

    String concepto11 = request.getParameter("concepto11");
    double valor11 = 0;

    if (!request.getParameter("valor11").isEmpty()) {
        valor11 = Double.parseDouble(request.getParameter("valor11"));
    }

    String fecha = request.getParameter("fecha");

    double total = Double.parseDouble(request.getParameter("ttotal"));


    try {
        if (total == 0 || fecha == "") {
            out.println("<font style='font-size: 20px; color: red'> <strong> Error... FALTAN DATOS</strong> </font>");
        } else {
            int idpresupuesto = 0;
            int idpresupuestoGastos = 0;
            int presupuestoCompletadoIngreso = 0;
            int presupuestoCompletadoGastos = 0;
            int presupuestoGastosCompletadorubro = 0;
            String descripcion = "";
            Rubro rubro = new Rubro();
            Presupuesto presupuesto = (Presupuesto) session.getAttribute("presupuesto");
            PresupuestoGastos pregastos = (PresupuestoGastos) session.getAttribute("pregastos");
            if (presupuesto != null) {
                idpresupuesto = presupuesto.getIdPresupuesto();
                fecha = presupuesto.getFecha();
                presupuestoCompletadoIngreso = presupuesto.getCompletadoIngreso();
                presupuestoCompletadoGastos = presupuesto.getCompletadoGastos();
                descripcion = presupuesto.getDescripcion();
                if (pregastos != null) {
                    pregastos.setSubtotal(total+pregastos.getSubtotal());
                    idpresupuestoGastos = pregastos.getIdPresupuestoGastos();
                    presupuestoGastosCompletadorubro = pregastos.getCompletadorubro();
                } else {
                    idpresupuestoGastos = ManejadorPresupuestoGastos.consultarIdPresupuestoGastosDisponible();
                    pregastos = new PresupuestoGastos((idpresupuestoGastos + 1), presupuesto.getIdPresupuesto(),total);
                }
            } else {
                idpresupuesto = ManejadorPresupuesto.consultarIdPresupuestoDisponible();
                idpresupuestoGastos = ManejadorPresupuestoGastos.consultarIdPresupuestoGastosDisponible();
                presupuesto = new Presupuesto((idpresupuesto + 1), fecha, descripcion);
                pregastos = new PresupuestoGastos((idpresupuestoGastos + 1), presupuesto.getIdPresupuesto(),total);
            }
            LinkedList<Rubro> listaRubro = new LinkedList();
            if (valor1 != 0) {
                rubro = new Rubro(pregastos.getIdPresupuestoGastos(), pregastos.getIdPresupuesto(), concepto1, valor1);
                listaRubro.add(rubro);
            }
            if (valor2 != 0) {
                rubro = new Rubro(pregastos.getIdPresupuestoGastos(), pregastos.getIdPresupuesto(), concepto2, valor2);
                listaRubro.add(rubro);
            }
            if (valor3 != 0) {
                rubro = new Rubro(pregastos.getIdPresupuestoGastos(), pregastos.getIdPresupuesto(), concepto3, valor3);
                listaRubro.add(rubro);
            }
            if (valor4 != 0) {
                rubro = new Rubro(pregastos.getIdPresupuestoGastos(), pregastos.getIdPresupuesto(), concepto4, valor4);
                listaRubro.add(rubro);
            }
            if (valor5 != 0) {
                rubro = new Rubro(pregastos.getIdPresupuestoGastos(), pregastos.getIdPresupuesto(), concepto5, valor5);
                listaRubro.add(rubro);
            }
            if (valor6 != 0) {
                rubro = new Rubro(pregastos.getIdPresupuestoGastos(), pregastos.getIdPresupuesto(), concepto6, valor6);
                listaRubro.add(rubro);
            }
            if (valor7 != 0) {
                rubro = new Rubro(pregastos.getIdPresupuestoGastos(), pregastos.getIdPresupuesto(), concepto7, valor7);
                listaRubro.add(rubro);
            }
            if (valor8 != 0) {
                rubro = new Rubro(pregastos.getIdPresupuestoGastos(), pregastos.getIdPresupuesto(), concepto8, valor8);
                listaRubro.add(rubro);
            }
            if (valor9 != 0) {
                rubro = new Rubro(pregastos.getIdPresupuestoGastos(), pregastos.getIdPresupuesto(), concepto9, valor9);
                listaRubro.add(rubro);
            }
            if (valor10 != 0) {
                rubro = new Rubro(pregastos.getIdPresupuestoGastos(), pregastos.getIdPresupuesto(), concepto10, valor10);
                listaRubro.add(rubro);
            }
            if (valor11 != 0) {
                rubro = new Rubro(pregastos.getIdPresupuestoGastos(), pregastos.getIdPresupuesto(), concepto11, valor11);
                listaRubro.add(rubro);
            }
            int tamList = listaRubro.size();
            if (tamList > 0) {
                int j = 0;
                for (int i = 0; (i + 1) <= tamList; i++) {
                    rubro = listaRubro.get(i);;
                    try {
                        if (!ManejadorPresupuesto.ExitePresupuestoID(pregastos.getIdPresupuesto())) {
                            ManejadorPresupuesto.registrarPresupuesto(presupuesto);
                        }
                        if (!ManejadorPresupuestoGastos.ExitePresupuestoGastosID(pregastos.getIdPresupuesto(), pregastos.getIdPresupuestoGastos())) {
                            ManejadorPresupuestoGastos.registrarPresupuestoGastos(pregastos);
                        }
                        if (!ManejadorRubro.existeRubro(pregastos.getIdPresupuesto(), pregastos.getIdPresupuestoGastos(), rubro.getConcepto())) {
                            ManejadorRubro.registrarRubro(rubro);
                        } else {
                            throw new SQLException("Ya está Registrado.");
                        }
                        j++;
                    } catch (SQLException ex) {
                        throw new SQLException("Al Registrar presupuesto de Gastos: " + ex.getMessage());
                    }
                }
                if (j == tamList) {
                    presupuestoGastosCompletadorubro = 1;
                    pregastos.setCompletadorubro(presupuestoGastosCompletadorubro);
                    String cpt = "<script type='text/JavaScript'>$('#preGastos').click();$('#finReg').show();</script>";
                    ManejadorPresupuestoGastos.modificarPresupuestoGastos(pregastos);
                    if (presupuestoGastosCompletadorubro == 1) {
                        cpt = "<script type='text/JavaScript'>$('#preGastos').click();</script>";
                        presupuestoCompletadoGastos = 1;
                        Double totalPre = pregastos.getSubtotal();
                        presupuesto.setCompletadoGastos(presupuestoCompletadoGastos);
                        presupuesto.setTotal(totalPre + presupuesto.getTotal());
                        ManejadorPresupuesto.modificarPresupuesto(presupuesto, presupuesto.getIdPresupuesto());
                    }
                    if (presupuestoCompletadoGastos == 1 && presupuestoCompletadoIngreso == 1) {
                        PresupuestoIngreso preing = (PresupuestoIngreso) session.getAttribute("preing");
                        double totalPresupuesto = preing.getSubtotal() - pregastos.getSubtotal();
                        presupuesto.setTotal(totalPresupuesto);
                        ManejadorPresupuesto.modificarPresupuesto(presupuesto, presupuesto.getIdPresupuesto());
                        session.removeAttribute("presupuesto");
                        session.removeAttribute("preing");
                        session.removeAttribute("pregastos");
                    } else {
                        session.setAttribute("pregastos", pregastos);
                        session.setAttribute("presupuesto", presupuesto);
                    }
                    out.println("<label class='exito'>REGISTRO EXITOSO</label>" + cpt);
                } else {
                    throw new SQLException("AL REGISTRAR PRESUPUESTO.");
                }
            }
        }
    } catch (SQLException ex) {
        out.println("<label class='noexito'> Error... " + ex.getMessage() + "</label>");
    }
%>