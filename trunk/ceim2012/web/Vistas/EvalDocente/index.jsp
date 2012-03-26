<%-- 
    Document   : index
    Created on : 17/10/2011, 12:06:50 PM
    Author     : Dario A
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Documento sin título</title>
<style type="text/css">
body {
	background-image: url(imagenes/fondoazuldegra.gif);
	background-repeat: repeat-x;
	margin: 0px;
	padding: 0px;
}
.contenedor {
	background-image: url(imagenes/centro.png);
	height: 413px;
	width: 788px;
	margin-right: auto;
	margin-left: auto;
	margin-top: 100px;
}
.contenedor #formulario {
	display: block;
	text-align: center;
	float: right;
	margin-top: 100px;
	margin-right: 23px;
}
</style>
</head>

<body>
<div class="contenedor">
  <div id="formulario">
    <form id="form1" name="form1" method="post" action="verificaUser.jsp">
      <fieldset>
        <legend>INICIO DE SESION</legend>
        <br />
        <label for="identificacion">Identificacion:<br />
        </label>
        <input type="text" name="id" id="identificacion" />
        <br />
        <label for="contraseña">Contraseña:</label>
        <br />
        <input type="password" name="pass" id="contraseña" />
        <br />
        <%
                if(request.getParameter("error")!=null)
                out.println(request.getParameter("error"));
                out.println("<br/>");
         %>
        <br />
        <input type="submit" name="iniciar" id="iniciar" value="Iniciar Sesion" />
      </fieldset>
    </form>
  </div>
</div>
</body>
</html>

