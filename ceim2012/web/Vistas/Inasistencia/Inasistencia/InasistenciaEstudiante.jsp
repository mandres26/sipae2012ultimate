<%--
    Document   : InasistenciaEstudiante
    Created on : 10-nov-2011, 20:53:03
    Author     : M4ST3R
--%>
<jsp:useBean id="inasistencia" scope="page" class="Conceptos.Asistencia.Inasistencia" />

<%@page import="Conceptos.Asistencia.*"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="MPAsistencia.CursoDAO"%>
<%@page import="java.util.StringTokenizer"%>
<%@page import="MPAsistencia.InasistenciaDAO"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.List"%>
<%@page import="Utilidades.Model"%>
<%@page import="java.util.Iterator"%>
<%@page import="Utilidades.ManejadorBaseDatos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestion Inasistencia</title>
        
        
        <link type="text/css" href="../JavaScript/jquery-ui-1.8.16.custom/css/custom-theme/jquery-ui-1.8.16.custom.css" rel="Stylesheet" />
        <script type="text/javascript" src="../JavaScript/jquery-ui-1.8.16.custom/js/jquery-1.6.2.min.js"></script>
        <script type="text/javascript" src="../JavaScript/jquery-ui-1.8.16.custom/js/jquery-ui-1.8.16.custom.min.js"></script>
        <script type="text/javascript" src="../JavaScript/jquery-ui-1.8.16.custom/js/jquery.dataTables.min.js"></script>

        <style type="text/css">
           .style1
        {
            text-align: center;
        }
        .style5
        {
            width: 185px;
            height: 147px;
            text-align: center;
        }
        .style2
        {
            background-color: #006666;
            border-style: outset;
            color: #FFFFFF; font-weight: bold;
            text-align: center;
        }
        .style7
        {
            font-weight: bold;
        }
        .logo
        {
            width: 185px;
            height: 175px;
            text-align: center;
        }
        .style11
        {
            border-color: #008080;
            border-right-style: ridge;
            width: 290px;
        }
        .style9
        {
            font-weight: normal;
        }
        .style10
        {
            
            background-color: #006666;
            border-style: outset;
            color: #FFFFFF;
            font-weight: bold;
            text-align: center;
            width: 334px;
            height: 30px;
        }
        .celdasverdes
        {
            border-color: #008080;
            border-right-style: ridge;
            width:100%;
        }
        </style>
        
        <script>
            $(document).ready(function(){
                $("#tablainasistencia").dataTable({
                    "bJQueryUI": true,
                    "aaSorting": [[ 1, "asc" ]],
                    "aoColumns": [
                    null,
                    null,
                    { "bSortable": false, "bSearchable": false },
                    { "bSortable": false, "bSearchable": false },
                    { "bSortable": false, "bSearchable": false },
                ]
                });
            })
            $(document).ready(function(){
                $("#tablalistar").dataTable({
                    "bJQueryUI": true,
                    "aaSorting": [[ 0, "desc" ]],
                    "aoColumns": [
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    { "bSortable": false},
                    { "bSortable": false},
                    //{ "bSortable": false, "bSearchable": false },
                ]
                });
            })
    
                 
            $(document).ready(function(){
               $("#calendario").datepicker();
            })
            $(function() {
                    $( "#accordion" ).accordion();

            });
            $(function() {
                    $("input:submit, input:button",".demo").button();
                    $("a").button();
                    $("a",".demo").click(function() { return false;});

            });
            $(function() {
                    $( "#check" ).button();
                    $( "#format" ).buttonset();
            });
            $(function() {
                    $( "#tabs" ).tabs({
                            ajaxOptions: {
                                    error: function( xhr, status, index, anchor ) {
                                            $( anchor.hash ).html(
                                                    "Couldn't load this tab. We'll try to fix this as soon as possible. " +
                                                    "If this wouldn't be a demo." );
                                    }
                            }
                    });
            });
    
        function fnFilterColumn ( i )
	{
            $('#tablalistar').dataTable().fnFilter( 
                    $("#col"+(i+1)+"_filter").val(),
                    i
            );
	}

        $(document).ready(function() {
            $('#tablalistar').dataTable();

            $("#col4_filter").change(function() { fnFilterColumn( 3 ); } );

            $("#col5_filter").change(function() { fnFilterColumn( 4 ); } );

            $("#col6_filter").change( function() { fnFilterColumn( 5 ); } );
        } );
        function marcar_todo(form){ 
           for (i=0;i<form.elements.length;i++) 
              if(form.elements[i].type == "checkbox")	
                 form.elements[i].checked=1;
        } 
        function desmarcar_todo(form){ 
           for (i=0;i<form.elements.length;i++) 
              if(form.elements[i].type == "checkbox")	
                 form.elements[i].checked=0; 
        } 
        
        </script>
        
