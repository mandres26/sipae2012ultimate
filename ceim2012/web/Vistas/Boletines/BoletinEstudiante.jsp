<%-- 
    Document   : BoletinEstudiante
    Created on : Oct 14, 2011, 2:03:21 PM
    Author     : josedavo
--%>

<%@page import="java.util.Date"%>
<%@page import="java.util.Iterator"%>
<%@page import="Manejadores.ControlCurso"%>
<%@page import="java.util.List"%>
<%@page import="Gestion.Curso"%>
<%--@page errorPage = "ErrorPage.jsp"--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="personas.Usuario"%>


<%@ page session="true" %>
<%
String usuario = "";
HttpSession sesionOk = request.getSession();
if (sesionOk.getAttribute("username") == null) {
%>
<jsp:forward page="login.jsp">
<jsp:param name="error" value="Es
obligatorio identificarse"/>
</jsp:forward>
<%
} else {
usuario = (String)sesionOk.getAttribute("username");
}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>

        <link rel="stylesheet" href="css/style_prin.css" type="text/css" />
        <link href="css/style_menu.css" rel="stylesheet" type="text/css">
         <link rel="shortcut icon" href="Imagenes/icono.png.png">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <script type="text/javascript" src="js/jquery.js"></script>
         <script language="javascript" type="text/javascript" src="js/pestannasBoletin.jsp"></script>
	<script src="js/menu.js" language="javascript" type="text/javascript"></script>
        <script type="text/javascript" src="js/sliderman.1.3.6.js"></script>
        <script src="js/IE8.js" type="text/javascript"></script>
        <script src="js/IE7.js" type="text/javascript"></script>
        <script src="js/IE9.js" type="text/javascript"></script>
        <title>..:GestionesPrincipales:.</title>
    </head>
    <body>
<div id="mod-line">
    <div id="toolbar">

            <div id="toolbar2">
  <h2>Autenticado como:<a href="perfil.jsp"><%=usuario%></a><a href="cerrarSession.jsp">(CerrarSesion)</a></h2>
 <input type="hidden" name="usern" value="<%=usuario%>" />
 </div>

    </div>
    </div>
    <br>


    <div id="top">
   <h1>CEIM</h1><h8>CENTRO EDUCATIVO INTEGRAL MODERNO</h8>
   <div id="imagen">
       <img src="Imagenes/EscudoCEIM.png" >
   </div>
</div><br>
<br>
<br>
        <div id="wrap4">
            <div>
            <form id="formb" action="ListaEstudiante.jsp" target="zona1" name="formestud" method="POST" onsubmit=" var envio=false;
           if(anocurso.value=='' )alert('El campo año no puede quedar en  blanco. Hace parte de la consulta.');else envio=true;return envio"><br>
             <center><h8>GENERAR BOLETIN</h8></center><br><br>

             Curso:<select name="listcur">
             <option >Seleccione...</option>
             <%
           
                 List<Curso> cur=ControlCurso.listarCurso();

                 Iterator it=cur.iterator();
                 while(it.hasNext()){
                 Curso c=(Curso)it.next();
                 
                %>
                <option   value="<%= c.getCodCurso() %>" > <%=c.getNombre()  %></option>
                <%}
                 %>
             </select><br>
             
             Año:<select name="lisyears">
             <option >Seleccione...</option>
             <%
                 List<String> years=ControlCurso.listyears();
                 it= years.iterator();
                 while(it.hasNext()){
                 String y=(String)it.next();
                 %>
                <option   value="<%= y %>" ><%= y %></option>
                <%}
                 %>
             </select><br>
            <br><br><br>
            <input id="buttom" type="submit" value="Enviar" name="bolest" /><br><br>
            <input id="buttom"type="reset" value="Limpiar" name="limfor" />
            
          </form>
             <div id="imagenb">
             <img src="Imagenes/estudi.png" >
            </div>
             <iframe id="iframele" name="zona1"  > </iframe>
           </div>
        </div>

  
    
    </body>
</html>
