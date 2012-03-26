<%-- 
    Document   : Registrar_docente
    Created on : 2/11/2011, 07:02:02 PM
    Author     : Moncho
--%>

<%@page import="MPHorarios.ControlDocente"%>
<%@page import="Conceptos.Horarios.Docente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar Docente</title>
    </head>
    <body>
    <table width="25%" border="0" bordercolor="#F0F0F0" bgcolor="#CCCCCC">
      <tr>
        <th width="39%" scope="row"><div align="left">Codigo:</div></th>
        <td width="61%"><form name="form1" method="post" action="">
          <label>
          <input type="text" name="textfield">
          </label>
        </form>
        </td>
      </tr>
      <tr>
        <th scope="row"><div align="left">Identificacion:</div></th>
        <td><input type="text" name="textfield2"></td>
      </tr>
      <tr>
        <th scope="row"><div align="left">Nombre:</div></th>
        <td><input type="text" name="textfield3"></td>
      </tr>
      <tr>
        <th scope="row"><div align="left">Apellidos:</div></th>
        <td><input type="text" name="textfield4"></td>
      </tr>
      <tr>
        <th scope="row"><div align="left">Telefono:</div></th>
        <td><input type="text" name="textfield42"></td>
      </tr>
      <tr>
        <th scope="row"><div align="left">Direccion:</div></th>
        <td><input type="text" name="textfield43"></td>
      </tr>
      <tr>
        <th scope="row"><div align="left">Sexo:</div></th>
        <td><input type="text" name="textfield44"></td>
      </tr>
      <tr>
        <th scope="row">&nbsp;</th>
        <td bordercolor="#0000FF"><form name="form2" method="post" action="">
          <label>
            <input type="submit" name="Submit" value="Guardar">
          </label>
        </form>
        </td>
      </tr>
    </table>
         <%/*
        String ide= request.getParameter("ide");
        String cedula=request.getParameter("cedu");
        String nombre=request.getParameter("nombre");
        String apellido=request.getParameter("apellido");
        String direccion = request.getParameter("dir");
        String sexo = request.getParameter("sexo");
        String usuario = request.getParameter("usuario");
        String pass = request.getParameter("pass");

        Docente doc = new Docente();       
        doc.setVar_id_docente(cedula);
        doc.setVar_cedula_docente(cedula);
        doc.setVar_nombre_docente(nombre);
        doc.setVar_apellido_docente(apellido);
        
        doc.setVar_direccion_docente(direccion);
        doc.setVar_sexo_docente(sexo);
        
        
        ControlDocente.registrarDocente(doc);
        
        
       */ %>
        
    </body>
    
</html>
