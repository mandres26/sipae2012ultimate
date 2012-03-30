<%-- 
    Document   : index
    Created on : 21/02/2012, 01:22:00 PM
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head profile="http://gmpg.org/xfn/11">
<title>.:SIPAE:.</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="imagetoolbar" content="no">
<link  href="cssprin/layout.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" type="text/css" href="cssprin/ddsmoothmenu.css"/>
<script type="text/javascript" src="js/easySlider1.5.js"></script>
	<!-- sliderman.js -->
<script type="text/javascript" src="js/sliderman.1.3.6.js"></script>
<link rel="stylesheet" type="text/css" href="cssprin/sliderman.css" />
<link rel="stylesheet" type="text/css" href="cssprin/slidermanen.css" />
<link rel="stylesheet" type="text/css" href="cssprin/calendario.css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-1.js"></script>
<script type="text/javascript" src="js/ddsmoothmenu.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.js"></script>
<script type="text/javascript" src="js/jquery_002.js"></script>
<script type="text/javascript" src="js/calendario.js"></script>


<style type="text/css">
#freecssfooter{display:block;position:fixed;bottom:0;left:0;width:100%;height:125px;margin-bottom:-125px;overflow:hidden;background-color:transparent;z-index:5000;text-indent:-5000px;}
#freecssfooter div#fcssholder{margin-bottom:-125px;}
#freecssfooter a, #freecssfooter div{display:block; text-indent:-5000px;}
</style>
<!--[if lte IE 6]><style type="text/css">#freecssfooter{position:absolute;}</style><![endif]-->
<script src="js/bsa.js" async="" type="text/javascript"></script>
<script async="async" src="Free%20CSS%20_%20Free%20CSS%20Templates%20_%20Demo%20of%20the%20CSS%20Template%20Educational_files/s_b893e54e42ad5b76e7b252f59be18e67.htm" id="_bsap_js_b893e54e42ad5b76e7b252f59be18e67" type="text/javascript"></script>

<script type="text/javascript">

ddsmoothmenu.init({
	mainmenuid: "templatemo_menu", //menu DIV id
	orientation: 'h', //Horizontal or vertical menu: Set to "h" or "v"
	classname: 'ddsmoothmenu', //class added to menu's outer DIV
	//customtheme: ["#1c5a80", "#18374a"],
	contentsource: "markup" //"markup" or ["container_id", "path_to_menu_file"]
})

</script>
<script type="text/javascript">
(function(){
  var bsa = document.createElement('script');
     bsa.type = 'text/javascript';
     bsa.async = true;
     bsa.src = 'js/bsa.js';
  (document.getElementsByTagName('head')[0]||document.getElementsByTagName('body')[0]).appendChild(bsa);

</script>
  
</head>
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
             <jsp:forward page="GestionAdministrador.jsp"></jsp:forward>
            <%
        }
        }
            
        %>
<body id="top" >
<div class="borde">
<div class="espacio">
<div class="wrapper col0">
  <div id="topbar">
    <div style="display: block;" id="slidepanel">
<div class="topbox"><h2>Manual de Usuario</h2>
    <ul>
    <a href="#"><li>Manual Administrador</li></a>
    <a href="#"><li>Manual Docente</li></a>
    <a href="#"><li>Manual Acudiente</li></a>
    </ul>
<h2>Como Ingresar</h2>
</div>
<div class="topbox">
<h2>Imformacion</h2>
<p>Si es Acudiente por favor registrese <a href="Vistas/Matricula/Racu.jsp">AQUI</a> para inscribir a el estudiante</p>

