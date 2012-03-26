<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.LinkedList,java.sql.SQLException,modelo.PresupuestoIngreso,modelo.Presupuesto,modelo.PresupuestoGastos,controlador.ManejadorRubro,modelo.Rubro"  session='true'%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PRESUPUESTO DE GASTOS</title>
        <script type="text/javascript"  src="images/calculoPresupuestoGastos.js" charset="utf-8"></script>
        <script type="text/javascript">
            $(document).ready(function() {
                Modgastos.ready();
            });
        </script>
    </head>
    <body>
        <%
            int idPresupuesto = 0;
            try {
                idPresupuesto = Integer.parseInt(request.getParameter("id"));
            } catch (Exception ex) {
                idPresupuesto = 0;
            }
            int idPregas = 0;
            try {
                idPregas = Integer.parseInt(request.getParameter("idpregastos"));
            } catch (Exception ex) {
                idPregas = 0;
            }
            try {
                LinkedList<Rubro> listaImp = ManejadorRubro.listarRubro(idPresupuesto, idPregas);
                    Rubro arriendo = new Rubro();
                    Rubro energia = new Rubro();
                    Rubro agua = new Rubro();
                    Rubro gas = new Rubro();
                    Rubro Int = new Rubro();
                    Rubro didactico = new Rubro();
                    Rubro papeleria = new Rubro();
                    Rubro nomina = new Rubro();
                    Rubro suministros = new Rubro();
                    Rubro mantenimiento = new Rubro();
                    Rubro otros = new Rubro();
                    for (int i = 0; i < listaImp.size(); i++) {
                        Rubro imp = new Rubro();
                        if ((i + 1) <= listaImp.size()) {
                            imp = listaImp.get(i);
                            if (imp.getConcepto().equals("Arriendo")) {
                                arriendo = new Rubro(imp);
                            }
                            imp = new Rubro();
                        }
                        if ((i + 1) <= listaImp.size()) {
                            imp = listaImp.get(i);
                            if (imp.getConcepto().equals("Servicio de energía")) {
                                energia = new Rubro(imp);
                            }
                            imp = new Rubro();
                        }
                        if ((i + 1) <= listaImp.size()) {
                            imp = listaImp.get(i);
                            if (imp.getConcepto().equals("Servicio de agua potable")) {
                                agua = new Rubro(imp);
                            }
                            imp = new Rubro();
                        }
                        if ((i + 1) <= listaImp.size()) {
                            imp = listaImp.get(i);
                            if (imp.getConcepto().equals("Servicio de gas")) {
                                gas = new Rubro(imp);
                            }
                            imp = new Rubro();
                        }
                        if ((i + 1) <= listaImp.size()) {
                            imp = listaImp.get(i);
                            if (imp.getConcepto().equals("Servicio de telefonia e internet")) {
                                Int = new Rubro(imp);
                            }
                            imp = new Rubro();
                        }
                        if ((i + 1) <= listaImp.size()) {
                            imp = listaImp.get(i);
                            if (imp.getConcepto().equals("Material Didactico")) {
                                didactico = new Rubro(imp);
                            }
                            imp = new Rubro();
                        }
                        if ((i + 1) <= listaImp.size()) {
                            imp = listaImp.get(i);
                            if (imp.getConcepto().equals("Papeleria")) {
                                papeleria = new Rubro(imp);
                            }
                            imp = new Rubro();
                        }
                        if ((i + 1) <= listaImp.size()) {
                            imp = listaImp.get(i);
                            if (imp.getConcepto().equals("Nomina")) {
                                nomina = new Rubro(imp);
                            }
                            imp = new Rubro();
                        }
                        if ((i + 1) <= listaImp.size()) {
                            imp = listaImp.get(i);
                            if (imp.getConcepto().equals("Suministros")) {
                                suministros = new Rubro(imp);
                            }
                            imp = new Rubro();
                        }
                        if ((i + 1) <= listaImp.size()) {
                            imp = listaImp.get(i);
                            if (imp.getConcepto().equals("Mantenimiento")) {
                                mantenimiento = new Rubro(imp);
                            }
                            imp = new Rubro();
                        }
                        if ((i + 1) <= listaImp.size()) {
                            imp = listaImp.get(i);
                            if (imp.getConcepto().equals("Otros")) {
                                otros = new Rubro(imp);
                            }
                            imp = new Rubro();
                        }
                    }

        %>
        <h3>CEDULA PRESUPUESTAL DE GASTOS</h3>
        <form id="form1" action="" method="post">
            <table>
                <thead>
                    <tr>
                        <th>CONCEPTO</th>
                        <th>VALOR</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody id="tbody">
                    <tr>
                        <td>ARRIENDO</td>
                        <td><input id="valor1" name="valor1" class="validate[custom[number]]"  type="text" value="<%=arriendo.getValor()%>" onkeyup="totalArriendo()"/></td>
                        <td><input type="hidden" id="t1" name="t1" value="<%=arriendo.getValor()%>" /><input type="hidden" id="id1" name="id1" value="<%=arriendo.getId()%>" /><input type="hidden" value="Arriendo" name="concepto1" /></td>
                    </tr>
                    <tr>
                        <td>SERVICIO DE ENERGIA</td>
                        <td><input id="valor2" name="valor2" class="validate[custom[number]]"  type="text" value="<%=energia.getValor()%>" onkeyup="totalServicioEnergia()"/></td>
                        <td><input type="hidden" id="t2" name="t2" value="<%=energia.getValor()%>" /><input type="hidden" id="id2" name="id2" value="<%=energia.getId()%>" /><input type="hidden" value="Servicio de energía" name="concepto2" /></td>
                    </tr>
                    <tr>
                        <td>SERVICIO DE AGUA POTABLE</td>
                        <td><input id="valor3" name="valor3" class="validate[custom[number]]"  type="text" value="<%=agua.getValor()%>" onkeyup="totalServicioAgua()"/></td>
                        <td><input type="hidden" id="t3" name="t3" value="<%=agua.getValor()%>" /><input type="hidden" id="id3" name="id3" value="<%=agua.getId()%>" /><input type="hidden" value="Servicio de agua potable" name="concepto3" /></td>
                    </tr>
                    <tr>
                        <td>SERVICIO DE GAS</td>
                        <td><input id="valor4" name="valor4" class="validate[custom[number]]"  type="text" value="<%=gas.getValor()%>" onkeyup="totalServicioGas()"/></td>
                        <td><input type="hidden" id="t4" name="t4" value="<%=gas.getValor()%>" /><input type="hidden" id="id4" name="id4" value="<%=gas.getId()%>" /><input type="hidden" value="Servicio de gas" name="concepto4" /></td>
                    </tr>
                    <tr>
                        <td>SERVICIO DE TELEFONIA E INTERNET</td>
                        <td><input id="valor5" name="valor5" class="validate[custom[number]]"  type="text" value="<%=Int.getValor()%>" onkeyup="totalServicioTel()"/></td>
                        <td><input type="hidden" id="t5" name="t5" value="<%=Int.getValor()%>" /><input type="hidden" id="id5" name="id5" value="<%=Int.getId()%>" /><input type="hidden" value="Servicio de telefonia e internet" name="concepto5" /></td>
                    </tr>
                    <tr>
                        <td>MATERIAL DIDACTICO</td>
                        <td><input id="valor6" name="valor6" class="validate[custom[number]]"  type="text" value="<%=didactico.getValor()%>" onkeyup="totalDidactico()"/></td>
                        <td><input type="hidden" id="t6" name="t6" value="<%=didactico.getValor()%>" /><input type="hidden" id="id6" name="id6" value="<%=didactico.getId()%>" /><input type="hidden" value="Material Didactico" name="concepto6" /></td>
                    </tr>
                    <tr>
                        <td>PAPELERIA</td>
                        <td><input id="valor7" name="valor7" class="validate[custom[number]]"  type="text" value="<%=papeleria.getValor()%>" onkeyup="totalPapeleria()"/></td>
                        <td><input type="hidden" id="t7" name="t7" value="<%=papeleria.getValor()%>" /><input type="hidden" id="id7" name="id7" value="<%=papeleria.getId()%>" /><input type="hidden" value="Papeleria" name="concepto7" /></td>
                    </tr>
                    <tr>
                        <td>NOMINA</td>
                        <td><input id="valor8" name="valor8" class="validate[custom[number]]"  type="text" value="<%=nomina.getValor()%>" onkeyup="totalNomina()"/></td>
                        <td><input type="hidden" id="t8" name="t8" value="<%=nomina.getValor()%>" /><input type="hidden" id="id8" name="id8" value="<%=nomina.getId()%>" /><input type="hidden" value="Nomina" name="concepto8" /></td>
                    </tr>
                    <tr>
                        <td>SUMINISTROS</td>
                        <td><input id="valor9" name="valor9" class="validate[custom[number]]"  type="text" value="<%=suministros.getValor()%>" onkeyup="totalSuministros()"/></td>
                        <td><input type="hidden" id="t9" name="t9" value="<%=suministros.getValor()%>" /><input type="hidden" id="id9" name="id9" value="<%=suministros.getId()%>" /><input type="hidden" value="Suministros" name="concepto9" /></td>
                    </tr>
                    <tr>
                        <td>MANTENIMIENTOS</td>
                        <td><input id="valor10" name="valor10" class="validate[custom[number]]"  type="text" value="<%=mantenimiento.getValor()%>" onkeyup="totalMantenimiento()"/></td>
                        <td><input type="hidden" id="t10" name="t10" value="<%=mantenimiento.getValor()%>" /><input type="hidden" id="id10" name="id10" value="<%=mantenimiento.getId()%>" /><input type="hidden" value="Mantenimiento" name="concepto10" /></td>
                    </tr>
                    <tr>
                        <td>OTROS</td>
                        <td><input id="valor11" name="valor11" class="validate[custom[number]]"  type="text" value="<%=otros.getValor()%>" onkeyup="totalOtros()"/></td>
                        <td><input type="hidden" id="t11" name="t11" value="<%=otros.getValor()%>" /><input type="hidden" id="id11" name="id11" value="<%=otros.getId()%>" /><input type="hidden" value="Otros" name="concepto11" /></td>
                    </tr>
                </tbody>
                <tfoot>
                    <tr>
                        <th>Total:</th>
                        <th><label id="resulTotal">0</label></th>
                        <th><input type="hidden" id="ttotal" name="ttotal" value="0" /></th>
                    </tr>
                </tfoot>
            </table>
            <input type="submit" value="Guardar" /><input id="reset" type="reset" value="Limpiar" />
            <div id="result">

            </div>
        </form>
        <%
            } catch (SQLException ex) {
                out.println("<label class='noexito'> Error... " + ex.getMessage() + "</label>");
            }
        %>
    </body>
</html>