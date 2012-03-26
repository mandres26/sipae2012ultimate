<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.modelo.Acudiente,com.modelo.Docente" session="true" %>
<%
    Docente docente = (Docente) session.getAttribute("usuario");
    if (docente == null) {
        docente = new Docente();
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript">
            $(document).ready(function(){
                menuDocente.ready();
            });
        </script>
    </head>
    <body>
        <div id="columnA">
            <a id="cerrar" href="" title="Cerrar session">Cerrar Sesion</a>
            <br>
            <fieldset>
                <legend>Menú Opciones</legend>
                <a id="regExcusa" href="">Registrar Excusa.</a>
                <br>
                <% if (!docente.getCargo().equals("rector")) {%>
                <a id="revExcusa" href="">Listar Excusa de Docente.</a>
                <br>
                <%}%>
                <a id="vizExcusa" href="">Listar Excusas de estudiantes.</a>
                <% if (docente.getCargo().equals("rector")) {%>
                <br>
                <a id="listDocente" href="">Listar Excusas de Docentes.</a>
                <%}%>
            </fieldset>
        </div>
        <div id="columnB">
            <label id="docente">Docente: <%=docente.getVar_nombre_docente()%> <%=docente.getVar_apellido_docente()%></label>
        </div>
        <div style="clear: both;">&nbsp;</div>
        <div  id="result">
            <p>Seleccione una opción</p>
        </div>
    </body>
</html>