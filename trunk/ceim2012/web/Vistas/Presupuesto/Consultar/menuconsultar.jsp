<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Date, java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>COLEGIO INTEGRAL MODERNO - CONSULTAR PRESUPUESTO</title>
        <script type="text/javascript">
            $(document).ready(function(){
                consultarPresupuesto.ready();
            });
        </script>
    </head>
    <body>
        <form id="formFecha" method="post" action="">
            <fieldset>
                <legend>Seleccione año a consultar</legend>
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
            <div id="container"></div>
        </form>
    </body>
</html>