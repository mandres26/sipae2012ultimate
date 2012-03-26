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
          <link rel="stylesheet" type="text/css" media="all" href="http://localhost:8080/VistaThis/calendario/jsDatePick_ltr.min.css" />
<script type="text/javascript" src="http://localhost:8080/VistaThis/calendario/jquery.1.4.2.js"></script>
<script type="text/javascript" src="http://localhost:8080/VistaThis/calendario/jsDatePick.jquery.min.1.3.js"></script>
<script type="text/javascript">
	window.onload = function(){
		new JsDatePick({
			useMode:2,
			target:"calen1",
			dateFormat:"%d-%M-%Y"
			
		});
                
               
	};
</script>
        <script src="validacion.js" language="JavaScript"></script>
        <%
           String filtro=request.getParameter("filtro");    
           if(filtro!=null)
               if(filtro.equals("ok")){
                   
                   
               }
              
           
        
     %>
         <link href="default.css" rel="stylesheet" type="text/css" />
         
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
	left: 701px;
	top: 46px;
}
    </style>
    </head>
    <body>
       <div id="identificacion"></div>
       <!-- Identificacion  -->
<div id="apDiv2"></div>
<div id="header">
	 
  <div id="logo">
    <h1><a >rEGISTRAR Acudiente</a><br/>
    </h1>
	
  </div>&nbsp;&nbsp;&nbsp;&nbsp;
 
</div>
<div id="menu">
	<ul>
		
	  <li>
	    <div id="apDiv1"><img src="images/ESCUD.png" width="147" height="130"></div>
	  </li>
          <li>Bienvenido</li>
		
  </ul>
    
</div>
<div id="content">
   
	<div id="main">
		<div id="welcome"><a href="index.jsp">Home</a>
		       
      </div>
            
            <!-- incripcion de estudiante  -->
            
            <div id="listado"  style="width:470px; height:500px; overflow: scroll;" class="pestanaInvisible"> <!--division que muestra el listado, de los estudinates--></div>
 

            
            <div id="inscripcion" class="pestanaVisible">
                <form action="RegistrarUsuario" method="POST">
                
                <input type="hidden" id="filtro" name="filtro" value="no" />
                <center>
                  <b>Acudiente</b>
                </center><br/>
                <table >
            
            <tbody>
                
                <tr>
                  
                    <td>Identificacion<br/><input type="text" name="id" value="" />&nbsp;&nbsp;</td>
            <td>Nombre:<br/> <input type="text" name="nombre" value="" />&nbsp;&nbsp;</td>
                    <td>apellido:<br/> <input type="text" name="apellido" value="" />&nbsp;&nbsp;</td>
                </tr>
              
                <tr>
                    
                      <td>usuario: <br/><input type="text" name="usuario" value="" /><br/>&nbsp;&nbsp;</td>
                    <td>contraseña:<br/><input type="text" name="contrasena" value="" />&nbsp;&nbsp;</td>
                    <td>telefono<br/>
        <input type="text" name="telefono" value="" />&nbsp;&nbsp;</td>
                    
                </tr>
                
                <tr>
                    <td>direccion<br/>
        <input type="text" name="direcion" value="" />&nbsp;&nbsp;</td>
                    <td >Fecha de nacimiento<br/>
                        <input type="text" name="fn" id="calen1" value="" />&nbsp;&nbsp;</td>
                   
        <td>email<br/>
        <input type="text" name="email" value="" />&nbsp;&nbsp;</td>
                </tr>
                <tr>
                    
                    <td colspan="3">sexo<br/>
                        <select name="sexo" style="width: 155px">
            <option>Masculino</option>
            <option>Femenino</option>
        </select>&nbsp;&nbsp;</td> 
                </tr>
                
                
            </tbody>
        </table>
                <br/>
                
       <input type="submit" value="registrar" onclick="registroacudiente()"/>
               
                </form>
                  <!-- este es el listado  --> 
             
               
            </div>
                      
                                                
                                                
          
                                                
            <br/> <br/> <br/><br/> <br/> <br/>
		<div id="example">
			 
		
		  <blockquote> </blockquote>
	  </div>
	
    </div>
	<div id="sidebar">
            <form id="form1" method="post" action="InicioSesion">
	  
      </form>
		<div id="updates" class="boxed">
			<h2 class="title">eVENTOS</h2>
			<div class="content">
				<ul>
					<li>
						<h3>Diciembre 2, 2011</h3>
						<p><a href="#">Sustentaciones de proyectos</a> </p>
					</li>
					<li></li>
					<li>
						<h3>Diciembre 5, 2011</h3>
						<p><a href="#">Despedidda de fin de año...</a></p>
					</li>
					<li></li>
					<li>					</li>
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
