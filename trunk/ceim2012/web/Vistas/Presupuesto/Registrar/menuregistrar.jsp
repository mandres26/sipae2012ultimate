<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Date, java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>COLEGIO INTEGRAL MODERNO - REGISTRAR PRESUPUESTO</title>
        <script type="text/javascript">
            $(document).ready(function(){
                menuRegistrar.ready();
            });
        </script>
    </head>
    <body>
        <form id="formFecha" method="post" action="">
            <fieldset>
                <legend>Seleccione año a presupuestar</legend>
                <select id="fecha" name="fecha" class="validate[required]">
                    <option value="">-</option>
                    <%
                        Date fecha = new Date();
                        SimpleDateFormat simpleDateformat = new SimpleDateFormat("yyyy");
                        int year = Integer.parseInt(simpleDateformat.format(fecha));
                        for (int i = 1; i < 11; i++) {
                            out.print("<option value='" + (year + i) + "'>" + (year + i) + "</option>");
                        }
                    %>
                </select>
            </fieldset>
            <fieldset id="desPresupuesto">
                <legend>Descripcion del presupuesto</legend>
                <textarea class="validate[required]" id="descripcion" name="descripcion" maxlength="200" placeholder="Breve descripcion del Presupuesto."></textarea>
            </fieldset>
            <fieldset id="regPresupuesto">
                <legend>Registrar Presupuesto</legend>
                <a id="preIngreso" href="">REGISTRAR PRESUPUESTO DE INGRESO</a> <br>
                <a id="preGastos" href="">REGISTRAR PRESUPUESTO DE GASTOS</a>
            </fieldset>
            <input id="finReg" name="finReg" type="button" value="Finalizar Registro"/>
        </form>
        <br>
        <div id="container"></div>
    </body>
</html>