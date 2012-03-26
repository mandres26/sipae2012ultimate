<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.SQLException,controlador.ManejadorPresupuesto,controlador.ManejadorPresupuestoIngreso,controlador.ManejadorPresupuestoGastos, modelo.Presupuesto,modelo.PresupuestoIngreso,modelo.PresupuestoGastos,modelo.Rubro" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>COLEGIO INTEGRAL MODERNO - MODIFICAR PRESUPUESTO</title>
        <script type="text/javascript">
            menuModificar.ready();
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
            Presupuesto presupuesto = new Presupuesto();
            PresupuestoGastos pregastos = new PresupuestoGastos();
            PresupuestoIngreso preing = new PresupuestoIngreso();
            if (idPresupuesto > 0) {
                try {
                    presupuesto = ManejadorPresupuesto.consultarPresupuestoID(idPresupuesto);
                    if (presupuesto != null) {
                        pregastos = ManejadorPresupuestoGastos.consultarPresupuestoGastosPresupuesto(idPresupuesto);
                        if (pregastos == null)
                            pregastos = new PresupuestoGastos();
                        out.print("<input id='idpregastos' name='idpregastos' type='hidden' value='" + pregastos.getIdPresupuestoGastos() + "'/>");
                        preing = ManejadorPresupuestoIngreso.consultarPresupuestoIngresoPresupuesto(idPresupuesto);
                        if (preing == null)
                            preing = new PresupuestoIngreso();
                        out.print("<input id='idpreing' name='idpreing' type='hidden' value='" + preing.getIdPresupuestoIngreso() + "'/>");
                    } else {
                        out.print("<label class='no'>Error debe seleccionar algún Presupuesto.</label>");
                    }
                } catch (SQLException ex) {
                    out.print("<label class='noexito'>" + ex.getMessage() + ".</label><br>");
                }
            } else {
                out.print("<label class='noexito'>Error debe Seleccionar algún Presupuesto.</label><br>");
            }
            out.print("<input id='idpresupuesto' name='idpresupuesto' type='hidden' value='" + idPresupuesto + "'/><br><a id='volver' href='' title='Volver a la lista de presupuesto'><img src='images/back.gif' alt='regresar a la lista'/>Volver a la Lista.<script type='text/javascript'>consultarPresupuesto.seleccionar();</script></a><br><br>");
        %>
        <fieldset id="desPresupuesto">
            <legend>Descripcion del presupuesto</legend>
            <textarea class="validate[required]" id="descripcion" name="descripcion" maxlength="200" placeholder="Breve descripcion del Presupuesto."><%=presupuesto.getDescripcion()%></textarea>
        </fieldset>
        <fieldset id="modPresupuesto">
            <legend>Modificar Presupuesto</legend>
            <a id="preIngreso" href="">REGISTRAR PRESUPUESTO DE INGRESO</a> <br>
            <a id="preGastos" href="">REGISTRAR PRESUPUESTO DE GASTOS</a>
        </fieldset><br>
        <div id="container3"></div>
    </body>
</html>