<%-- 
    Document   : RegistrarActividad
    Created on : 2/04/2012, 05:50:07 AM
    Author     : Usuario
--%>

<%@page import="ManejadorSEvaluacion.ControladorLogroActividad"%>
<%@page import="ManejadorHorario.ControlAsignatura"%>
<%@page import="java.sql.Date"%>
<%@page import="Utilidades.GeneradorFecha"%>
<%@page import="javax.sound.midi.ControllerEventListener"%>
<%@page import="java.util.Iterator"%>
<%@page import="Conceptos.Logro"%>
<%@page import="ManejadorSEvaluacion.ControladorLogro"%>
<%@page import="java.util.List"%>
<%@page import="Conceptos.Actividades"%>
<%@page import="ManejadorSEvaluacion.ControlActividades"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
        <title>Registrar Actividad</title>
    </head>
    <body>
           <%
            String codigoasign=request.getParameter("codigoasig");
            
            %>
                 
        <h2>Registrar Actividad</h2>
        <form action="GuardarActividad.jsp" method="Post"> 
        <table>
          
         
                <tr>
                    <td>Codigo Asignatura:<br/><input type="text" name="codigoasignatura" value="<%=codigoasign%>" disabled="false"/> </td>
                    <td>Codigo:<br/><input type="text" name="codigo" value="" /> </td>
                    <td>Nombre:<br/><input type="text" name="nombre" value="" /> </td>
               
                </tr>
                   <tr>
                    <td>Tema:<br/><input type="text" name="tema" value="" /> </td>
                    <td> <textarea name="descripcion" rows="10" cols="20">
                        </textarea></td>
                   
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
                    <td >Porcentaje:<br/><input type="text" name="porcentaje" value="" /> </td>
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
                     <td >Estado:<br/>
                       <select name="estado">
                           <option value="activo">Activa</option>
                           <option value="desactivada">Desactividad</option>
                           
                       </select>
                   </td>
                   
                </tr>
                <tr>
                    <td>
                  Logro:<select name="listlogro" >
                 <option value="0" select> Seleccione...
             <%
           
                 List<Logro> log=ControladorLogro.listarlogros();

                 Iterator it=log.iterator();
                 while(it.hasNext()){
                 Logro logro=(Logro)it.next();
                 
                %>
                <option   value="1" > <%=logro.getVar_nombre_logro()%>
                <%}
                 %>
             </select><br> </td> 
                </tr>
         </table>
            <input type="submit" value="Guardar"/>
        </form>
           
    </body>
</html>
