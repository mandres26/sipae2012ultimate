<%-- 
    Document   : GestionAdministrador
    Created on : 15/03/2012, 10:18:45 PM
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage = "ErrorPage.jsp" %>
<%@ page session="true" %>
<%
String usuario=(String)request.getSession().getAttribute("usuario");
String pass=(String)request.getSession().getAttribute("pass");
%>
<!DOCTYPE html>
<html>
     <link rel="stylesheet" href="cssprin/style_prin.css" type="text/css" />
        <link rel="stylesheet" href="cssprin/portal.css" type="text/css" />
         <link rel="shortcut icon" href="Imagenes/EscudoCEIM.png">
        
        
        <link rel="stylesheet" type="text/css" href="cssprin/ddsmoothmenu.css"/>
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/jquery-1.js"></script>
        <script type="text/javascript" src="js/ddsmoothmenu.js"></script>
        <script type="text/javascript" src="js/ddsmoothmenuvert.js"></script>
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/jquery-ui-1.js"></script>
        <script type="text/javascript" src="js/jquery_002.js"></script>
         
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>..:Gestion-----Admin-----:.</title>
        
<script type="text/javascript">

ddsmoothmenu.init({
	mainmenuid: "templatemo_menu", //menu DIV id
	orientation: 'v', //Horizontal or vertical menu: Set to "h" or "v"
	classname: 'ddsmoothmenu', //class added to menu's outer DIV
	//customtheme: ["#1c5a80", "#18374a"],
	contentsource: "markup" //"markup" or ["container_id", "path_to_menu_file"]
})

</script>

<style>
    submenu{
      top: 94px; visibility: visible; left: 0px; width: 140px; display: none;
    }
