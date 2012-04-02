<%-- 
    Document   : Administrador
    Created on : 1/04/2012, 09:03:08 PM
    Author     : Usuario
--%>
<%@page contentType="text/html; charset=iso-8859-1"
session="true" language="java" import="java.util.*" %>


<!DOCTYPE html>
<html>
  <head>

         <link rel="stylesheet" href="cssprin/portal.css" type="text/css" />
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <title>:. Administrador .:</title>
     
  </head>
<style>
div.parte{
border: 0px solid #FE2E2E;
margin:50px;
float: left;
width: 100px;
height: 50px;
}
</style>

<body>
<%
if(request.getParameter("error")!=null)

{
out.println(request.getParameter("error"));
}
%>
 <div class="wrapper">
   <div class="header-bar">
       <CENTER><h3>Administrador CEIM</h3></CENTER>
 
    </div>
     <a href="index.jsp">Home</a>
     <br>
     <br>
     
    <div class="wrapper2">
       <div class="header-bar2">
        <center><h2>Administracion Login</h2></center>
      </div>
        <br>
        <div class="parte">
            <img src="cssprin/images/hercandado4.gif"/>
        </div>
   <div class="sign-in">
    <div class="signin-box">
    <h1>Acceder</h1>
    <form id="gaia_loginform" action="checklogin.jsp" method="POST" onsubmit=" var envio=false;
      if(usuario.value=='' || clave.value=='')alert('Debe ingresar Usuario y Contraseña. Ambos datos son obligatorios.');else envio=true;return envio">
        <label><strong class="nomuser-label">Usuario:</strong>
        <input id="input" cheked="true" placeholder="usuario" name="usuario" type="text">
        </label>
        <label> <strong class="passwd-label">Contraseña:</strong>
           <input id="input" placeholder="password" name="clave"  type="password">
        </label>
         <br>
         <input type="submit" class="g-button g-button-submit" id="signIn"  value="Login" /><label class="remember" name=""><input type="checkbox" name="recro" value="1" /><strong class="remember-label">Recordarme</strong></label><br/>
     <a href="Registrarusuario.jsp">Registrar Usuario?</a>
    </form>
    </div>

    </div>
      
  </div><br/><br/>
 
<div class="footer-bar">
    <div class="footer content clearfix">
    <center>&COPY;2011 Fundación Universitaria Tecnologico Comfenalco</center>
    </div>
</div>


 </div>



  
</body>
</html>
