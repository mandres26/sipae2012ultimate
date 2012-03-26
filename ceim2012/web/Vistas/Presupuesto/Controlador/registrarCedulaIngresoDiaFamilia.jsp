<%@page import="java.util.LinkedList,java.sql.*,controlador.ManejadorDiaFamilia,controlador.ManejadorPresupuesto,controlador.ManejadorPresupuestoIngreso,controlador.ManejadorPresupuestoGastos,modelo.DiaFamilia,modelo.Presupuesto,modelo.PresupuestoIngreso,modelo.PresupuestoGastos" session='true'%>
<%
    String nivel1 = request.getParameter("nivel1");
    int cantidad1 = 0;
    double valor1 = 0;
    double subtotal1 = 0;

    if (!request.getParameter("cantidad1").isEmpty() && !request.getParameter("valor1").isEmpty() && !request.getParameter("t1").isEmpty()) {
        cantidad1 = Integer.parseInt(request.getParameter("cantidad1"));
        valor1 = Double.parseDouble(request.getParameter("valor1"));
        subtotal1 = Integer.parseInt(request.getParameter("t1"));
    }

    String nivel2 = request.getParameter("nivel2");
    int cantidad2 = 0;
    double valor2 = 0;
    double subtotal2 = 0;
    if (!request.getParameter("cantidad2").isEmpty() && !request.getParameter("valor2").isEmpty() && !request.getParameter("t2").isEmpty()) {
        cantidad2 = Integer.parseInt(request.getParameter("cantidad2"));
        valor2 = Double.parseDouble(request.getParameter("valor2"));
        subtotal2 = Integer.parseInt(request.getParameter("t2"));
    }

    String nivel3 = request.getParameter("nivel3");
    int cantidad3 = 0;
    double valor3 = 0;
    double subtotal3 = 0;

    if (!request.getParameter("cantidad3").isEmpty() && !request.getParameter("valor3").isEmpty() && !request.getParameter("t3").isEmpty()) {
        cantidad3 = Integer.parseInt(request.getParameter("cantidad3"));
        valor3 = Double.parseDouble(request.getParameter("valor3"));
        subtotal3 = Integer.parseInt(request.getParameter("t3"));
    }

    String nivel4 = request.getParameter("nivel4");
    int cantidad4 = 0;
    double valor4 = 0;
    double subtotal4 = 0;
    if (!request.getParameter("cantidad4").isEmpty() && !request.getParameter("valor4").isEmpty() && !request.getParameter("t4").isEmpty()) {
        cantidad4 = Integer.parseInt(request.getParameter("cantidad4"));
        valor4 = Double.parseDouble(request.getParameter("valor4"));
        subtotal4 = Integer.parseInt(request.getParameter("t4"));
    }


    String nivel5 = request.getParameter("nivel5");
    int cantidad5 = 0;
    double valor5 = 0;
    double subtotal5 = 0;
    if (!request.getParameter("cantidad5").isEmpty() && !request.getParameter("valor5").isEmpty() && !request.getParameter("t5").isEmpty()) {
        cantidad5 = Integer.parseInt(request.getParameter("cantidad5"));
        valor5 = Double.parseDouble(request.getParameter("valor5"));
        subtotal5 = Integer.parseInt(request.getParameter("t5"));
    }

    String nivel6 = request.getParameter("nivel6");
    int cantidad6 = 0;
    double valor6 = 0;
    double subtotal6 = 0;
    if (!request.getParameter("cantidad6").isEmpty() && !request.getParameter("valor6").isEmpty() && !request.getParameter("t6").isEmpty()) {
        cantidad6 = Integer.parseInt(request.getParameter("cantidad6"));
        valor6 = Double.parseDouble(request.getParameter("valor6"));
        subtotal6 = Integer.parseInt(request.getParameter("t6"));
    }

    String nivel7 = request.getParameter("nivel7");
    int cantidad7 = 0;
    double valor7 = 0;
    double subtotal7 = 0;
    if (!request.getParameter("cantidad7").isEmpty() && !request.getParameter("valor7").isEmpty() && !request.getParameter("t7").isEmpty()) {
        cantidad7 = Integer.parseInt(request.getParameter("cantidad7"));
        valor7 = Double.parseDouble(request.getParameter("valor7"));
        subtotal7 = Integer.parseInt(request.getParameter("t7"));
    }

    String nivel8 = request.getParameter("nivel8");
    int cantidad8 = 0;
    double valor8 = 0;
    double subtotal8 = 0;
    if (!request.getParameter("cantidad8").isEmpty() && !request.getParameter("valor8").isEmpty() && !request.getParameter("t8").isEmpty()) {
        cantidad8 = Integer.parseInt(request.getParameter("cantidad8"));
        valor8 = Double.parseDouble(request.getParameter("valor8"));
        subtotal8 = Integer.parseInt(request.getParameter("t8"));
    }

    String fecha = request.getParameter("fecha");

    String descripcion = request.getParameter("descripcion");

    double total = Integer.parseInt(request.getParameter("ttotal"));

    try {
        if (total == 0 || fecha == "") {
            out.println("<font style='font-size: 20px; color: red'> <strong> Error... FALTAN DATOS</strong> </font>");
        } else {
            int idpresupuesto = 0;
            int idpresupuestoIngreso = 0;
            int presupuestoCompletadoIngreso = 0;
            int presupuestoCompletadoGastos = 0;
            int presupuestoIngCompletadoma = 0;
            int presupuestoIngCompletadocom = 0;
            int presupuestoIngCompletadofam = 0;
            DiaFamilia fam = new DiaFamilia();
            Presupuesto presupuesto = (Presupuesto) session.getAttribute("presupuesto");
            PresupuestoIngreso preing = (PresupuestoIngreso) session.getAttribute("preing");
            if (presupuesto != null) {
                idpresupuesto = presupuesto.getIdPresupuesto();
                fecha = presupuesto.getFecha();
                presupuestoCompletadoIngreso = presupuesto.getCompletadoIngreso();
                presupuestoCompletadoGastos = presupuesto.getCompletadoGastos();
                descripcion = presupuesto.getDescripcion();
                if (preing != null) {
                    preing.setSubtotal(total+preing.getSubtotal());
                    idpresupuestoIngreso = preing.getIdPresupuestoIngreso();
                    presupuestoIngCompletadoma = preing.getCompletadoma();
                    presupuestoIngCompletadocom = preing.getCompletadocom();
                    presupuestoIngCompletadofam = preing.getCompletadofam();
                } else {
                    idpresupuestoIngreso = ManejadorPresupuestoIngreso.consultarIdPresupuestoIngresoDisponible();
                    preing = new PresupuestoIngreso(presupuesto.getIdPresupuesto(), (idpresupuestoIngreso + 1), total);
                }
            } else {
                idpresupuesto = ManejadorPresupuesto.consultarIdPresupuestoDisponible();
                idpresupuestoIngreso = ManejadorPresupuestoIngreso.consultarIdPresupuestoIngresoDisponible();
                presupuesto = new Presupuesto((idpresupuesto + 1), fecha, descripcion);
                preing = new PresupuestoIngreso(presupuesto.getIdPresupuesto(), (idpresupuestoIngreso + 1), total);
            }
            LinkedList<DiaFamilia> listaDiaFamilia = new LinkedList();
            if (cantidad1 != 0 && valor1 != 0 && subtotal1 > 0) {
                fam = new DiaFamilia(preing.getIdPresupuestoIngreso(), preing.getIdPresupuesto(), nivel1, cantidad1, valor1, subtotal1);
                listaDiaFamilia.add(fam);
            }
            if (cantidad2 != 0 && valor2 != 0 && subtotal2 > 0) {
                fam = new DiaFamilia(preing.getIdPresupuestoIngreso(), preing.getIdPresupuesto(), nivel2, cantidad2, valor2, subtotal2);
                listaDiaFamilia.add(fam);
            }
            if (cantidad3 != 0 && valor3 != 0 && subtotal3 > 0) {
                fam = new DiaFamilia(preing.getIdPresupuestoIngreso(), preing.getIdPresupuesto(), nivel3, cantidad3, valor3, subtotal3);
                listaDiaFamilia.add(fam);
            }
            if (cantidad4 != 0 && valor4 != 0 && subtotal4 > 0) {
                fam = new DiaFamilia(preing.getIdPresupuestoIngreso(), preing.getIdPresupuesto(), nivel4, cantidad4, valor4, subtotal4);
                listaDiaFamilia.add(fam);
            }
            if (cantidad5 != 0 && valor5 != 0 && subtotal5 > 0) {
                fam = new DiaFamilia(preing.getIdPresupuestoIngreso(), preing.getIdPresupuesto(), nivel5, cantidad5, valor5, subtotal5);
                listaDiaFamilia.add(fam);
            }
            if (cantidad6 != 0 && valor6 != 0 && subtotal6 > 0) {
                fam = new DiaFamilia(preing.getIdPresupuestoIngreso(), preing.getIdPresupuesto(), nivel6, cantidad6, valor6, subtotal6);
                listaDiaFamilia.add(fam);
            }
            if (cantidad7 != 0 && valor7 != 0 && subtotal7 > 0) {
                fam = new DiaFamilia(preing.getIdPresupuestoIngreso(), preing.getIdPresupuesto(), nivel7, cantidad7, valor7, subtotal7);
                listaDiaFamilia.add(fam);
            }
            if (cantidad8 != 0 && valor8 != 0 && subtotal8 > 0) {
                fam = new DiaFamilia(preing.getIdPresupuestoIngreso(), preing.getIdPresupuesto(), nivel8, cantidad8, valor8, subtotal8);
                listaDiaFamilia.add(fam);
            }
            int tamList = listaDiaFamilia.size();
            if (tamList > 0) {
                int j = 0;
                for (int i = 0; (i + 1) <= tamList; i++) {
                    fam = listaDiaFamilia.get(i);
                    try {
                        if (!ManejadorPresupuesto.ExitePresupuestoID(preing.getIdPresupuesto())) {
                            ManejadorPresupuesto.registrarPresupuesto(presupuesto);
                        }
                        if (!ManejadorPresupuestoIngreso.ExitePresupuestoIngresoID(preing.getIdPresupuesto(), preing.getIdPresupuestoIngreso())) {
                            ManejadorPresupuestoIngreso.registrarPresupuestoIngreso(preing);
                        }
                        if (!ManejadorDiaFamilia.existePresupuestoDiaFamilia(preing.getIdPresupuesto(), preing.getIdPresupuestoIngreso(), fam.getNivel())) {
                            ManejadorDiaFamilia.registrarPresupuestoDiaFamilia(fam);
                        } else {
                            throw new SQLException("Ya está Registrado.");
                        }
                        j++;
                    } catch (SQLException ex) {
                        throw new SQLException("Al Registrar presupuesto del Dia de la Familia: " + ex.getMessage());
                    }
                }
                if (j == tamList) {
                    presupuestoIngCompletadofam = 1;
                    preing.setCompletadofam(presupuestoIngCompletadofam);
                    String cpt = "<script type='text/JavaScript'>$('#regDiaFam').click();$('#finReg').show();</script>";
                    ManejadorPresupuestoIngreso.modificarPresupuestoIngreso(preing, preing.getIdPresupuesto());
                    if (presupuestoIngCompletadoma == 1 && presupuestoIngCompletadocom == 1 && presupuestoIngCompletadofam == 1) {
                        cpt = "<script type='text/JavaScript'>$('#preIngreso').click()</script>";
                        presupuestoCompletadoIngreso = 1;
                        presupuesto.setCompletadoIngreso(presupuestoCompletadoIngreso);
                        Double totalPre = preing.getSubtotal();
                        presupuesto.setTotal(totalPre + presupuesto.getTotal());
                        ManejadorPresupuesto.modificarPresupuesto(presupuesto, presupuesto.getIdPresupuesto());
                    }
                    if (presupuestoCompletadoIngreso == 1 && presupuestoCompletadoGastos == 1) {
                        PresupuestoGastos pregastos = (PresupuestoGastos) session.getAttribute("pregastos");
                        double totalPresupuesto = preing.getSubtotal() - pregastos.getSubtotal();
                        presupuesto.setTotal(totalPresupuesto);
                        ManejadorPresupuesto.modificarPresupuesto(presupuesto, presupuesto.getIdPresupuesto());
                        session.removeAttribute("presupuesto");
                        session.removeAttribute("preing");
                        session.removeAttribute("pregastos");
                    } else {
                        session.setAttribute("preing", preing);
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