</div>
<div class="topbox last">
        <h2>Login </h2>
        <form   method="POST" action="InicioSesion" onsubmit=" var envio=false;
      if(usuario.value=='' || pass.value=='')alert('Debe ingresar Usuario y Contraseña. Ambos datos son obligatorios.');else envio=true;return envio">
          <fieldset>
            
          <label >Usuario:</label>
          <input name="usuario" id="usuario" type="text"/>
          
          <label >Password: </label>
          <input name="pass" id="pass" value="" type="password"/>
         
	    <label >Tipo Usuario:  </label>
		<select name="tipo" id="select">
                    <option value="1">Acudiente</option>
   		    <option value="2">Docente</option>
                    <option value="3">Administrativo</option>
  		</select>
        

          <label for="remember">
          <input class="checkbox" name="remember" id="remember" checked="checked" type="checkbox">
          Recordarme</label>

          <p>
            <input name="login" id="login" value="Login" type="submit">
            &nbsp;
            <input name="login" id="login" value="Reset" type="reset">
          </p>
           
          </fieldset>
             <%
                if(info!=null){
                  out.print("<h2 style=\"color:black\">"+info+"</h2>");
                  request.getSession().setAttribute("info", "");
                }
            %> 
        </form>
      </div>
      <br class="clear">
    </div>
    <div id="loginpanel">
      <ul>
        <li class="left">LogIn Aqui »</li>
        <li class="right" id="toggle"><a style="display: none;" id="slideit" href="#slidepanel">Administracion</a><a id="closeit" style="display: block;" href="#slidepanel">Cerrar Panel</a></li>
      </ul>
    </div>
    <br class="clear">
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col1">
  <div id="header">
    <div id="logo">
      <h1><a href="#">SIPAE</a></h1>
      <p>CEIM</p>
      <p>(CENTRO EDUCATIVO INTEGRAL MODERNO)</p>
    </div>
    <div class="fl_right">
      <ul>
          <form method="POST" action=""><li class="last">Buscar</li><input value="" type="text"/><input value="Buscar" type="submit"/></form>
        
        <li><a href="#">Soporte Line</a></li>
        <li><a href="#">School Board</a></li>
      </ul>
      <p>Tel: xxxxx xxxxxxxxxx | Mail: info@domain.com</p>
    </div>
    <br class="clear">
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="menu">
        <div id="templatemo_menu" class="ddsmoothmenu">
            <ul>
              	<li><a href="#" class="selected">Home</a></li>
          		<li style="z-index: 100; "><a href="#" class="">Acerca</a>
                    <ul style="top: 94px; visibility: visible; left: 0px; width: 140px; display: none; ">
                        <li><a href="#">Mision</a></li>
                        <li><a href="#">Vision</a></li>
                        <li><a href="#">Quienes Somos</a></li>
                  	</ul>
              	</li>
          		<li style="z-index: 99; "><a href="#" class="">Institucion</a>
                    <ul style="top: 94px; visibility: visible; left: 0px; width: 140px; display: none; ">
                        <li><a href="#">Perfil Institucional</a></li>
                        <li><a href="#">Simbolo Istnal</a></li>
                        <li><a href="#">Documentos</a></li>
                    
                  	</ul>
              	</li>
              	<li style="z-index: 100; "><a href="#" class="">Calendario Academico</a>
                	
                </li>
              	<li><a href="http://www.templatemo.com/templates/templatemo_281_chrome/contact.html">Contact</a></li>
            </ul>
            <br style="clear: left">
        </div> <!-- end of templatemo_menu -->
</div>
   
<!-- ####################################################################################################### -->
<div class="wrapper col3">
<div id="slider_container_1hom">
	<div id="SliderName">

        <img src="cssprin/imagenesslider/imagen1.jpg"  />
	<img src="cssprin/imagenesslider/imagen2.jpg"  />
        <img src="cssprin/imagenesslider/imagen3.jpg"  />
        <img src="cssprin/imagenesslider/imagen4.jpg"  />

        <div class="c"></div>
	<div id="SliderNameNavigation"></div>
	<script type="text/javascript">
        // we created new effect and called it 'demo01'. We use this name later.
	Sliderman.effect({name: 'demo01', cols: 10, rows: 8, delay: 20, fade: true, order: 'straight_stairs'});
                                        demo3Effect1 = {name: 'myEffect31', top: true, move: true, duration: 400};
					demo3Effect2 = {name: 'myEffect32', right: true, move: true, duration: 400};
					demo3Effect3 = {name: 'myEffect33', bottom: true, move: true, duration: 400};
					demo3Effect4 = {name: 'myEffect34', left: true, move: true, duration: 400};
					demo3Effect5 = {name: 'myEffect35', rows: 3, cols: 9, delay: 50, duration: 100, order: 'random', fade: true};
					demo3Effect6 = {name: 'myEffect36', rows: 2, cols: 4, delay: 100, duration: 400, order: 'random', fade: true, chess: true};

					effectsDemo3 = [demo3Effect1,demo3Effect2,demo3Effect3,demo3Effect4,demo3Effect5,demo3Effect6,'blinds'];
                                        var demoSlider_3 = Sliderman.slider({container: 'SliderName', width: 850, height:255, effects: effectsDemo3,  display: {
						pause: true, // slider pauses on mouseover
						autoplay: 3000, // 3 seconds slideshow
						always_show_loading: 200, // testing loading mode
						description: {background: '#ffffff', opacity: 0.5, height: 80, position: 'bottom'}, // image description box settings
						loading: {background: '#ffffff', opacity: 0.2, image: '../cssprin/imagenesslider/botonslider/loading.gif'}, // loading box settings
						buttons: {hide:true,opacity: 1, prev: {className: 'SliderNamePrev', label: ''}, next: {className: 'SliderNameNext', label: ''}}, // Next/Prev buttons settings
						navigation: {container: 'SliderNameNavigation', label: '&nbsp;'} // navigation (pages) settings
					}});

	</script>
	</div>
         

