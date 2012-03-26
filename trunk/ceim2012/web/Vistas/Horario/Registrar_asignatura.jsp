<%-- 
    Document   : Registrar_asignatura
    Created on : 2/11/2011, 05:16:33 PM
    Author     : Moncho
--%>

<%@page import="MPHorarios.ControlAsignatura"%>
<%@page import="Conceptos.Horarios.Asignatura"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table width="232" border="0">
          <tr>
            <th width="77" scope="row"><div align="left">Codigo:</div></th>
            <td width="145"><form name="form1" method="post" action="">
              <label>
                <input type="text" name="textfield">
              </label>
            </form>
            </td>
          </tr>
          <tr>
            <th scope="row"><div align="left">Nombre:</div></th>
            <td><input type="text" name="textfield2"></td>
          </tr>
          <tr>
            <th scope="row">&nbsp;</th>
            <td><form name="form2" method="post" action="">
              <label>
                <input type="submit" name="Submit" value="Guardar">
              </label>
            </form>
            </td>
          </tr>
        </table>
        <h1>&nbsp;</h1>
        
         <%
        int codigo= Integer.parseInt(request.getParameter("cod"));
        String nombre=request.getParameter("nom");
        
             
        Asignatura asi = new Asignatura();       
        asi.setVar_codigo_asignatura(codigo);
        asi.setVar_nombre_asignatura(nombre);
        
        
        
        ControlAsignatura.registrarAsignatura(asi);
        
        
        %>
    </body>
</html>