</style>

    </head>
   <body>

 <div class="wrapper">
 <div class="header-bar">

     <h3 style="text-align: center">GESTIONES ADMINISTRADOR</h3><h4>Autenticado como:<a href="perfil.jsp" target="_black"><%=usuario%></a><a href="cerrarSession.jsp">(CerrarSesion)</a></h4>
 <input type="hidden" name="usern" value="<%=usuario%>" />
 
  </div>
 <div id="manual">
      <ul>
    <a href="#"><li>Manual Administrador</li></a>
    <a href="#"><li>Manual Docente</li></a>
    <a href="#"><li>Manual Acudiente</li></a>
    </ul>
     <img id="imageni"src="cssprin/images/ESCUD_1.png" alt="escudoceim" width="200px" height="200px"/>
     </div>
 <div id="wrap8">
 <div class="menu">
        <div id="templatemo_menu" id="ddsmoothmenu">
            <ul>
              	<li><a href="#" class="selected">Gestion Matricula</a>
                <ul class="submenu">
                             <li><a href="">Inscripcion Est.</a> 
                                 <li><a href="#">Matricular Estudiante</a> 
                                 <li><a href="#">Listar EStudiante/Mat</a>    
                              <ul><!--Submenu del menu principal de menu-->
                                 <li><a href="#">Opcion1</a></li>
                                 <li><a href="#">Opcion2</a></li>
                             </ul>
                 
                       </ul>
                </li>
                 <li><a href="">Gestion Horario</a>
                 <ul class="submenu">
                    <li ><a  href="#">Curso</a><!--Menu principal de menu-->
                         <ul class="submenu">
                             <li><a href="Vistas/Horario/Registrar_curso.jsp">Registrar</a> 
                                 <li><a href="#">Consultar</a> 
                                 <li><a href="#">Listar</a>    
                              <ul><!--Submenu del menu principal de menu-->
                                 <li><a href="#">Opcion1</a></li>
                                 <li><a href="#">Opcion2</a></li>
                             </ul>
                 
                       </ul>
                   </li>
                <li><a href="#">Aula</a>
                      <ul class="submenu">
                          <li><a href="Vistas/Horario/Registrar_aula.jsp">Registrar</a> 
                                 <li><a href="#">Consultar</a> 
                                 <li><a href="#">Listar</a>    
                         <ul><!--Submenu del menu principal de menu-->
                             <li><a href="#">Opcion1</a></li>
                             <li><a href="#">Opcion2</a></li>
                        </ul>
                 
                     </ul>
                          
                          
                </li>
                <li><a href="#">Asignatura</a>
                      <ul class="submenu">
                          <li><a href="Vistas/Horario/Registrar_asignatura.jsp">Registrar</a> 
                          <li><a href="#">Consultar</a> 
                                 <li><a href="#">Listar</a>    
                         <ul><!--Submenu del menu principal de menu-->
                            <li><a href="#">Opcion1</a></li>
                             <li><a href="#">Opcion2</a></li>
                        </ul>
                 
                     </ul>
                </li>
                <li><a href="#">Docente</a>
                 <ul class="submenu">
                     <li><a href="Vistas/Horario/Registrar_docente.jsp">Registrar</a> 
                                 <li><a href="#">Consultar</a> 
                                 <li><a href="#">Listar</a>    
                         <ul><!--Submenu del menu principal de menu-->
                             <li><a href="#">Opcion1</a></li>
                             <li><a href="#">Opcion2</a></li>
                        </ul>
                 
                     </ul>
                </li>
                <li><a href="#">Horario</a>
                 <ul class="submenu">
                          <li><a href="#">Registrar</a> 
                                 <li><a href="#">Consultar</a> 
                                 <li><a href="#">Listar</a>    
                         <ul><!--Submenu del menu principal de menu-->
                             <li><a href="#">Opcion1</a></li>
                             <li><a href="#">Opcion2</a></li>
                        </ul>
                 
                </ul>
                </li>
                       
              	</ul>
                
                </li>
                <li style="z-index: 100; "><a href="#" class="">Gestion Evaluacion</a>
                   <ul class="submenu">
                          <li><a href="#">Registrar</a> 
                                 <li><a href="#">Consultar</a> 
                                 <li><a href="#">Listar</a>    
                         <ul><!--Submenu del menu principal de menu-->
                             <li><a href="#">Opcion1</a></li>
                             <li><a href="#">Opcion2</a></li>
                        </ul>
                 
                </ul>
              	</li>
                  <li style="z-index: 100; "><a href="#" class="">Gestion Evaluacion</a>
                   <ul class="submenu">
                          <li><a href="#">Registrar</a>
                                 <li><a href="#">Consultar</a>
                                 <li><a href="#">Listar</a>
                         <ul><!--Submenu del menu principal de menu-->
                             <li><a href="#">Opcion1</a></li>
                             <li><a href="#">Opcion2</a></li>
                        </ul>

                </ul>
              	</li>
                <li style="z-index: 99; "><a href="#" class="">Gestion EvalDocente</a>
                   <ul class="submenu">
                          <li><a href="#">Registrar</a> 
                                 <li><a href="#">Consultar</a> 
                                 <li><a href="#">Listar</a>    
                         <ul><!--Submenu del menu principal de menu-->
                             <li><a href="#">Opcion1</a></li>
                             <li><a href="#">Opcion2</a></li>
                        </ul>
                 
                </ul>
              	</li>
          	<li style="z-index: 100; "><a href="#" class="">Gestion Excusa</a>
                   <ul class="submenu">
                          <li><a href="Vistas/Horario/Registrar_aula.jsp">Registrar</a> 
                                 <li><a href="#">Consultar</a> 
                                 <li><a href="#">Listar</a>    
                         <ul><!--Submenu del menu principal de menu-->
                             <li><a href="#">Opcion1</a></li>
                             <li><a href="#">Opcion2</a></li>
                        </ul>
                 
                </ul>
              	</li>
          	<li style="z-index: 100; "><a href="#" class="">Gestion Disciplina</a>
                	 <ul class="submenu">
                          <li><a href="Vistas/Horario/Registrar_aula.jsp">Registrar</a> 
                                 <li><a href="#">Consultar</a> 
                                 <li><a href="#">Listar</a>    
                         <ul><!--Submenu del menu principal de menu-->
                             <li><a href="#">Opcion1</a></li>
                             <li><a href="#">Opcion2</a></li>
                        </ul>
                 
                </ul>
                </li>
               
                <li><a href="">Reportes</a>
                <ul class="submenu">
                    <li ><a  href="#">Academicos</a><!--Menu principal de menu-->
                         <ul class="submenu">
                             <li><a href="Vistas/Horario/Registrar_curso.jsp">Registrar</a> 
                                 <li><a href="#">Consultar</a> 
                                 <li><a href="#">Listar</a>    
                              <ul><!--Submenu del menu principal de menu-->
                                 <li><a href="#">Opcion1</a></li>
                                 <li><a href="#">Opcion2</a></li>
                             </ul>
                 
                       </ul>
                   </li>
                <li><a href="#">Administrativos</a>
                      <ul class="submenu">
                          <li><a href="Vistas/Horario/Registrar_aula.jsp">Registrar</a> 
                                 <li><a href="#">Consultar</a> 
                                 <li><a href="#">Listar</a>    
                         <ul><!--Submenu del menu principal de menu-->
                             <li><a href="#">Opcion1</a></li>
                             <li><a href="#">Opcion2</a></li>
                        </ul>
                 
                     </ul>
                          
                          
                </li>
            </ul>
              	<li><a href="">Gestion Usuario</a>
                  <ul class="submenu">
                          <li><a href="Vistas/Horario/Registrar_aula.jsp">Registrar</a> 
                                 <li><a href="#">Consultar</a> 
                                 <li><a href="#">Listar</a>    
                         <ul><!--Submenu del menu principal de menu-->
                             <li><a href="#">Opcion1</a></li>
                             <li><a href="#">Opcion2</a></li>
                        </ul>
                 
                </ul>
                
                </li>
            
                    <li style="z-index: 100; "><a href="#" class="">Presupuesto</a>
                   <ul class="submenu">
                          <li><a href="#">Registrar</a>
                                 <li><a href="#">Consultar</a>
                                 <li><a href="#">Listar</a>
                         <ul><!--Submenu del menu principal de menu-->
                             <li><a href="#">Opcion1</a></li>
                             <li><a href="#">Opcion2</a></li>
                        </ul>

                </ul>
              	</li>
                     </ul>
            <br style="clear: left">
   
        </div> <!-- end of templatemo_menu -->
</div> 
     <hr></hr>
    
     
 
</div>
  
 <div class="wrapper5 col6">
  <div id="copyright">
    <p class="fl_left">Copyright © 2012 - All Rights Reserved - <a href="#">Domain Name</a></p>
    <p class="fl_right">fitco by <a href="#" title="Fundacion Universitaria Tecnologico Comfenalco">Fundacion Universitaria Tecnologico Comfenalco</a></p>
    <br class="clear">
  </div>
</div>
 </div>
  
    </body>
</html>
