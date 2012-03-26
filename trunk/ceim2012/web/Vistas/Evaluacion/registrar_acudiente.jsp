<%-- 
    Document   : registrar_acudiente
    Created on : 18-oct-2011, 17:07:24
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="default.css" rel="stylesheet" type="text/css" />
        <title>Registro de acudiente</title>
        <script src="validacion.js" language="JavaScript"></script>
        <%
           String filtro=request.getParameter("filtro");    
           if(filtro!=null)
               if(filtro.equals("ok")){
                   
                   
               }
              
           
        
     %>
        
    </head>
    <body>
        <form action="index.jsp" method="POST">
         <input type="hidden" id="filtro" name="filtro" value="no" />
        usuario:<br/>
        <input type="text" name="usuario" value="" /><br/>
        contraseña:<br/>
        <input type="text" name="contrasena" value="" /><br/>
        identificacion<br/>
        <input type="text" name="id" value="" /><br/>
        nombre<br/>
        <input type="text" name="nombre" value="" /><br/>
        apellido<br/>
        <input type="text" name="apellido" value="" /><br/>
        telefono<br/>
        <input type="text" name="telefono" value="" /><br/>
        direccion<br/>
        <input type="text" name="direcion" value="" /><br/>
        sexo<br/>
        <select name="sexo">
            <option>Masculino</option>
            <option>Femenino</option>
        </select>
        <br/>
        email<br/>
        <input type="text" name="email" value="" />
        <br/>
        <input type="submit" value="registrar" onclick="registroacudiente()"/>
        </form>
        
    </body>
</html>
