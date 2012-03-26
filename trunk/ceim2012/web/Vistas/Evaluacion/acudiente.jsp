<%-- 
    Document   : acudiente
    Created on : 29-nov-2011, 15:54:37
    Author     : dell
--%>

<%@page import="com.modelo.Estudiante"%>
<%@page import="com.modelo.Curso"%>
<%@page import="com.controladores.ControladorCurso"%>
<%@page import="java.util.List"%>
<%@page import="com.modelo.Acudiente"%>
<%@page import="com.controladores.ControladorAcudiente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>.: Integral Moderno :.</title>
         <link href="default.css" rel="stylesheet" type="text/css" />
          <link rel="stylesheet" type="text/css" media="all" href="http://localhost:8080/VistaThis/calendario/jsDatePick_ltr.min.css" />
<script type="text/javascript" src="http://localhost:8080/VistaThis/calendario/jquery.1.4.2.js"></script>
<script type="text/javascript" src="http://localhost:8080/VistaThis/calendario/jsDatePick.jquery.min.1.3.js"></script>
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
     Acudiente a=ControladorAcudiente.isUsurioPass(usuario, pass);
Estudiante est=new Estudiante(); 
      
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
       <div id="identificacion"><%=a.getVar_nombre_acudiente().toUpperCase()+" "+a.getVar_apellido_acudiente().toUpperCase() %>(<a href="cerrarSession.jsp">Cerrar sesion</a>)</div>
       <!-- Identificacion  -->
<div id="apDiv2"></div>
<div id="header">
	 
  <div id="logo">
    <h1><a >Acudiente</a><br/>
    </h1>
	
  </div>&nbsp;&nbsp;&nbsp;&nbsp;
 
</div>
<div id="menu">
	<ul>
		
	  <li>
	    <div id="apDiv1"><img src="images/ESCUD.png" width="147" height="130"></div>
            <a href="#"  onclick="llamadaInscripcion()" title="">Registrar Estudiante</a></li>
          <li><a href="#" 
                 onclick="sendRequest('GET','res/listadoprueba.jsp?id=<%=Long.parseLong(a.getVar_id_acudiente())%>');llamadaMatricula();">Lista</a></li>
		
  </ul>
    
</div>
<div id="content">
   
	<div id="main">
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
            
            <!-- incripcion de estudiante  -->
            
            <div id="listado"  style="width:470px; height:500px; overflow: scroll;" class="pestanaInvisible"> <!--division que muestra el listado, de los estudinates--></div>
 

            
            <div id="inscripcion" class="pestanaVisible">
                <form action="RegistrarEstudiante" method="POST">
                
                
                <center><b>Estudiante</b></center><br/>
                <table >
            
            <tbody>
                
                <tr>
                    <td>Identificacion:<br/><input type="text" name="id" id="id" value="<%=(String.valueOf(est.getIdentificacion()).equals("0"))?"":String.valueOf(est.getIdentificacion()) %>"   
                                                   onkeypress="return validacion(event, 'id');" />&nbsp;&nbsp;</td>
                    <td>Nombre:<br/><input type="text" name="nombre" id="nom" value="<%=est.getNombre() %>" />&nbsp;&nbsp;</td>
                    <td>Apellido<br/><input type="text" name="apellido" value="<%=est.getApellido() %>" />&nbsp;&nbsp;</td>
            
                </tr>
              
                <tr>
                    <td>Sexo:<br/><select name="sexo" style="width: 145px;" title="<%=((est.isSexo())?"Masculino":"Femenino") %>">
                            <option value="1">Masculino</option>
                            <option value="0">Femenino</option>
                        </select>&nbsp;&nbsp;</td>
                    <td>Barrio:<br/><input type="text" name="barrio" value="<%=est.getBarrio() %>" />
                    &nbsp;&nbsp;</td>
                    <td>Resto de direccion<br/><input type="text" name="direccion" value="<%=est.getResto_direccion() %>" />&nbsp;&nbsp;</td>
                    
                </tr>
                
                <tr>
                    <td>Curso<br/><select name="curso" style="width: 145px;">
                            <% List<Curso> listaCurso =ControladorCurso.listarCliente();
                            for(int i=0; i<listaCurso.size();i++){
                               %>
                               <option value="<%=listaCurso.get(i).getCodigo()%>" ><%=listaCurso.get(i).getNombre()%></option>
                            <%}%>
                        </select>&nbsp;&nbsp;</td>
                    <td>Numero Hermanos<br/><input type="text" id="hermanos" name="hermanos" value="<%=(String.valueOf(est.getNumero_hermanos()).equals("0"))?"":String.valueOf(est.getNumero_hermanos()) %>" onkeypress="return validacion(event, 'hermanos');"/>&nbsp;&nbsp;</td>
                    <td>Fecha Nacimiento<br/><input type="text" id="calen1" name="fn"/>&nbsp;&nbsp;</td>
                </tr>
              
                
                
            </tbody>
        </table>
                
                <center><b>Padres</b></center><br/>
                                        <table >
                                           <tbody>
                                                <tr>
                                                    <td>Identificacion madre:<br/><input type="text" name="id_madre" id="id_madre" value="<%=est.getPadres().getVar_id_madre()%>" onkeypress="return validacion(event, 'id_madre');"/>&nbsp;&nbsp;</td>
                                                    <td>Nombre madre:<br/><input type="text" name="nom_madre" value="<%=est.getPadres().getVar_nombre_mama()%>" /> &nbsp;&nbsp;</td>
                                                    <td>Apellido madre:<br/><input type="text" name="ape_madre" value="<%=est.getPadres().getVar_apellido_mama()%>" />&nbsp;&nbsp; </td>
                                                </tr>
                                               
                                                <tr>
                                                    <td>Identificacion padre:<br/><input type="text" name="id_padre" id="id_padre" value="<%=est.getPadres().getVar_id_padre()%> " onkeypress="return validacion(event, 'id_padre');"/> &nbsp;&nbsp;</td>
                                                    <td>Nombe padre:<br/><input type="text" name="nom_padre" value="<%=est.getPadres().getVar_nombre_papa()%>" />&nbsp;&nbsp; </td>
                                                    <td>Apellido padre:<br/><input type="text" name="ape_padre" value="<%=est.getPadres().getVar_apellido_papa()%>" /> &nbsp;&nbsp;</td>
                                                </tr>
                                            </tbody>
                                        </table> 
                                                                            
                                                <input type="submit" value="&nbsp;&nbsp;Registrar&nbsp;&nbsp;" onclick="agregarFechasToCamposTexto()"/>
                </form>
                  <!-- este es el listado  --> 
             
               
            </div>
                      
                                                
                                                
          
                                                
            <br/> <br/> <br/><br/> <br/> <br/>
		<div id="example">
			 
		
		  <blockquote> </blockquote>
	  </div>
	
    </div>
	<div id="sidebar">
            <form id="form1" method="post" action="InicioSesion">
	  
      </form>
		<div id="updates" class="boxed">
			<h2 class="title">eVENTOS</h2>
			<div class="content">
				<ul>
					<li>
						<h3>Diciembre 2, 2011</h3>
						<p><a href="#">Sustentaciones de proyectos</a> </p>
					</li>
					<li></li>
					<li>
						<h3>Diciembre 5, 2011</h3>
						<p><a href="#">Despedidda de fin de año...</a></p>
					</li>
					<li></li>
					<li>					</li>
				</ul>
			</div>
		</div>
		
	</div>

  <p>&nbsp;</p>
  <p>&nbsp;</p>
</div>
<div id="footer">
	<p id="legal">Institucion Integral Moderno</p>
	</div>
   
    </body>
</html>
