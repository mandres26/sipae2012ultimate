<%-- 
    Document   : Registrado
    Created on : 13/09/2011, 03:44:52 AM
    Author     : Usuario
--%>


<%@page import="Manejadores.ControlCurso"%>
<%@page import="Gestion.Curso"%>
<%@page import="Manejadores.ControlAsignatura"%>
<%@page import="Gestion.Asignatura"%>
<%@page import="Manejadores.ControlEstudiante"%>
<%@page import="personas.Estudiante"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="personas.Persona"%>
<%@page import="Manejadores.ControladorPersona"%>
<%@page import="Manejadores.ControlDocumento"%>
<%@page import="Manejadores.ControlDocumentoAcudiente"%>
<%@page import="Gestion.Documento"%>
<%@page import="Gestion.DocumentoAcudiente"%>
<%@page errorPage = "ErrorPage.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" href="css/style_prin.css" type="text/css" />
         <link rel="shortcut icon" href="Imagenes/icono.png.png">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" href="css/style_paginterna.css">
        <title></title>
        
    </head>
    <body>
        <form  id="formle" action="Reporte.jsp" target="_blank" name="formestud" method="POST">
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
             Tipo:<select name="seltipo" >
                <option name="cernotas"value="1">Cert. Estudio</option>
                <option name="pazysalvo"value="2">Paz y Salvo</option>
                <option name="certcur" value="3">Cert.Curso</option>
         </select>
           <input id="buttom" type="submit" value="Generar" name="bolest" />


    </form><br>
        <div>
        <iframe  name="zona2"  > </iframe>
        </div>

        
    </body>

</html>
