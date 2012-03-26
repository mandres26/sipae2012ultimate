<%-- 
    Document   : Docente
    Created on : 3/11/2011, 04:31:52 PM
    Author     : sigi
--%>

<%@page import="Evaluaciones.com.modelo.Actividades"%>
<%@page import="com.res.TIPOS_MENSAJE"%>
<%@page import="Evaluaciones.com.modelo.TipoLogros"%>
<%@page import="Evaluaciones.com.modelo.Logro"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="com.modelo.Docente"%>

<%@page import="com.controladores.Controlador"%>
<%@page import="com.res.SessionUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
        <title>Admintrador Docente Integral Moderno</title>
        <%
        String styleLogin="display:block";
        String styleAdmin="display:none"; 
        String info="";
        
        //session.......
             final String NOMBRE_USUARIO_SESSION="docente";
             SessionUsuario sessionUsuario=(SessionUsuario)session.getAttribute(NOMBRE_USUARIO_SESSION);
             String usuario=request.getParameter("user");
             String password=request.getParameter("pass");
             if(sessionUsuario!=null){
                   styleLogin="display:none";
                    Controlador<Docente> control=new Controlador();
                 styleAdmin="display:block";
                      Docente docente=new Docente();
                    out.print("Docente identificado como "+ docente.getVar_nombre_docente().toUpperCase()+" "+docente.getVar_apellido_docente().toUpperCase()+"(<a href=\"http://localhost:8080/VistaThis/cerrarSession.jsp\">salir</a>)"); 
               }else{
                 sessionUsuario = new SessionUsuario(usuario, password, null);
                 Controlador<Docente> control=new Controlador();
                 
                      Docente docente=new Docente();
                     if(docente!=null){
                         sessionUsuario.setIdUsuario(docente.getVar_id_docente());
                         session.setAttribute(NOMBRE_USUARIO_SESSION, sessionUsuario);
                         out.print("Docente identificado como "+ docente.getVar_nombre_docente().toUpperCase()+" "+docente.getVar_apellido_docente().toUpperCase()+"(<a href=\"http://localhost:8080/VistaThis/cerrarSession.jsp\">salir</a>)"); 
                     styleLogin="display:none";
                    styleAdmin="display:block";
                    }
               }
         %>
         
        <%

        
           //registrar el Asignatura
             String guardarLogros=request.getParameter("guardarLogros");   
             if(guardarLogros!=null){
                 Controlador<Logro> controlador=new Controlador();//creamos el controlador
                 String map[]={request.getParameter("codigo"), request.getParameter("nombre")};
                 if(!controlador.existeCliente(map)){
                   Logro logro=new Logro();
                                  logro.setVar_codigo_logros(request.getParameter("codigo"));
                   logro.setVar_nombre_logro(request.getParameter("nombre"));
                   logro.setTipoLogro((request.getParameter("tipos").equals("Fuerte")?TipoLogros.FUERTE:TipoLogros.DEVIL));
                   controlador.registrarCliente(logro);
                       info="su ha guardado el logro: "+logro.getVar_nombre_logro()+" de tipo: "+logro.getTipoLogro().toString()+" ha sido guardado exitosamente!";
                     
                 }
                
             }
       
        %>
        
        <%

        
           //registrar el Asignatura
             String guardarActividades=request.getParameter("guardarActividades");   
             if(guardarActividades!=null){
                 Controlador<Actividades> controlador=new Controlador();//creamos el controlador
                 String map[]={request.getParameter("codigo"), request.getParameter("nombre")};
                 if(!controlador.existeCliente(map)){
                   Actividades actividades=new Actividades();
                                 
                   controlador.registrarCliente(actividades);
                       info="se ha guardado el logro: "+"-"+" ha sido guardado exitosamente!";
                     
                 }
                
             }
       
        %>
        <link href="http://localhost:8080/VistaThis/style.css" rel="stylesheet" type="text/css"/>
        <script src="js/Opciones.js" language="JavaScript"></script>
    </head>
    <body>
        
        <br/><br/><br/><br/>
        <div id="content2"> 
            
            <!--Este es de la parte del login-->
            
            <div id="login" style="<%=styleLogin%>">
                <form action="http://localhost:8080/VistaThis/administrador/Docente.jsp" method="POST"> 
                    <fieldset>
                        <legend align= "center"><  DOCENTE  ></legend>
                           <center> <table >
                            
                            <tbody>
                                <tr>
                                    <td>Usuario:<br/><input type="text" name="user" value="" /><br/><br/></td>
                                </tr>
                                <tr>
                                    <td>Contraseña:<br/><input type="password" name="pass" value="" /><br/><br/></td>
                                </tr>
                                <tr>
                                    <td><input type="submit" value="Ingresar" /></td>
                                </tr>
                            </tbody>
                        </table>
                 </center></fieldset>
                </form> 
           </div><!--este es el fin del login.-->
           <!--aqui empieza el panel de docente-->
           <div>
               
               <!--ESTA ES LA PARTE CUANDO EL ADMINISTRADOR SE IDENTIFICA Y LE MUESTRA LAS OPCIONES-->
           <div id="admin" style="<%=styleAdmin%>">
               <a href="#" onclick="logros();">Registrar Logros</a>&nbsp;
               <a href="#" onclick="actividad();">Registrar Actividad</a>&nbsp;
               <a href="#" onclick="curso();">Agregar notas</a>&nbsp;
               <a href="#" onclick="excusa();">Excusa</a>&nbsp;
               
           </div>
               
           </div>
           
        
           <%=info%>
             <!--  esta es la parte de logro -->
             <div id="logros" style="display: none">
                 <form action="Docente.jsp" method="POST">
                     <br/>
                     <h1>Logros</h1><br/>
                     <table>
                         
                         <tbody>
                             <tr>
                                 <td>Codigo:<br/><input type="text" name="codigo" value="" /></td>
                                 
                             </tr>
                             <tr>
                                 
                                 <td>Nombre:<br/><input type="text" name="nombre" value="" /></td>
                                
                             </tr>
                             <tr>
                                 
                                 <td>Tipo:<br/><select name="tipos" style="width: 155px">
                                         <option>Fuerte</option>
                                         <option>Devil</option>
                                     </select></td>
                             </tr>
                         </tbody>
                     </table>
                     <input type="hidden" name="guardarLogros" value="" />
                     <input type="submit" value="Guardar" />
                 </form>   
             </div>
             <!-- actividades----->
             
           
               <div id="actividades" style="display: none">
                 <form action="Docente.jsp" method="POST">
                     <br/>
                     <h1>Actividades</h1><br/>
                     <table>
                         
                         <tbody>
                             <tr>
                                 <td>Codigo:<br/><input type="text" name="codigo" value="" /></td>
                                  <td>Nombre:<br/><input type="text" name="nombre" value="" /></td>
                                   <td>Porcentaje<br/><input type="text" name="porcentaje" value="" /></td>
                                   <td>Periodo<br/><select name="periodo">
                                           <option>1</option>
                                           <option>2</option>
                                           <option>3</option>
                                           <option>4</option>
                                       </select></td>
                             </tr>
                             <tr>
                                 
                                 <td>Fecha de Creacion:<br/>
                                     <select name="diaCreacion">
                                         <%
                                         for(int i=1;i<32;i++){
                                         %>
                                         <option><%=i%></option>
                                         <%}%>
                                     </select>
                                     <select name="mesCreacion">
                                         <%
                                         String mes[]={"Enenro", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"};
                                         for(int i=0;i<12;i++){
                                         %>
                                         <option><%=mes[i]%></option>
                                         <%}%>
                                     </select>
                                     
                                     
                                 </td>
                                 <td>Fecha de Ejecucion:<br/>
                                     <select name="diaCreacion">
                                         <%
                                         for(int i=1;i<32;i++){
                                         %>
                                         <option><%=i%></option>
                                         <%}%>
                                     </select>
                                     <select name="mesCreacion">
                                         <%
                                         for(int i=0;i<12;i++){
                                         %>
                                         <option><%=mes[i]%></option>
                                         <%}%>
                                     </select>
                                     
                                     
                                 </td>
                                
                                 
                                
                             </tr>
                             <tr>
                                 
                                 
                             </tr>
                         </tbody>
                     </table>
                     <input type="hidden" name="guardarActividades" value="" />
                     <input type="submit" value="Guardar" />
                 </form>   
             </div>
                                     
                                      <!--  esta es la parte de excusa -->
             <div id="excusa" style="display: none">
                 <form action="Docente.jsp" method="POST">
                     <br/>
                     <h1>Escusa</h1><br/>
                     <table>
                         
                         <tbody>
                             <tr>
                                 <td>Fecha:<br/><input type="text" name="fecha" value="" /></td>
                                 
                             </tr>
                             <tr>
                                 
                                 <td>Motivo:<br/><textarea name="motivo" rows="1"  style="height: 100px; width: 150px">
                                     </textarea>
                                     
                                 </td>
                                
                             </tr>
                            
                         </tbody>
                     </table>
                     <input type="hidden" name="guardarEscusa" value="" />
                     <input type="submit" value="Guardar" />
                 </form>   
             </div>
                                     
             </div>
    </body>
</html>
