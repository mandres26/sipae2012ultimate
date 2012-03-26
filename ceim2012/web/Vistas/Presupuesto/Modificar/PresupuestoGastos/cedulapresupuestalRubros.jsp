<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CEDULA PRESUPUESTAL DE GASTOS</title>
        <script type="text/javascript"  src="../../images/calculoPresupuestoGastos.js" charset="utf-8"></script>
        <script type="text/javascript">
            $(document).ready(function() {
                gastos.ready()
            });
        </script>
    </head>
    <body>
        <h3>CEDULA PRESUPUESTAL DE GASTOS</h3>
        <form id="form1" action="" method="post">
            <table>
                <thead>
                    <tr>
                        <th>CONCEPTO</th>
                        <th>VALOR</th>
                        <th>
                            
                        </th>
                    </tr>
                </thead>
                <tbody id="tbody">
                    <tr>
                        <td>ARRIENDO</td>
                        <td><input id="valor1" name="valor1" class="validate[custom[number]]"  type="text" value=""/></td>
                        <td><input type="hidden" id="t1" name="t1" value="" /></td>
                    </tr>
                    <tr>
                        <td>SERVICIOS</td>
                        <td><input id="valor2" name="valor2" class="validate[custom[number]]"  type="text" value=""/></td>
                        <td><input type="hidden" id="t2" name="t2" value="" /></td>
                    </tr>
                    <tr>
                        <td>MATERIAL DIDACTICO</td>
                        <td><input id="valor3" name="valor3" class="validate[custom[number]]"  type="text" value=""/></td>
                        <td><input type="hidden" id="t3" name="t3" value="" /></td>
                    </tr>
                    <tr>
                        <td>PAPELERIA</td>
                        <td><input id="valor4" name="valor4" class="validate[custom[number]]"  type="text" value=""/></td>
                        <td><input type="hidden" id="t4" name="t4" value="" /></td>
                    </tr>
                    <tr>
                        <td>NOMINA</td>
                        <td><input id="valor5" name="valor5" class="validate[custom[number]]"  type="text" value=""/></td>
                        <td><input type="hidden" id="t5" name="t5" value="" /></td>
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
        </form>
    </body>
</html>