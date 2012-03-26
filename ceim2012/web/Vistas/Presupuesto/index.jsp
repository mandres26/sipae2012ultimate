<%-- 
    Author     : katia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=5" />  <!-- IE7 mode -->
        <meta http-equiv="X-UA-Compatible" content="IE=100"/>  <!-- IE8 mode -->

        <title>Sistema De Gestion Presupuesto</title>
        <!--CSS-->
        <link rel=StyleSheet href="images/style.css" type="text/css"/>
        <link rel="stylesheet" href="images/skin.css" type="text/css"/>
        <!--[if IE]><link rel=StyleSheet href="images/style.ie7.css" type="text/css"/><!--<![endif]-->
        <!--[if IE]><link rel=StyleSheet href="images/style.ie6.css" type="text/css"/><!--<![endif]-->
        <link rel=StyleSheet href="images/styleindex.css" type="text/css"/>
        <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon"/>
        <link rel="stylesheet" href="images/view.css" type="text/css" media="all"/>
        <link rel="stylesheet" href="images/style.css" type="text/css" media="screen" />
        <link rel="stylesheet" href="images/validationEngine.jquery.css" type="text/css"/>
        <!--JAVASCRIPT-->
        <script src="images/script.js" type="text/javascript"></script>
        <script src="images/jquery-1.4.2.min.js" type="text/javascript"></script>
        <script src="images/jquery.validate.js" type="text/javascript"></script>
        <script src="images/funciones.js" type="text/javascript"  charset="utf-8"></script>
        <script src="images/jquery.validationEngine.min.js" type="text/javascript"  charset="utf-8"></script>
        <script src="images/languages/jquery.validationEngine-es.min.js" type="text/javascript"  charset="utf-8"></script>
        <script type="text/JavaScript">
            <!--
            function MM_swapImgRestore() { //v3.0
                var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
            }

            function MM_preloadImages() { //v3.0
                var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
                    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
                        if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
                }

                function MM_findObj(n, d) { //v4.01
                    var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
                        d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
                    if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
                    for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
                    if(!x && d.getElementById) x=d.getElementById(n); return x;
                }

                function MM_swapImage() { //v3.0
                    var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
                        if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
                }
                //-->
                
                $(document).ready(function(){
                    index.ready();
                });
        </script>
    </head>
    <body>
        <div id="art-page-background-simple-gradient" >
        </div>
        <div id="art-page-background-glare">
            <div id="art-page-background-glare-image"></div>
        </div>
        <div id="art-main">
            <div class="art-Sheet">
                <div class="art-Sheet-tl"></div>
                <div class="art-Sheet-tr"></div>
                <div class="art-Sheet-bl"></div>
                <div class="art-Sheet-br"></div>
                <div class="art-Sheet-tc"></div>
                <div class="art-Sheet-bc"></div>
                <div class="art-Sheet-cl"></div>
                <div class="art-Sheet-cr"></div>
                <div class="art-Sheet-cc"></div>
                <div class="art-Sheet-body">
                    <div class="art-Header">
                        <div class="art-Header-jpeg"></div>
                        <div class="art-Logo">
                            <!-- <h1 id="name-text" class="art-Logo-name"><a href="#"><b></b></a></h1> !-->
                            <div id="slogan-text" class="art-Logo-text"> </div>

                        </div>
                    </div>
                    <div class="art-nav">
                        <div class="l"></div>
                        <div class="r"></div>
                        <ul class="art-menu">
                            <li>
                                <a id="index" href="index.jsp"><span class="l"></span><span class="r"></span><span class="t">Inicio</span></a>
                                <ul>
                                    <li><a onclick="" href="">Cerrar Sesion</a></li>
                                </ul>
                            </li>
                            <li>
                                <a id="presu" href=""><span class="l"></span><span class="r"></span><span class="t">Presupuesto</span></a>
                                <ul>
                                    <li><a id="registrar" href="">Registrar Presupuesto</a></li>
                                    <li><a id="consultar" href="">Consultar Presupuesto</a></li>
                                    <li><a id="listar" href="">Listar Presupuesto</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="art-contentLayout">
                        <div class="art-content">
                            <div class="art-Post">
                                <div class="art-Post-body">
                                    <div class="art-Post-inner">
                                        <h2 class="art-PostHeader">
                                        </h2>
                                        <div class="art-PostContent" id="art-PostContent">
                                            <label style="font-size: 10pt">  Bienvenido </label></br>
                                        </div>
                                        <div class="cleared"></div>
                                    </div>
                                    <div class="cleared"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="cleared"></div>
                </div>
            </div>
        </div>
    </body>
</html>