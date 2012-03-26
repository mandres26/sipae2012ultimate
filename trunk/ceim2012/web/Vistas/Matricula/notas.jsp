<%-- 
    Document   : notas
    Created on : 01-dic-2011, 22:09:23
    Author     : dell
--%>
<%@page import="java.sql.Connection"%>
<%@page import="com.controladores.ManejadorBaseDatos"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.controladores.Controlador"%>
<%@page import="com.modelo.Docente"%>
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
        
    String actividad[]=null;
         
       String periodo=request.getParameter("periodo");
       if(periodo==null){
           periodo="1";
       }
         
         
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
          <li><a href="docenteVista.jsp">Incio</a></li>
		 <li><a href="#">Editar Actividades</a></li>
  </ul>
    
</div>

   
	
        <div id="content">
   
            <div id="main">
		<div id="welcome" style="width:900px">
		 
                      
                                              
                                                
          
                                                
           
		<div id="example">
			
		
		  <blockquote>
          <!--  aqui va el listado  -->
          
        
       <!--  esta es para la lista de los estudiantes, para agregarles las notas....  -->
       <select name="periodo" >
           <option>1</option>
           <option>2</option>
           <option>3</option>
           <option>4</option>
       </select><input type="submit" value="consultar" />
       <form action="http://localhost:8080/VistaThis/RegistrarEstudianteLogroActividad" method="POST">
       <table >
           <thead>
               <tr style="color: #000; background-color: #279DC3" >
                   <th style="width: 300px">Estudiantes</th>
                   <!-- esto es para las actividades -->
                   <%
                   pst = con.prepareStatement("select count(*) from actividad where var_id_docente=? and var_periodo_actividad=?");
                    pst.setString(1, d.getVar_id_docente());//identificacion docente
                    pst.setString(2, "1");//periodo
                    rs = pst.executeQuery();
                    while(rs.next()){actividad=new String[rs.getInt(1)];}
                  
                    pst = con.prepareStatement("select var_codigo_actividad,  var_nombre_actividad from actividad where var_id_docente=? and var_periodo_actividad=?");
                    pst.setString(1, d.getVar_id_docente());//identificacion docente
                    pst.setString(2, "1");//periodo
                    rs = pst.executeQuery(); 
                    int i=0;
                    while(rs.next()){
                        PreparedStatement pst2  = con.prepareStatement("select * from estlogroactividad where var_cod_actividad=?");
                        pst2.setString(1, rs.getString(1));//identificacion docente
                         ResultSet rs2 = pst2.executeQuery(); 
                         boolean ver=true;
                         while(rs2.next()){
                         ver=false;
                         }
                         actividad[i++]=rs.getString(1);
                         if(ver){
                       
                       //si la actividad ya tiene su nota, no va ha aparecer...
                      
                    
                   %>
                   <th colspan="2" style="width: 260px"><%=rs.getString(2).toUpperCase()%></th>
                   <%}}%> 
               </tr> 
           </thead>
      
           
           <tbody>
              <%
              
 try {
         //esto es para que solamente muestre, el listado de los alumnos que el acudiente a inscrito..
            pst = con.prepareStatement("select * from estudiantes_asignatura_docente where idd=? and ida=?");
            pst.setString(1, "8834679");//identificacion docente
            pst.setString(2, "3");//identificacion aignatura
            rs = pst.executeQuery();
          boolean color=true;
           while(rs.next()){
               i=0;
              
              %>
               <tr style="background-color: <%=(color)?"white":"#279DC3"%>; color: #000">
                   <td style="width: 300px" >
                       <%=rs.getString(2).toUpperCase()+" "+rs.getString(3).toUpperCase()%>
                   </td>
                   <!-- este es el de las actividades del docente-->
                   <% for(int ii=0;ii<actividad.length;ii++){
                       PreparedStatement pst3  = con.prepareStatement("select * from estlogroactividad where var_cod_actividad=?");
                        pst3.setString(1, actividad[i]);//identificacion docente
                         ResultSet rs3 = pst3.executeQuery(); 
                         boolean ver=true;
                         while(rs3.next()){
                         ver=false;
                         }
                         if(ver){
%>
                   <td>Nota:<br/><input type="text" name="nota<%=rs.getString(1)+"/"+actividad[i]%>" value="" style="width: 50px"/></td>  
                   <td style="width:200px"><!-- logros  --> 
                       <%
                       PreparedStatement pst2 = con.prepareStatement("select la.var_codigo_logro, l.var_nombre_logro from logroactividad  as la, logro as l where var_codigo_docente=?  and var_codigo_actividad=? and la.var_codigo_logro=l.var_codigo_logros");
                       pst2.setString(1, "8834679");//identificacion docente
                       pst2.setString(2, actividad[i++]);//identificacion actividad
                       ResultSet rs2 = pst2.executeQuery();
                        
                       while(rs2.next()){
                       %>
                       <input type="checkbox" name="<%=rs.getString(1)+"/"+actividad[i-1]%>" value="<%=rs2.getString(1)%>" /><%=rs2.getString(2)%>
                       <br/><hr/>
                      <% } %>
                   </td><% }} %>
               </tr>
             <%   color=!color;} } finally { } %>
           </tbody>
       </table>
           <!-- datos qeu se nesecitan..  -->
           <input type="hidden" name="docente" value="<%=d.getVar_id_docente()%>" />
           <input type="submit" value="Guardar" />  
    
       </form>
          
          <!--  fin-->
          </blockquote>
	  </div>
	
    </div></div></div>
	
<div id="footer">
	<p id="legal">Institucion Integral Moderno</p>
	</div>
   
    </body>
</html>
