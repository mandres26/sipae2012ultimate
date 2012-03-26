<%-- 
    Document   : acudiente
    Created on : 29-nov-2011, 15:54:37
    Author     : dell
--%>

<%@page import="Conceptos.Estudiante"%>
<%@page import="ManejadorMatriculas.ControladorAcudiente"%>
<%@page import="Conceptos.Acudiente"%>
<%@page import="java.util.List"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>.: :.</title>
         <link href="style_inter/default.css" rel="stylesheet" type="text/css" />
         
        <script src="js/Opciones.js" language="JavaScript"></script>
        
         <%
         String usuario=(String)request.getSession().getAttribute("usuario");
         String pass=(String)request.getSession().getAttribute("pass");
     Acudiente a=ControladorAcudiente.isUsurioPass(usuario, pass);
     Estudiante est=new Estudiante();        
     %>
     <script><!--
         
         function inscripcion(){
            
             document.getElementById("listadoEstudiantes").hidden=false;
             document.getElementById("gi").hidden=false;
             document.getElementById("gm").hidden=true;
             document.getElementById("listadoEstudiantesM").hidden=true;
         }
         function matricula(){
            
             document.getElementById("listadoEstudiantesM").hidden=false;
             document.getElementById("gi").hidden=true;
             document.getElementById("gm").hidden=false;
             document.getElementById("listadoEstudiantes").hidden=true;
         }
         
        window.onload = function(){
             
          
            <%String info=(String)request.getSession().getAttribute("info");
             if(info!=null)
              if(!info.trim().equalsIgnoreCase("")){
                                           
                                         
               
            %>
                  timer = window.setTimeout("cerrar()", 3000);
                  <%
                 }
%>
             
               
	};
      function cerrar(){
         
          document.getElementById("msj").hidden=true;
      }
         
         --></script>
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
    </head>
    <body>
        <div class="borde">
        <div class="espacio">    
       <div id="identificacion">(<a href="cerrarSession.jsp">Cerrar sesion</a>)</div>
       <!-- Identificacion  -->
<div id="apDiv2"></div>
<div id="header">
	 
 
    <h1>ADMINISTRADOR</h1>
 
</div>
<div id="menu">
	<ul>
	<li>
	<a href="listadoInscripcion.jsp" 
                  onclick="inscripcion()">Inscribir Estudiante</a></li>
	<li>
	<a href="listadoMatricula.jsp" onclick="matricula()">Matricular Estudiante</a></li>
	</ul>
</div>
                 
 
<div id="msj" >
		        <%
                                       if(info!=null){
                                           if(!info.trim().equalsIgnoreCase("")){
                                           out.print("<h5 style=\"color:red\">"+info+"</h5>");
                                           //request.getSession().setAttribute("info", "");
                                          }
                                        }
%>
</div>
<div id="content">
   
	
		
                  <b>Estudiantes</b>
              
		       

            <iframe  name="zona1" style="width:800px; height:auto; overflow: auto;" /><!--division que muestra el listado, de los estudinates--></iframe>
              
            <!-- incripcion de estudiante  -->
            
            <div id="listado"  style="width:900px; height:100px; overflow: auto;" class="pestanaInvisible"> <!--division que muestra el listado, de los estudinates--></div>
 

            <!--   inscripcion   -->
            <form target="zona1"  action="InscribirEstudiante.jsp" method="POST">
                <div id="listadoEstudiantes" class="listado" style="width:900px; height:100px; overflow: auto; " hidden="true"></div>
           <input type="hidden" name="guardarInscritos" value="ok"  />  
           <input type="submit" id="gi" value="Guardar" hidden="true"/>  
            </form>
           <!--   fin insripcion   -->                                    
             <!--   inscripcion   -->
              <form target="zona1" action="MatricularEstudiante.jsp" method="POST">
                  <div id="listadoEstudiantesM" class="listado" style="width:900px; height:100px; overflow: auto; " hidden="true"></div>
                  <input type="hidden" name="guardarInscritos" value="ok" />
                  <br/><br/>
                  <input type="submit" id="gm" value="Guardar" hidden="true"/>  
              </form>
           <!--   fin insripcion   -->                                     
          
           <p><br/> 
           <br/> 
              <br/><br/> <br/> <br/>
              
            </p>                                     <hr>

        <div id="example">
			 
		
		  <blockquote> </blockquote>
	  </div>
	
    </div>
	

  <p>&nbsp;</p>
  <p>&nbsp;</p>
</div>
        </div>
<div class="wrapper col6">
  <div id="copyright">
    <p class="fl_left">Copyright © 2012 - All Rights Reserved - <a href="#">Domain Name</a></p>
    <p class="fl_right">fitco by <a href="#" title="Fundacion Universitaria Tecnologico Comfenalco">Fundacion Universitaria Tecnologico Comfenalco</a></p>
    <br class="clear">
  </div>
</div>           
             
</html>
