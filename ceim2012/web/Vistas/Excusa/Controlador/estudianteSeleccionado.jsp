<%@page import="java.sql.SQLException,com.modelo.Estudiante,com.controlador.ControlEstudiante" session="true"%>
<%
    String idestudiante;
    try {
        idestudiante = request.getParameter("id");
    } catch (Exception ex) {
        idestudiante = null;
    }
    out.print("<span style='margin: 0 0 0 23px;'><a id='volver' href=''><img src='images/ICONS/back.png'>Volver</a></span><script type='text/javascript'>regExcusa.ready();</script>");
    if (idestudiante != null) {
        try {
            Estudiante estudiante = ControlEstudiante.consultarClienteID(idestudiante);
            if (estudiante != null) {
                session.setAttribute("estudiante", estudiante);
                //out.print("<script type='text/javascript'>alert('Estudiante Seleccionado: " + estudiante.getNombre() + "');</script>");
%>
<fieldset id="datosEstudiante">
    <legend>Datos Estudiante</legend>
    <table style="border: 0px;">
        <tr>
            <th>Nombre:</th><td style="border-bottom: none"><%=estudiante.getNombre()%></td>
            <th>Apellido:</th><td style="border-bottom: none"><%=estudiante.getApellido()%></td>
        </tr>
        <tr>
            <th>Curso:</th><td style="border-bottom: none"><%=estudiante.getCursoTemporal()%></td>
            <th></th><td style="border-bottom: none"></td>
        </tr>
    </table>
</fieldset>
<div id="contentform">
    <form id="formExcusa" method="post" action="">
        <table style="border: 0px; margin: 0 0 0 0">
            <tr>
                <th>Fecha Inicio:</th><td style="border-bottom: none"><input id="fechaIniciExcusa" name="fechaInicio" type="text" value="" class="validate[required]" autofocus="autofocus"/></td>
            </tr>
            <tr>
                <th>Fecha Final:</th><td style="border-bottom: none"><input id="fechaFinal" name="fechaFinal" type="text" value="" class="validate[required]"/></td>
            </tr>
            <tr>
                <th>Motivo:</th><td style="border-bottom: none"><textarea style=" height: 80px; max-height:80px; min-height:80px; width: 240px; max-width: 240px; min-width: 240px; font-family: Arial; font-size: 15px;" id="motivo" name="motivo" class="validate[required]"></textarea></td>
            </tr>
        </table>
        <div id="botones">
            <input id="registrar" name="registrar" type="submit" value="Registrar"/><input id="reset" name="reset" type="reset" value="Limpiar"/>
        </div>
    </form>
    <div id="resultRegistro"></div>
        
</div>
<%
            } else {
                out.print("<script type='text/javascript'>alert('Error, no se encontro estudiante.');</script>");
            }
        } catch (SQLException ex) {
            out.print("<script type='text/javascript'>alert('Error SQL: " + ex.getMessage() + "');</script>");
        }
    } else {
        out.print("<script type='text/javascript'>alert('Error, debe selecionar algun estudiante.')</script>");
    }
%>