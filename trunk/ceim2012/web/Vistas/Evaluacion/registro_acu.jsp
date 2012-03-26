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
     <script src="validacion.js" language="JavaScript"></script>
        <%
           String filtro=request.getParameter("filtro");    
           if(filtro!=null)
               if(filtro.equals("ok")){
                   
                   
               }
              
           
        
     %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>.: Integral Moderno :.</title>
         <link href="Nueva carpeta/VistaThis/web/default.css" rel="stylesheet" type="text/css" />
         
         <script src="Nueva carpeta/VistaThis/web/pestannasEstudiante.js" language="JavaScript"></script>
        
         <%
         String usuario=(String)request.getSession().getAttribute("usuario");
         String pass=(String)request.getSession().getAttribute("pass");
     Acudiente a=ControladorAcudiente.isUsurioPass(usuario, pass);
Estudiante est=new Estudiante();        
     %>
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
<!-- Identificacion  -->
<div id="apDiv2"></div>
<div id="header">
	 
  <div id="logo">
    <h1><a >Acudiente</a><br/>
    </h1>
	
  </div>&nbsp;&nbsp;&nbsp;&nbsp;
 
</div>
<div id="menu">
	<ul>
		
	  <li>
	    <div id="apDiv1"><img src="Nueva carpeta/VistaThis/web/images/ESCUD.png" width="147" height="130"></div>
	  </li>
          <li></li>
		
  </ul>
    
</div>
<div id="content"><br/><br/><br/>

<form action="index.jsp" method="POST">
         <input type="hidden" id="filtro" name="filtro" value="no" />
        usuario: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  contraseña:<br/>
        <input type="text" name="usuario" value="" />
        
        <input type="text" name="contrasena" value="" /><br/>
        identificacion:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;nombre<br/>
        <input type="text" name="id" value="" />
     
        <input type="text" name="nombre" value="" />
<br/>
        apellido:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;			               telefono<br/>
        <input type="text" name="apellido" value="" />
       <input type="text" name="telefono" value="" /><br/>
        direccion:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	 sexo:<br/>
        <input type="text" name="direcion" value="" />
      
        <select name="sexo">
            <option>Masculino</option>
            <option>Femenino</option>
        </select>
        <br/>
        email<br/>
        <input type="text" name="email" value="" />
        <br/><br/><br/><br/>
        <input type="submit" value="registrar" onclick="registroacudiente()"/>
  </form>
  
    

  <p>&nbsp;</p>
  <p>&nbsp;</p>
</div>
<div id="footer">
	<p id="legal">Institucion Integral Moderno</p>
	</div>
   
    </body>
</html>
