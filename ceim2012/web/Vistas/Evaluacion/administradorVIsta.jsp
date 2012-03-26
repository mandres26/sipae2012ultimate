<%-- 
    Document   : acudiente
    Created on : 29-nov-2011, 15:54:37
    Author     : dell
--%>

<%@page import="com.modelo.Estudiante"%>
<%@page import="com.modelo.Curso"%>
<%@page import="com.controladores.ControladorCurso"%>
<%@page import="java.util.List"%>
<%@page import="com.modelo.Acudiente"%>
<%@page import="com.controladores.ControladorAcudiente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>.: Integral Moderno :.</title>
         <link href="default.css" rel="stylesheet" type="text/css" />
         
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
       <div id="identificacion">(<a href="cerrarSession.jsp">Cerrar sesion</a>)</div>
       <!-- Identificacion  -->
<div id="apDiv2"></div>
<div id="header">
	 
  <div id="logo">
    <h1><a >ADMINISTRADOR</a><br/>
    </h1>
	
  </div>&nbsp;&nbsp;&nbsp;&nbsp;
 
</div>
<div id="menu">
	<ul>
		
	  <li>
	    <div id="apDiv1"><img src="images/ESCUD.png" width="147" height="130"></div>
	  </li>
          <li></li>
  </ul>
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
</div>
<div id="content">
   
	<div id="main">
		<div id="welcome"><center>
                  <b>Estudiantes</b>
                </center>
		       
</div>
            
            <!-- incripcion de estudiante  -->
            
            <div id="listado"  style="width:470px; height:500px; overflow: scroll;" class="pestanaInvisible"> <!--division que muestra el listado, de los estudinates--></div>
 

            <!--   inscripcion   -->
            <form action="InscribirEstudiante" method="POST">
                <div id="listadoEstudiantes" class="listado" style="width:470px; height:500px; overflow: scroll; " hidden="true"></div>
           <input type="hidden" name="guardarInscritos" value="ok"  />  
           <input type="submit" id="gi" value="Guardar" hidden="true"/>  
            </form>
           <!--   fin insripcion   -->                                    
             <!--   inscripcion   -->
              <form action="MatricularEstudiante" method="POST">
                  <div id="listadoEstudiantesM" class="listado" style="width:470px; height:500px; overflow: scroll; " hidden="true"></div>
                  <input type="hidden" name="guardarInscritos" value="ok" />  
                  <input type="submit" id="gm" value="Guardar" hidden="true"/>  
              </form>
           <!--   fin insripcion   -->                                     
          
                                                
            <p><br/> 
           <br/> 
              <br/><br/> <br/> <br/>
              
            </p>
        <div id="example">
			 
		
		  <blockquote> </blockquote>
	  </div>
	
    </div>
	<div id="sidebar">
            <form id="form1" method="post" action="InicioSesion">
	  
      </form>
		<div id="updates" class="boxed">
			<h2 class="title">Opciones</h2>
			<div class="content">
				<ul>
					<li>
						<h3>
					<a href="#" 
                  onclick="inscripcion();sendRequest('GET','listadoInscripcion.jsp');">Inscribir Estudiante</a></h3></li>
					<li>
						<h3>
					<a href="#" onclick="matricula();sendRequest2('GET','listadoMatricula.jsp')">Matricular Estudiante</a></h3></li>
				</ul>
			</div>
		</div>
		
	</div>

  <p>&nbsp;</p>
  <p>&nbsp;</p>
</div>
<div id="footer">
	<p id="legal">Institucion Integral Moderno</p>
	</div>
   
    </body>
</html>
