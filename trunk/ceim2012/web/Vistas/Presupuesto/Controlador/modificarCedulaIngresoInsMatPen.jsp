<%@page import="java.util.LinkedList,java.sql.*,controlador.ManejadorInsMatPen,controlador.ManejadorPresupuesto,controlador.ManejadorPresupuestoIngreso,controlador.ManejadorPresupuestoGastos,controlador.ManejadorDiaFamilia,controlador.ManejadorDiaCometa,modelo.InsMatPen,modelo.DiaFamilia,modelo.DiaCometa,modelo.PresupuestoIngreso,modelo.Presupuesto,modelo.PresupuestoGastos" session='true'%>
<%
    String nivel1 = request.getParameter("nivel1");
    int id1 = 0;
    int cantidad1 = 0;
    double inscripcion1 = 0;
    double matricula1 = 0;
    double pension1 = 0;
    double subtotal1 = 0;

    if (!request.getParameter("cantidad1").isEmpty() && !request.getParameter("insc1").isEmpty() && !request.getParameter("matri1").isEmpty() && !request.getParameter("pens1").isEmpty() && !request.getParameter("t1").isEmpty()) {
        id1 = Integer.parseInt(request.getParameter("id1"));
        cantidad1 = Integer.parseInt(request.getParameter("cantidad1"));
        inscripcion1 = Double.parseDouble(request.getParameter("insc1"));
        matricula1 = Double.parseDouble(request.getParameter("matri1"));
        pension1 = Double.parseDouble(request.getParameter("pens1"));
        subtotal1 = Double.parseDouble(request.getParameter("t1"));
    }

    String nivel2 = request.getParameter("nivel2");
    int id2 = 0;
    int cantidad2 = 0;
    double inscripcion2 = 0;
    double matricula2 = 0;
    double pension2 = 0;
    double subtotal2 = 0;
    if (!request.getParameter("cantidad2").isEmpty() && !request.getParameter("insc2").isEmpty() && !request.getParameter("matri2").isEmpty() && !request.getParameter("pens2").isEmpty() && !request.getParameter("t2").isEmpty()) {
        id2 = Integer.parseInt(request.getParameter("id2"));
        cantidad2 = Integer.parseInt(request.getParameter("cantidad2"));
        inscripcion2 = Double.parseDouble(request.getParameter("insc2"));
        matricula2 = Double.parseDouble(request.getParameter("matri2"));
        pension2 = Double.parseDouble(request.getParameter("pens2"));
        subtotal2 = Double.parseDouble(request.getParameter("t2"));
    }

    String nivel3 = request.getParameter("nivel3");
    int id3 = 0;
    int cantidad3 = 0;
    double inscripcion3 = 0;
    double matricula3 = 0;
    double pension3 = 0;
    double subtotal3 = 0;

    if (!request.getParameter("cantidad3").isEmpty() && !request.getParameter("insc3").isEmpty() && !request.getParameter("matri3").isEmpty() && !request.getParameter("pens3").isEmpty() && !request.getParameter("t3").isEmpty()) {
        id3 = Integer.parseInt(request.getParameter("id3"));
        cantidad3 = Integer.parseInt(request.getParameter("cantidad3"));
        inscripcion3 = Double.parseDouble(request.getParameter("insc3"));
        matricula3 = Double.parseDouble(request.getParameter("matri3"));
        pension3 = Double.parseDouble(request.getParameter("pens3"));
        subtotal3 = Double.parseDouble(request.getParameter("t3"));
    }

    String nivel4 = request.getParameter("nivel4");
    int id4 = 0;
    int cantidad4 = 0;
    double inscripcion4 = 0;
    double matricula4 = 0;
    double pension4 = 0;
    double subtotal4 = 0;
    if (!request.getParameter("cantidad4").isEmpty() && !request.getParameter("insc4").isEmpty() && !request.getParameter("matri4").isEmpty() && !request.getParameter("pens4").isEmpty() && !request.getParameter("t4").isEmpty()) {
        id4 = Integer.parseInt(request.getParameter("id4"));
        cantidad4 = Integer.parseInt(request.getParameter("cantidad4"));
        inscripcion4 = Double.parseDouble(request.getParameter("insc4"));
        matricula4 = Double.parseDouble(request.getParameter("matri4"));
        pension4 = Double.parseDouble(request.getParameter("pens4"));
        subtotal4 = Double.parseDouble(request.getParameter("t4"));
    }


    String nivel5 = request.getParameter("nivel5");
    int id5 = 0;
    int cantidad5 = 0;
    double inscripcion5 = 0;
    double matricula5 = 0;
    double pension5 = 0;
    double subtotal5 = 0;
    if (!request.getParameter("cantidad5").isEmpty() && !request.getParameter("insc5").isEmpty() && !request.getParameter("matri5").isEmpty() && !request.getParameter("pens5").isEmpty() && !request.getParameter("t5").isEmpty()) {
        id5 = Integer.parseInt(request.getParameter("id5"));
        cantidad5 = Integer.parseInt(request.getParameter("cantidad5"));
        inscripcion5 = Double.parseDouble(request.getParameter("insc5"));
        matricula5 = Double.parseDouble(request.getParameter("matri5"));
        pension5 = Double.parseDouble(request.getParameter("pens5"));
        subtotal5 = Double.parseDouble(request.getParameter("t5"));
    }

    String nivel6 = request.getParameter("nivel6");
    int id6= 0;
    int cantidad6 = 0;
    double inscripcion6 = 0;
    double matricula6 = 0;
    double pension6 = 0;
    double subtotal6 = 0;
    if (!request.getParameter("cantidad6").isEmpty() && !request.getParameter("insc6").isEmpty() && !request.getParameter("matri6").isEmpty() && !request.getParameter("pens6").isEmpty() && !request.getParameter("t6").isEmpty()) {
        id6 = Integer.parseInt(request.getParameter("id6"));
        cantidad6 = Integer.parseInt(request.getParameter("cantidad6"));
        inscripcion6 = Double.parseDouble(request.getParameter("insc6"));
        matricula6 = Double.parseDouble(request.getParameter("matri6"));
        pension6 = Double.parseDouble(request.getParameter("pens6"));
        subtotal6 = Double.parseDouble(request.getParameter("t6"));
    }

    String nivel7 = request.getParameter("nivel7");
    int id7 = 0;
    int cantidad7 = 0;
    double inscripcion7 = 0;
    double matricula7 = 0;
    double pension7 = 0;
    double subtotal7 = 0;
    if (!request.getParameter("cantidad7").isEmpty() && !request.getParameter("insc7").isEmpty() && !request.getParameter("matri7").isEmpty() && !request.getParameter("pens7").isEmpty() && !request.getParameter("t7").isEmpty()) {
        id7 = Integer.parseInt(request.getParameter("id7"));
        cantidad7 = Integer.parseInt(request.getParameter("cantidad7"));
        inscripcion7 = Double.parseDouble(request.getParameter("insc7"));
        matricula7 = Double.parseDouble(request.getParameter("matri7"));
        pension7 = Double.parseDouble(request.getParameter("pens7"));
        subtotal7 = Double.parseDouble(request.getParameter("t7"));
    }

    String nivel8 = request.getParameter("nivel8");
    int id8 = 0;
    int cantidad8 = 0;
    double inscripcion8 = 0;
    double matricula8 = 0;
    double pension8 = 0;
    double subtotal8 = 0;
    if (!request.getParameter("cantidad8").isEmpty() && !request.getParameter("insc8").isEmpty() && !request.getParameter("matri8").isEmpty() && !request.getParameter("pens8").isEmpty() && !request.getParameter("t8").isEmpty()) {
        id8 = Integer.parseInt(request.getParameter("id8"));
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
            try {
                idpresupuesto = Integer.parseInt(request.getParameter("id"));
            } catch (Exception ex) {
                idpresupuesto = 0;
            }
            int idpresupuestoIngreso = 0;
            try {
                idpresupuestoIngreso = Integer.parseInt(request.getParameter("idpreing"));
            } catch (Exception ex) {
                idpresupuestoIngreso = 0;
            }
            int presupuestoCompletadoIngreso = 0;
            int presupuestoCompletadoGastos = 0;
            int presupuestoIngCompletadoma = 0;
            int presupuestoIngCompletadocom = 0;
            int presupuestoIngCompletadofam = 0;
            InsMatPen ins = new InsMatPen();
            Presupuesto presupuesto = ManejadorPresupuesto.consultarPresupuestoID(idpresupuesto);
            PresupuestoIngreso preing = ManejadorPresupuestoIngreso.consultarPresupuestoIngresoID(idpresupuestoIngreso, idpresupuesto);
            
            PresupuestoGastos pregastos = ManejadorPresupuestoGastos.consultarPresupuestoGastosPresupuesto(idpresupuesto);
            if (presupuesto != null) {
                idpresupuesto = presupuesto.getIdPresupuesto();
                fecha = presupuesto.getFecha().substring(0, 4);
                presupuestoCompletadoIngreso = presupuesto.getCompletadoIngreso();
                presupuestoCompletadoGastos = presupuesto.getCompletadoGastos();
                presupuesto.setDescripcion(descripcion);
                
                double subFam = ManejadorPresupuestoIngreso.subtotalFAM(preing);
                double subCom = ManejadorPresupuestoIngreso.subtotalCOM(preing);
                double subIMP = ManejadorPresupuestoIngreso.subtotalIMP(preing);
                
                double valorAnt = subFam+subCom+total;
                preing.setSubtotal(valorAnt);
                idpresupuestoIngreso = preing.getIdPresupuestoIngreso();
                presupuestoIngCompletadoma = preing.getCompletadoma();
                presupuestoIngCompletadocom = preing.getCompletadocom();
                presupuestoIngCompletadofam = preing.getCompletadofam();

            }
            LinkedList<InsMatPen> listaInsMatPen = new LinkedList();
            if ((cantidad1 != 0 && matricula1 != 0 && pension1 != 0 && inscripcion1 != 0) || subtotal1 > 0) {
                ins = new InsMatPen(id1,preing.getIdPresupuesto(), preing.getIdPresupuestoIngreso(), nivel1, cantidad1, inscripcion1, matricula1, pension1, subtotal1);
                listaInsMatPen.add(ins);
            }
            if ((cantidad2 != 0 && matricula2 != 0 && pension2 != 0 && inscripcion2 != 0) || subtotal2 > 0) {
                ins = new InsMatPen(id2,preing.getIdPresupuesto(), preing.getIdPresupuestoIngreso(), nivel2, cantidad2, inscripcion2, matricula2, pension2, subtotal2);
                listaInsMatPen.add(ins);
            }
            if ((cantidad3 != 0 && matricula3 != 0 && pension3 != 0 && inscripcion3 != 0) || subtotal3 > 0) {
                ins = new InsMatPen(id3,preing.getIdPresupuesto(), preing.getIdPresupuestoIngreso(), nivel3, cantidad3, inscripcion3, matricula3, pension3, subtotal3);
                listaInsMatPen.add(ins);
            }
            if ((cantidad4 != 0 && matricula4 != 0 && pension4 != 0 && inscripcion4 != 0) || subtotal4 > 0) {
                ins = new InsMatPen(id4,preing.getIdPresupuesto(), preing.getIdPresupuestoIngreso(), nivel4, cantidad4, inscripcion4, matricula4, pension4, subtotal4);
                listaInsMatPen.add(ins);
            }
            if ((cantidad5 != 0 && matricula5 != 0 && pension5 != 0 && inscripcion5 != 0) || subtotal5 > 0) {
                ins = new InsMatPen(id5,preing.getIdPresupuesto(), preing.getIdPresupuestoIngreso(), nivel5, cantidad5, inscripcion5, matricula5, pension5, subtotal5);
                listaInsMatPen.add(ins);
            }
            if ((cantidad6 != 0 && matricula6 != 0 && pension6 != 0 && inscripcion6 != 0) || subtotal6 > 0) {
                ins = new InsMatPen(id6,preing.getIdPresupuesto(), preing.getIdPresupuestoIngreso(), nivel6, cantidad6, inscripcion6, matricula6, pension6, subtotal6);
                listaInsMatPen.add(ins);
            }
            if ((cantidad7 != 0 && matricula7 != 0 && pension7 != 0 && inscripcion7 != 0) || subtotal7 > 0) {
                ins = new InsMatPen(id7,preing.getIdPresupuesto(), preing.getIdPresupuestoIngreso(), nivel7, cantidad7, inscripcion7, matricula7, pension7, subtotal7);
                listaInsMatPen.add(ins);
            }
            if ((cantidad8 != 0 && matricula8 != 0 && pension8 != 0 && inscripcion8 != 0) || subtotal8 > 0) {
                ins = new InsMatPen(id8,preing.getIdPresupuesto(), preing.getIdPresupuestoIngreso(), nivel8, cantidad8, inscripcion8, matricula8, pension8, subtotal8);
                listaInsMatPen.add(ins);
            }
            int tamList = listaInsMatPen.size();
            if (tamList > 0) {
                int j = 0;
                for (int i = 0; i < tamList; i++) {
                    ins = listaInsMatPen.get(i);
                    try {
                        if (ManejadorInsMatPen.existePresupuestoInsMatPen(preing.getIdPresupuesto(), preing.getIdPresupuestoIngreso(), ins.getNivel())) {
                            ManejadorInsMatPen.modificarPresupuestoInsMatPen(ins);
                        } else {
                            ManejadorInsMatPen.registrarPresupuestoInsMatPen(ins);
                        }
                        j++;
                    } catch (SQLException ex) {
                        throw new SQLException("Al Modificar presupuesto de Inscripciones, Matriculas y penciones: " + ex.getMessage());
                    }
                }
                if (j == tamList) {
                    ManejadorPresupuestoIngreso.modificarPresupuestoIngreso(preing, preing.getIdPresupuesto());
                    presupuestoCompletadoIngreso = 1;
                    presupuesto.setCompletadoIngreso(presupuestoCompletadoIngreso);
                    presupuesto.setTotal(preing.getSubtotal() - pregastos.getSubtotal());
                    ManejadorPresupuesto.modificarPresupuesto(presupuesto, presupuesto.getIdPresupuesto());

                    out.println("<label class='exito'>MODIFICADO CON EXITO</label>");
                } else {
                    throw new SQLException("AL MODIFICAR PRESUPUESTO.");
                }
            }
        }
    } catch (SQLException ex) {
        out.println("<label class='noexito'> Error... " + ex.getMessage() + "</label>");
    }
%>