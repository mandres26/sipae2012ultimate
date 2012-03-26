<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.LinkedList,java.sql.SQLException,modelo.DiaCometa, modelo.PresupuestoIngreso, modelo.Presupuesto,modelo.PresupuestoGastos, controlador.ManejadorDiaCometa"  session='true'%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CEDULA PRESUPUESTAL DE INGRESOS PARA EL DIA DE LA COMETA</title>
        <script type="text/javascript"  src="images/calculoPresupuestoDiaCometa.js"></script>
        <script type="text/javascript"  src="images/validarNivelesFAM.js" charset="utf-8"></script>
        <script type="text/javascript">
            $(document).ready(function(){
                ModdiaCometa.ready();
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
            int idPreing = 0;
            try {
                idPreing = Integer.parseInt(request.getParameter("idpreing"));
            } catch (Exception ex) {
                idPreing = 0;
            }
            try {
                LinkedList<DiaCometa> listaImp = ManejadorDiaCometa.listarPresupuestoDiaCometa(idPresupuesto, idPreing);
                DiaCometa parvulo = new DiaCometa();
                DiaCometa prejardin = new DiaCometa();
                DiaCometa preescolar = new DiaCometa();
                DiaCometa primero = new DiaCometa();
                DiaCometa segundo = new DiaCometa();
                DiaCometa tercero = new DiaCometa();
                DiaCometa cuarto = new DiaCometa();
                DiaCometa quinto = new DiaCometa();
                for (int i = 0; i < listaImp.size(); i++) {
                    DiaCometa imp = new DiaCometa();
                    if ((i + 1) <= listaImp.size()) {
                        imp = listaImp.get(i);
                        if (imp.getNivel().equals("parvulo")) {
                            parvulo = new DiaCometa(imp);
                        }
                        imp = new DiaCometa();
                    }
                    if ((i + 1) <= listaImp.size()) {
                        imp = listaImp.get(i);
                        if (imp.getNivel().equals("prejardin")) {
                            prejardin = new DiaCometa(imp);
                        }
                        imp = new DiaCometa();
                    }
                    if ((i + 1) <= listaImp.size()) {
                        imp = listaImp.get(i);
                        if (imp.getNivel().equals("preescolar")) {
                            preescolar = new DiaCometa(imp);
                        }
                        imp = new DiaCometa();
                    }
                    if ((i + 1) <= listaImp.size()) {
                        imp = listaImp.get(i);
                        if (imp.getNivel().equals("primero")) {
                            primero = new DiaCometa(imp);
                        }
                        imp = new DiaCometa();
                    }
                    if ((i + 1) <= listaImp.size()) {
                        imp = listaImp.get(i);
                        if (imp.getNivel().equals("segundo")) {
                            segundo = new DiaCometa(imp);
                        }
                        imp = new DiaCometa();
                    }
                    if ((i + 1) <= listaImp.size()) {
                        imp = listaImp.get(i);
                        if (imp.getNivel().equals("tercero")) {
                            tercero = new DiaCometa(imp);
                        }
                        imp = new DiaCometa();
                    }
                    if ((i + 1) <= listaImp.size()) {
                        imp = listaImp.get(i);
                        if (imp.getNivel().equals("cuarto")) {
                            cuarto = new DiaCometa(imp);
                        }
                        imp = new DiaCometa();
                    }
                    if ((i + 1) <= listaImp.size()) {
                        imp = listaImp.get(i);
                        if (imp.getNivel().equals("quinto")) {
                            quinto = new DiaCometa(imp);
                        }
                        imp = new DiaCometa();
                    }
                }
        %>
        <h3>CEDULA PRESUPUESTAL DE INGRESOS POR El DIA DE LA COMETA</h3>
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
                        <td><input id="cant1" class="validate[custom[number]]" type="text" name="cantidad1" value="<%=parvulo.getCantidad()%>" onkeyup="totalParvulo()"/></td>
                        <td><input id="valor1" class="validate[custom[number]]" type="text" name="valor1" value="<%=parvulo.getValor()%>" onkeyup="totalParvulo()"/></td>
                        <td style="text-align: center;"><div id="resulPar">0</div><input type="hidden" id="t1" name="t1" value="<%=parvulo.getSubTotal()%>" /><input type="hidden" id="id1" name="id1" value="<%=parvulo.getId()%>" /></td>
                    </tr>
                    <tr>
                        <td>PREJARDIN<input type="hidden" name="nivel2" value="prejardin" /></td>
                        <td><input id="cant2" class="validate[custom[number]]" type="text" name="cantidad2" value="<%=prejardin.getCantidad()%>" onkeyup="totalPrejardin()"/></td>
                        <td><input id="valor2" class="validate[custom[number]]" type="text" name="valor2" value="<%=prejardin.getValor()%>" onkeyup="totalPrejardin()"/></td>
                        <td style="text-align: center;"><div id="resulPre">0</div><input type="hidden" id="t2" name="t2" value="<%=prejardin.getSubTotal()%>" /><input type="hidden" id="id2" name="id2" value="<%=prejardin.getId()%>" /></td>
                    </tr>
                    <tr>
                        <td>PREESCOLAR<input type="hidden" name="nivel3" value="preescolar" /></td>
                        <td><input id="cant3" class="validate[custom[number]]" type="text" name="cantidad3" value="<%=preescolar.getCantidad()%>" onkeyup="totalPreescolar()"/></td>
                        <td><input id="valor3" class="validate[custom[number]]" type="text" name="valor3" value="<%=preescolar.getValor()%>" onkeyup="totalPreescolar()"/></td>
                        <td style="text-align: center;"><div id="resulPrees">0</div><input type="hidden" id="t3" name="t3" value="<%=preescolar.getSubTotal()%>" /><input type="hidden" id="id3" name="id3" value="<%=preescolar.getId()%>" /></td>
                    </tr>
                    <tr>
                        <td>PRIMERO<input type="hidden" name="nivel4" value="primero" /></td>
                        <td><input id="cant4" class="validate[custom[number]]" type="text" name="cantidad4" value="<%=primero.getCantidad()%>" onkeyup="totalPrimero()"/></td>
                        <td><input id="valor4" class="validate[custom[number]]" type="text" name="valor4" value="<%=primero.getValor()%>" onkeyup="totalPrimero()"/></td>
                        <td style="text-align: center;"><div id="resulPri">0</div><input type="hidden" id="t4" name="t4" value="<%=primero.getSubTotal()%>" /><input type="hidden" id="id4" name="id4" value="<%=primero.getId()%>" /></td>
                    </tr>
                    <tr>
                        <td>SEGUNDO<input type="hidden" name="nivel5" value="segundo" /></td>
                        <td><input id="cant5" class="validate[custom[number]]" type="text" name="cantidad5" value="<%=segundo.getCantidad()%>" onkeyup="totalSegundo()"/></td>
                        <td><input id="valor5" class="validate[custom[number]]" type="text" name="valor5" value="<%=segundo.getValor()%>" onkeyup="totalSegundo()"/></td>
                        <td style="text-align: center;"><div id="resulSeg">0</div><input type="hidden" id="t5" name="t5" value="<%=segundo.getSubTotal()%>" /><input type="hidden" id="id5" name="id5" value="<%=segundo.getId()%>" /></td>
                    </tr>
                    <tr>
                        <td>TERCERO<input type="hidden" name="nivel6" value="tercero" /></td>
                        <td><input id="cant6" class="validate[custom[number]]" type="text" name="cantidad6" value="<%=tercero.getCantidad()%>" onkeyup="totalTercero()"/></td>
                        <td><input id="valor6" class="validate[custom[number]]" type="text" name="valor6" value="<%=tercero.getValor()%>" onkeyup="totalTercero()"/></td>
                        <td style="text-align: center;"><div id="resulTer">0</div><input type="hidden" id="t6" name="t6" value="<%=tercero.getSubTotal()%>" /><input type="hidden" id="id6" name="id6" value="<%=tercero.getId()%>" /></td>
                    </tr>
                    <tr>
                        <td>CUARTO<input type="hidden" name="nivel7" value="cuarto" /></td>
                        <td><input id="cant7" class="validate[custom[number]]" type="text" name="cantidad7" value="<%=cuarto.getCantidad()%>" onkeyup="totalCuarto()"/></td>
                        <td><input id="valor7" class="validate[custom[number]]" type="text" name="valor7" value="<%=cuarto.getValor()%>" onkeyup="totalCuarto()"/></td>
                        <td style="text-align: center;"><div id="resulCua">0</div><input type="hidden" id="t7" name="t7" value="<%=cuarto.getSubTotal()%>" /><input type="hidden" id="id7" name="id7" value="<%=cuarto.getId()%>" /></td>
                    </tr>
                    <tr>
                        <td>QUINTO<input type="hidden" name="nivel8" value="quinto" /></td>
                        <td><input id="cant8" class="validate[custom[number]]" type="text" name="cantidad8" value="<%=quinto.getCantidad()%>" onkeyup="totalQuinto()"/></td>
                        <td><input id="valor8" class="validate[custom[number]]" type="text" name="valor8" value="<%=quinto.getValor()%>" onkeyup="totalQuinto()"/></td>
                        <td style="text-align: center;"><div id="resulQui">0</div><input type="hidden" id="t8" name="t8" value="<%=quinto.getSubTotal()%>" /><input type="hidden" id="id8" name="id8" value="<%=quinto.getId()%>" /></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <th style="text-align: center;">TOTAL:</th>
                        <td style="text-align: center;"><div id="resulTotal">0</div><input type="hidden" id="ttotal" name="ttotal" value="0" /></td>
                    </tr>
                </tbody>
            </table>
            <input type="submit" value="Guardar" /><input id="reset" type="reset" value="Limpiar" />
            <div id="result"></div>
        </form>
        <%
            } catch (SQLException ex) {
            }
        %>
    </body>
</html>