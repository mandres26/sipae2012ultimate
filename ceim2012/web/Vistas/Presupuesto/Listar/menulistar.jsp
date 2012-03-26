<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*,java.sql.SQLException, modelo.Presupuesto,controlador.ManejadorPresupuesto" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>COLEGIO INTEGRAL MODERNO - CONSULTAR PRESUPUESTO</title>
        <script type="text/javascript">
            $(document).ready(function() {
                listarPresupuesto.ready();
            });
        </script>
    </head>
    <body>
        <div id="container">
            <%
                try {
                    LinkedList<Presupuesto> listaPresupuesto = ManejadorPresupuesto.listarPresupuesto();
                    if (!listaPresupuesto.isEmpty()) {
                        int tamlist = listaPresupuesto.size();
                        String tablaPre = "<br><label class='titulo'>LISTA DE PRESUPUESTOS REGISTRADOS</label><br><img src='images/PreSelect.png' title='Presupuesto Seleccionado.' alt='Presupuesto seleccionado' height='16'><br><table><thead><tr><th>AÑO</th><th>DESCRIPCION</th><th>TOTAL</th><th>VER</th></tr></thead><tbody>";
                        String select;
                        for (int i = 0; i < tamlist; i++) {
                            Presupuesto presupuesto = listaPresupuesto.get(i);
                            if (presupuesto.getSeleccionado() == 1) {
                                select = "style='background-color: yellowgreen;'";
                            } else {
                                select = "";
                            }
                            tablaPre += "<tr " + select + "><td>" + presupuesto.getFecha().substring(0, 4) + "</td><td>" + presupuesto.getDescripcion() + "</td><td>"+presupuesto.getTotal()+"</td><td><a id='" + presupuesto.getIdPresupuesto() + "' class='seleccionar' href=''><img src='images/search24.png' width='24' height='24' alt='Seleccionar' title='Seleccionar Presupuesto " + presupuesto.getIdPresupuesto() + ".'/><script type='text/javascript'>listarPresupuesto.seleccionar();</script></a></td></tr>";
                        }
                        tablaPre += "</tbody></table>";
                        out.print(tablaPre);
                    } else {
                        throw new SQLException("No hay Presupuesto Registrado.");
                    }
                } catch (SQLException ex) {
                    out.println("<label class='noexito'>" + ex.getMessage() + "</label>");
                }
            %>
        </div><br>
    </body>
</html>