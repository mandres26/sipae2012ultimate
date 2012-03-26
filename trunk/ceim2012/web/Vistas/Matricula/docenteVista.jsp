<%-- 
    Document   : acudiente
    Created on : 29-nov-2011, 15:54:37
    Author     : dell
--%>

<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Conceptos.Docente"%>
<%@page import="Utilidades.ManejadorBaseDatos"%>
<%@page import="java.sql.Connection"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
           <%
           
         String usuario=(String)request.getSession().getAttribute("usuario");
         String pass=(String)request.getSession().getAttribute("pass");
     %>
    
    
        <script type="text/javascript">
            <!--
	window.onload = function(){
		new JsDatePick({
			useMode:2,
			target:"calen1",
			dateFormat:"%d-%M-%Y"
			
		});
                
                new JsDatePick({
			useMode:2,
			target:"calen2",
			dateFormat:"%d-%M-%Y"
			
		});
	};
        
        function agregarFechasToCamposTexto(){
            document.getElementById("fi").value=document.getElementById("calen1").value;
            document.getElementById("ff").value=document.getElementById("calen2").value;
        }
         function add(codigo, name){
                 
                   document.getElementById("text").value=codigo;
                   document.getElementById("name").value=name;
               }
        -->
</script>
 
         
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>.: Integral Moderno :.</title>
         <link href="default.css" rel="stylesheet" type="text/css" />
          <link rel="stylesheet" type="text/css" media="all" href="http://localhost:8080/VistaThis/calendario/jsDatePick_ltr.min.css" />