</head>
<body >
    <%
       String nomcurso = "";
       String docente = "Echavez Angelica";
       String codcurso ="";
       
       Date fecha = new Date();
       InasistenciaDAO id =new InasistenciaDAO();
       SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
      
       ManejadorBaseDatos mbd = ManejadorBaseDatos.getInstancia();
       
       CursoDAO cd = new CursoDAO();
       Iterator it=null;

        try {
            mbd.conectar();
            cd.setConexion(mbd.getConexion());

            it = cd.buscarCursos().iterator();

        }catch (NullPointerException e){
            %>
        <h1 class="style2">Bruto El Servidor De Base de Datos No Esta Corriendo !!!</h1><%
        }catch (Exception e){

            %><h1 class="style2">Error Inesperado !!!</h1><%
        }
     %>
    
    <div class="a">
        <a href ="../index.jsp" style="width: 24.5%">HOME</a>
        <a href ="../Disciplina/registrarIndisciplina.jsp" style="width: 24.5%">INDISCIPLINA ESTUDIANTE</a>
        <a href ="InasistenciaEstudiante.jsp" style="width: 24.5%">INASISTENCIA ESTUDIANTES</a>
        <a href ="AgendaEstudiante.jsp" style="width: 24.5%">AGENDA DEL ESTUDIANTE</a>
    </div>
    
     
     <div id="tabs">
        <ul>
                <li><a href="#tabs-1">Registrar</a></li>
                <li><a href="#tabs-2">Consultas</a></li>
        </ul>
        <div id="tabs-1"> 
            <h1 class="style2">REGISTRAR INASISTENCIA DE ESTUDIANTES</h1>
           
            <table style="width:100%;" >
                <tr class="celdasverdes">
                    <td class="style11">

                        <form id="formcursos"  method="post" action="InasistenciaEstudiante.jsp">
                            <table>
                                <tr style="width: 80%"><center>
                                    <img class="logo" src="../Imagenes/Img/logoCEIM.png"/></br>
                                    <img src="../Imagenes/Img/Texto Ceim.png"/>
                                </center></tr>

                             <tr ></br>
                                <div id="accordion"  style="width: 95%">

                                    <h3><a href="#">INFORMACION DEL CURSO:</a></h3>
                                        <div> 
                                           <b>FECHA: <span class="style9"><%=sdf.format(fecha)+" "%></span>
                                            <br /> </br>
                                            ELEGIR CURSO:
                                             <div class="demo">
                                               <select name="cboCursos">
                                                <option>-</option>
                                                    <%    
                                                    while(it.hasNext()){
                                                       Curso curso = new Curso();
                                                       curso = (Curso)it.next();                   
                                                        %>
                                                       <option><%=curso.getNombre()+" "+curso.getSeccion()%></option>
                                                    <%}

                                                nomcurso = request.getParameter("cboCursos");
                                                %>
                                               </select>
                                                <input type="submit" value="OK" name="btOk" />
                                            </div>
                                            </br> 
                                            DOCENTE: <span class="style9">
                                            <%=docente%></span>
                                            <input type="hidden" name="docente" id="docente" value="<%=docente%>"/>
                                            </br></br> 
                                            CURSO:<span class="style9">
                                            <%if(nomcurso!=null && !nomcurso.equals("-") ){%>

                                                <%=nomcurso%>
                                            <%}else{
                                                %>No Elegido<%
                                            }%> 
                                            
                                            </span> </b>
                                        </div>
                                    <h3><a href="#">NOVEDADES:</a></h3>
                                        <div>
                                            <b>Tema:</b><br />
                                            Examen Castellano,<br />
                                            Lunes 2 Octubre
                                        </div>   
                                    <h3><a href="#">CALENDARIO:</a></h3>
                                            <div id="calendario"></div>
                                  </div>
                                </tr>
                            </table>
                        </form>
                    </td>
                    <td>

                    <form id="formasistencia" method="post" action="InasistenciaEstudiante.jsp">
                       <%
                       try{

                          if (nomcurso != null && !nomcurso.equals("-") && request.getParameter("btSalvar") == null){

                              it = cd.buscarEstudiantesCurso(nomcurso).iterator();
                       %>
                       <div style="margin-left: 10%; margin-right: 10%">
                            <table id="tablainasistencia" style="border-width: thin; border-style: groove; width: 96%; text-align: center;" align="center" rules="rows">
                                <thead>
                                    <tr>
                                        <td align="center" class="style2">Codigo</td>

                                        <td align="center" class="style2">Apellidos y Nombres</td>

                                        <td align="center" class="style2">Ausente</td>

                                        <td align="center" class="style2">Historial</td>

                                        <td align="center" class="style2">Observaciones</td>
                                    </tr>
                                </thead>

                                   <%
                                      while(it.hasNext()){
                                         Estudiante est = new Estudiante();
                                         est = (Estudiante)it.next();
                                         docente = request.getParameter("docente");
                                        %>

                                           <tr>
                                               <td><%=est.getCodigo()%></td>
                                              <td><%=est.getApellidos()+" "+est.getNombres()%></td> 
                                              <td>
                                              <% 
                                                id.setConexion(mbd.getConexion()); 
                                                inasistencia=id.verificarExistencia(est.getCodigo(),docente, nomcurso/*,asignatura*/);
                                                   
                                              if(inasistencia!=null){

                                                    %><input type="checkbox" name="ausente<%=est.getCodigo()%>"  CHECKED/><%
                                              }else{
                                             
                                                    %><input type="checkbox" name="ausente<%=est.getCodigo()%>"/><%
                                              }%>
                                              </td>
                                              
                                            <td><div class="demo"><button type="button" name="historial<%=est.getCodigo()%>"><img src="../Imagenes/iconos/iconohistorial.png"/></button></div></td>
                                           
                                            <%if(inasistencia!=null ){%>
                                                <td><textarea name="textObservaciones<%=est.getCodigo()%>" rows="1" cols="20" ><%=inasistencia.getObservaciones()%></textarea></td>  
                                            <%}else{%>
                                                <td><textarea name="textObservaciones<%=est.getCodigo()%>" rows="1" cols="20" ></textarea></td> 
                                            <%}%>
                                        </tr>

                                       <%
                                        codcurso = est.getCodCurso();
                                        }%>
                              </table>
                              
                            <div class="demo" style="text-align: center">
                              <input type="button" name="marcartodos" onclick="javascript:marcar_todo(this.form)" value="Marcar Todos"/>
                              <input type="button" name="desmarcartodos" onclick="javascript:desmarcar_todo(this.form)" value="Desmarcar Todos"/>
                              </br></br> 
                              <input type="submit" value="Guardar Datos" name="btSalvar"/>
                            </div>
                            <input type="hidden" name="codcurso" value="<%=codcurso%>"/>
                            <input type="hidden" name="nomdocente" value="<%=docente%>"/>
                            <input type="hidden" name="cursoactual" value="<%=request.getParameter("cboCursos")%>" />
                         </div> 
                            <%
                            }else if (request.getParameter("btSalvar") != null){

                                       String codestudiante = "";
                                       docente = request.getParameter("nomdocente");
                                       nomcurso = request.getParameter("cursoactual");
                                       Iterator<String> it2 = cd.listaCodEstudiantes(nomcurso).iterator();
                                       id.setConexion(mbd.getConexion());
                                       
                                       while(it2.hasNext()){

                                           codestudiante = it2.next();
                                           inasistencia=id.verificarExistencia(codestudiante,docente, nomcurso/*,asignatura*/);
                                           
                                            //si ocurre esto inserta
                                           if(request.getParameter("ausente"+codestudiante) != null && inasistencia == null){
                                             
                                                Inasistencia ina = new Inasistencia();
                                                ina.setcodEstudiante(codestudiante);
                                                ina.setIdCurso(Integer.parseInt(request.getParameter("codcurso")));
                                                ina.setFecha(new Timestamp(new Date().getTime()));
                                                ina.setCodDocente("789");
                                                ina.setAsignatura("2");
                                                ina.setIdExcusa(Integer.parseInt(codestudiante));
                                                ina.setObservaciones(request.getParameter("textObservaciones"+codestudiante));
                                                
                                                id.addAsistencia(ina);
                                                
                                                
                                           //si ocurre esto actualiza
                                           }else if(request.getParameter("ausente"+codestudiante) != null && inasistencia != null){
                                               
                                               Inasistencia ina = new Inasistencia();
                                                ina.setIdExcusa(Integer.parseInt(codestudiante));
                                                ina.setObservaciones(request.getParameter("textObservaciones"+codestudiante));
                                                ina.setId(inasistencia.getId());
                                                
                                                id.actualizarAsistencia(ina);
                                               
                                               
                                           //si ocurre esto elimina
                                           }else if(request.getParameter("ausente"+codestudiante) == null && inasistencia != null){
                                               
                                                id.eliminarAsistencia(inasistencia.getId());
                                                
                                                
                                           }
                                       }
                                     %>
                                       <h2 style="text-align:center ; color : #006666; font-weight: bold"><img src="../Imagenes/Img/guardado.png" style="text-align:center"/></br>
                                           DATOS GUARDADOS CON EXITO !!!</h2><%

                            }else if (nomcurso.equals("-")){

                               throw new NullPointerException();
                            }
                         }catch(NullPointerException e){

                              %><h2 style="text-align:center ; color : #006666; font-weight: bold"><img src="../Imagenes/Img/interrogacion.png"/></br>
                                  ELIJA EL CURSO A TOMAR ASISTENCIA !!!</h2><%
                         }catch(Exception e){

                                  %><h2 style="text-align:center ; color : red; font-weight: bold ">ERROR NO IDENTIFICADO REGISTRAR !!!</h2>
                       <%}%>
                        
                     </form>
                     </td>
                </tr>
            </table>
        </div>
       <div id="tabs-2">
           <h1 class="style2">LISTADO INASISTENCIA DE ESTUDIANTES</h1>
        
           <div style="text-align: center">
              <strong>[FILTROS]</strong></br></br>
                         
              <%  cd.setConexion(mbd.getConexion() );
                 Iterator it5 = cd.buscarCursos().iterator();
   
                 id.setConexion(mbd.getConexion() );
                 %>
              Curso: 
              
              <select  name="col4_filter" id="col4_filter">
                 <option></option> 
                 <% 
                 while(it5.hasNext()){
                       Curso c = new Curso();
                       c = (Curso)it5.next();                  
                        %>
                   <option><%=c.getNombre()+" "+c.getSeccion()%></option> 
               <%}
                 it5 = null;
                %>
              </select> 
              
              Docente:  
              
              <select name="col5_filter" id="col5_filter">
                 <option></option> 
                 <% it5 = id.listaDocentes().iterator();
                 
                 while(it5.hasNext()){
                       String doc  = (String)it5.next();                  
                        %>
                   <option><%=doc%></option> 
               <%}
                 it5=null;
                %>
              </select>  
              
              Asignatura:   <select name="col6_filter" id="col6_filter">
                 <option></option> 
                 <% 
                 it5 = id.listaAsiganturas().iterator();
                 
                 while(it5.hasNext()){
                       String asig  = (String)it5.next();                  
                        %>
                   <option><%=asig%></option> 
               <%}%>
              </select>  
              
           </div></br>
              
              <form id="formlistar" name="formlistar" method="post" action="InasistenciaEstudiante.jsp">
                       <%
                       try{
                         // if (nombre != null && !nombre.equals("-") && request.getParameter("btSalvar") == null){
                       %>
                       
                        <table id="tablalistar" style="border-width: thin; border-style: groove; width: 98.5%; text-align: center;" align="center" rules="rows">
                               <thead>
                                    <tr>
                                        <td align="center" class="style2">Fecha y Hora</td>
                                        
                                        <td align="center" class="style2">Codigo</td>
                                        
                                        <td align="center" class="style2">Apellidos y Nombres</td>

                                        <td align="center" class="style2">Curso</td>
                                        
                                        <td align="center" class="style2">Docente</td>
                                        
                                        <td align="center" class="style2">Asignatura</td>

                                        <td align="center" class="style2">Excusa</td>
                                        
                                        <td align="center" class="style2">Observaciones</td>
                                    </tr>
                               </thead>     
                                 <%
                                 id.setConexion(mbd.getConexion());
                                 Iterator<Inasistencia> it3 = id.listarAsistencia().iterator();
                                 Inasistencia inas =null;
                                  while(it3.hasNext()){
                                     inas =new Inasistencia();
                                     inas = it3.next();
                                     
                                  %>
                                  
                                     <tr>
                                        <td>
                                            <%=inas.getFecha()%>
                                        </td>
                                        <td>
                                            <%=inas.getCodEstudiante()%>
                                        </td> 
                                        <td>
                                            <%=inas.getNombreestudiante()%>
                                        </td>
                                        <td>
                                            <%=inas.getNombrecurso()%>
                                        </td>
                                        <td>
                                            <%=inas.getNombredocente()%>
                                        </td>  
                                        <td>
                                            <%=inas.getAsignatura()%>
                                        </td>  
                                        <td>Mi Excusa 
                                            <%=inas.getCodEstudiante() //debe ir la excusa inas.getDescripcionExcusa();
                                            %>
                                        </td>  
                                        <td>
                                            <%=inas.getObservaciones()%>
                                        </td>  
                                  </tr>

                               <%}%>
                                    </tr>
                        </table></br>

                        
            <%      //}fin del si te la pestaña 3    
             }catch(Exception e){%>
                <h2 style="text-align:center ; color : red; font-weight: bold ">ERROR NO IDENTIFICADO AL LISTAR !!!</h2>
            <%}%>
           
           </form>
           
        </div>               
                       
    </div>
</body>
</html>
