<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.LinkedList,java.sql.SQLException,com.modelo.Acudiente, com.modelo.Docente,com.modelo.Estudiante,com.modelo.Excusa,com.controlador.ControlEstudiante,com.controlador.ControladorDocente,com.controlador.ControladorExcusa" session="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <% if (request.getParameter("op").equals("registrar")) {%>
        <script type="text/javascript">
            regExcusa.ready();
        </script>
        <%} else {%>
        <script type="text/javascript">
            revExcusa.ready();
        </script>
        <%}%>
    </head>
    <body>
        <%
            Docente docente;
            Acudiente acudiente;
            try {
                docente = (Docente) session.getAttribute("usuario");
            } catch (Exception ex) {
                docente = null;
            }
            try {
                acudiente = (Acudiente) session.getAttribute("usuario");
            } catch (Exception ex) {
                acudiente = null;
            }

            if (acudiente != null) {
        %>
        <div id="formContainerExcusas">
            <div id="resultEstudiante">

                <% if (request.getParameter("op").equals("registrar")) {%>
                <h3 style="font-size: 14pt; margin: 0 0 0 0;">Registrar Excusa</h3>
                <%} else {%>
                <h3 style="font-size: 14pt; margin: 0 0 0 0;">Lista de Excusas</h3>
                <%}%>
                <label>Seleccione estudiante.</label>
                <%
                    try {
                        Estudiante estudiante;
                        LinkedList<Estudiante> listaEstudiante = ControlEstudiante.listarEstudianteAcudiente(acudiente.getVar_id_acudiente().toString());
                        if (!listaEstudiante.isEmpty()) {
                            int tamList = listaEstudiante.size();
                            String table = "<table class='tablaEstuduante'><thead><tr><th>Cedula</th><th>Nombre</th><th class='apellido'>Apellido</th><th>Seleccionar</th></tr></thead><tbody>";
                            for (int i = 0; i < tamList; i++) {
                                estudiante = listaEstudiante.get(i);
                                table += "<tr><td>" + estudiante.getIdentificacion() + "</td><td>" + estudiante.getNombre() + "</td><td class='apellido'>" + estudiante.getApellido() + "</td><td><a id='" + estudiante.getIdentificacion() + "' href='' title='Generar excusa para " + estudiante.getNombre() + ".'><img class='select' src='images/ICONS/Clear_Green_Button.png'></a></td></tr>";
                            }
                            table += "</tbody></table>";
                            out.print(table);
                        } else {
                            out.print("<script type='text/javascript'>alert('Error, no se encontraron estudiantes registrados por el Acudiente: " + acudiente.getVar_nombre_acudiente() + " " + acudiente.getVar_apellido_acudiente() + ".');</script>");
                        }
                    } catch (SQLException ex) {
                        out.print("<script type='text/javascript'>alert('" + ex.getMessage() + ".');</script>");
                    }
                %>
            </div>
            <div id="contentform2">

            </div>
        </div>
        <%} else if (docente != null) {%>
        <div id="formContainerExcusas" style="margin: 0 0 0 33px;">
            <% if (request.getParameter("op").equals("registrar")) {%>
            <h3 style="font-size: 14pt; margin: 0 0 0 0;">Registrar Excusa</h3>
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
            <%} else if (request.getParameter("op").equals("listarDocente")) {%>
            <div id="resultEstudiante" style="margin: 0 0 0 0;">
                <h3 style="font-size: 14pt; margin: 0 0 0 0;">Lista de Excusas</h3>
                <%try {
                        LinkedList<Integer> listaId = ControladorExcusa.listaIdExcusasDocente(docente);
                        if (!listaId.isEmpty()) {
                %>
                <table  class='tablaEstuduante'>
                    <thead>
                        <tr>
                            <th>Fecha Registro</th><th>Fecha Inicio</th><th>Fecha Final</th><th>Motivo</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (int i = 0; i < listaId.size(); i++) {
                                int id = listaId.get(i);
                                Excusa excusa = ControladorExcusa.consultarExcusaId(id);
                        %>
                        <tr><td><%=excusa.getFechaExcusa()%></td><td><%=excusa.getFechaInicio()%></td><td><%=excusa.getFechaFinal()%></td><td><%=excusa.getMotivo()%></td></tr>
                        <%
                                }
                            } else {
                                out.print("<script type='text/javascript'>alert('Error, no tiene excusas registradas.');</script>");
                            }
                        %>
                    </tbody>
                </table>
            </div>
            <%
                } catch (SQLException ex) {
                    out.print("<script type='text/javascript'>alert(\"Error SQL: " + ex.getMessage() + "\");</script>");
                }
            } else if (request.getParameter("op").equals("listarEstudiantes")) {%>
            <div id="resultEstudiante" style="margin: 0 0 0 0;">
                <h3 style="font-size: 14pt; margin: 0 0 0 0;">Lista de estudiantes</h3>
                <label>Seleccione estudiante.</label>
                <%
                    try {
                        Estudiante estudiante;
                        LinkedList<Estudiante> listaEstudiante = ControlEstudiante.listarEstudiante();
                        if (!listaEstudiante.isEmpty()) {
                            int tamList = listaEstudiante.size();
                            String table = "<table class='tablaEstuduante'><thead><tr><th>Cedula</th><th>Nombre</th><th class='apellido'>Apellido</th><th>Seleccionar</th></tr></thead><tbody>";
                            for (int i = 0; i < tamList; i++) {
                                estudiante = listaEstudiante.get(i);
                                table += "<tr><td>" + estudiante.getIdentificacion() + "</td><td>" + estudiante.getNombre() + "</td><td class='apellido'>" + estudiante.getApellido() + "</td><td><a id='" + estudiante.getIdentificacion() + "' href='' title='Listar excusas de " + estudiante.getNombre() + ".'><img class='select' src='images/ICONS/Clear_Green_Button.png'></a></td></tr>";
                            }
                            table += "</tbody></table>";
                            out.print(table);
                        } else {
                            out.print("<script type='text/javascript'>alert('Error, no se encontraron estudiantes registrados por el Acudiente: " + acudiente.getVar_nombre_acudiente() + " " + acudiente.getVar_apellido_acudiente() + ".');</script>");
                        }
                    } catch (SQLException ex) {
                        out.print("<script type='text/javascript'>alert('" + ex.getMessage() + ".');</script>");
                    }
                %>
            </div>
            <%} else if (request.getParameter("op").equals("listarDocentes")) {%>
            <div id="resultEstudiante" style="margin: 0 0 0 0;">
                <h3 style="font-size: 14pt; margin: 0 0 0 0;">Lista de Docentes</h3>
                <label>Seleccione Docente.</label>
                <%
                    try {
                        Docente doc;
                        LinkedList<Docente> listaDocente = ControladorDocente.listarDocente();
                        if (!listaDocente.isEmpty()) {
                            int tamList = listaDocente.size();
                %>
                <table>
                    <thead>
                        <tr><th>Cedula</th><th>Nombre</th><th class='apellido'>Apellido</th><th>Seleccionar</th></tr>
                    </thead>
                    <tbody>
                        <%
                            String table = "<table class='tablaEstuduante'><tbody>";
                            for (int i = 0; i < tamList; i++) {
                                doc = listaDocente.get(i);
                        %>
                        <tr><td><%=doc.getVar_id_docente()%></td><td><%=doc.getVar_nombre_docente()%></td><td class='apellido'><%=doc.getVar_apellido_docente()%></td><td><a id="docente" href='' title='Listar excusas de<%=doc.getVar_nombre_docente()%>.' onclick='revExcusa.selectDocente(<%=doc.getVar_id_docente()%>);'><img class='select' src='images/ICONS/Clear_Green_Button.png'></a></td></tr>
                                    <%}%>
                    </tbody>
                </table>
                <%
                        } else {
                            out.print("<script type='text/javascript'>alert('Error, no se encontraron docentes.');</script>");
                        }
                    } catch (SQLException ex) {
                        out.print("<script type='text/javascript'>alert('" + ex.getMessage() + ".');</script>");
                    }
                %>
            </div>
            <%}%>
        </div>
        <div id="resultRegistro"></div>
        <%} else {%>
        <script type="text/javascript">alert("No tiene los permisos nesesarios para esta en esta sección.",function(){location.href="index.jsp"});</script>
        <%}%>
    </body>
</html>