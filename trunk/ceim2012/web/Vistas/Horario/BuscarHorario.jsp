<%-- 
    Document   : BuscarHorario
    Created on : 30/11/2011, 09:34:38 PM
    Author     : Moncho
--%>

<%@page import="java.io.DataOutputStream"%>
<%@page import="java.io.DataOutput"%>
<%@page import="ReporteHorario.ReporteHorario"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="MPHorarios.ControlHorario"%>
<%@page import="Conceptos.Horarios.Horario"%>
<%@page import="MPHorarios.ControlDocente"%>
<%@page import="Conceptos.Horarios.Docente"%>
<%@page import="MPHorarios.ControlAula"%>
<%@page import="Conceptos.Horarios.Aula"%>
<%@page import="Conceptos.Horarios.Curso"%>
<%@page import="MPHorarios.ControlCurso"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <style media="all" type="text/css">@import "css/all.css";</style>
        <script src="Script/dhtmlgoodies_calendar.js" type="text/javascript"></script>
        <script src="Script/validaciones.js" type="text/javascript"></script>
        <link href="Script/dhtmlgoodies_calendar.css" rel="stylesheet" type="text/css" media="all" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultar Horario</title>
    </head>
    <body>
        <div align="center">
            <form name="form" id="form" method="post" action="">
                <table border="0">
                    <tr>
                        <td>
                            Curso
                            <span class="last">
                                <select name="combocurso" id="combocurso">
                                    <option value="0" selected>--TODOS--</option>
                                    <%
                                                try {
                                                    List<Curso> listaCursos = ControlCurso.listarCurso();

                                                    if (listaCursos != null && !listaCursos.isEmpty()) {
                                                        for (Curso curso : listaCursos) {
                                    %>
                                    <option value="<%=curso.getVar_codigo_curso()%>"><%=curso.getVar_nombre_curso()%></option>
                                    <%
                                                        }
                                                    }
                                                } catch (Exception e) {
                                                    e.printStackTrace();
                                                }
                                    %>
                                </select>
                            </span>
                        </td>
                        <td>
                            Docente
                            <span class="last">
                                <select name="combodocente" id="combodocente">
                                    <option value="0" selected>--TODOS--</option>
                                    <%
                                                try {
                                                    List<Docente> listaDocente = ControlDocente.listarDocente();

                                                    if (listaDocente != null && !listaDocente.isEmpty()) {
                                                        for (Docente docente : listaDocente) {
                                    %>
                                    <option value="<%=docente.getVar_id_docente()%>"><%=docente.getVar_nombre_docente().concat(" ").concat(docente.getVar_apellido_docente())%></option>
                                    <%
                                                        }
                                                    }
                                                } catch (Exception e) {
                                                    e.printStackTrace();
                                                }
                                    %>
                                </select>
                            </span>
                        </td>
                        <td>
                            Aula
                            <span class="last">
                                <select name="comboaula" id="comboaula">
                                    <option value="0" selected>--TODAS--</option>
                                    <%
                                                try {
                                                    List<Aula> listaAula = ControlAula.listarAulas();

                                                    if (listaAula != null && !listaAula.isEmpty()) {
                                                        for (Aula aula : listaAula) {
                                    %>
                                    <option value="<%=aula.getVar_codigo_aula()%>"><%=aula.getVar_codigo_aula()%></option>
                                    <%
                                                        }
                                                    }
                                                } catch (Exception e) {
                                                    e.printStackTrace();
                                                }
                                    %>
                                </select>
                            </span>
                        </td>
                    </tr>
                </table>
                <br/>
                <br/>
                <input type="button" name="buscar" value="Buscar" onclick="imprimirHorario('');">
                <input type="button" name="imprimir" value="Imprimir" onclick="imprimirHorario('CtrlHorario.jsp?op=3');">
                <tr  class="bg">
                        <td colspan="4"><div align="center"><li id="button5"><a href="index.jsp" title="">Salir</a></li></div></td>
                <br/>
                <br/>
                <%
                            if (request.getParameter("combocurso") != null && request.getParameter("comboaula") != null && request.getParameter("combodocente") != null) {

                                SimpleDateFormat formatoHora = new SimpleDateFormat("hh:mm");
                                List<Horario> listaHorarios = ControlHorario.buscarHorario(Integer.parseInt(request.getParameter("combocurso")), request.getParameter("comboaula"), Integer.parseInt(request.getParameter("combodocente")));

                                if (listaHorarios != null && !listaHorarios.isEmpty()) {
                %>
                <table cellpadding="0" cellspacing="0" class="listing form" width="100%">
                    <tr>
                        <th colspan="7" align="center">RESULTADO DE HORARIOS</th>
                    </tr>
                    <tr>
                        <th>CURSO</th>
                        <th>AULA</th>
                        <th>DOCENTE</th>
                        <th>ASIGNATURA</th>
                        <th>DIA</th>
                        <th>HORA</th>
                        <th></th>
                    </tr>
                    <%
                                                            for (Horario horario : listaHorarios) {
                    %>
                    <tr>
                        <td><%=horario.getVar_curso_horario().getVar_nombre_curso().toUpperCase()%></td>
                        <td><%=horario.getVar_aula_horario().getVar_codigo_aula().toUpperCase()%></td>
                        <td><%=horario.getVar_docente_horario().getVar_nombre_docente().concat(" ").concat(horario.getVar_docente_horario().getVar_apellido_docente()).toUpperCase()%></td>
                        <td><%=horario.getVar_asignatura_horario().getVar_nombre_asignatura().toUpperCase()%></td>
                        <td><%=horario.getVar_dia_horario()%></td>
                        <td><%=formatoHora.format(horario.getVar_hora_inicial_horario()).concat(" - ").concat(formatoHora.format(horario.getVar_hora_fin_horario()))%></td>
                        <td>
                            <a href="ActualizarHorario.jsp?idHorario=<%=horario.getVar_id_horario()%>" style="text-decoration: none"><b>Modificar</b></a>
                            <a href="CtrlHorario.jsp?op=2&idHorario=<%=horario.getVar_id_horario()%>" style="text-decoration: none"><b>Eliminar</b></a>
                        </td>
                    </tr>
                    <%
                                                            }
                    %>
                </table>
                <%
                                }
                            }


                            String mensaje = request.getParameter("mensaje");

                            if (mensaje != null && !mensaje.trim().isEmpty()) {
                %>
                <div id="mensaje" align="center"><b><%=mensaje%></b></div>
                <%
                            }
                %>
            </form>
        </div>
    </body>
</html>
