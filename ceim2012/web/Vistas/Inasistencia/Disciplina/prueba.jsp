<%-- 
    Document   : prueba
    Created on : 23/11/2011, 09:04:43 AM
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link type="text/css" href="../JavaScript/jquery-ui-1.8.16.custom/css/custom-theme/jquery-ui-1.8.16.custom.css" rel="Stylesheet" />
        <script type="text/javascript" src="../JavaScript/jquery-ui-1.8.16.custom/js/jquery-1.6.2.min.js"></script>
        <script type="text/javascript" src="../JavaScript/jquery-ui-1.8.16.custom/js/jquery-ui-1.8.16.custom.min.js"></script>

        <style>
            .toggler { width: 500px; height: 200px; }
            #button { padding: .5em 1em; text-decoration: none; }
            #effect { width: 240px; height: 135px; padding: 0.4em; position: relative; }
            #effect h3 { margin: 0; padding: 0.4em; text-align: center; }
        </style>
        <script>
            $(function() {
                // run the currently selected effect
                function runEffect() {
                    // get effect type from
                    var selectedEffect = $( "#effectTypes" ).val();

                    // most effect types need no options passed by default
                    var options = {};
                    // some effects have required parameters
                    if ( selectedEffect === "scale" ) {
                        options = { percent: 0 };
                    } else if ( selectedEffect === "size" ) {
                        options = { to: { width: 200, height: 60 } };
                    }

                    // run the effect
                    $( "#effect" ).toggle( selectedEffect, options, 500 );
                };

                // set effect from select menu value
                $( "#button" ).click(function() {
                    runEffect();
                    return false;
                });
            });
        </script>
    </head>
    <body>




        <div class="demo">

            <div class="toggler">
                <div id="effect" class="ui-widget-content ui-corner-all">
                    <h3 class="ui-widget-header ui-corner-all">Toggle</h3>
                    <p>
			Etiam libero neque, luctus a, eleifend nec, semper at, lorem. Sed pede. Nulla lorem metus, adipiscing ut, luctus sed, hendrerit vitae, mi.
                    </p>
                </div>
            </div>

            <select name="effects" id="effectTypes">
                <option value="blind">Blind</option>
                <option value="bounce">Bounce</option>
                <option value="clip">Clip</option>
                <option value="drop">Drop</option>
                <option value="explode">Explode</option>
                <option value="fold">Fold</option>
                <option value="highlight">Highlight</option>
                <option value="puff">Puff</option>
                <option value="pulsate">Pulsate</option>
                <option value="scale">Scale</option>
                <option value="shake">Shake</option>
                <option value="size">Size</option>
                <option value="slide">Slide</option>
            </select>

            <a href="#" id="button" class="ui-state-default ui-corner-all">Run Effect</a>
        </div><!-- End demo -->



        <div style="display: none;" class="demo-description">
            <p>Click the button above to preview the effect.</p>
        </div><!-- End demo-description -->

    </body>
</html>
