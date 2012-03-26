<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.DiaCometa, modelo.PresupuestoIngreso, modelo.Presupuesto,modelo.PresupuestoGastos, controlador.ManejadorDiaCometa"  session='true'%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CEDULA PRESUPUESTAL DE INGRESOS PARA EL DIA DE LA COMETA</title>
        <script type="text/javascript"  src="images/calculoPresupuestoDiaCometa.js"></script>
        <script type="text/javascript"  src="images/validarNivelesFAM.js" charset="utf-8"></script>
        <script type="text/javascript">
            $(document).ready(function(){
                diaCometa.ready();
            });
        </script>
    </head>
    <body>
        <h3>CEDULA PRESUPUESTAL DE INGRESOS POR El DIA DE LA COMETA</h3>
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
            if (preing.getCompletadoma() != 1 || preing.getCompletadocom() != 1 || preing.getCompletadofam() != 1) {
                if (preing.getCompletadocom() != 1) {
        %>
        <form id="form3" action="" method="post">
            <table  border="0" cellspacing="5" cellpadding="1">
                <thead>
                    <tr>
                        <th>NIVEL</th>
                        <th>CANTIDAD</th>
                        <th>VALOR</th>
                        <th style="text-align: center;">SUBTOTAL</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>PARVULO<input type="hidden" name="nivel1" value="parvulo" /></td>
                        <td><input id="cant1" class="validate[custom[number]]" type="text" name="cantidad1" value="" onkeyup="totalParvulo()"/></td>
                        <td><input id="valor1" class="validate[custom[number]]" type="text" name="valor1" value="" onkeyup="totalParvulo()"/></td>
                        <td style="text-align: center;"><div id="resulPar">0</div><input type="hidden" id="t1" name="t1" value="" /></td>
                    </tr>
                    <tr>
                        <td>PREJARDIN<input type="hidden" name="nivel2" value="prejardin" /></td>
                        <td><input id="cant2" class="validate[custom[number]]" type="text" name="cantidad2" value="" onkeyup="totalPrejardin()"/></td>
                        <td><input id="valor2" class="validate[custom[number]]" type="text" name="valor2" value="" onkeyup="totalPrejardin()"/></td>
                        <td style="text-align: center;"><div id="resulPre">0</div><input type="hidden" id="t2" name="t2" value="" /></td>

                    </tr>
                    <tr>
                        <td>PREESCOLAR<input type="hidden" name="nivel3" value="preescolar" /></td>
                        <td><input id="cant3" class="validate[custom[number]]" type="text" name="cantidad3" value="" onkeyup="totalPreescolar()"/></td>
                        <td><input id="valor3" class="validate[custom[number]]" type="text" name="valor3" value="" onkeyup="totalPreescolar()"/></td>
                        <td style="text-align: center;"><div id="resulPrees">0</div><input type="hidden" id="t3" name="t3" value="" /></td>
                    </tr>
                    <tr>
                        <td>PRIMERO<input type="hidden" name="nivel4" value="primero" /></td>
                        <td><input id="cant4" class="validate[custom[number]]" type="text" name="cantidad4" value="" onkeyup="totalPrimero()"/></td>
                        <td><input id="valor4" class="validate[custom[number]]" type="text" name="valor4" value="" onkeyup="totalPrimero()"/></td>
                        <td style="text-align: center;"><div id="resulPri">0</div><input type="hidden" id="t4" name="t4" value="" /></td>
                    </tr>
                    <tr>
                        <td>SEGUNDO<input type="hidden" name="nivel5" value="segundo" /></td>
                        <td><input id="cant5" class="validate[custom[number]]" type="text" name="cantidad5" value="" onkeyup="totalSegundo()"/></td>
                        <td><input id="valor5" class="validate[custom[number]]" type="text" name="valor5" value="" onkeyup="totalSegundo()"/></td>
                        <td style="text-align: center;"><div id="resulSeg">0</div><input type="hidden" id="t5" name="t5" value="" /></td>
                    </tr>
                    <tr>
                        <td>TERCERO<input type="hidden" name="nivel6" value="tercero" /></td>
                        <td><input id="cant6" class="validate[custom[number]]" type="text" name="cantidad6" value="" onkeyup="totalTercero()"/></td>
                        <td><input id="valor6" class="validate[custom[number]]" type="text" name="valor6" value="" onkeyup="totalTercero()"/></td>
                        <td style="text-align: center;"><div id="resulTer">0</div><input type="hidden" id="t6" name="t6" value="" /></td>
                    </tr>
                    <tr>
                        <td>CUARTO<input type="hidden" name="nivel7" value="cuarto" /></td>
                        <td><input id="cant7" class="validate[custom[number]]" type="text" name="cantidad7" value="" onkeyup="totalCuarto()"/></td>
                        <td><input id="valor7" class="validate[custom[number]]" type="text" name="valor7" value="" onkeyup="totalCuarto()"/></td>
                        <td style="text-align: center;"><div id="resulCua">0</div><input type="hidden" id="t7" name="t7" value="" /></td>
                    </tr>
                    <tr>
                        <td>QUINTO<input type="hidden" name="nivel8" value="quinto" /></td>
                        <td><input id="cant8" class="validate[custom[number]]" type="text" name="cantidad8" value="" onkeyup="totalQuinto()"/></td>
                        <td><input id="valor8" class="validate[custom[number]]" type="text" name="valor8" value="" onkeyup="totalQuinto()"/></td>
                        <td style="text-align: center;"><div id="resulQui">0</div><input type="hidden" id="t8" name="t8" value="" /></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <th style="text-align: center;">TOTAL:</th>
                        <td style="text-align: center;"><div id="resulTotal">0</div><input type="hidden" id="ttotal" name="ttotal" value="" /></td>
                    </tr>
                </tbody>
            </table>
            <input type="submit" value="Guardar" /><input id="reset" type="reset" value="Limpiar" />
            <div id="result"></div>
        </form>
        <%            } else {%>
        <h4>El Ingreso del Dia de la Cometa ya esta registrado. </h4>
        <%}
        } else {%>
        <h4>El Presupuesto de Ingreso ha sido registrado correctamente. </h4>  
        <%}%>
    </body>
</html>