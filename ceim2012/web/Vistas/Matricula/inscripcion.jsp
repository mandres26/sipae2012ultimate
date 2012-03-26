<%-- 
    Document   : inscripcion
    Created on : 11-sep-2011, 17:16:46
    Author     : dell
--%>



<%@page import="ManejadorHorario.ControlCurso"%>
<%@page import="Conceptos.Curso"%>
<%@page import="ManejadorMatriculas.ControlEstudiante"%>
<%@page import="ManejadorMatriculas.ControladorAcudiente"%>
<%@page import="Utilidades.SessionUsuario"%>
<%@page import="Conceptos.Acudiente"%>
<%@page import="Conceptos.Estudiante"%>
<%@ page import="java.util.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.*" %>
<%@ page import="java.io.*" %>
<%@page errorPage="index.jsp" contentType="text/html" pageEncoding="UTF-8"  session="true"%>

<!DOCTYPE html>
<html>
    
    <head>
      <link rel="stylesheet" href="style.css" type="text/css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>:. Integral Moderno .:</title>
        <script src="pestannasEstudiante.js" language="JavaScript"></script>
        
    </head>
    <body>
        
        <script language="JavaScript">
                          var ajax=document.getElementById("estudianteencontrado");
                          ajax.innerHTML='Este estudiante ya se encuentra';
                 
                      </script>
         <div id="wrap">
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<!--Ideficacion-->
  <%

Estudiante est=new Estudiante(); 
Acudiente acudiente=null;
String correoAcudiente="";
String visivilidad="none"; 
String style="display:none";
String style2="display:inline-block";
String text="";
String pestana="nota_estudiante_no_econtrado";
final String NOMBRE_USUARIO_SESSIO="usuario";
  String filtro=request.getParameter("filtro_busqueda");
  if(filtro==null)
      filtro="vacio";
        
 SessionUsuario sessionUsuario=(SessionUsuario)session.getAttribute(NOMBRE_USUARIO_SESSIO);
  if(sessionUsuario!=null){
   
        //Acudiente a=ControladorAcudiente.isUsurioPass(request.getParameter("user"), request.getParameter("pass"));
       acudiente=ControladorAcudiente.isUsurioPass(sessionUsuario.getUsuario(), sessionUsuario.getPassword()); 
            
      if(acudiente!=null){
           out.print("Identificado como: "+acudiente.getVar_nombre_acudiente().toUpperCase()+" "+acudiente.getVar_apellido_acudiente().toUpperCase()+" <a href=\"cerrarSession.jsp\">Cerrar sesion<a>");
          correoAcudiente=acudiente.getVar_email_acudiente().toString();
          
        
        }else{
          // out.print("se regresa a otra pagina"); 
           //acudiente=new Acudiente();
           
         //eso es para que se valla a la otra pagina
           %>
           //<jsp:forward page="index.jsp"></jsp:forward>
           <%
       
        }
            
      }else{
      //acudiente=new Acudiente();
     acudiente=ControladorAcudiente.isUsurioPass(request.getParameter("user"), request.getParameter("pass"));
     if(acudiente!=null){
           sessionUsuario=new SessionUsuario(request.getParameter("user"), request.getParameter("pass"), String.valueOf(acudiente.getVar_id_acudiente()));
           session.setAttribute(NOMBRE_USUARIO_SESSIO, sessionUsuario);
           
          correoAcudiente=acudiente.getVar_email_acudiente().toString();
          
        
        }
     
     
  %>
           //<jsp:forward page="index.jsp"></jsp:forward>
           <%
      }
          
  
        
        String id=request.getParameter("id");
         String modificar=request.getParameter("modificar");
         if(modificar==null)
              modificar="vacio";
        
         if(modificar.equals("vacio")){
             if(filtro.equals("vacio")){    
             if(id!=null){
               
                 est.setVar_identificacion_estudiante(request.getParameter("id"));
                 
                  if(!ControlEstudiante.existeEstudiante(id))
                      {
                 try{  
                 
                   //estudinate..                                    
                 est.setVar_identificacion_estudiante(request.getParameter("id"));
                 est.setVar_nombres_estudiante(request.getParameter("nombre"));
                 est.setVar_apellidos_estudiante(request.getParameter("apellido"));
                 est.setVar_nombre_madre_estudiante(request.getParameter("madre"));
                 est.setVar_sexo_estudiante(request.getParameter("sexo"));
                // est.setCursoTemporal(request.getParameter("curso"));
                 est.setVar_nombre_padre_estudiante(request.getParameter("padre"));
                 est.setVar_direccion_estudiante(request.getParameter("direccion"));
                  est.setVar_numero_hermanos_estudiante(Integer.parseInt(request.getParameter("hermanos")));
                  est.setAcudiente(ControladorAcudiente.consultarAcudiente(request.getParameter("id_acudiente")));
                  //padres
                  //mama
                  
                   
                  //para registrar los estudiantes...
                   ControlEstudiante.registrarEstudiante(est,request.getParameter("email"));
                   text="El estudiante ha sido guardado exitosamente";
                   visivilidad="block";//para que salga el cuadro..
                   pestana="estudiante_guardado";
                   est=new Estudiante();
                                     }catch(Exception e){
                                         text=e.getMessage();
                   visivilidad="block";//para que salga el cuadro..
                   pestana="nota_estudiante_no_econtrado";
                                     }
                  }else{
                      text="El estudiante ya se encuentra en la base de datos";
                   visivilidad="block";//para que salga el cuadro..
                   pestana="nota_estudiante_no_econtrado";
                          }
                  }
             }else{
                 if(filtro.equals("busqueda")){
                     est=ControlEstudiante.consultarEstudiante(id);//se consulta el estudiante
                     if(est==null){
                         est=new Estudiante();
                        visivilidad="block";
                        text="Estudiante no se encuentra en la base de datos";
                     }else{
                         style="display:inline-block";
                         style2="display:none";
                     }
                 }
             }
               }else{
                  est=new Estudiante();
                 est.setVar_identificacion_estudiante(request.getParameter("id"));
                 
                  if(ControlEstudiante.existeEstudiante(id)){
                     
                      est.setVar_identificacion_estudiante(request.getParameter("id"));
                 est.setVar_nombres_estudiantes(request.getParameter("nombre"));
                 est.setVar_apellidos_estudiante(request.getParameter("apellido"));
                  est.setVar_nombre_madre_estudiante(request.getParameter("madre"));
                  est.setVar_nombre_padre_estudiante(request.getParameter("padre"));
                 est.setVar_direccion_estudiante(request.getParameter("direccion"));
                
                 est.setVar_numero_hermanos_estudiante(Integer.parseInt(request.getParameter("hermanos")));
      
                  est.setAcudiente(ControladorAcudiente.consultarAcudiente(request.getParameter("nombre")));
                   ControlEstudiante.ActualizarEstudiante(est, id);
                   est=new Estudiante();
                   text="El estudiante ha sido modificado exitosamente";
                   visivilidad="block";//para que salga el cuadro..
                   pestana="estudiante_guardado";
                  }else
                      out.print("Este estudiante no encontrado!");
                 
                  
               }
  
  
    
 %>

