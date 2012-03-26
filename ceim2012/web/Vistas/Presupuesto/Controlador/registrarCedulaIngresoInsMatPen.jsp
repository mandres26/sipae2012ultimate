<%@page import="modelo.PresupuestoGastos"%>
<%@page import="java.util.LinkedList,java.sql.*,controlador.ManejadorInsMatPen,controlador.ManejadorPresupuesto,controlador.ManejadorPresupuestoIngreso,modelo.InsMatPen,modelo.PresupuestoIngreso,modelo.Presupuesto" session='true'%>
<%
    String nivel1 = request.getParameter("nivel1");
    int cantidad1 = 0;
    double inscripcion1 = 0;
    double matricula1 = 0;
    double pension1 = 0;
    double subtotal1 = 0;

    if (!request.getParameter("cantidad1").isEmpty() && !request.getParameter("insc1").isEmpty() && !request.getParameter("matri1").isEmpty() && !request.getParameter("pens1").isEmpty() && !request.getParameter("t1").isEmpty()) {
        cantidad1 = Integer.parseInt(request.getParameter("cantidad1"));
        inscripcion1 = Double.parseDouble(request.getParameter("insc1"));
        matricula1 = Double.parseDouble(request.getParameter("matri1"));
        pension1 = Double.parseDouble(request.getParameter("pens1"));
        subtotal1 = Double.parseDouble(request.getParameter("t1"));
    }

    String nivel2 = request.getParameter("nivel2");
    int cantidad2 = 0;
    double inscripcion2 = 0;
    double matricula2 = 0;
    double pension2 = 0;
    double subtotal2 = 0;
    if (!request.getParameter("cantidad2").isEmpty() && !request.getParameter("insc2").isEmpty() && !request.getParameter("matri2").isEmpty() && !request.getParameter("pens2").isEmpty() && !request.getParameter("t2").isEmpty()) {
        cantidad2 = Integer.parseInt(request.getParameter("cantidad2"));
        inscripcion2 = Double.parseDouble(request.getParameter("insc2"));
        matricula2 = Double.parseDouble(request.getParameter("matri2"));
        pension2 = Double.parseDouble(request.getParameter("pens2"));
        subtotal2 = Double.parseDouble(request.getParameter("t2"));
    }

    String nivel3 = request.getParameter("nivel3");
    int cantidad3 = 0;
    double inscripcion3 = 0;
    double matricula3 = 0;
    double pension3 = 0;
    double subtotal3 = 0;

    if (!request.getParameter("cantidad3").isEmpty() && !request.getParameter("insc3").isEmpty() && !request.getParameter("matri3").isEmpty() && !request.getParameter("pens3").isEmpty() && !request.getParameter("t3").isEmpty()) {
        cantidad3 = Integer.parseInt(request.getParameter("cantidad3"));
        inscripcion3 = Double.parseDouble(request.getParameter("insc3"));
        matricula3 = Double.parseDouble(request.getParameter("matri3"));
        pension3 = Double.parseDouble(request.getParameter("pens3"));
        subtotal3 = Double.parseDouble(request.getParameter("t3"));
    }

    String nivel4 = request.getParameter("nivel4");
    int cantidad4 = 0;
    double inscripcion4 = 0;
    double matricula4 = 0;
    double pension4 = 0;
    double subtotal4 = 0;
    if (!request.getParameter("cantidad4").isEmpty() && !request.getParameter("insc4").isEmpty() && !request.getParameter("matri4").isEmpty() && !request.getParameter("pens4").isEmpty() && !request.getParameter("t4").isEmpty()) {
        cantidad4 = Integer.parseInt(request.getParameter("cantidad4"));
        inscripcion4 = Double.parseDouble(request.getParameter("insc4"));
        matricula4 = Double.parseDouble(request.getParameter("matri4"));
        pension4 = Double.parseDouble(request.getParameter("pens4"));
        subtotal4 = Double.parseDouble(request.getParameter("t4"));
    }


    String nivel5 = request.getParameter("nivel5");
    int cantidad5 = 0;
    double inscripcion5 = 0;
    double matricula5 = 0;
    double pension5 = 0;
    double subtotal5 = 0;
    if (!request.getParameter("cantidad5").isEmpty() && !request.getParameter("insc5").isEmpty() && !request.getParameter("matri5").isEmpty() && !request.getParameter("pens5").isEmpty() && !request.getParameter("t5").isEmpty()) {
        cantidad5 = Integer.parseInt(request.getParameter("cantidad5"));
        inscripcion5 = Double.parseDouble(request.getParameter("insc5"));
        matricula5 = Double.parseDouble(request.getParameter("matri5"));
        pension5 = Double.parseDouble(request.getParameter("pens5"));
        subtotal5 = Double.parseDouble(request.getParameter("t5"));
    }

    String nivel6 = request.getParameter("nivel6");
    int cantidad6 = 0;
    double inscripcion6 = 0;
    double matricula6 = 0;
    double pension6 = 0;
    double subtotal6 = 0;
    if (!request.getParameter("cantidad6").isEmpty() && !request.getParameter("insc6").isEmpty() && !request.getParameter("matri6").isEmpty() && !request.getParameter("pens6").isEmpty() && !request.getParameter("t6").isEmpty()) {
        cantidad6 = Integer.parseInt(request.getParameter("cantidad6"));
        inscripcion6 = Double.parseDouble(request.getParameter("insc6"));
        matricula6 = Double.parseDouble(request.getParameter("matri6"));
        pension6 = Double.parseDouble(request.getParameter("pens6"));
        subtotal6 = Double.parseDouble(request.getParameter("t6"));
    }

    String nivel7 = request.getParameter("nivel7");
    int cantidad7 = 0;
    double inscripcion7 = 0;
    double matricula7 = 0;
    double pension7 = 0;
    double subtotal7 = 0;
    if (!request.getParameter("cantidad7").isEmpty() && !request.getParameter("insc7").isEmpty() && !request.getParameter("matri7").isEmpty() && !request.getParameter("pens7").isEmpty() && !request.getParameter("t7").isEmpty()) {
        cantidad7 = Integer.parseInt(request.getParameter("cantidad7"));
        inscripcion7 = Double.parseDouble(request.getParameter("insc7"));
        matricula7 = Double.parseDouble(request.getParameter("matri7"));
        pension7 = Double.parseDouble(request.getParameter("pens7"));
        subtotal7 = Double.parseDouble(request.getParameter("t7"));
    }

    String nivel8 = request.getParameter("nivel8");
    int cantidad8 = 0;
    double inscripcion8 = 0;
    double matricula8 = 0;
    double pension8 = 0;
    double subtotal8 = 0;
    if (!request.getParameter("cantidad8").isEmpty() && !request.getParameter("insc8").isEmpty() && !request.getParameter("matri8").isEmpty() && !request.getParameter("pens8").isEmpty() && !request.getParameter("t8").isEmpty()) {
        cantidad8 = Integer.parseInt(request.getParameter("cantidad8"));
        inscripcion8 = Double.parseDouble(request.getParameter("insc8"));
        matricula8 = Double.parseDouble(request.getParameter("matri8"));
        pension8 = Double.parseDouble(request.getParameter("pens8"));
        subtotal8 = Double.parseDouble(request.getParameter("t8"));
    }

    String fecha = request.getParameter("fecha");

    String descripcion = request.getParameter("descripcion");

    double total = Integer.parseInt(request.getParameter("ttotal"));

    try {
        if (total == 0 || fecha == "" || descripcion == "") {
            out.println("<font style='font-size: 20px; color: red'> <strong> Error... FALTAN DATOS</strong> </font>");
        } else {
            int idpresupuesto = 0;
            int idpresupuestoIngreso = 0;
            int presupuestoCompletadoIngreso = 0;
            int presupuestoCompletadoGastos = 0;
            int presupuestoIngCompletadoma = 0;
            int presupuestoIngCompletadocom = 0;
            int presupuestoIngCompletadofam = 0;
            InsMatPen ins = new InsMatPen();
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
            LinkedList<InsMatPen> listaInsMatPen = new LinkedList();
            if ((cantidad1 != 0 && matricula1 != 0 && pension1 != 0 && inscripcion1 != 0) || subtotal1 > 0) {
                ins = new InsMatPen(preing.getIdPresupuesto(), preing.getIdPresupuestoIngreso(), nivel1, cantidad1, inscripcion1, matricula1, pension1, subtotal1);
                listaInsMatPen.add(ins);
            }
            if ((cantidad2 != 0 && matricula2 != 0 && pension2 != 0 && inscripcion2 != 0) || subtotal2 > 0) {
                ins = new InsMatPen(preing.getIdPresupuesto(), preing.getIdPresupuestoIngreso(), nivel2, cantidad2, inscripcion2, matricula2, pension2, subtotal2);
                listaInsMatPen.add(ins);
            }
            if ((cantidad3 != 0 && matricula3 != 0 && pension3 != 0 && inscripcion3 != 0) || subtotal3 > 0) {
                ins = new InsMatPen(preing.getIdPresupuesto(), preing.getIdPresupuestoIngreso(), nivel3, cantidad3, inscripcion3, matricula3, pension3, subtotal3);
                listaInsMatPen.add(ins);
            }
            if ((cantidad4 != 0 && matricula4 != 0 && pension4 != 0 && inscripcion4 != 0) || subtotal4 > 0) {
                ins = new InsMatPen(preing.getIdPresupuesto(), preing.getIdPresupuestoIngreso(), nivel4, cantidad4, inscripcion4, matricula4, pension4, subtotal4);
                listaInsMatPen.add(ins);
            }
            if ((cantidad5 != 0 && matricula5 != 0 && pension5 != 0 && inscripcion5 != 0) || subtotal5 > 0) {
                ins = new InsMatPen(preing.getIdPresupuesto(), preing.getIdPresupuestoIngreso(), nivel5, cantidad5, inscripcion5, matricula5, pension5, subtotal5);
                listaInsMatPen.add(ins);
            }
            if ((cantidad6 != 0 && matricula6 != 0 && pension6 != 0 && inscripcion6 != 0) || subtotal6 > 0) {
                ins = new InsMatPen(preing.getIdPresupuesto(), preing.getIdPresupuestoIngreso(), nivel6, cantidad6, inscripcion6, matricula6, pension6, subtotal6);
                listaInsMatPen.add(ins);
            }
            if ((cantidad7 != 0 && matricula7 != 0 && pension7 != 0 && inscripcion7 != 0) || subtotal7 > 0) {
                ins = new InsMatPen(preing.getIdPresupuesto(), preing.getIdPresupuestoIngreso(), nivel7, cantidad7, inscripcion7, matricula7, pension7, subtotal7);
                listaInsMatPen.add(ins);
            }
            if ((cantidad8 != 0 && matricula8 != 0 && pension8 != 0 && inscripcion8 != 0) || subtotal8 > 0) {
                ins = new InsMatPen(preing.getIdPresupuesto(), preing.getIdPresupuestoIngreso(), nivel8, cantidad8, inscripcion8, matricula8, pension8, subtotal8);
                listaInsMatPen.add(ins);
            }
            int tamList = listaInsMatPen.size();
            if (tamList > 0) {
                int j = 0;
                for (int i = 0; i < tamList; i++) {
                    ins = listaInsMatPen.get(i);
                    try {
                        if (!ManejadorPresupuesto.ExitePresupuestoID(preing.getIdPresupuesto())) {
                            ManejadorPresupuesto.registrarPresupuesto(presupuesto);
                        }
                        if (!ManejadorPresupuestoIngreso.ExitePresupuestoIngresoID(preing.getIdPresupuesto(), preing.getIdPresupuestoIngreso())) {
                            ManejadorPresupuestoIngreso.registrarPresupuestoIngreso(preing);
                        }
                        if (!ManejadorInsMatPen.existePresupuestoInsMatPen(preing.getIdPresupuesto(), preing.getIdPresupuestoIngreso(), ins.getNivel())) {
                            ManejadorInsMatPen.registrarPresupuestoInsMatPen(ins);
                        } else {
                            throw new SQLException("Ya está Registrado.");
                        }
                        j++;
                    } catch (SQLException ex) {
                        throw new SQLException("Al Registrar presupuesto de Inscripciones, Matriculas y penciones: " + ex.getMessage());
                    }
                }
                if (j == tamList) {
                    presupuestoIngCompletadoma = 1;
                    preing.setCompletadoma(presupuestoIngCompletadoma);
                    String cpt = "<script type='text/JavaScript'>$('#regInscrip').click();$('#finReg').show();</script>";
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