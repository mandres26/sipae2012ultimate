<%-- 
    Document   : Registrar_aula
    Created on : 2/11/2011, 06:59:54 PM
    Author     : Moncho
--%>

<%@page import="MPHorarios.ControlAula"%>
<%@page import="Conceptos.Horarios.Aula"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table width="234" border="0">
          <tr>
            <th width="71" scope="row"><div align="left">Codigo:</div></th>
            <td width="119">&nbsp;</td>
          </tr>
          <tr>
            <th scope="row"><div align="left">Nombre:</div></th>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <th scope="row">&nbsp;</th>
            <td><input type="submit" name="Submit" value="Guardar"></td>
          </tr>
        </table>
        <form name="form1" method="post" action="">
          <label></label>
        </form>
        <h1>&nbsp;</h1>
         <%
        int codigo= Integer.parseInt(request.getParameter("cod"));
        String nombre=request.getParameter("nom");
        
             
        Aula aul = new Aula();       
        aul.setVar_codigo_aula(codigo);
        aul.setVar_nombre_aula(nombre);
        
        
        
        ControlAula.registrarAula(aul);
        
        
        %>
        
    </body>
</html>