</div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col5">
  <div id="footer">
   <div id="newsletter">
      <h2>Eventos</h2>
       <div id="slider_container_2">
	<div id="SliderName2">

        <img src="cssprin/imagenesslider/naturaleza1.jpg"  />
	<img src="cssprin/imagenesslider/images1.jpg"  />
        

        <div class="c"></div>
	<div id="SliderNameNavigation2"></div>
       <div class="c"></div>
        <script type="text/javascript">
        // we created new effect and called it 'demo01'. We use this name later.
	Sliderman.effect({name: 'demo01', cols: 10, rows: 8, delay: 20, fade: true, order: 'straight_stairs'});

					demo3Effect2 = {name: 'myEffect32', right: true, move: true, duration: 400};

					effectsDemo3 = [demo3Effect2];
                                        var demoSlider_2 = Sliderman.slider({container: 'SliderName2', width: 300, height:250, effects: effectsDemo3,  display: {
						pause: true, // slider pauses on mouseover
						autoplay: 20000, // 3 seconds slideshow
						always_show_loading: 200, // testing loading mode
						description: {background: '#ffffff', opacity: 0.5, height: 80, position: 'bottom'}, // image description box settings
						loading: {background: '#ffffff', opacity: 0.5, image: 'imagenesslider/botonslider/loading.gif'}, // loading box settings
						buttons: {hide:true,opacity: 1, prev: {className: 'SliderNamePrev', label: ''}, next: {className: 'SliderNameNext', label: ''}}, // Next/Prev buttons settings
						navigation: {container: 'SliderNameNavigation2', label: '&nbsp;'} // navigation (pages) settings
					}


		 			});

	</script>
	</div>

</div> 
    </div>
    <div class="calendar">
      <h2>Calendario</h2>
    
    </div>
     <div class="footbox">
      <h3>Noticias</h3>
     <div id="slider_container_3">
	<div id="SliderName3">

        <img src="cssprin/imagenesslider/naturaleza1.jpg"  />
	<img src="cssprin/imagenesslider/images1.jpg"  />

        <div class="c"></div>
	<div id="SliderNameNavigation3"></div>
	<script type="text/javascript">
        // we created new effect and called it 'demo01'. We use this name later.
	Sliderman.effect({name: 'demo01', cols: 10, rows: 8, delay: 20, fade: true, order: 'straight_stairs'});
                                        demo3Effect2 = {name: 'myEffect32', right: true, move: true, duration: 400};
						effectsDemo3 = [demo3Effect2];
                                        var demoSlider_3 = Sliderman.slider({container: 'SliderName3', width: 300, height:250, effects: effectsDemo3,  display: {
						pause: true, // slider pauses on mouseover
						autoplay: 7000, // 3 seconds slideshow
						always_show_loading:200, // testing loading mode
						description: {background: '#ffffff', opacity: 0.5, height: 80, position: 'bottom'}, // image description box settings
						loading: {background: '#ffffff', opacity: 0.2, image: 'imagenesslider/botonslider/loading.gif'}, // loading box settings
						buttons: {hide:true,opacity: 1, prev: {className: 'SliderNamePrev', label: ''}, next: {className: 'SliderNameNext', label: ''}}, // Next/Prev buttons settings
						navigation: {container: 'SliderNameNavigation3', label: '&nbsp;'} // navigation (pages) settings
					}});

	</script>
	</div>



</div> 
    </div>
    <br class="clear">
  </div>
</div>
<!-- ####################################################################################################### -->

<script src="urchin.js" type="text/javascript"></script>
<script type="text/javascript">
_uacct = "UA-159243-28";
urchinTracker();
</script>

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

