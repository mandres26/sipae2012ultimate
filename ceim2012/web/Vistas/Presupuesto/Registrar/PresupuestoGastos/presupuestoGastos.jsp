<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.PresupuestoIngreso,modelo.Presupuesto,modelo.PresupuestoGastos"  session='true'%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PRESUPUESTO DE GASTOS</title>
        <script type="text/javascript"  src="images/calculoPresupuestoGastos.js" charset="utf-8"></script>
        <script type="text/javascript">
            $(document).ready(function() {
                gastos.ready()
            });
        </script>
    </head>
    <body>
        <h3>CEDULA PRESUPUESTAL DE GASTOS</h3>
        <%
            Presupuesto pre = (Presupuesto) session.getAttribute("presupuesto");
            if (pre == null) {
                pre = new Presupuesto();
            }
            PresupuestoIngreso preing = (PresupuestoIngreso) session.getAttribute("preing");
            if (preing == null) {
                preing = new PresupuestoIngreso();
            }
            PresupuestoGastos pregastos = (PresupuestoGastos) session.getAttribute("pregastos");
            if (pregastos == null) {
                pregastos = new PresupuestoGastos();
            }
            if (pregastos.getCompletadorubro() != 1) {
        %>
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
                        <td><input id="valor1" name="valor1" class="validate[custom[number]]"  type="text" value="" onkeyup="totalArriendo()"/></td>
                        <td><input type="hidden" id="t1" name="t1" value="" /><input type="hidden" value="Arriendo" name="concepto1" /></td>
                    </tr>
                    <tr>
                        <td>SERVICIO DE ENERGIA</td>
                        <td><input id="valor2" name="valor2" class="validate[custom[number]]"  type="text" value="" onkeyup="totalServicioEnergia()"/></td>
                        <td><input type="hidden" id="t2" name="t2" value="" /><input type="hidden" value="Servicio de energía" name="concepto2" /></td>
                    </tr>
                    <tr>
                        <td>SERVICIO DE AGUA POTABLE</td>
                        <td><input id="valor3" name="valor3" class="validate[custom[number]]"  type="text" value="" onkeyup="totalServicioAgua()"/></td>
                        <td><input type="hidden" id="t3" name="t3" value="" /><input type="hidden" value="Servicio de agua potable" name="concepto3" /></td>
                    </tr>
                    <tr>
                        <td>SERVICIO DE GAS</td>
                        <td><input id="valor4" name="valor4" class="validate[custom[number]]"  type="text" value="" onkeyup="totalServicioGas()"/></td>
                        <td><input type="hidden" id="t4" name="t4" value="" /><input type="hidden" value="Servicio de gas" name="concepto4" /></td>
                    </tr>
                    <tr>
                        <td>SERVICIO DE TELEFONIA E INTERNET</td>
                        <td><input id="valor5" name="valor5" class="validate[custom[number]]"  type="text" value="" onkeyup="totalServicioTel()"/></td>
                        <td><input type="hidden" id="t5" name="t5" value="" /><input type="hidden" value="Servicio de telefonia e internet" name="concepto5" /></td>
                    </tr>
                    <tr>
                        <td>MATERIAL DIDACTICO</td>
                        <td><input id="valor6" name="valor6" class="validate[custom[number]]"  type="text" value="" onkeyup="totalDidactico()"/></td>
                        <td><input type="hidden" id="t6" name="t6" value="" /><input type="hidden" value="Material Didactico" name="concepto6" /></td>
                    </tr>
                    <tr>
                        <td>PAPELERIA</td>
                        <td><input id="valor7" name="valor7" class="validate[custom[number]]"  type="text" value="" onkeyup="totalPapeleria()"/></td>
                        <td><input type="hidden" id="t7" name="t7" value="" /><input type="hidden" value="Papeleria" name="concepto7" /></td>
                    </tr>
                    <tr>
                        <td>NOMINA</td>
                        <td><input id="valor8" name="valor8" class="validate[custom[number]]"  type="text" value="" onkeyup="totalNomina()"/></td>
                        <td><input type="hidden" id="t8" name="t8" value="" /><input type="hidden" value="Nomina" name="concepto8" /></td>
                    </tr>
                    <tr>
                        <td>SUMINISTROS</td>
                        <td><input id="valor9" name="valor9" class="validate[custom[number]]"  type="text" value="" onkeyup="totalSuministros()"/></td>
                        <td><input type="hidden" id="t9" name="t9" value="" /><input type="hidden" value="Suministros" name="concepto9" /></td>
                    </tr>
                    <tr>
                        <td>MANTENIMIENTOS</td>
                        <td><input id="valor10" name="valor10" class="validate[custom[number]]"  type="text" value="" onkeyup="totalMantenimiento()"/></td>
                        <td><input type="hidden" id="t10" name="t10" value="" /><input type="hidden" value="Mantenimiento" name="concepto10" /></td>
                    </tr>
                    <tr>
                        <td>OTROS</td>
                        <td><input id="valor11" name="valor11" class="validate[custom[number]]"  type="text" value="" onkeyup="totalOtros()"/></td>
                        <td><input type="hidden" id="t11" name="t11" value="" /><input type="hidden" value="Otros" name="concepto11" /></td>
                    </tr>
                </tbody>
                <tfoot>
                    <tr>
                        <th>Total:</th>
                        <th><label id="resulTotal">0</label></th>
                        <th><input type="hidden" id="ttotal" name="ttotal" value="" /></th>
                    </tr>
                </tfoot>
            </table>
            <input type="submit" value="Guardar" /><input id="reset" type="reset" value="Limpiar" />
            <div id="result">

            </div>
        </form>
        <div id="fotogastos">
            <img id="fotopregastos" src="images/presupuesto-familiar.jpg" height="210">
        </div>
        <%} else {%>
        <h4>El Presupuesto de Gastos ha sido registrado correctamente, Registre el Presupuesto de Ingreso.</h4>  
        <%}%>
    </body>
</html>