<%-- 
    Document   : index
    Created on : 29-nov-2011, 14:44:57
    Author     : dell
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>.: Integral Moderno :.</title>
        <link href="default.css" rel="stylesheet" type="text/css" />
        <%
         String info=(String)request.getSession().getAttribute("info");
        
        String tipo=(String)request.getSession().getAttribute("tipo");
        if(tipo!=null){
            if(tipo.equalsIgnoreCase("1")){
                //regresar a pagina
                %>
        <jsp:forward page="acudiente.jsp"></jsp:forward>
                
        <%
            }if(tipo.equalsIgnoreCase("2")){%>
             <jsp:forward page="docenteVista.jsp"></jsp:forward>
            <%
            }if(tipo.equalsIgnoreCase("3")){%>
             <jsp:forward page="administradorVista.jsp"></jsp:forward>
            <%
        }
        }
            
        %>
<script type="text/javascript" src="js/sliderman.1.3.6.js"></script>
	<link rel="stylesheet" type="text/css" href="css/sliderman.css" />
    <style type="text/css">
    #apDiv1 {
	position:absolute;
	width:200px;
	height:115px;
	z-index:1;
	left: 205px;
	top: 75px;
}
    #apDiv2 {
	position:absolute;
	width:795px;
	height:39px;
	z-index:2;
	left: 1350px;
	top: 15px;
}
    </style>
    </head>
   <body>
   <!-- Identificacion  -->
<div id="apDiv2"></div>
<div id="header">
	 
  <div id="logo">
    
   	<h2><a href="http://www.freecsstemplates.org/"> instituCION </a> </h2>
      <div id="apDiv1"><img src="images/ESCUD.png" width="100" height="100"></div>
      <h1><a href="#">iNTEGRAL MODERNO</a></h1>
	
  </div>&nbsp;&nbsp;&nbsp;&nbsp;
 
</div>
<div id="menu">
	<ul>
		<li class="first"><a href="#" title="">Home</a></li>
		<li><a href="#" title="">nuestra insticion</a></li>
		<li><a href="#" title="">mision</a></li>
		<li><a href="#" title="">Vision</a></li>
	</ul>
    
</div>
<div id="content">
   
	<div id="main">
		<div id="welcome">
		  <div class="contenedorSlider">
		    <div id="slider_container_1">
	<div id="SliderName">
	<img src="imagenesslider/imagen1.jpg"  />
     <img src="imagenesslider/imagen2.jpg"  />
     <img src="imagenesslider/imagen3.jpg"  />
     <img src="imagenesslider/imagen4.jpg"  />
     <img src="imagenesslider/imagen1.jpg"  />   

          <div class="c"></div>
	<div id="SliderNameNavigation"></div>
	<script type="text/javascript">
        
	 Sliderman.effect({name: 'demo01', cols: 10, rows: 8, delay: 20, fade: true, order: 'straight_stairs'});
                                         demo3Effect1 = {name: 'myEffect31', top: true, move: true, duration: 400};
	 				demo3Effect2 = {name: 'myEffect32', right: true, move: true, duration: 400};
	 				demo3Effect3 = {name: 'myEffect33', bottom: true, move: true, duration: 400};
	 				demo3Effect4 = {name: 'myEffect34', left: true, move: true, duration: 400};
	 				demo3Effect5 = {name: 'myEffect35', rows: 3, cols: 9, delay: 50, duration: 100, order: 'random', fade: true};
		 			demo3Effect6 = {name: 'myEffect36', rows: 2, cols: 4, delay: 100, duration: 400, order: 'random', fade: true, chess: true};

		 			effectsDemo3 = [demo3Effect1,demo3Effect2,demo3Effect3,demo3Effect4,demo3Effect5,demo3Effect6,'blinds'];
                                         var demoSlider_3 = Sliderman.slider({container: 'SliderName', width: 470, height:250, effects: effectsDemo3,  display: {
		 				pause: true, // slider pauses on mouseover
		 				autoplay: 3000, // 3 seconds slideshow
		 				always_show_loading: 200, // testing loading mode
		 				description: {background: '#ffffff', opacity: 0.5, height: 80, position: 'bottom'}, // image description box settings
		 				loading: {background: '#ffffff', opacity: 0.2, image: 'imagenesslider/botonslider/loading.gif'}, // loading box settings
					 	buttons: {hide:true,opacity: 1, prev: {className: 'SliderNamePrev', label: ''}, next: {className: 'SliderNameNext', label: ''}}, // Next/Prev buttons settings
				 		navigation: {container: 'SliderNameNavigation', label: '&nbsp;'} // navigation (pages) settings
				 	}});
z
	    </script>
            
	    </div>
			
       </div>
      
          </div>  
             <!--Fin de slider-->
            
            
            
            
            
            
            
            
            
            
</div> <br/> <br/> <br/><br/> <br/> <br/>
		<div id="example">
			
			<h2>&nbsp;</h2>
			<h2>Bienvenidos</h2>
<p>Esta una institucion con formacion integral</p>
			<blockquote> </blockquote>
	  </div>
	
    </div>
	<div id="sidebar">
            <form id="form1" method="post" action="InicioSesion">
	  <div id="login" class="boxed">
        <h2 class="title"> Tipo:
		    <select name="tipo" id="select">
                        <option value="1">Acudiente</option>
   <option value="2">Docente</option>
  
    <option value="3">Administrativo</option>
  </select></h2>
			<div class="content">
				
					<fieldset>
					<legend>Sign-In</legend>
					<label for="inputtext1"><br />
					  </label>
					<label for="select"></label>
                                        <%
                                       if(info!=null){
                                           out.print("<h5 style=\"color:red\">"+info+"</h5>");
                                           request.getSession().setAttribute("info", "");
                                        }
%>
				 	<label for="inputtext1">	Usuario:				  </label>
					<input id="inputtext1" type="text" name="usuario" value="" />
					<label for="inputtext2">Contraseña:</label>
					<input id="inputtext2" type="password" name="pass" value="" />
                    <p><a href="Racu.jsp">Registrar acudiente?</a></p>
					<input  type="submit" name="inputsubmit1" value="&nbsp;&nbsp;Iniciar sesión&nbsp;&nbsp;" />
					
				  </fieldset>
				
			</div> 
		</div>
            </form>
		<div id="updates" class="boxed">
			<h2 class="title">EVENTOS</h2>
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
