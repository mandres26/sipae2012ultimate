<%-- 
    Document   : GestionarHorarios
    Created on : 2/11/2011, 06:23:30 PM
    Author     : Moncho
--%>

<%@page import="MPHorarios.ControlDocente"%>
<%@page import="Conceptos.Horarios.Docente"%>
<%@page import="MPHorarios.ControlAula"%>
<%@page import="Conceptos.Horarios.Aula"%>
<%@page import="MPHorarios.ControlAsignatura"%>
<%@page import="Conceptos.Horarios.Asignatura"%>
<%@page import="MPHorarios.ControlCurso"%>
<%@page import="Conceptos.Horarios.Curso"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style media="all" type="text/css">@import "css/all.css";</style>
        <script src="Script/dhtmlgoodies_calendar.js" type="text/javascript"></script>
        <script src="Script/validaciones.js" type="text/javascript"></script>
        <link href="Script/dhtmlgoodies_calendar.css" rel="stylesheet" type="text/css" media="all" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>REGISTRAR HORARIOS</title>
    </head>
    <body>
        <form name="form" id="form" method="post" action="CtrlHorario.jsp">
            <input type="hidden" id="op" name="op" value="0"/>
            <div align="center">
                <table width="50%" border="0" class="listing form">
                    <tr>
                        <th class="full" colspan="4">REGISTRAR HORARIO </th>
                    </tr>
                    <tr class="bg">
                        <td width="85" class="first">Cursos</td>
                        <td width="43" class="last">
                            <select name="comboCursos" id="comboCursos">
                                <option value="0" selected>--SELECCIONE--</option>
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
                        </td>
                        <td width="70" class="first">HoraInicial</td>
                        <td width="180" class="last">
                            <input type="text" id="horaInicialText" name="horaInicialText" maxlength="10" readonly="true"><input type="button" name="horaInicialButton" value="..." onClick="displayCalendar(horaInicialText, 'hh:ii', this, true);" />
                        </td>
                    </tr>
                    <tr>
                        <td class="first">Asignaturas</td>
                        <td class="last">
                            <select name="comboAsignaturas" id="comboAsignaturas">
                                <option value="0" selected>--SELECCIONE--</option>
                                <%
                                            try {
                                                List<Asignatura> listaAsignatura = ControlAsignatura.listarAsignatura();

                                                if (listaAsignatura != null && !listaAsignatura.isEmpty()) {
                                                    for (Asignatura asignatura : listaAsignatura) {
                                %>
                                <option value="<%=asignatura.getVar_codigo_asignatura()%>"><%=asignatura.getVar_nombre_asignatura()%></option>
                                <%
                                                    }
                                                }
                                            } catch (Exception e) {
                                                e.printStackTrace();
                                            }
                                %>
                            </select>
                        </td>
                        <td class="first">HoraFinal</td>
                        <td class="last">
                            <input type="text" id="horaFinalText" name="horaFinalText" maxlength="10" readonly="true"><input type="button" name="horaFinalButton" value="..." onClick="displayCalendar(horaFinalText, 'hh:ii', this, true);" />
                        </td>
                    </tr>
                    <tr  class="bg">
                        <td class="first">Aulas</td>
                        <td class="last">
                            <select name="comboAulas" id="comboAulas">
                                <option value="0" selected>--SELECCIONE--</option>
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
                        </td>
                        <td class="first">Dia</td>
                        <td class="last">
                            <select name="comboDia" id="comboDia">
                                <option value="0" selected>--SELECCIONE--</option>
                                <option value="LUNES" >LUNES</option>
                                <option value="MARTES" >MARTES</option>
                                <option value="MIERCOLES" >MIERCOLES</option>
                                <option value="JUEVES" >JUEVES</option>
                                <option value="VIERNES" >VIERNES</option>
                                <option value="SABADO" >SABADO</option>
                                <option value="DOMINGO" >DOMINGO</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="first">Docentes</td>
                        <td class="last">
                            <select name="comboDocentes" id="comboDocentes">
                                <option value="0" selected>--SELECCIONE--</option>
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
                        </td>
                        <td></td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr  class="bg">
                        <td colspan="4"><div align="center"><input name="guardar" type="button" id="guardar" value="Guardar" onclick="validarHorario();"/></div></td>
                    </tr>
                     

                       
                    <tr>
                </table>
                <br/>
                <div id="error" style="color:#FF0000;" align="center"></div>
                <%
                            String mensaje = request.getParameter("mensaje");

                            if (mensaje != null && !mensaje.trim().isEmpty()) {
                %>
                <td colspan="4"><div id="mensaje" align="center"><b><%=mensaje%></b></div></td>
                <%          }%>
            </div>
        </form>
    </body>
</html>
