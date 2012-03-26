<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" import="com.modelo.Acudiente,com.modelo.Docente"%>
<!DOCTYPE html>
<html>
    <%
        Docente docente;
        Acudiente acudiente;
        try {
            docente = (Docente) session.getAttribute("usuario");
        } catch (Exception ex) {
            docente = null;
        }
        try {
            acudiente = (Acudiente) session.getAttribute("usuario");
        } catch (Exception ex) {
            acudiente = null;
        }
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/vista.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" type="text/css" href="css/sliderman.css" />
        <link rel="stylesheet" type="text/css" href="css/validationEngine.jquery.css" />
        <!--...Slider...-->
        <script type="text/javascript" src="js/sliderman.1.3.6.js"></script>
        <script type="text/javascript" src="js/index.js"></script>
        <script type="text/javascript" src="js/jquery-1.6.1.js"></script>
        <script type="text/javascript" src="js/jquery.validationEngine.js"></script>
        <script type="text/javascript" src="js/languages/jquery.validationEngine-es.js"></script>
        <script type="text/javascript">
            $(document).ready( function() {
                index.ready();
            });
        </script>
        <title>.::Integral Moderno::.</title>
    </head>
    <body>
        <div id="header">
            <!--Slider de imagenes-->
            <div class="contenedorSlider">
                <div id="slider_container_1">
                    <div id="SliderName">
                        <img src="imagenesslider/01.jpg"  />
                        <img src="imagenesslider/02.jpg"  />
                        <img src="imagenesslider/03.jpg"  />
                        <img src="imagenesslider/04.jpg"  />
                        <img src="imagenesslider/05.jpg"  />
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
                            var demoSlider_3 = Sliderman.slider({container: 'SliderName', width: 700, height:250, effects: effectsDemo3,  display: {
                                    pause: true, // slider pauses on mouseover
                                    autoplay: 3000, // 3 seconds slideshow
                                    always_show_loading: 200, // testing loading mode
                                    description: {background: '#ffffff', opacity: 0.5, height: 80, position: 'bottom'}, // image description box settings
                                    loading: {background: '#ffffff', opacity: 0.2, image: 'imagenesslider/botonslider/loading.gif'}, // loading box settings
                                    buttons: {hide:true,opacity: 1, prev: {className: 'SliderNamePrev', label: ''}, next: {className: 'SliderNameNext', label: ''}}, // Next/Prev buttons settings
                                    navigation: {container: 'SliderNameNavigation', label: '&nbsp;'} // navigation (pages) settings
                                }});

                        </script>
                    </div>
                </div>
            </div>  
            <!--Fin de slider-->
        </div><!--fin de cabecera-->
        <div id="menu">
            <ul>
                <li><a id="home" href="" title="Home">Home</a></li>
                <li><a id="mision" href="" title="Mision">¿Quienes somos?</a></li>
            </ul>
        </div><!--fin menu-->
        <!--Contenedor del centro-->
        <div id="content">
            <%
                if (docente != null) {
                    out.print("<script type='text/javascript'>$('#content').load('Docente/menudocente.jsp');</script>");
                } else if (acudiente != null) {
                    out.print("<script type='text/javascript'>$('#content').load('Acudiente/menuacudiente.jsp');</script>");
                } else {
            %>
            <div id="columnA">
                <% if (docente != null || acudiente != null) {%>
                <a id="cerrar" href="" title="Cerrar session">Cerrar Sesion</a>
                <%}%>
                <h2>BIENVENIDOS A NUESTRO SITIO WEB</h2>
            </div>
            <div id="columnB">
                <fieldset id="login">
                    <legend>Login</legend>
                    <form name="form1" id="form1" action="" method="POST">
                        Usuario:<br/>
                        <input type="text" id="user" name="user" value="" class="validate[required]" autofocus="autofocus"/><br/>
                        Contraseña:<br/>
                        <input type="password" id="pass" name="pass" value="" class="validate[required]"/><br/>

                        <input name="boton" type="submit" value="Ingresar" />
                    </form>
                </fieldset>
            </div>
            <div style="clear: both;">&nbsp;</div>
            <div  id="result">
            </div>
            <%}%>
        </div>
        <div id="footer">
            &COPY;&Sqrt;Colegio Integral Moderno <br/> Tel: 64545453 -6234234234 direccion j<br/> gmail 
        </div>
    </body>
</html>