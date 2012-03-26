<%-- 
    Author     : katia
--%>

<%@page import="java.util.*,java.sql.SQLException, modelo.DiaFamilia, modelo.PresupuestoIngreso,controlador.ManejadorPresupuestoIngreso,modelo.PresupuestoGastos,controlador.ManejadorPresupuestoGastos, modelo.Presupuesto,controlador.ManejadorPresupuesto,controlador.ManejadorInsMatPen,modelo.InsMatPen" session='true'%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PRESUPUESTO DE INGRESO</title>
        <script type="text/javascript">
            $(document).ready(function() {
                modificarPresupuesto.ready();
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
            if (idPresupuesto > 0) {
                try {
                    Presupuesto presupuesto = ManejadorPresupuesto.consultarPresupuestoID(idPresupuesto);
                    if (presupuesto != null) {
                        if (presupuesto.getSeleccionado() == 0) {
                            PresupuestoIngreso preing = null;
                            if (presupuesto.getCompletadoIngreso() == 1) {
                                preing = ManejadorPresupuestoIngreso.consultarPresupuestoIngresoPresupuesto(idPresupuesto);
                            }
                            out.print("<input id='idpreing' name='idpreing' type='hidden' value='" + preing.getIdPresupuestoIngreso() + "'/><input id='idpresupuesto' name='idpresupuesto' type='hidden' value='" + preing.getIdPresupuesto() + "'/>");
                        } else {
                            out.print("<label class='no'>Error no se puede modificar presupuesto por que esta seleccionado para el año " + presupuesto.getFecha().substring(0, 4) + ".</label>");
                        }
                    } else {
                        out.print("<label class='no'>Error debe seleccionar algún Presupuesto.2</label>");
                    }
                } catch (SQLException ex) {
                    out.print("<label class='noexito'>" + ex.getMessage() + ".</label><br>");
                }
            } else {
                out.print("<label class='noexito'>Error debe Seleccionar algún Presupuesto.1</label><br>");
            }
        %>
        <div id="opciones">
            <h3>Seleccione una opción</h3>
            <fieldset>
                <legend><b>Menú de registro para presupuesto de ingresos</b></legend>
                <a id="modInscrip" href="">Inscripciones, matriculas y penciones</a><br>
                <a id="modDiaFam" href="">Dia de la Familia</a><br>
                <a id="modDiaCom" href="">Dia de la Cometa</a>
            </fieldset>
            <div id="formContainer">

            </div>
        </div>
    </body>
</html>