<div id="header2">
   <!--<br/><br/> <br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <img src="images/pic.jpg"/>-->
   <br/><br/>
<h1>&nbsp;&nbsp;&nbsp;Intitucion Educativa Integral Moderno</h1>
<h2> &nbsp;&nbsp;&nbsp;&nbsp;Estudiantes </h2>
</div>

<div id="menu">
<ul>
<li><a href="index.jsp">Home</a></li>
<li><a href="inscripcion.jsp">Inscribir nuevo Estudiante</a></li>

</ul>
</div>

<div id="content">

<div class="right"> 

    <br/><br/>
    <h2><a href="#" onclick="llamadaInscripcion()">-Inscripcion-</a>
        <!--<a href="res/listado.jsp?id=<%=acudiente.getVar_id_acudiente()%>" onclick="llamadaInscripcion()">-Listar estudiantes-</a>-->
        <a  href="res/listadoprueba.jsp?id=<%=Long.parseLong(acudiente.getVar_id_acudiente())%>" onclick="sendRequest('GET','res/listadoprueba.jsp?id=<%=acudiente.getVar_id_acudiente()%>');llamadaMatricula();">-Estudiantes-</a>
         <!--<a  href="Matricula.jsp" >-Matricula-</a>--></h2>
<div class="articles">
<!-- campos de textos -->
<div id="estudianteencontrado"></div><!--Estudiante-->
<div id="inscripcion" class="pestanaVisible">
     
