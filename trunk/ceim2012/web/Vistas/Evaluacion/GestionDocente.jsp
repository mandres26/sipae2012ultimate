<%-- 
    Document   : GestionDocente
    Created on : 1/04/2012, 11:23:02 PM
    Author     : Usuario
--%>

<%@page import="ManejadorSEvaluacion.ControlDocenteAsignatura"%>
<%@page import="Conceptos.DocenteAsignatura"%>
<%@page import="ManejadorHorario.ControlAsignatura"%>
<%@page import="Conceptos.Asignatura"%>
<%@page import="java.util.Iterator"%>
<%@page import="Conceptos.Logro"%>
<%@page import="ManejadorSEvaluacion.ControladorLogro"%>
<%@page import="ManejadorHorario.ControlDocente"%>
<%@page import="Conceptos.Docente"%>
<%@page import="Utilidades.ManejadorBaseDatos"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
     
    
    
        <script type="text/javascript">
            <!--
	window.onload = function(){
		new JsDatePick({
			useMode:2,
			target:"calen1",
			dateFormat:"%d-%M-%Y"
			
		});
                
                new JsDatePick({
			useMode:2,
			target:"calen2",
			dateFormat:"%d-%M-%Y"
			
		});
	};
        
        function agregarFechasToCamposTexto(){
            document.getElementById("fi").value=document.getElementById("calen1").value;
            document.getElementById("ff").value=document.getElementById("calen2").value;
        }
         function add(codigo, name){
                 
                   document.getElementById("text").value=codigo;
                   document.getElementById("name").value=name;
               }
        -->
</script>
 
         
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>.: Gestion Docente :.</title>
         <link href="style_inter/default.css" rel="stylesheet" type="text/css" />
          <link rel="stylesheet" type="text/css" media="all" href="calendario/jsDatePick_ltr.min.css" />
<script type="text/javascript" src="calendario/jquery.1.4.2.js"></script>
<script type="text/javascript" src="calendario/jsDatePick.jquery.min.1.3.js"></script>

         <script src="pestannasEstudiante.js" language="JavaScript"></script>
        
        
    <style type="text/css">
    #apDiv1 {
	position:absolute;
	width:145px;
	height:115px;
	z-index:1;
	left: 141px;
	top: 63px;
}
    #identificacion {
	position:absolute;
	width:518px;
	height:51px;
	z-index:2;
	left: 599px;
	top: 16px;
}
    </style>
        
         <%
         String usuario=(String)request.getSession().getAttribute("usuario");
         String pass=(String)request.getSession().getAttribute("pass");
         Docente doc=ControlDocente.isUsuarioPass(usuario, pass);
    
     
     %>
    </head>
 
    <body>
 <div class="borde2">
<div class="espacio2">         
        <div id="identificacion"><%=doc.getVar_nombre_docente().toUpperCase()+" "+doc.getVar_apellido_docente().toUpperCase()%>(<a href="../../cerrarSession.jsp">Cerrar sesion</a>)</div>
       <!-- Identificacion  -->

<div id="header">
<h4>Docente</h4>	 
 </div>

<div id="menu">
	<ul>
		
	  <li>
	    <div id="apDiv1"><img src="images/ESCUD.png" width="147" height="130"></div>
	  </li>
      <li><a href="GestionDocente.jsp">Inicio</a> </li>
          <li> <a href="notas.jsp" >Notas </a></li>
		
  </ul>
    
</div>
       <br/><br/>
  	
                            <table  style="float: left;">
                             <thead>
                             <tr>
                                <th>ASIGNATURA</th>
                              </tr>
                            </thead>   
                    <tbody>	 
                   <!-- aqui van las asignaturas del docente..  -->
                    <tr>
                    <td>
                    <%
                    
                    List <DocenteAsignatura> docasigs = ControlDocenteAsignatura.listarDocenteAsignatura("01");
                    Iterator ita=docasigs.iterator();
                      while(ita.hasNext()){
                    DocenteAsignatura docasig =(DocenteAsignatura)ita.next();
                    
                       %>
                       <ul>
                           <form action="RegistrarActividad.jsp" target="zona1">
                           <li><%=docasig.getAsignatura().getVar_nombre_asignatura()%></li>
                            <input type="submit" name="codigoasig" value="<%=docasig.getAsignatura().getVar_codigo_asignatura()%>" />
                    
                           </form>
                       </ul>
                      <%
                           }
                         %>
                         </td>
                          </tr>
			 </tbody>		
                            </table>							
                         <div id="right"><iframe id="iframe" name="zona1"></iframe></div>		

	
                                        
            <!-- incripcion de estudiante  -->
            
      <div id="listado"  style="width:470px; height:500px; overflow: scroll;" class="pestanaInvisible"> <!--division que muestra el listado, de los estudinates--></div>
 
              
           
</div>
      
 <div class="wrapper col6">
  <div id="copyright">
    <p class="fl_left">Copyright © 2012 - All Rights Reserved - <a href="#">Domain Name</a></p>
    <p class="fl_right">fitco by <a href="#" title="Fundacion Universitaria Tecnologico Comfenalco">Fundacion Universitaria Tecnologico Comfenalco</a></p>
    <br class="clear">
  </div>       
 </div> 
    </body>
</html>
