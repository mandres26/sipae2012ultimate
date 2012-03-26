<%@page session="true" import="java.util.LinkedList,java.sql.SQLException,controlador.ManejadorPresupuesto,modelo.Presupuesto"%>
<%
    String fecha = request.getParameter("fecha");

    if (!fecha.isEmpty()) {
        try {
            LinkedList<Presupuesto> listaPresupuesto = ManejadorPresupuesto.listarPresupuestoFecha(fecha);
            if (!listaPresupuesto.isEmpty()) {
                int tamlist = listaPresupuesto.size();
                String tablaPre = "<br><label class='titulo'>LISTA DE PRESUPUESTOS REGISTRADOS PARA EL AÑO: "+fecha+"</label><br><img src='images/PreSelect.png' title='Presupuesto Seleccionado.' alt='Presupuesto seleccionado' height='16'><br><table><thead><tr><th>AÑO</th><th>DESCRIPCION</th><th>TOTAL</th><th>VER</th></tr></thead><tbody>";
                String select;
                for (int i = 0; i < tamlist; i++) {
                    Presupuesto presupuesto = listaPresupuesto.get(i);
                    if (presupuesto.getSeleccionado() == 1) {
                        select = "style='background-color: yellowgreen;'";
                    } else {
                        select = "";
                    }
                    tablaPre += "<tr " + select + "><td>" + presupuesto.getFecha().substring(0, 4) + "</td><td>" + presupuesto.getDescripcion() + "</td><td>"+presupuesto.getTotal()+"</td><td><a id='" + presupuesto.getIdPresupuesto() + "' class='seleccionar' href=''><img src='images/search24.png' width='24' height='24' alt='Seleccionar' title='Seleccionar Presupuesto " + presupuesto.getIdPresupuesto() + ".'/><script type='text/javascript'>consultarPresupuesto.seleccionar();</script></a></td></tr>";
                }
                tablaPre += "</tbody></table>";
                out.print(tablaPre);
                session.setAttribute("fecha", fecha);
            } else {
                throw new SQLException("No hay Presupuesto Registrado en el Año: " + fecha);
            }
        } catch (SQLException ex) {
            out.print("<label class='noexito'>" + ex.getMessage() + "</label><br>");
        }
    } else {
        out.print("<label class='noexito'>Error... Seleccione Año.</label><br>");
    }
%>