<script type="text/javascript" src="http://localhost:8080/VistaThis/calendario/jquery.1.4.2.js"></script>
<script type="text/javascript" src="http://localhost:8080/VistaThis/calendario/jsDatePick.jquery.min.1.3.js"></script>

         <script src="pestannasEstudiante.js" language="JavaScript"></script>
        
        
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
    
    <%
         Connection con;
         
         ManejadorBaseDatos mbd=ManejadorBaseDatos.getInstancia();
              mbd.conectar();
              con=mbd.getConexion();
               Docente d=null;
         ResultSet rs = null;
         PreparedStatement pst = null;
         pst = con.prepareStatement("select * from docente where usuario=? and pass=?");
         pst.setString(1, usuario);
         pst.setString(2, pass);
         rs = pst.executeQuery();
         while(rs.next()) {
              d=Docente.load(rs);
         }
        
     try { 
         
       
         
         
         %>
    
    
    
    <body>
       <div id="identificacion"><%=d.getVar_nombre_docente().toUpperCase()+" "+d.getVar_apellido_docente().toUpperCase()%>(<a href="cerrarSession.jsp">Cerrar sesion</a>)</div>
       <!-- Identificacion  -->
<div id="apDiv2"></div>
<div id="header">
	 
  <div id="logo">
    <h1><a >Docente</a><br/>
    </h1>
	
  </div>&nbsp;&nbsp;&nbsp;&nbsp;
 
</div>
<div id="menu">
	<ul>
		
	  <li>
	    <div id="apDiv1"><img src="images/ESCUD.png" width="147" height="130"></div>
	  </li>
      <li><a href="docenteVista.jsp" style="<%=(request.getParameter("name")!=null)?"display: block":"display: none"%> ">Inicio</a> </li>
          <li> <a href="notas.jsp" style="<%=(request.getParameter("name")!=null)?"display: block":"display: none"%> ">Notas <%=request.getParameter("name")%> </a></li>
		
  </ul>
    
</div>
<div id="content">
   
	<div id="main">
              <!-- Aqui es para ingresar la actividad -->
                <div  style="<%=(request.getParameter("name")!=null)?"display: block":"display: none"%> ">
		            
            <!-- incripcion de estudiante  -->
            
      <div id="listado"  style="width:470px; height:500px; overflow: scroll;" class="pestanaInvisible"> <!--division que muestra el listado, de los estudinates--></div>
 

            
            <div id="inscripcion" class="pestanaVisible">
              
                
              
                 Actividad para la asigatura de <%=request.getParameter("name")%> 
                 <hr/>
        <form method="POST" action="http://localhost:8080/VistaThis/RegistrarActividad">
       <!-- nota: colocar una excepcion..   -->
        <input type="hidden" name="codigoAsignatura" value="<%=request.getParameter("text")%>" />
        <table >
            
         
                <tr>
                    <td>Codigo:<br/><input type="text" name="codigo" value="" /> </td>
                    <td>Nombre:<br/><input type="text" name="nombre" value="" /> </td>
                   
                </tr>
                 
                <tr>
                    <td>fecha inicio:<br/>
                        <input type="hidden" name="fi" id="fi" value="" />
                        <input type="text" name="fi" id="calen1" value="" /> </td>
                    <td>fecha final:<br/>
                        <input type="hidden" name="ff" id="ff" value="" />
                        <input type="text" name="ff" value="" id="calen2" /> </td>
                   
                </tr>
                <tr>
                    <td >Porcentaje:<br/><input type="text" name="mod" value="" /> </td>
                   <td >Periodo:<br/>
                       <select name="periodo">
                           <option>1</option>
                           <option>2</option>
                           <option>3</option>
                           <option>4</option>
                       </select>
                   </td>
                   
                </tr>
      <tr>
          <td colspan="2" >Logro</td>
                  
                </tr>
        <tr>
                    <td>Nombre </td>
                    <td>Tipo </td>
                   
                </tr>
        <%
       
             ResultSet rs2 = null;
         PreparedStatement pst2 = null;
    
        
        
     try { 
         
         pst2 = con.prepareStatement("select * from logro");
         
        rs2 = pst2.executeQuery();
  
         while(rs2.next()) {
            %>
            <tr >
           <td  > <input type="checkbox" name="logro" value="<%=rs2.getString(1)%>" /><%=rs2.getString(2)%><td><td> 
           <td> <%=rs2.getString(3)%></td>
              </tr>
               <%
             
         } 
    } finally {
         if (rs2 != null) {
            rs.close();
         }
         if (pst2 != null) {
           pst.close();
         }
         
    }
        %>
         
            
     
       
     
           </table>
        <input type="submit" value="Guardar" onclick="agregarFechasToCamposTexto()"/>
         </form>
                
                </div>
                
                <!--  fin  -->
                
                <br/>
                <br/>
                                        <table >
                                           <tbody>
                                                <tr>
                                                    <td width="148"><br/>&nbsp;&nbsp;</td>
                                                    <td width="147"><br/>                                                      
                                                    &nbsp;&nbsp;</td>
                                                    <td width="149"><br/>&nbsp;&nbsp; </td>
                                                </tr>
                                               
                                                <tr>
                                                    <td><br/>                                                      
                                                    &nbsp;&nbsp;</td>
                                                    <td>&nbsp;&nbsp; </td>
                                                    <td>&nbsp;</td>
                                                </tr>
                                            </tbody>
                                        </table>
              
                  <!-- este es el listado  --> 
             
               
            </div>
                      
                                                
                                                
          
                                                
            <br/> <br/> <br/><br/> <br/> <br/>
		<div id="example">
			 
		
		  <blockquote> </blockquote>
	  </div>
	
    </div>
	<div id="sidebar">
           
		<div id="updates" class="boxed">
			<h2 class="title">Asignaturas</h2>
			<div class="content">
				<ul>
					<li> 
                    <!-- aqui van las asignaturas del docente..  -->
                      <form name="form1" action="docenteVista.jsp" method="get">
             <%
           pst = con.prepareStatement("select var_codigo_asignatura, var_nombre_asignatura from asignatura_docente where var_id_docente=?");
         pst.setString(1, d.getVar_id_docente());
         rs = pst.executeQuery();
         while(rs.next()) {
            %>
            <a href="#" onclick="add('<%=rs.getString(1)%>', '<%=rs.getString(2)%>');window.document.form1.submit()"><%=rs.getString(2).toUpperCase()%><br/></a> 
            
           <%
             
         } 
    } finally {
         if (rs != null) {
            rs.close();
         }
         if (pst != null) {
           pst.close();
         }
         
    }
        %>
        <input type="hidden" name="text" id="text" value="" />
        <input type="hidden" name="name" id="name" value="" />
        </form>
						
                     
						
					</li>
					<li></li>
					<li>
						<h3></h3>
						<p><a href="#"></a></p>
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
