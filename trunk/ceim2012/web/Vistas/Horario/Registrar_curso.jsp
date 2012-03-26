<%-- 
    Document   : Registrar_curso
    Created on : 2/11/2011, 07:01:02 PM
    Author     : Moncho
--%>

<%@page import="MPHorarios.ControlCurso"%>
<%@page import="Conceptos.Horarios.Curso"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table width="231" border="0">
          <tr>
            <th width="74" scope="row"><div align="left">Codigo:</div></th>
            <td width="116"><input type="text" name="textfield"></td>
          </tr>
          <tr>
            <th scope="row"><div align="left">Nombre:</div></th>
            <td><input type="text" name="textfield2"></td>
          </tr>
          <tr>
            <th scope="row">&nbsp;</th>
            <td><form name="form2" method="post" action="">
              <label>
                <input type="submit" name="Submit" value="Enviar">
              </label>
            </form>
            </td>
          </tr>
        </table>
        <form name="form1" method="post" action="">
          <label></label>
        </form>
        <h1>&nbsp;</h1>
         <%
        int codigo= Integer.parseInt(request.getParameter("cod"));
        String nombre=request.getParameter("nom");
        
             
        Curso cur = new Curso();       
        cur.setVar_codigo_curso(codigo);
        cur.setVar_nombre_curso(nombre);
        
        
        
        ControlCurso.registrarCurso(cur);
        
        
        %>
        
        
    </body>
    
    
    
</html>
