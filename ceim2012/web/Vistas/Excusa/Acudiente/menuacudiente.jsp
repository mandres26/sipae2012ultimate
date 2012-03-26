<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.modelo.Acudiente,com.modelo.Docente" session="true" %>
<%
    Acudiente acudiente = (Acudiente) session.getAttribute("usuario");
    if (acudiente == null) {
        acudiente = new Acudiente();
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript">
            $(document).ready(function(){
                menuAcudiente.ready();
            });
        </script>
    </head>
    <body>
        <div id="columnA">
            <a id="cerrar" href="" title="Cerrar session">Cerrar Sesion</a>
            <br>
            <fieldset id="opciones">
                <legend>Menú Opciones</legend>
                <a id="regExcusa" href="">Registrar Excusa</a>
                <br>
                <a id="revExcusa" href="">Listar Excusa de Estudiante</a>
            </fieldset>
        </div>
        <div id="columnB">
            <label id="docente">Acudiente: <%=acudiente.getVar_nombre_acudiente()%> <%=acudiente.getVar_apellido_acudiente()%></label>
        </div>
        <div style="clear: both;">&nbsp;</div>
        <div  id="result">
            <p>Seleccione una opción</p>
        </div>
    </body>
</html>
