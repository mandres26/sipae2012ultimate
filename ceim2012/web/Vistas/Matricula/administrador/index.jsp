<%-- 
    Document   : index
    Created on : 2/11/2011, 10:41:59 PM
    Author     : idadyou
--%>

<%@page import="com.controladores.ControlEstudainte"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="com.controladores.ControladorCurso"%>
<%@page import="java.util.List"%>
<%@page import="com.modelo.Asignatura"%>
<%@page import="com.modelo.Curso"%>
<%@page import="com.modelo.Estudiante"%>
<%@page import="com.modelo.Docente"%>
<%@page import="com.controladores.Controlador"%>

<%@page import="com.controladores.ControladorAdministrador"%>
<%@page import="com.res.SessionUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         
         <% 
            //session.......
             String info="";
             final String NOMBRE_USUARIO_SESSION="admin";
             String styleLogin="display:block"; 
             String styleAdmin="display:none";                
             SessionUsuario sessionUsuario=(SessionUsuario)session.getAttribute(NOMBRE_USUARIO_SESSION);
             String usuario=request.getParameter("user");
             String password=request.getParameter("pass");
             if(sessionUsuario!=null){
                   styleLogin="display:none";
                 styleAdmin="display:block";
                    out.print("Identificado como "+ sessionUsuario.getUsuario()+"(<a href=\"http://localhost:8080/VistaThis/cerrarSession.jsp\">salir</a>)"); 
                     
               }else{
                 sessionUsuario = new SessionUsuario(usuario, password, null); 
                 boolean exist=ControladorAdministrador.existeAdministrador(sessionUsuario);
                     if(exist){
                         session.setAttribute(NOMBRE_USUARIO_SESSION, sessionUsuario);
                         out.print("Identificado como "+ sessionUsuario.getUsuario()+"(<a href=\"http://localhost:8080/VistaThis/cerrarSession.jsp\">salir</a>)"); 
                     styleLogin="display:none";
                     styleAdmin="display:block";
                    }
               }
       %>
       
       <%
           //registrar el docente
             String guardarDocente=request.getParameter("guardarDocente");   
             if(guardarDocente!=null){
                 
                 String[] asignaturaDocente=request.getParameterValues("asignaturaDocente");
                 
                 Controlador<Docente> controlador=new Controlador();//creamos el controlador
                 String map[]={request.getParameter("id"), request.getParameter("codigo")};
                 if(!controlador.existeCliente(map)){
                    Docente docente=new Docente();
                     docente.setVar_id_docente(request.getParameter("id"));
                    docente.setVar_codigo_docente(request.getParameter("codigo"));
                     docente.setVar_nombre_docente(request.getParameter("nombre"));
                      docente.setVar_apellido_docente(request.getParameter("apellido"));
                       docente.setSexo((request.getParameter("sexo").equals("1")?true:false));
                        docente.setVar_direccion_docente(request.getParameter("direccion"));
                        docente.setUsuario(request.getParameter("usuarioDocente"));
                        docente.setPass(request.getParameter("passwordDocente"));
                        //asiignaturas
                        
                        docente.setAsignaturasNombres(asignaturaDocente);
                        
                        controlador.registrarCliente(docente);
                        info="Docente identificado como "+docente.getVar_nombre_docente()+" ha sido guardado exitosamente!";
                     
                 }
                
             }
       
        %>
        
        <%
           //registrar el curso
             String guardarCurso=request.getParameter("guardarCurso");   
             if(guardarCurso!=null){
                 Controlador<Curso> controlador=new Controlador();//creamos el controlador
                 String map[]={request.getParameter("codigo"), request.getParameter("nombre")};
                 if(!controlador.existeCliente(map)){
                   Curso curso=new Curso();
                   curso.setCodigo(request.getParameter("codigo"));
                   curso.setNombre(request.getParameter("nombre"));
                   controlador.registrarCliente(curso);
                        info="curso identificado como "+curso.getNombre()+" ha sido guardado exitosamente!";
                     
                 }
                
             }
       
        %>      
        <%

        
           //registrar el Asignatura
             String guardarAsignatura=request.getParameter("guardarAsignatura");   
             if(guardarAsignatura!=null){
                 Controlador<Asignatura> controlador=new Controlador();//creamos el controlador
                 String map[]={request.getParameter("codigo"), request.getParameter("nombre")};
                 if(!controlador.existeCliente(map)){
                   Asignatura asignatura=new Asignatura();
                                  asignatura.setVar_codigo_asignatura(request.getParameter("codigo"));
                   asignatura.setVar_combre_asignatura(request.getParameter("nombre"));
                   controlador.registrarCliente(asignatura);
                        info="Asignatura identificado como "+asignatura.getVar_combre_asignatura()+" ha sido guardado exitosamente!";
                     
                 }
                
             }
       
        %>   
         <%
             //registrar el Asignatura
             String guardarInscritos=request.getParameter("guardarInscritos"); 
                             
             if(guardarInscritos!=null){
                 
                 String[] map=request.getParameterValues("inscripcion");
                 if(map!=null){
                     for(int i=0;i<map.length;i++){
                         ControlEstudainte.inscribirEstudante(map[i]);
                         
                     }
                    info="Estudiantes inscritos exitosamente";
                 }
              }
       
        %> 
        <%

        
           //registrar el Asignatura
             String guardarMatriculados=request.getParameter("guardarMatriculados"); 
                             
             if(guardarMatriculados!=null){
                 
                 String[] map=request.getParameterValues("matricula");
                 if(map!=null){
                     for(int i=0;i<map.length;i++){
                         ControlEstudainte.matricularEstudante(map[i]);
                         
                     }
                    info="Estudiantes matriculados exitosamente";
                 }
                     
                
             }
       
        %> 

         
         <link href="http://localhost:8080/VistaThis/style.css" rel="stylesheet" type="text/css"/>
         <script src="js/Opciones.js" language="JavaScript"></script>
        <title>Administrador Colegio Integral Moderno</title>
    </head>
    <body>
        <br/><br/><br/><br/>
        <div id="content2" > 
            
            <!--Este es de la parte del login-->
            
            <div id="login" style="<%=styleLogin%>">
                <form action="http://localhost:8080/VistaThis/administrador/" method="POST"> 
                    ADMINISTRADOR<br/><br/>
                    Usuario:<br/><input type="text" name="user" value="" /><br/>
                    Contraseña:<br/><input type="password" name="pass" value="" /><br/>
                    <input type="submit" value="Ingresar" />
                </form> 
           </div><!--este es el fin del login.-->
           
           <!--ESTA ES LA PARTE CUANDO EL ADMINISTRADOR SE IDENTIFICA Y LE MUESTRA LAS OPCIONES-->
           <div id="admin" style="<%=styleAdmin%>">
               <a href="#" onclick="docente();">Agregar Docente</a>&nbsp;
               <a href="#" onclick="asignatura();">Agregar Asignatura</a>&nbsp;
               <a href="#" onclick="curso();">Agregar Curso</a>&nbsp;
               <a href="#" onclick="curso();">Agregar Horario</a>
               <a href="#" onclick="inscripcion();sendRequest('GET','listadoInscripcion.jsp');">Inscribir Estudiante</a>
               
               <a href="#" onclick="matricular();sendRequest2('GET','listadoMatricula.jsp')">Matricular Estudiante</a>
               <a href="#" onclick="escuela()">Escuela abierta para padres</a>
               <br/><h1 style="font-size: 20px"><%=info%></h1>
               
           </div>
           <!--.. FIN ..ESTA ES LA PARTE CUANDO EL ADMINISTRADOR SE IDENTIFICA Y LE MUESTRA LAS OPCIONES-->
           
           <!-- divicion de docente-->
           <div id="docente"  style="display:none">
               <form name="formDocente" action="http://localhost:8080/VistaThis/administrador/" method="post">
            
            <table >
                <thead>
                 <tbody>
                    <tr>
                        <td>Codigo:<br/><input type="text" name="codigo" value="" /><br/></td>
                        <td>Identificacion:<br/><input type="text" name="id" value="" /><br/></td>
                        <td>Nombre:<br/><input type="text" name="nombre" value="" /><br/></td>
                    </tr>
                    <tr>
                        <td></td><td></td><td></td><!--Espacio-->
                    </tr>
                    <tr>
                        <td>Apellido:<br/><input type="text" name="apellido" value="" /><br/></td>
                        <td>Sexo:<br/><select name="sexo" style="width: 155px">
                                <option value="1">Maculino</option>
                                <option value="0">Femenino</option>
                            </select><br/></td>
                        <td>Direccion:<br/><input type="text" name="direccion" value="" /></td>
                    </tr>
                    <tr>
                        <td>Usuario:<br/><input type="text" name="usuarioDocente" value="" /><br/></td>
                        <td>Contraseña:<br/><input type="password" name="passwordDocente" value="" /><br/></td>
                        
                    </tr>
                </tbody>
            </table><br/><br/>
            <!--division de asignaturas-->
            
            <div id="contenedorAsignaturas">
                <fieldset style="width: 300px">
                <div id="divisionAsignaturas">
                    
                <div id="asignatura1">
                    <div id="campos" >
                       
                    <% 
                            
                            Controlador<Asignatura> control=new Controlador();
                            List<Asignatura> listaCurso =control.listarCliente();
                            for(int i=0; i<listaCurso.size();i++){
                               %>
                               <input type="hidden" id="t<%=listaCurso.get(i).getVar_codigo_asignatura()%>" value="<%=listaCurso.get(i).getVar_combre_asignatura() %>" />
                            <%}%>
                            </div>
                    
            <select name="asignatura" id="asignaturas" style="width: 145px;" onchange="cargarAsignaturaNueva('asignatura1');">
                           <option>-Asignaturas-</option> 
                           <% 
                            
                            for(int i=0; i<listaCurso.size();i++){
                               %>
                               <option value="<%=listaCurso.get(i).getVar_codigo_asignatura() %>" ><%=listaCurso.get(i).getVar_combre_asignatura() %></option>
                            <%}%>
                        </select>
            </div></div></fieldset></div>
                  <br/>
                   
                   <input type="hidden" name="guardarDocente" value="ok" />  
                   <input type="submit" value="Guardar" />   
        </form>
           </div>
           
            <!-- divicion de curso-->
            <div id="curso" style="display:none">
               <form action="http://localhost:8080/VistaThis/administrador/" method="post">
            
            <table >
                <thead>
                
                    <tr>
                        <td colspan="2"><center>Curso</center></td>
                    </tr>
                </thead>
                 <tbody>
                    <tr>
                        <td>Codigo:<br/><input type="text" name="codigo" value="" /><br/></td>
                        <td>Nombre:<br/><input type="text" name="nombre" value="" /><br/></td>
                    </tr>
                    
                </tbody>
            </table>
                   <input type="hidden" name="guardarCurso" value="ok" />  
                   <input type="submit" value="Guardar" />   
        </form> 
                
            </div>
            
            <!-- divicion de asignatura-->
            <div id="asignatura" style="display:none">
               <form action="http://localhost:8080/VistaThis/administrador/" method="post">
            
            <table >
                <thead>
               
                    <tr>
                        <td colspan="2"><center>Asignatura</center></td>
                    </tr>
                </thead>
                 <tbody>
                    <tr>
                        <td>Codigo:<br/><input type="text" name="codigo" value="" /><br/></td>
                        <td>Nombre:<br/><input type="text" name="nombre" value="" /><br/></td>
                    </tr>
                    
                </tbody>
            </table>
                   <input type="hidden" name="guardarAsignatura" value="ok" />  
                   <input type="submit" value="Guardar" />   
        </form> 
                
            </div>
           
            
           <!--  division de inscripcion-->
          
           <div id="inscripcion" style="display:none">
                <form action="http://localhost:8080/VistaThis/administrador/" method="post">
            
            <table >
                <thead>
              
                    <tr>
                        <td colspan="2"><center>Inscripcion</center></td>
                    </tr>
                </thead>
                
            </table>
                   <div id="listadoIncripcion"></div>
                   <input type="hidden" name="guardarInscritos" value="ok" />  
                   <input type="submit" value="Guardar" />   
        
                 </form> 
            </div>
           
           
            <!--  division de matricular a los estudiantes-->
          
           <div id="matricula" style="display:none">
                <form action="http://localhost:8080/VistaThis/administrador/" method="post">
            
            <table >
                <thead>
         
                    <tr>
                        <td colspan="2"><center>Matricular</center></td>
                    </tr>
                </thead>
                
            </table>
                   <div id="listadoEstudiantes"></div>
                   <input type="hidden" name="guardarMatriculados" value="ok" />  
                   <input type="submit" value="Guardar" />   
        
                 </form> 
            </div>
            
            <!--  division de escuela abierta para padres-->
          
           <div id="escuela" style="display:none">
                <form action="http://localhost:8080/VistaThis/administrador/" method="post">
            
            <table >
                <thead>
             
                    <tr>
                        <td colspan="2"><center>Escuela abierta para padres</center></td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>fecha<br/><input type="text" name="codigo" value="" /><br/></td>
                        <td>Nombre:<br/><input type="text" name="nombre" value="" /><br/></td>
                    </tr>
                    <tr>
                        <td colspan="2">Descripcion<br/><textarea name="motivo" rows="1"  style="height: 100px; width: 320px">
                                     </textarea><br/></td>
                       
                    </tr>
                    
                </tbody>
            </table>
                    <input type="submit" value="Enviar" />
                 </form> 
            </div>
              
           
        </div>
     </body>
</html>
