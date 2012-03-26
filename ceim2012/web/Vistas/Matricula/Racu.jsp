<%-- 
    Document   : acudiente
    Created on : 29-nov-2011, 15:54:37
    Author     : dell
--%>


<%@page import="java.util.List"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
        <title>.: Registro  de Acudiente :.</title>
          <link rel="stylesheet" type="text/css" media="all" href="calendario/jsDatePick_ltr.min.css" />
          <link rel="stylesheet" type="text/css"  href="style_inter/default.css" />
          
<script type="text/javascript" src="calendario/jquery.1.4.2.js"></script>
<script type="text/javascript" src="calendario/jsDatePick.jquery.min.1.3.js"></script>
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
          

<div class="borde">
<div class="espacio">

<div id="header">
    <img id="imagen" src="images/acudiente.png" />
    <br/><br/>
    <h3>Registro de Acudiente</h3>
</div>

<div id="content">
    <br/>
   <div id="welcome">
                    <a href="">Home</a>
		</div>
	<div id="main">
		
        <div id="listado"  style="width:470px; height:500px; overflow: scroll;" class="pestanaInvisible"> <!--division que muestra el listado, de los estudinates--></div>
    <!-- formulario para guardar el acudiente-->
        <form action="GuardarAcudiente.jsp" method="POST">
                <input type="hidden" id="filtro" name="filtro" value="no" />
                <center><br/><br/>
                    <h2><b>Acudiente</b></h2>
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
                    <td>telefono<br/><input type="text" name="telefono" value="" />&nbsp;&nbsp;</td>
                </tr>
                
                <tr>
                    <td>direccion<br/><input type="text" name="direcion" value="" />&nbsp;&nbsp;</td>
                    <td >Fecha de nacimiento<br/><input type="text" name="fn" id="calen1" value="" />&nbsp;&nbsp;</td>
                    <td>email<br/><input type="text" name="email" value="" />&nbsp;&nbsp;</td>
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
                <input type="submit" value="Registrar" />
                <br/> <br/>
   </form>
                 <!-- este es el listado  --> 
</div></div>                                             
</div>
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