<form action="inscripcion.jsp" method="POST" id="form1" name="form1">
       <div id="acudiente">
            
        </div>
            
        
        <input type="hidden" id="filtro_busqueda" name="filtro_busqueda"  value="vacio"/>
        <div class="<%=pestana%>" style="display: <%=visivilidad%>" ><%=text%> </div>
        <div class="b"><div class="bl"><div class="br"><div class="l"><div class="r"><div class="t"><div class="tl"><div class="tr">
                                        
                                        <center><b>Estudiante</b></center><br/>
        <table >
            
            <tbody>
                
                <tr>
                    <td>Identificacion:<br/><input type="text" name="id" id="id" value="<%=(String.valueOf(est.getVar_identificacion_estudiante()).equals("0"))?"":String.valueOf(est.getVar_identificacion_estudiante()) %>"   
                                                   onkeypress="return validacion(event, 'id');" />&nbsp;&nbsp;</td>
                    <td>Nombre:<br/><input type="text" name="nombre" id="nom" value="<%=est.getVar_nombres_estudiante() %>" />&nbsp;&nbsp;</td>
                    <td>Apellido<br/><input type="text" name="apellido" value="<%=est.getVar_apellidos_estudiante() %>" />&nbsp;&nbsp;</td>
            
                </tr>
               <tr>
                    <td><br/></td>
                    <td><br/></td>
                    <td><br/></td>
                </tr>
                <tr>
                    <td>Sexo:<br/><select name="sexo" style="width: 145px;" title="<%=((est.getVar_sexo_estudiante() %>">
                            <option value="1">Masculino</option>
                            <option value="0">Femenino</option>
                        </select>&nbsp;&nbsp;</td>
                    <td>Barrio:<br/><input type="text" name="barrio" value="<%=est.getVar_direccion_estudiante() %>" />&nbsp;&nbsp;</td>
                    
                    
                </tr>
                <tr>
                    <td><br/></td>
                    <td><br/></td>
                    <td><br/></td>
                </tr>
                <tr>
                    <td>Curso<br/><select name="curso" style="width: 145px;">
                            <% List<Curso> listaCurso =ControlCurso.listarCurso();
                            for(int i=0; i<listaCurso.size();i++){
                               %>
                               <option value="<%=listaCurso.get(i).getVar_codigo_curso()%>" ><%=listaCurso.get(i).getVar_nombre_curso()%></option>
                            <%}%>
                        </select></td>
                </tr>
                 <tr>
                
                <td>Numero Hermanos<br/><input type="text" id="hermanos" name="hermanos" value="<%=(String.valueOf(est.getVar_numero_hermanos_estudiante()).equals("0"))?"":String.valueOf(est.getVar_numero_hermanos_estudiante()) %>" onkeypress="return validacion(event, 'hermanos');"/>&nbsp;&nbsp;</td>
                <td>Nombre madre::<br/><input type="text" name="nom_madre" value="<%=est.getVar_nombre_madre_estudiante()%>" /> &nbsp;&nbsp;</td>
                <td>Nombe padre:<br/><input type="text" name="nom_padre" value="<%=est.getVar_nombre_padre_estudiante()%>" />&nbsp;&nbsp; </td>
                                                                                     
                 </tr>
            </tbody>
        </table>
                
<br/><!--para ampliar el formulario-->
                </div></div></div></div></div></div></div></div>
        <!--botones-->
        <br/><br/><input type="hidden" name="id_acudiente" value="<%=acudiente.getVar_id_acudiente()%>" />
        <input type="submit" value="Registrar" style="<%=style2%>"/>
        <input type="button" value="Limpiar"  onclick="window.location.href='inscripcion.jsp'"/><input  type="submit" id="modificarBoton"  style="<%=style%>" onclick="actualizarText()" value="Modificar" />
        <input type="hidden" name="email" value="<%=correoAcudiente%>" />
            <input id="modificar" type="hidden" name="modificar"  value="vacio" />
            
        <!--Esto es para la parte de escusas...-->
      
  <!-- fin de la ajax divicion-->
</form>
     <form  action="excusa.jsp">
         <input type="hidden" name="id_estudiante" value="<%=est.getVar_identificacion_estudiante()%>" />
         <input type="submit" value="Excusar" style="<%=(est.getVar_estado()?"display:inline-block":"display:none")%>"/>
        </form>
          </div>
</div>
<br /><br />

<br /><br />

</div>

<div class="articles">

</div>
</div>


<div style="clear: both;"> </div>
 <div id="listado"  style="width:970px; height:500px; overflow: scroll;" class="pestanaInvisible"> <!--division que muestra el listado, de los estudinates--></div>
 
</div>

<div id="bottom"> </div>


<div id="footer">
    Instiduacion Universitaria Tecnologico Comfenalco <br/> V semestre Sistemas
</div>

    </body>
</html>
