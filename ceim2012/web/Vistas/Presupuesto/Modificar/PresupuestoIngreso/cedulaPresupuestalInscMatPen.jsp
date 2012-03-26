<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.SQLException,java.util.LinkedList,modelo.InsMatPen, modelo.PresupuestoIngreso,modelo.Presupuesto,modelo.PresupuestoGastos, controlador.ManejadorInsMatPen"  session='true'%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CEDULA PRESUPUESTAL DE INGRESOS POR INCRIPCIONES, MATRICULAS Y PENSIONES</title>
        <script type="text/javascript"  src="images/calculoPresupuestoInscMatPen.js" charset="utf-8"></script>
        <script type="text/javascript"  src="images/validarNivelesIMP.js" charset="utf-8"></script>
        <script type="text/javascript">
            $(document).ready(function(){
                ModInscMatPen.ready();
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
                LinkedList<InsMatPen> listaImp = ManejadorInsMatPen.listarPresupuestoInsMatPen(idPresupuesto, idPreing);
                    InsMatPen parvulo = new InsMatPen();
                    InsMatPen prejardin = new InsMatPen();
                    InsMatPen preescolar = new InsMatPen();
                    InsMatPen primero = new InsMatPen();
                    InsMatPen segundo = new InsMatPen();
                    InsMatPen tercero = new InsMatPen();
                    InsMatPen cuarto = new InsMatPen();
                    InsMatPen quinto = new InsMatPen();
                    for (int i = 0; i < listaImp.size(); i++) {
                        InsMatPen imp = new InsMatPen();
                        if ((i + 1) <= listaImp.size()) {
                            imp = listaImp.get(i);
                            if (imp.getNivel().equals("parvulo")) {
                                parvulo = new InsMatPen(imp);
                            }
                            imp = new InsMatPen();
                        }
                        if ((i + 1) <= listaImp.size()) {
                            imp = listaImp.get(i);
                            if (imp.getNivel().equals("prejardin")) {
                                prejardin = new InsMatPen(imp);
                            }
                            imp = new InsMatPen();
                        }
                        if ((i + 1) <= listaImp.size()) {
                            imp = listaImp.get(i);
                            if (imp.getNivel().equals("preescolar")) {
                                preescolar = new InsMatPen(imp);
                            }
                            imp = new InsMatPen();
                        }
                        if ((i + 1) <= listaImp.size()) {
                            imp = listaImp.get(i);
                            if (imp.getNivel().equals("primero")) {
                                primero = new InsMatPen(imp);
                            }
                            imp = new InsMatPen();
                        }
                        if ((i + 1) <= listaImp.size()) {
                            imp = listaImp.get(i);
                            if (imp.getNivel().equals("segundo")) {
                                segundo = new InsMatPen(imp);
                            }
                            imp = new InsMatPen();
                        }
                        if ((i + 1) <= listaImp.size()) {
                            imp = listaImp.get(i);
                            if (imp.getNivel().equals("tercero")) {
                                tercero = new InsMatPen(imp);
                            }
                            imp = new InsMatPen();
                        }
                        if ((i + 1) <= listaImp.size()) {
                            imp = listaImp.get(i);
                            if (imp.getNivel().equals("cuarto")) {
                                cuarto = new InsMatPen(imp);
                            }
                            imp = new InsMatPen();
                        }
                        if ((i + 1) <= listaImp.size()) {
                            imp = listaImp.get(i);
                            if (imp.getNivel().equals("quinto")) {
                                quinto = new InsMatPen(imp);
                            }
                            imp = new InsMatPen();
                        }
                    }
        %>
        <h3>CEDULA PRESUPUESTAL DE INGRESOS POR INCRIPCIONES, MATRICULAS Y PENSIONES</h3>
        <form id="form1" action="" method="post">
            <table border="0" cellspacing="5" cellpadding="1">
                <thead>
                    <tr>
                        <th>NIVEL</th>
                        <th>CANTIDAD</th>
                        <th>INSCRIPCION</th>
                        <th>MATRICULA</th>
                        <th>PENSION</th>
                        <th style="text-align: center;">SUBTOTAL</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>PARVULO<input type="hidden" name="nivel1" value="parvulo" /></td>
                        <td><input id="cantidad1" class="validate[custom[number]]" type="text" name="cantidad1" value="<%=parvulo.getCantidad()%>" onkeyup="totalParvulo()"/></td>
                        <td><input id="insc1" class="validate[custom[number]]" type="text" name="insc1" value="<%=parvulo.getInscripcion()%>" onkeyup="totalParvulo()"/></td>
                        <td><input id="matri1" class="validate[custom[number]]" type="text" name="matri1" value="<%=parvulo.getMatricula()%>" onkeyup="totalParvulo()"/></td>
                        <td><input id="pens1" class="validate[custom[number]]" type="text" name="pens1" value="<%=parvulo.getPension()%>"  onkeyup="totalParvulo()"/></td>
                        <td style="text-align: center;"><div id="resulPar">0</div><input type="hidden" id="t1" name="t1" value="<%=parvulo.getSubTotal()%>" /><input type="hidden" id="id1" name="id1" value="<%=parvulo.getId()%>" /></td>
                    </tr>
                    <tr>
                        <td>PREJARDIN<input type="hidden" name="nivel2" value="prejardin" /></td>
                        <td><input id="cantidad2" class="validate[custom[number]]" type="text" name="cantidad2" value="<%=prejardin.getCantidad()%>" onkeyup="totalPrejardin()"/></td>
                        <td><input id="insc2" class="validate[custom[number]]" type="text" name="insc2" value="<%=prejardin.getInscripcion()%>" onkeyup="totalPrejardin()"/></td>
                        <td><input id="matri2" class="validate[custom[number]]" type="text" name="matri2" value="<%=prejardin.getMatricula()%>" onkeyup="totalPrejardin()"/></td>
                        <td><input id="pens2" class="validate[custom[number]]" type="text" name="pens2" value="<%=prejardin.getPension()%>" onkeyup="totalPrejardin()"/></td>
                        <td style="text-align: center;"><div id="resulPre">0</div><input type="hidden" id="t2" name="t2" value="<%=prejardin.getSubTotal()%>" /><input type="hidden" id="id2" name="id2" value="<%=prejardin.getId()%>" /></td>
                    </tr>
                    <tr>
                        <td>PREESCOLAR<input type="hidden" name="nivel3" value="preescolar" /></td>
                        <td><input id="cantidad3" class="validate[custom[number]]" type="text" name="cantidad3" value="<%=preescolar.getCantidad()%>"  onkeyup="totalPreescolar()"/></td>
                        <td><input id="insc3" class="validate[custom[number]]" type="text" name="insc3" value="<%=preescolar.getInscripcion()%>" onkeyup="totalPreescolar()"/></td>
                        <td><input id="matri3" class="validate[custom[number]]" type="text" name="matri3" value="<%=preescolar.getMatricula()%>" onkeyup="totalPreescolar()"/></td>
                        <td><input id="pens3" class="validate[custom[number]]" type="text" name="pens3" value="<%=preescolar.getPension()%>" onkeyup="totalPreescolar()"/></td>
                        <td style="text-align: center;"><div id="resulPrees">0</div><input type="hidden" id="t3" name="t3" value="<%=preescolar.getSubTotal()%>" /><input type="hidden" id="id3" name="id3" value="<%=preescolar.getId()%>" /></td>
                    </tr>
                    <tr>
                        <td>PRIMERO<input type="hidden" name="nivel4" value="primero" /></td>
                        <td><input id="cantidad4" class="validate[custom[number]]" type="text" name="cantidad4" value="<%=primero.getCantidad()%>"  onkeyup="totalPrimero()"/></td>
                        <td><input id="insc4" class="validate[custom[number]]" type="text" name="insc4" value="<%=primero.getInscripcion()%>" onkeyup="totalPrimero()"/></td>
                        <td><input id="matri4" class="validate[custom[number]]" type="text" name="matri4" value="<%=primero.getMatricula()%>" onkeyup="totalPrimero()"/></td>
                        <td><input id="pens4" class="validate[custom[number]]" type="text" name="pens4" value="<%=primero.getPension()%>" onkeyup="totalPrimero()"/></td>
                        <td style="text-align: center;"><div id="resulPri">0</div><input type="hidden" id="t4" name="t4" value="<%=primero.getSubTotal()%>" /><input type="hidden" id="id4" name="id4" value="<%=primero.getId()%>" /></td>
                    </tr>
                    <tr>
                        <td>SEGUNDO<input type="hidden" name="nivel5" value="segundo" /></td>
                        <td><input id="cantidad5" class="validate[custom[number]]" type="text" name="cantidad5" value="<%=segundo.getCantidad()%>"  onkeyup="totalSegundo()"/></td>
                        <td><input id="insc5" class="validate[custom[number]]" type="text" name="insc5" value="<%=segundo.getInscripcion()%>" onkeyup="totalSegundo()"/></td>
                        <td><input id="matri5" class="validate[custom[number]]" type="text" name="matri5" value="<%=segundo.getMatricula()%>" onkeyup="totalSegundo()"/></td>
                        <td><input id="pens5" class="validate[custom[number]]" type="text" name="pens5" value="<%=segundo.getPension()%>" onkeyup="totalSegundo()"/></td>
                        <td style="text-align: center;"><div id="resulSeg">0</div><input type="hidden" id="t5" name="t5" value="<%=segundo.getSubTotal()%>" /><input type="hidden" id="id5" name="id5" value="<%=segundo.getId()%>" /></td>
                    </tr>
                    <tr>
                        <td>TERCERO<input type="hidden" name="nivel6" value="tercero" /></td>
                        <td><input id="cantidad6" class="validate[custom[number]]" type="text" name="cantidad6" value="<%=tercero.getCantidad()%>"  onkeyup="totalTercero()"/></td>
                        <td><input id="insc6" class="validate[custom[number]]" type="text" name="insc6" value="<%=tercero.getInscripcion()%>" onkeyup="totalTercero()"/></td>
                        <td><input id="matri6" class="validate[custom[number]]" type="text" name="matri6" value="<%=tercero.getMatricula()%>" onkeyup="totalTercero()"/></td>
                        <td><input id="pens6" class="validate[custom[number]]" type="text" name="pens6" value="<%=tercero.getPension()%>" onkeyup="totalTercero()"/></td>
                        <td style="text-align: center;"><div id="resulTer">0</div><input type="hidden" id="t6" name="t6" value="<%=tercero.getSubTotal()%>" /><input type="hidden" id="id6" name="id6" value="<%=tercero.getId()%>" /></td>
                    </tr>
                    <tr>
                        <td>CUARTO<input type="hidden" name="nivel7" value="cuarto" /></td>
                        <td><input id="cantidad7" class="validate[custom[number]]" type="text" name="cantidad7" value="<%=cuarto.getCantidad()%>"  onkeyup="totalCuarto()"/></td>
                        <td><input id="insc7" class="validate[custom[number]]" type="text" name="insc7" value="<%=cuarto.getInscripcion()%>" onkeyup="totalCuarto()"/></td>
                        <td><input id="matri7" class="validate[custom[number]]" type="text" name="matri7" value="<%=cuarto.getMatricula()%>" onkeyup="totalCuarto()"/></td>
                        <td><input id="pens7" class="validate[custom[number]]" type="text" name="pens7" value="<%=cuarto.getPension()%>" onkeyup="totalCuarto()"/></td>
                        <td style="text-align: center;"><div id="resulCua">0</div><input type="hidden" id="t7" name="t7" value="<%=cuarto.getSubTotal()%>" /><input type="hidden" id="id7" name="id7" value="<%=cuarto.getId()%>" /></td>
                    </tr>
                    <tr>
                        <td>QUINTO<input type="hidden" name="nivel8" value="quinto" /></td>
                        <td><input id="cantidad8" class="validate[custom[number]]" type="text" name="cantidad8" value="<%=quinto.getCantidad()%>"  onkeyup="totalQuinto()"/></td>
                        <td><input id="insc8" class="validate[custom[number]]" type="text" name="insc8" value="<%=quinto.getInscripcion()%>" onkeyup="totalQuinto()"/></td>
                        <td><input id="matri8" class="validate[custom[number]]" type="text" name="matri8" value="<%=quinto.getMatricula()%>" onkeyup="totalQuinto()"/></td>
                        <td><input id="pens8" class="validate[custom[number]]" type="text" name="pens8" value="<%=quinto.getPension()%>" onkeyup="totalQuinto()"/></td>
                        <td style="text-align: center;"><div id="resulQui">0</div><input type="hidden" id="t8" name="t8" value="<%=quinto.getSubTotal()%>" /><input type="hidden" id="id8" name="id8" value="<%=quinto.getId()%>" /></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <th style="text-align: center;">TOTAL:</th>
                        <td style="text-align: center;"><div id="resulTotal">0</div><input type="hidden" id="ttotal" name="ttotal" value="0" /></td>
                    </tr>
                </tbody>
            </table>
            <input type="submit" value="Guardar" /><input id="reset" type="reset" value="Limpiar" />
            <div id="result">

            </div>
        </form>
        <%
            } catch (SQLException ex) {
            }
        %>
    </body>
</html>