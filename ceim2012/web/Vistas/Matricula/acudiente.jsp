<%-- 
    Document   : acudiente
    Created on : 29-nov-2011, 15:54:37
    Author     : dell
--%>


<%@page import="ManejadorHorario.ControlCurso"%>
<%@page import="Conceptos.Curso"%>
<%@page import="java.util.List"%>
<%@page import="ManejadorMatriculas.ControladorAcudiente"%>
<%@page import="Conceptos.Acudiente"%>
<%@page import="Conceptos.Estudiante" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>.:Registro Estudiantes :.</title>
         <link href="style_inter/default.css" rel="stylesheet" type="text/css" />
          <link rel="stylesheet" type="text/css" media="all" href="calendario/jsDatePick_ltr.min.css" />
<script type="text/javascript" src="calendario/jquery.1.4.2.js"></script>
<script type="text/javascript" src="calendario/jsDatePick.jquery.min.1.3.js"></script>
<script type="text/javascript">
	window.onload = function(){
		new JsDatePick({
			useMode:2,
			target:"calen1",
			dateFormat:"%d-%M-%Y"
			
		});
             <%String info=(String)request.getSession().getAttribute("info");
             if(info!=null)
              if(!info.trim().equalsIgnoreCase("")){
                                           
                                         
               
            %>
                  timer = window.setTimeout("cerrar()", 3000);
                  <%
                 }
%>
             
               
	};
      function cerrar(){
         
          document.getElementById("msj").hidden=true;
      }
</script>
         <script src="pestannasEstudiante.js" language="JavaScript"></script>
        
         <%
         String usuario=(String)request.getSession().getAttribute("usuario");
         String pass=(String)request.getSession().getAttribute("pass");
         Acudiente a=ControladorAcudiente.isUsuarioPass(usuario, pass);
    
      
     %>
    <style type="text/css">
    #apDiv1 {
	position:absolute;
	width:145px;
	height:115px;
	z-index:1;
	left: 141px;
	top: 63px;
}
    #identificacion {
	position:absolute;
	width:518px;
	height:51px;
	z-index:2;
	left: 599px;
	top: 16px;
}
    </style>
    </head>
    <body>
<div class="borde2">
<div class="espacio2">       
       <div id="identificacion"><%=a.getVar_nombre_acudiente().toUpperCase()+" "+a.getVar_apellido_acudiente().toUpperCase() %>(<a href="../../cerrarSession.jsp">Cerrar sesion</a>)</div>
       <!-- Identificacion  -->
<div id="apDiv2"></div>
<div id="header">
    <img id="imagen" src="images/acudiente.png" />
    <br/><br/>
    <h4>Acudiente</h4>
</div>
<div id="menu">
	<ul>
		
	  <li>
	     <a href="#"  onclick="llamadaInscripcion()" title="">Registrar Estudiante</a></li>
          <li><a href="res/listadoprueba.jsp?id=<%=Long.parseLong(a.getVar_id_acudiente())%>" target="zona1">Lista</a> 
                
        </ul>
                 
</div> 
 <input type="hidden"  name="idacud" value="<%a.getVar_id_acudiente();%>"/>                
<div id="content">
   	
            <div id="welcome" >
                <div id="msj" >
		        <%
                                       if(info!=null){
                                           if(!info.trim().equalsIgnoreCase("")){
                                           out.print("<h5 style=\"color:red\">"+info+"</h5>");
                                           request.getSession().setAttribute("info", "");
                                          }
                                        }
%>
                </div>
            </div>
           <center><h2>Listado de Estudiante</h2></center>
            <br/>
            <iframe  name="zona1" style="width:800px; height:auto; overflow: auto;" /><!--division que muestra el listado, de los estudinates--></iframe>
                       
            <!-- incripcion de estudiante  -->
            
             
                 <div id="inscripcion" class="pestanaVisible">
             
                     <form   action="RegistrarEstudiante.jsp" method="POST">
                  <table style="border:2px solid #007ED1" width="750px" cellspacing="15">
                      <thead>
                         <td><hr/></td>
                              <th>Informacion de Estudiante</th>
                              <td><hr/></td>
                      </thead>
                      <tbody>
                          <tr>
                              <td>Identificacion:<input type="text" name="id" id="ident" onkeypress="return validacion(event, 'ident');"/></td>
                              <td>Nombre:<input type="text" name="nombre" id="nom" />&nbsp;&nbsp;</td>
                              <td>Apellido:<input type="text" name="apellido" />&nbsp;&nbsp;&nbsp;&nbsp;</td>
                              <td>Sexo:<select name="sexo"  >
                                            <option value="masculino">Masculino</option>
                                            <option value="femenino">Femenino</option>
                                      </select>&nbsp;&nbsp;</td>
                              <td>Foto:<input type="file" name="foto" /></td>
                             
                          </tr>
                          <tr>
                              <td>Direccion:<br/><input type="text" name="barrio"  />&nbsp;&nbsp;</td>
                              <td>Fecha Nacimiento:<input type="text" id="calen1" name="fn"/>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                              <td>Numero Hermanos:<input type="text" id="hermanos" name="hermanos" onkeypress="return validacion(event, 'hermanos');"/> </td>
                              <td></td>
                              <td></td>
                          </tr>
                          <tr>
                              <td><hr/></td>
                              <th>Informacion del Curso a Cursar</th>
                              <td><hr/></td>
                       
                          </tr>
                          <tr>
                              <td>Curso:<select name="curso" style="width: 145px;">
                            <% List<Curso> listaCurso =ControlCurso.listarCurso();
                            for(int i=0; i<listaCurso.size();i++){
                               %>
                               <option value="<%=listaCurso.get(i).getVar_codigo_curso()%>" ><%=listaCurso.get(i).getVar_nombre_curso()%></option>
                            <%}%>
                        </select>&nbsp;&nbsp;</td>
                              
                          </tr>
                      
                           <tr>
                             <td><hr/></td>
                              <th>Informacion de Padres</th>
                              <td><hr/></td>
                          </tr>
                        
                          <tr>
                              <td>Nombre padre::<input type="text" name="nom_padre"  />&nbsp;&nbsp; </td>
                               <td>Nombre Madre:<input type="text" name="nom_madre"/>&nbsp;&nbsp;</td>
              
                          </tr>
                      </tbody>
                  </table>
                <br/><br/>
              <input type="submit" value="&nbsp;&nbsp;Registrar&nbsp;&nbsp;" onclick="agregarFechasToCamposTexto()"/>
                 
               </form>
                  <!-- este es el listado  --> 
            </div>
            <br/>
        </div>
</div>
</div>

 <div class="wrapper col6">
  <div id="copyright">
    <p class="fl_left">Copyright © 2012 - All Rights Reserved - <a href="#">Domain Name</a></p>
    <p class="fl_right">fitco by <a href="#" title="Fundacion Universitaria Tecnologico Comfenalco">Fundacion Universitaria Tecnologico Comfenalco</a></p>
    <br class="clear">
  </div>
</div>                     
    </body>
</html>
