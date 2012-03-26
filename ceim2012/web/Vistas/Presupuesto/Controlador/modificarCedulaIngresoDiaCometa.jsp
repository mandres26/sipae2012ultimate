<%@page import="java.util.LinkedList,java.sql.*,controlador.ManejadorDiaCometa,controlador.ManejadorPresupuesto,controlador.ManejadorPresupuestoIngreso,controlador.ManejadorPresupuestoGastos,modelo.DiaCometa,modelo.Presupuesto,modelo.PresupuestoIngreso,modelo.PresupuestoGastos" session='true'%>
<%
    String nivel1 = request.getParameter("nivel1");
    int id1 = 0;
    int cantidad1 = 0;
    double valor1 = 0;
    double subtotal1 = 0;
    if (!request.getParameter("cantidad1").isEmpty() && !request.getParameter("valor1").isEmpty() && !request.getParameter("t1").isEmpty()) {
        id1 = Integer.parseInt(request.getParameter("id1"));
        cantidad1 = Integer.parseInt(request.getParameter("cantidad1"));
        valor1 = Double.parseDouble(request.getParameter("valor1"));
        subtotal1 = Integer.parseInt(request.getParameter("t1"));
    }

    String nivel2 = request.getParameter("nivel2");
    int id2 = 0;
    int cantidad2 = 0;
    double valor2 = 0;
    double subtotal2 = 0;
    if (!request.getParameter("cantidad2").isEmpty() && !request.getParameter("valor2").isEmpty() && !request.getParameter("t2").isEmpty()) {
        id2 = Integer.parseInt(request.getParameter("id2"));
        cantidad2 = Integer.parseInt(request.getParameter("cantidad2"));
        valor2 = Double.parseDouble(request.getParameter("valor2"));
        subtotal2 = Integer.parseInt(request.getParameter("t2"));
    }

    String nivel3 = request.getParameter("nivel3");
    int id3 = 0;
    int cantidad3 = 0;
    double valor3 = 0;
    double subtotal3 = 0;
    if (!request.getParameter("cantidad3").isEmpty() && !request.getParameter("valor3").isEmpty() && !request.getParameter("t3").isEmpty()) {
        id3 = Integer.parseInt(request.getParameter("id3"));
        cantidad3 = Integer.parseInt(request.getParameter("cantidad3"));
        valor3 = Double.parseDouble(request.getParameter("valor3"));
        subtotal3 = Integer.parseInt(request.getParameter("t3"));
    }

    String nivel4 = request.getParameter("nivel4");
    int id4 = 0;
    int cantidad4 = 0;
    double valor4 = 0;
    double subtotal4 = 0;
    if (!request.getParameter("cantidad4").isEmpty() && !request.getParameter("valor4").isEmpty() && !request.getParameter("t4").isEmpty()) {
        id4 = Integer.parseInt(request.getParameter("id4"));
        cantidad4 = Integer.parseInt(request.getParameter("cantidad4"));
        valor4 = Double.parseDouble(request.getParameter("valor4"));
        subtotal4 = Integer.parseInt(request.getParameter("t4"));
    }

    String nivel5 = request.getParameter("nivel5");
    int id5 = 0;
    int cantidad5 = 0;
    double valor5 = 0;
    double subtotal5 = 0;
    if (!request.getParameter("cantidad5").isEmpty() && !request.getParameter("valor5").isEmpty() && !request.getParameter("t5").isEmpty()) {
        id5 = Integer.parseInt(request.getParameter("id5"));
        cantidad5 = Integer.parseInt(request.getParameter("cantidad5"));
        valor5 = Double.parseDouble(request.getParameter("valor5"));
        subtotal5 = Integer.parseInt(request.getParameter("t5"));
    }

    String nivel6 = request.getParameter("nivel6");
    int id6= 0;
    int cantidad6 = 0;
    double valor6 = 0;
    double subtotal6 = 0;
    if (!request.getParameter("cantidad6").isEmpty() && !request.getParameter("valor6").isEmpty() && !request.getParameter("t6").isEmpty()) {
        id6 = Integer.parseInt(request.getParameter("id6"));
        cantidad6 = Integer.parseInt(request.getParameter("cantidad6"));
        valor6 = Double.parseDouble(request.getParameter("valor6"));
        subtotal6 = Integer.parseInt(request.getParameter("t6"));
    }

    String nivel7 = request.getParameter("nivel7");
    int id7 = 0;
    int cantidad7 = 0;
    double valor7 = 0;
    double subtotal7 = 0;
    if (!request.getParameter("cantidad7").isEmpty() && !request.getParameter("valor7").isEmpty() && !request.getParameter("t7").isEmpty()) {
        id7 = Integer.parseInt(request.getParameter("id7"));
        cantidad7 = Integer.parseInt(request.getParameter("cantidad7"));
        valor7 = Double.parseDouble(request.getParameter("valor7"));
        subtotal7 = Integer.parseInt(request.getParameter("t7"));
    }

    String nivel8 = request.getParameter("nivel8");
    int id8 = 0;
    int cantidad8 = 0;
    double valor8 = 0;
    double subtotal8 = 0;
    if (!request.getParameter("cantidad8").isEmpty() && !request.getParameter("valor8").isEmpty() && !request.getParameter("t8").isEmpty()) {
        id8 = Integer.parseInt(request.getParameter("id8"));
        cantidad8 = Integer.parseInt(request.getParameter("cantidad8"));
        valor8 = Double.parseDouble(request.getParameter("valor8"));
        subtotal8 = Integer.parseInt(request.getParameter("t8"));
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
            DiaCometa com = new DiaCometa();
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

                double valorAnt = subIMP + subFam + total;
                preing.setSubtotal(valorAnt);
                idpresupuestoIngreso = preing.getIdPresupuestoIngreso();
                presupuestoIngCompletadoma = preing.getCompletadoma();
                presupuestoIngCompletadocom = preing.getCompletadocom();
                presupuestoIngCompletadofam = preing.getCompletadofam();
            }
            LinkedList<DiaCometa> listaDiaCometa = new LinkedList();
            if (cantidad1 != 0 && valor1 != 0 && subtotal1 > 0) {
                com = new DiaCometa(id1,preing.getIdPresupuestoIngreso(), preing.getIdPresupuesto(), nivel1, cantidad1, valor1, subtotal1);
                listaDiaCometa.add(com);
            }
            if (cantidad2 != 0 && valor2 != 0 && subtotal2 > 0) {
                com = new DiaCometa(id2,preing.getIdPresupuestoIngreso(), preing.getIdPresupuesto(), nivel2, cantidad2, valor2, subtotal2);
                listaDiaCometa.add(com);
            }
            if (cantidad3 != 0 && valor3 != 0 && subtotal3 > 0) {
                com = new DiaCometa(id3,preing.getIdPresupuestoIngreso(), preing.getIdPresupuesto(), nivel3, cantidad3, valor3, subtotal3);
                listaDiaCometa.add(com);
            }
            if (cantidad4 != 0 && valor4 != 0 && subtotal4 > 0) {
                com = new DiaCometa(id4,preing.getIdPresupuestoIngreso(), preing.getIdPresupuesto(), nivel4, cantidad4, valor4, subtotal4);
                listaDiaCometa.add(com);
            }
            if (cantidad5 != 0 && valor5 != 0 && subtotal5 > 0) {
                com = new DiaCometa(id5,preing.getIdPresupuestoIngreso(), preing.getIdPresupuesto(), nivel5, cantidad5, valor5, subtotal5);
                listaDiaCometa.add(com);
            }
            if (cantidad6 != 0 && valor6 != 0 && subtotal6 > 0) {
                com = new DiaCometa(id6,preing.getIdPresupuestoIngreso(), preing.getIdPresupuesto(), nivel6, cantidad6, valor6, subtotal6);
                listaDiaCometa.add(com);
            }
            if (cantidad7 != 0 && valor7 != 0 && subtotal7 > 0) {
                com = new DiaCometa(id7,preing.getIdPresupuestoIngreso(), preing.getIdPresupuesto(), nivel7, cantidad7, valor7, subtotal7);
                listaDiaCometa.add(com);
            }
            if (cantidad8 != 0 && valor8 != 0 && subtotal8 > 0) {
                com = new DiaCometa(id8,preing.getIdPresupuestoIngreso(), preing.getIdPresupuesto(), nivel8, cantidad8, valor8, subtotal8);
                listaDiaCometa.add(com);
            }
            int tamList = listaDiaCometa.size();
            if (tamList > 0) {
                int j = 0;
                for (int i = 0; (i + 1) <= tamList; i++) {
                    com = listaDiaCometa.get(i);
                    try {
                        if (ManejadorDiaCometa.existePresupuestoDiaCometa(preing.getIdPresupuesto(), preing.getIdPresupuestoIngreso(), com.getNivel())) {
                            ManejadorDiaCometa.modificarPresupuestoDiaCometa(com);
                        } else {
                            ManejadorDiaCometa.registrarPresupuestoDiaCometa(com);
                        }
                        j++;
                    } catch (SQLException ex) {
                        throw new SQLException("Al Registrar Presupuesto del Dia de la Cometa: " + ex.getMessage());
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