<%-- 
    Document   : AdminCriterios
    Created on : 17/10/2011, 11:49:31 PM
    Author     : Dario A
--%>

<%@page import="Manejadores.ControlPuntoEval"%>
<%@page import="Conceptos.PuntoEval"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
      <script type="text/javascript" src="jquery.js"></script>
    <script type="text/javascript" src="thickbox.js"></script>
    <link rel="stylesheet" href="thickbox.css" type="text/css" />
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
	height: 250px;
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
<div id="titulo">Criterios a Evaluar- Evaluacion Docente <br />
  <%
           List<PuntoEval> p=ControlPuntoEval.listarPuntoEval();
  %>
    <br />
</div>
<div id="tabla">
  <table width="761" border="1">
<%
for(int i=0; i<p.size(); i++)
{
  out.print("<tr>");
      out.print("<td width='588'>"+p.get(i).getPeval()+"</td>");
      
      out.print("<td width='157'><form action='formModificar.jsp?cod="+p.get(i).getCodigo()+"' id='form2' name='form2' method='post'>");
        out.print("<a href='formModificar.jsp?height=66&width=325&modal=true' class='thickbox'>");
        out.print("<input type='submit' name='modif' id='mod' value='Modificar' />");
        out.print("</a>");
        out.print("</form></td>");
       
      out.print("<td width='157'><form action='AMEpeval.jsp?cod="+p.get(i).getCodigo()+"' id='form2' name='form2' method='post'>");
        out.print("<input type='submit' name='eli' id='eli' value='Eliminar' />");
      out.print("</form></td>");
   out.print("</tr>");
}
%>    
  </table>
</div>
<div id="nuevoC">
  <form id="form1" name="form1" method="post" action="AMEpeval.jsp">
    <label for="nuevo">Ingrese Nuevo Criterio a Evaluar</label>
    .<br />
<input name="agregarp" type="text" id="nuevo" size="70" />
    <input type="submit" name="agr" id="agregar" value="Agregar" />
  </form>
</div>
  <br/><a href="cerrarSesion.jsp">Cerrar Sesion</a>
</body>
</html>
