<%@page import="java.util.LinkedList,java.sql.*,controlador.ManejadorPresupuesto,controlador.ManejadorPresupuestoGastos,controlador.ManejadorPresupuestoIngreso,controlador.ManejadorRubro,modelo.Rubro,modelo.Presupuesto,modelo.PresupuestoGastos,modelo.PresupuestoIngreso" session='true'%>
<%
    String concepto1 = request.getParameter("concepto1");
    double valor1 = 0;
    int id1 = 0;
    if (!request.getParameter("t1").isEmpty()) {
        id1 = Integer.parseInt(request.getParameter("id1"));
        valor1 = Double.parseDouble(request.getParameter("t1"));
    }

    String concepto2 = request.getParameter("concepto2");
    double valor2 = 0;
    int id2 = 0;
    if (!request.getParameter("t2").isEmpty()) {
        id2 = Integer.parseInt(request.getParameter("id2"));
        valor2 = Double.parseDouble(request.getParameter("t2"));
    }

    String concepto3 = request.getParameter("concepto3");
    double valor3 = 0;
    int id3 = 0;
    if (!request.getParameter("t3").isEmpty()) {
        id3 = Integer.parseInt(request.getParameter("id3"));
        valor3 = Double.parseDouble(request.getParameter("t3"));
    }

    String concepto4 = request.getParameter("concepto4");
    double valor4 = 0;
    int id4 = 0;
    if (!request.getParameter("t4").isEmpty()) {
        id4 = Integer.parseInt(request.getParameter("id4"));
        valor4 = Double.parseDouble(request.getParameter("t4"));
    }

    String concepto5 = request.getParameter("concepto5");
    double valor5 = 0;
    int id5 = 0;
    if (!request.getParameter("t5").isEmpty()) {
        id5 = Integer.parseInt(request.getParameter("id5"));
        valor5 = Double.parseDouble(request.getParameter("t5"));
    }

    String concepto6 = request.getParameter("concepto6");
    double valor6 = 0;
    int id6 = 0;
    if (!request.getParameter("t6").isEmpty()) {
        id6 = Integer.parseInt(request.getParameter("id6"));
        valor6 = Double.parseDouble(request.getParameter("t6"));
    }

    String concepto7 = request.getParameter("concepto7");
    double valor7 = 0;
    int id7 = 0;
    if (!request.getParameter("t7").isEmpty()) {
        id7 = Integer.parseInt(request.getParameter("id7"));
        valor7 = Double.parseDouble(request.getParameter("t7"));
    }

    String concepto8 = request.getParameter("concepto8");
    double valor8 = 0;
    int id8 = 0;
    if (!request.getParameter("t8").isEmpty()) {
        id8 = Integer.parseInt(request.getParameter("id8"));
        valor8 = Double.parseDouble(request.getParameter("t8"));
    }

    String concepto9 = request.getParameter("concepto9");
    double valor9 = 0;
    int id9 = 0;
    if (!request.getParameter("t9").isEmpty()) {
        id9 = Integer.parseInt(request.getParameter("id9"));
        valor9 = Double.parseDouble(request.getParameter("t9"));
    }

    String concepto10 = request.getParameter("concepto10");
    double valor10 = 0;
    int id10 = 0;
    if (!request.getParameter("t10").isEmpty()) {
        id10 = Integer.parseInt(request.getParameter("id10"));
        valor10 = Double.parseDouble(request.getParameter("t10"));
    }

    String concepto11 = request.getParameter("concepto11");
    double valor11 = 0;
    int id11 = 0;
    if (!request.getParameter("t11").isEmpty()) {
        id11 = Integer.parseInt(request.getParameter("id11"));
        valor11 = Double.parseDouble(request.getParameter("t11"));
    }

    String fecha = request.getParameter("fecha");

    String descripcion = request.getParameter("descripcion");

    double total = Double.parseDouble(request.getParameter("ttotal"));


    try {
        if (total == 0 || fecha == "") {
            out.println("<font style='font-size: 20px; color: red'> <strong> Error... FALTAN DATOS</strong> </font>");
        } else {
            int idpresupuesto = 0;
            try {
                idpresupuesto = Integer.parseInt(request.getParameter("id"));
            } catch (Exception ex) {
                idpresupuesto = 0;
            }
            int idpresupuestoGastos = 0;
            try {
                idpresupuestoGastos = Integer.parseInt(request.getParameter("idpregastos"));
            } catch (Exception ex) {
                idpresupuestoGastos = 0;
            }
            int presupuestoCompletadoIngreso = 0;
            int presupuestoCompletadoGastos = 0;
            int presupuestoGastosCompletadorubro = 0;
            Rubro rubro = new Rubro();
            Presupuesto presupuesto = ManejadorPresupuesto.consultarPresupuestoID(idpresupuesto);
            PresupuestoGastos pregastos = ManejadorPresupuestoGastos.consultarPresupuestoGastosPresupuesto(idpresupuesto);
            if (pregastos == null)
                pregastos = new PresupuestoGastos();

            PresupuestoIngreso preing = ManejadorPresupuestoIngreso.consultarPresupuestoIngresoPresupuesto(idpresupuesto);
            if (preing == null){
                preing = new PresupuestoIngreso();

            }
            if (presupuesto != null) {
                idpresupuesto = presupuesto.getIdPresupuesto();
                fecha = presupuesto.getFecha().substring(0, 4);
                presupuestoCompletadoIngreso = presupuesto.getCompletadoIngreso();
                presupuestoCompletadoGastos = presupuesto.getCompletadoGastos();
                presupuesto.setDescripcion(descripcion);

                pregastos.setSubtotal(total);
                idpresupuestoGastos = pregastos.getIdPresupuestoGastos();
                presupuestoGastosCompletadorubro = pregastos.getCompletadorubro();

            }
            LinkedList<Rubro> listaRubro = new LinkedList();
            if (valor1 != 0) {
                rubro = new Rubro(id1,pregastos.getIdPresupuestoGastos(), pregastos.getIdPresupuesto(), concepto1, valor1);
                listaRubro.add(rubro);
            }
            if (valor2 != 0) {
                rubro = new Rubro(id2,pregastos.getIdPresupuestoGastos(), pregastos.getIdPresupuesto(), concepto2, valor2);
                listaRubro.add(rubro);
            }
            if (valor3 != 0) {
                rubro = new Rubro(id3,pregastos.getIdPresupuestoGastos(), pregastos.getIdPresupuesto(), concepto3, valor3);
                listaRubro.add(rubro);
            }
            if (valor4 != 0) {
                rubro = new Rubro(id4,pregastos.getIdPresupuestoGastos(), pregastos.getIdPresupuesto(), concepto4, valor4);
                listaRubro.add(rubro);
            }
            if (valor5 != 0) {
                rubro = new Rubro(id5,pregastos.getIdPresupuestoGastos(), pregastos.getIdPresupuesto(), concepto5, valor5);
                listaRubro.add(rubro);
            }
            if (valor6 != 0) {
                rubro = new Rubro(id6,pregastos.getIdPresupuestoGastos(), pregastos.getIdPresupuesto(), concepto6, valor6);
                listaRubro.add(rubro);
            }
            if (valor7 != 0) {
                rubro = new Rubro(id7,pregastos.getIdPresupuestoGastos(), pregastos.getIdPresupuesto(), concepto7, valor7);
                listaRubro.add(rubro);
            }
            if (valor8 != 0) {
                rubro = new Rubro(id8,pregastos.getIdPresupuestoGastos(), pregastos.getIdPresupuesto(), concepto8, valor8);
                listaRubro.add(rubro);
            }
            if (valor9 != 0) {
                rubro = new Rubro(id9,pregastos.getIdPresupuestoGastos(), pregastos.getIdPresupuesto(), concepto9, valor9);
                listaRubro.add(rubro);
            }
            if (valor10 != 0) {
                rubro = new Rubro(id10,pregastos.getIdPresupuestoGastos(), pregastos.getIdPresupuesto(), concepto10, valor10);
                listaRubro.add(rubro);
            }
            if (valor11 != 0) {
                rubro = new Rubro(id11,pregastos.getIdPresupuestoGastos(), pregastos.getIdPresupuesto(), concepto11, valor11);
                listaRubro.add(rubro);
            }
            int tamList = listaRubro.size();
            if (tamList > 0) {
                int j = 0;
                for (int i = 0; i < tamList; i++) {
                    rubro = listaRubro.get(i);
                    try {
                        if (!ManejadorPresupuestoGastos.ExitePresupuestoGastosID(pregastos.getIdPresupuesto(), pregastos.getIdPresupuestoGastos())) {
                            ManejadorPresupuestoGastos.registrarPresupuestoGastos(pregastos);
                        }
                        if (ManejadorRubro.existeRubro(pregastos.getIdPresupuesto(), pregastos.getIdPresupuestoGastos(), rubro.getConcepto())) {
                            ManejadorRubro.modificarValorRubro(rubro);
                        } else {
                            ManejadorRubro.registrarRubro(rubro);
                        }
                        j++;
                    } catch (SQLException ex) {
                        throw new SQLException("Al Modificar presupuesto de Gastos: " + ex.getMessage());
                    }
                }
                if (j == tamList) {
                    ManejadorPresupuestoGastos.modificarPresupuestoGastos(pregastos);
                    presupuestoCompletadoGastos = 1;
                    presupuesto.setCompletadoGastos(presupuestoCompletadoGastos);
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