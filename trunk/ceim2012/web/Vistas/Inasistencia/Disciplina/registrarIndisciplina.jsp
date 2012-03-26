<%-- 
    Document   : registrarIndisciplina1
    Created on : 21/11/2011, 11:50:09 PM
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>

    <head>
        <title>Indisciplina Estudiantes</title>
        <meta content="es" http-equiv="Content-Language" />
        <meta content="text/html; charset=utf-8" http-equiv="Content-Type" />

        <link type="text/css" href="../JavaScript/jquery-ui-1.8.16.custom/css/custom-theme/jquery-ui-1.8.16.custom.css" rel="Stylesheet" />
        <script type="text/javascript" src="../JavaScript/jquery-ui-1.8.16.custom/js/jquery-1.6.2.min.js"></script>
        <script type="text/javascript" src="../JavaScript/jquery-ui-1.8.16.custom/js/jquery-ui-1.8.16.custom.min.js"></script>

        <script>
            $(function(){
                $("#resDoc").hide();
                $("a").button();
                $(".boton").button();
                $("#tabs").hide();
            });
        </script>

        <style type="text/css" >
            .style1 {
                text-align: center;
            }
            .style2 {
                font-family: "Times New Roman", Times, serif;
                font-size: x-large;
                color: #FFFFFF;
            }
            .style3 {
                background-color: #006666;
            }
            .style4 {
                text-align: center;
                border-right-style: none;
                border-right-width: medium;
            }
            .style5 {
                border-right-style: none;
                border-right-width: medium;
            }
            .style6 {
                border-right-width: 0px;
                margin-right: 0px;
            }
            .style7 {
                color: #006666;
            }
            .style8 {
                font-weight: bold;
                color: #006666;
            }
            .style9 {
                text-align: left;
            }

        </style>
        <script language="javascript" type="text/javascript" src="../JavaScript/consultarDocente.js"></script>
        <script language="javascript" type="text/javascript" src="../JavaScript/indisciplina.js"></script>
        <script language="javascript" type="text/javascript" src="../JavaScript/consultarEstudiante.js"></script>
        <script language="javascript" type="text/javascript" src="../JavaScript/consultarCoor.js"></script>
        <script language="javascript" type="text/javascript" src="../JavaScript/textoPorDefecto.js"></script>
        <script language="javascript" type="text/javascript" src="../JavaScript/consultarEstudiantePorNombre.js"></script>
        <script language="javascript" type="text/javascript" src="../JavaScript/autocompletar.js"></script>
    </head>

    <body>

     <div class="a">
            <a href ="../index.jsp" style="width: 305px">HOME</a>
            <a href ="../Disciplina/registrarIndisciplina.jsp" style="width: 305px">INDISCIPLINA ESTUDIANTE</a>
            <a href ="../Inasistencia/InasistenciaEstudiante.jsp" style="width: 305px">INASISTENCIA ESTUDIANTES</a>
            <a href ="AgendaEstudiante.jsp" style="width: 305px">AGENDA DEL ESTUDIANTE</a>
        </div></br>
        <table class="style3" style="width: 100%">
            <tr>
                <td class="style1"><span class="style2" lang="es"><strong>INDISCIPLINA
                            DE ESTUDIANTES</strong></span></td>
            </tr>
        </table>
        <table align="left" class="style6" style="width: 21%; height: 438px">
            <tr>
                <td class="style4" style="width: 146px; height: 124px">
                    <img height="118" src="../Imagenes/Img/logoCEIM.png" width="132" /></td>
            </tr>
            <tr>
                <td class="style4" style="width: 146px; height: 36px">
                    <img height="32" src="../Imagenes/Img/Texto%20Ceim.png" width="128" /></td>
            </tr>
            <tr>
                <td class="style5" style="width: 146px">&nbsp;</td>
            </tr>
        </table>
        <table class="style7" align="center">
            <tr>
                <td colspan="4" class="style1"><strong><br><br><br></strong></td>
            </tr>
            <tr>
                <td style="width: 100px" class="style1"><span lang="es"><strong>Nº de Caso:</strong></span></td>
                <td style="width: 106px" class="style1"><strong>
                        <input name="Text1" type="text" class="style8" disabled="disabled" value="00001" /></strong></td>
                <td style="width: 100px" class="style1"><span lang="es"><strong>Estado:</strong></span></td>
                <td class="style9" style="width: 160px"><strong>
                        <input name="Text1" type="text" class="style8" disabled="disabled" value="En Proceso..." /></strong></td>
            </tr>
            <tr>
                <td colspan="4" class="style1"><br></td>
            </tr>
            <tr>
                <td colspan="4" class="style1"><span lang="es"><strong>Digite un nombre
                            descriptivo del caso a registrar:</strong></span></td>
            </tr>
            <tr>
                <td colspan="4" class="style1">
                    <input class="style1" name="nombreCaso" id="nombreCaso" type="text" style="width: 476px" value="Desorden en salon de clases" /></td>
            </tr>
            <tr>
                <td colspan="4" class="style1">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="right" class="style12" style="width: 188px"><strong>
                        <span lang="es">Docente:&nbsp;&nbsp;&nbsp; </span></strong></td>
                <td colspan="3" class="style9">
                    <strong><span lang="es">
                            <input id="idDocVis" type="text" style="width: 131px" />&nbsp;
                            <input id="idDocOculto" type="hidden" style="width: 131px" />
                            <input id="buscarDoc" class="boton" name="Button1" type="button" value="Buscar" />
                            <input id="buscarPorNombre" class="boton" name="Button1" type="button" value="Buscar por Nombre" /></span></strong>
                    <div id="consultarDocente" title="Busqueda por nombre.">
                         <form>
                            <fieldset class="ui-helper-reset">
                                <label for=”name”>Nombre:</label>&nbsp;
                                <input type=”text” name=”name” id="nombreDocente" /><br/>
                            </fieldset>
                        </form>
                    </div>
                </td>
                <td></td>
            </tr>
            <tr>
                <td align="right" class="style12" style="width: 188px"><strong>Coordinador:<span lang="es">&nbsp;&nbsp;&nbsp;
                        </span></strong></td>
                <td colspan="4" class="style9">
                    <strong><span lang="es">
                            <input id="idCoorVis" type="text" style="width: 131px" />&nbsp;
                            <input id="idCoorOculto" type="hidden" style="width: 131px" />
                            <input id="buscarCoor" class="boton" name="Button1" type="button" value="Buscar" /></span></strong>
            </tr>
            <tr>
                <td colspan="4" class="style1">
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="4" class="style9">
                    <span lang="es"><strong>Descripción:</strong></span><br />
                    <textarea name="TextArea1" cols="100" rows="6" style="width: 597px; height: 50px"></textarea></td>
            </tr>
            <tr>
                <td colspan="4" class="style1">
                    <div class="demo">

                        <div id="dialog" title="Agregar Estudiante">
                            <form>
                                <fieldset class="ui-helper-reset">
                                    <table border="0">
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <label for="tab_title">Codigo de Estudiante</label>
                                                </td>
                                                <td>
                                                    <input tabindex="0" size="12" maxlength="11" type="text" name="idEst" id="idEst" value="" class="ui-widget-content ui-corner-all" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label for="nombreEst">Nombre:</label>
                                                </td>
                                                <td>
                                                    <input disabled size="30" ontype="text" name="nombreEst" id="nombreEst" value="" class="ui-widget-content ui-corner-all" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label for="tab_content">Sancion:</label>
                                                </td>
                                                <td>
                                                    <textarea tabindex="1" name="tab_content" id="tab_content" class="ui-widget-content ui-corner-all"></textarea>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label for="tab_title">Compromisos:</label>
                                                </td>
                                                <td>
                                                    <textarea tabindex="2" name="tab_content" id="tab_content_2" class="ui-widget-content ui-corner-all"></textarea>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label for="tab_title">Observaciones:</label>
                                                </td>
                                                <td>
                                                    <textarea tabindex="3" name="tab_content" id="tab_content_3" class="ui-widget-content ui-corner-all"></textarea>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>

                                </fieldset>
                            </form>
                        </div>

                        <button id="add_tab">Agregar Est.</button>

                        <div id="tabs" >
                            <ul>
                                <li><a href="#tabs-1">NOTA</a> <span class="ui-icon ui-icon-close">Remove Tab</span></li>
                            </ul>
                            <div id="tabs-1">
                                <p>Por favor sea claro es las descripciones de cada estudiante, de su buen uso depende el correcto funcionamiento de este software.</p>
                            </div>
                        </div>

                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="4" class="style1">
                    <input class="boton" type="button" id="guardar" value="Guardar">
                </td>
            </tr>
        </table>
    </body>

</html>

