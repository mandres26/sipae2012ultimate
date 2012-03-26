<%-- 
    Author     : katia
--%>

<%@page import="modelo.DiaFamilia, modelo.PresupuestoIngreso,modelo.PresupuestoGastos, modelo.Presupuesto" session='true'%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PRESUPUESTO DE INGRESO</title>
        <script type="text/javascript">
            $(document).ready(function() {
                presupuestoIngreso.ready();
            });
        </script>
    </head>
    <body>
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
        %>
        <div id="opciones">
            <h3>Seleccione una opción</h3>
            <fieldset>
                <legend><b>Menú de registro para presupuesto de ingresos</b></legend>
                <a id="regInscrip" href="">Inscripciones, matriculas y penciones</a><br>
                <a id="regDiaFam" href="">Dia de la Familia</a><br>
                <a id="regDiaCom" href="">Dia de la Cometa</a>
            </fieldset>
            <div id="foto">
                <img id="fotoInscrip" alt="Foto Inscripciones"src="images/Imagen4.jpg" height="100"/>
                <img id="fotoDiaFam" alt="Foto Dia Familia"src="images/Imagen5.png" height="100" style="background-color: white"/>
                <img id="fotoDiaCom" alt="Foto Dia Cometa"src="images/cometa.jpg" height="100"/>
            </div>
            <div id="formContainer">

            </div>
        </div>
        <%} else {%>
        <h4>El Presupuesto de Ingreso ha sido registrado correctamente, Registre el Presupuesto de Gastos.</h4>
        <%}%>
    </body>
</html>