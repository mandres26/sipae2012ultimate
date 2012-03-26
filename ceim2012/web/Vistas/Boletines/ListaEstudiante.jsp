<%-- 
    Document   : ListaEstudiante
    Created on : 24/10/2011, 11:40:47 PM
    Author     : Usuario
 
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="personas.Estudiante"%>
<%@page import="Manejadores.ControlEstudiante"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <title></title>
    </head>
    </head>
    <body>
      
       
       <form  id="formle" action="ReporteBoletin.jsp" target="zona2" name="formestud" method="POST">
             Estudiante:<select name="listest" >

             <%
                 int codcurso=Integer.parseInt(request.getParameter("listcur"));
                 String anocur=request.getParameter("anocurso");
               
                 List<Estudiante> est=ControlEstudiante.listarEstudiante(codcurso,anocur);

                 Iterator it=est.iterator();
                 while(it.hasNext()){
                 Estudiante estu=(Estudiante)it.next();
                %>
                <option   value="<%= estu.getCodigo() %>" ><%=estu.getNombres()%> </option>
                <%}
                 %>
             </select>
             <input  type = "hidden" name = "curso" value = "<%=codcurso%>" />
             Periodo:<select name="listper">
                 <option>1</option>
                 <option>2</option>
                 <option>3</option>
                 <option>4</option>
             </select>
           <input id="buttom" type="submit" value="Generar" name="bolest" />

              
    </form><br>
          <div>
        <iframe  name="zona2"  > </iframe>
          </div>
    </body>
</html>
