<%-- 
    Document   : inscripcion
    Created on : 11-sep-2011, 17:16:46
    Author     : dell
--%>


<%@page import="com.controladores.ControlEstudainte"%>
<%@page import="com.modelo.Estudiante"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="javax.swing.JOptionPane"%>

<!DOCTYPE html>
<html>
    
    <head>
      <link rel="stylesheet" href="style.css" type="text/css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>:. Integral Moderno .:</title>
        <script src="pestannasEstudiante.js" language="JavaScript"></script>
        
    </head>
    <body>
        
        <script language="JavaScript">
                          var ajax=document.getElementById("estudianteencontrado");
                          ajax.innerHTML='Este estudiante ya se encuentra';
                 
                      </script>
         <div id="wrap">
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<!--Ideficacion-->
  <% 
  Estudiante estudianteBusqueda=new Estudiante();
  
  
     String id=request.getParameter("id");
             if(id!=null){
                 Estudiante est=new Estudiante();
                 est.setCodigo(Integer.parseInt(request.getParameter("id")));
                 if(ControlEstudainte.existeCliente(id)){
                     estudianteBusqueda=ControlEstudainte.consultarCliente(request.getParameter("id"));
                   
                  }else
                      out.print("no se encuentra identificado");
}
    
 %>

<div id="header2">
   <!--<br/><br/> <br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <img src="images/pic.jpg"/>-->
   <br/><br/>
<h1><a href="#">&nbsp;&nbsp;&nbsp;Intitucion Educativa Integral Moderno</a></h1>
<h2> &nbsp;&nbsp;&nbsp;&nbsp;Estudiantes </h2>
</div>

<div id="menu">
<ul>
<li><a href="index.jsp">Home</a></li>
<li><a href="inscripcion.jsp">Inscribir nuevo Estudiante</a></li>

</ul>
</div>

<div id="content">

<div class="right"> 

    <h2><a href="inscripcion.jsp" >Inscribir</a></h2>
<div class="articles">
<!-- campos de textos -->
<div id="estudianteencontrado"></div><!--Estudiante-->
<form action="inscripcion.jsp" method="POST" id="form1" name="form1">
    <div id="ajax">

        <table >
            
            <tbody>
                
                <tr>
                     <td>Identificacion:<br/><input type="text" name="id" value="<%=estudianteBusqueda.getIdentificacion()%>" />&nbsp;&nbsp;</td>
                    <td>Nombre:<br/><input type="text" name="nombre" id="nom" value="<%=estudianteBusqueda.getNombre()%>" />&nbsp;&nbsp;</td>
                    <td>Apellido<br/><input type="text" name="apellido" value="<%=estudianteBusqueda.getApellido()%>" />&nbsp;&nbsp;</td>
            
                </tr>
               <tr>
                    <td><br/></td>
                    <td><br/></td>
                    <td><br/></td>
                </tr>
                <tr>
                    <td>Nombre del Madre:<br/><input type="text" name="madre" value="<%=estudianteBusqueda.getNombre_madre()%>" />&nbsp;&nbsp;</td>
                    <td>Nombre del Padre:<br/><input type="text" name="padre" value="" />&nbsp;&nbsp;</td>
                    <td>Barrio:<br/><input type="text" name="barrio" value="" />&nbsp;&nbsp;</td>
                </tr>
                <tr>
                    <td><br/></td>
                    <td><br/></td>
                    <td><br/></td>
                </tr>
                <tr>
                    <td>Resto de direccion<br/><input type="text" name="direccion" value="" />&nbsp;&nbsp;</td>
                    <td>Numero Hermanos<br/><input type="text" name="hermanos" value="" />&nbsp;&nbsp;</td>
                    <td>Nombre del acudiente<br/><input type="text" name="nombre_acudiente" value="" />&nbsp;&nbsp;</td>
                </tr>
              <tr>
                    <td><br/></td>
                    <td><br/></td>
                    <td><br/></td>
                </tr>
                <tr>
                    <td>identificacion del acudiente<br/><input type="text" name="id_acudiente" value="" />&nbsp;&nbsp;</td>
                    <td></td>
                    <td></td>
                </tr>
                
                
            </tbody>
        </table>

                   
        <!--botones-->
        <br/><br/>
         <input type="hidden" name="modificar" value="modificar" />
    <input type="submit" value="modificar" name="modificar"/>
    <input type="reset" value="Limpiar" />
   
    </div><!-- fin de la ajax divicion-->
</form>

    
<br /><br />

<br /><br />

</div>

<div class="articles">

</div>
</div>

<div class="left"> 


<ul>
<li><a href="#">Home</a></li>
<li><a href="#">Inscribir estudiante</a></li>
<li><a href="#">lo que se</a></li>

</ul>

<h2>nombre</h2>
<ul>
<li><a href="#">lo que sea</a></li> 

</ul>

</div>
<div style="clear: both;"> </div>

</div>

<div id="bottom"> </div>


<div id="footer">
    Instiduacion Universitaria Tecnologico Comfenalco <br/> V semestre Sistemas
</div>
</div>
    </body>
</html>
