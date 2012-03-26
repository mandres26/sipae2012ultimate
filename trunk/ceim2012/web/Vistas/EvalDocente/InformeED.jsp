<%-- 
    Document   : InformeED
    Created on : 18/10/2011, 12:26:18 AM
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
.contenedor #config {
	height: 102px;
	width: 68px;
	clear: left;
	float: left;
	margin-left: 40%;
}
.contenedor {
	margin-right: auto;
	margin-left: auto;
	height: 130px;
}
#tabla {
	text-align: left;
	display: block;
	width: 780px;
	margin-right: auto;
	margin-left: auto;
	overflow: auto;
	height: 300px;
}
#titulo {
	font-size: 36px;
	height: 69px;
	text-align: center;
	font-family: "Times New Roman", Times, serif;
	font-style: normal;
}
#nuevoC {
	width: 780px;
	margin-left: auto;
	margin-right: auto;
}
.contenedor #config #cbinsmenuebul_table {
	list-style-type: none;
	margin: 0px;
	padding: 0px;
}
.contenedor #info {
	height: 102px;
	width: 68px;
	clear: right;
	float: right;
	margin-right: 40%;
}
.contenedor #info #cbinsmenu0ebul_table {
	list-style-type: none;
	margin: 0px;
	padding: 0px;
}
</style>
</head>

<body>
<div class="contenedor">
  <div id="config">

<link rel="stylesheet" href="cbcscbinsmenu.css" type="text/css" />


<ul id="cbinsmenuebul_table" class="cbinsmenuebul_menulist" style="width: 68px; height: 102px;">
  <li><a href="AdminCriterios.jsp" title="Administrar"><img id="cbi_cbinsmenu_1" src="ebbtcbinsmenu1_0.png" name="ebbcbinsmenu_1" width="68" height="102" style="vertical-align: bottom;" border="0" alt="" title="" /></a></li>
</ul>
<script type="text/javascript" src="cbjscbinsmenu.js"></script>
  
  </div>
  <div id="info">
  
  <link rel="stylesheet" href="cbcscbinsmenu0.css" type="text/css" />


<ul id="cbinsmenu0ebul_table" class="cbinsmenu0ebul_menulist" style="width: 68px; height: 102px;">
  <li><a href="InformeED.jsp" title="Ver Informe"><img id="cbi_cbinsmenu0_1" src="ebbtcbinsmenu01_0.png" name="ebbcbinsmenu0_1" width="68" height="102" style="vertical-align: bottom;" border="0" alt="" title="" /></a></li>
</ul>
<script type="text/javascript" src="cbjscbinsmenu0.js"></script>
  
  </div>
</div>
<div id="titulo">Informe - Evaluacion Docente<br />
  <br />
</div>
<div id="nuevoC"></div>
<br/><a href="cerrarSesion.jsp">Cerrar Sesion</a>
</body>
</html>
