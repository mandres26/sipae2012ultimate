<%-- 
    Document   : inscripcion
    Created on : 11-sep-2011, 17:16:46
    Author     : dell
--%>


<%@page import="com.modelo.Padres"%>
<%@page import="com.modelo.Curso"%>
<%@page import="com.controladores.ControladorCurso"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="com.res.MotorPdf"%>
<%@page import="com.res.SessionUsuario"%>
<%@page import="com.modelo.Acudiente"%>
<%@page import="com.controladores.ControladorAcudiente"%>
<%@page import="com.controladores.ControlEstudainte"%>
<%@page import="com.modelo.Estudiante"%>
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
               
                 est.setCodigo(request.getParameter("id"));
                 
                  if(!ControlEstudainte.existeCliente(id)){
                 try{  
                Padres p=new Padres(); 
                   //estudinate..                                    
                 est.setIdentificacion(request.getParameter("id"));
                 est.setNombre(request.getParameter("nombre"));
                 est.setApellido(request.getParameter("apellido"));
                // est.setNombre_madre(request.getParameter("madre"));
                 est.setSexo((request.getParameter("sexo").equals("1"))?true:false);
                 est.setCursoTemporal(request.getParameter("curso"));
                 //est.setNombre_padre(request.getParameter("padre"));
                 est.setResto_direccion(request.getParameter("direccion"));
                 est.setBarrio(request.getParameter("barrio"));
                 est.setNumero_hermanos(request.getParameter("hermanos"));
                  est.setId_acudiente(request.getParameter("id_acudiente"));
                  //padres
                  //mama
                   p.setVar_id_madre(request.getParameter("id_madre"));
                   p.setVar_nombre_mama(request.getParameter("nom_madre"));
                   p.setVar_apellido_mama(request.getParameter("ape_madre"));
                  //papa
                   p.setVar_id_padre(request.getParameter("id_padre"));
                   p.setVar_nombre_papa(request.getParameter("nom_padre"));
                   p.setVar_apellido_papa(request.getParameter("ape_padre")); 
                   
                   //le adicionamos los padres al estudiante.
                   est.setPadres(p);
                   
                  //para registrar los estudiantes...
                   ControlEstudainte.registrarCliente(est, request.getParameter("email"));
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
                     est=ControlEstudainte.consultarCliente(id);//se consulta el estudiante
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
                 est.setCodigo(request.getParameter("id"));
                 
                  if(ControlEstudainte.existeCliente(id)){
                     
                      est.setIdentificacion(request.getParameter("id"));
                 est.setNombre(request.getParameter("nombre"));
                 est.setApellido(request.getParameter("apellido"));
             //    est.setNombre_madre(request.getParameter("madre"));
              //   est.setNombre_padre(request.getParameter("padre"));
                 est.setResto_direccion(request.getParameter("direccion"));
                 est.setBarrio(request.getParameter("barrio"));
                 est.setNumero_hermanos(request.getParameter("hermanos"));
      
                  est.setId_acudiente(request.getParameter("nombre"));
                   ControlEstudainte.ActualizarCliente(est, id);
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
        <a  href="#" onclick="sendRequest('GET','res/listadoprueba.jsp?id=<%=acudiente.getVar_id_acudiente()%>');llamadaMatricula();">-Estudiantes-</a>
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
                    <td>Identificacion:<br/><input type="text" name="id" id="id" value="<%=(String.valueOf(est.getIdentificacion()).equals("0"))?"":String.valueOf(est.getIdentificacion()) %>"   
                                                   onkeypress="return validacion(event, 'id');" />&nbsp;&nbsp;</td>
                    <td>Nombre:<br/><input type="text" name="nombre" id="nom" value="<%=est.getNombre() %>" />&nbsp;&nbsp;</td>
                    <td>Apellido<br/><input type="text" name="apellido" value="<%=est.getApellido() %>" />&nbsp;&nbsp;</td>
            
                </tr>
               <tr>
                    <td><br/></td>
                    <td><br/></td>
                    <td><br/></td>
                </tr>
                <tr>
                    <td>Sexo:<br/><select name="sexo" style="width: 145px;" title="<%=((est.isSexo())?"Masculino":"Femenino") %>">
                            <option value="1">Masculino</option>
                            <option value="0">Femenino</option>
                        </select>&nbsp;&nbsp;</td>
                    <td>Barrio:<br/><input type="text" name="barrio" value="<%=est.getBarrio() %>" />&nbsp;&nbsp;</td>
                    <td>Resto de direccion<br/><input type="text" name="direccion" value="<%=est.getResto_direccion() %>" />&nbsp;&nbsp;</td>
                    
                </tr>
                <tr>
                    <td><br/></td>
                    <td><br/></td>
                    <td><br/></td>
                </tr>
                <tr>
                    <td>Curso<br/><select name="curso" style="width: 145px;">
                            <% List<Curso> listaCurso =ControladorCurso.listarCliente();
                            for(int i=0; i<listaCurso.size();i++){
                               %>
                               <option value="<%=listaCurso.get(i).getCodigo()%>" ><%=listaCurso.get(i).getNombre()%></option>
                            <%}%>
                        </select></td>
                    <td>Numero Hermanos<br/><input type="text" id="hermanos" name="hermanos" value="<%=(String.valueOf(est.getNumero_hermanos()).equals("0"))?"":String.valueOf(est.getNumero_hermanos()) %>" onkeypress="return validacion(event, 'hermanos');"/>&nbsp;&nbsp;</td>
                </tr>
              
                
                
            </tbody>
        </table>
                <br/>
                 </div></div></div></div></div></div></div></div>
                <br/>
                <!--padres-->
                <div class="b"><div class="bl"><div class="br"><div class="l"><div class="r"><div class="t"><div class="tl"><div class="tr">
                                        
                                        <center><b>Padres</b></center><br/>
                                        <table >
                                           <tbody>
                                                <tr>
                                                    <td>Identificacion madre:<br/><input type="text" name="id_madre" id="id_madre" value="<%=est.getPadres().getVar_id_madre()%>" onkeypress="return validacion(event, 'id_madre');"/>&nbsp;&nbsp;</td>
                                                    <td>Nombre madre::<br/><input type="text" name="nom_madre" value="<%=est.getPadres().getVar_nombre_mama()%>" /> &nbsp;&nbsp;</td>
                                                    <td>Apellido madre:<br/><input type="text" name="ape_madre" value="<%=est.getPadres().getVar_apellido_mama()%>" /> </td>
                                                </tr>
                                                <tr>
                                                    <td><br/></td>
                                                    <td><br/></td>
                                                    <td><br/></td>
                                                </tr>
                                                <tr>
                                                    <td>Identificacion padre:<br/><input type="text" name="id_padre" id="id_padre" value="<%=est.getPadres().getVar_id_padre()%> " onkeypress="return validacion(event, 'id_padre');"/> &nbsp;&nbsp;</td>
                                                    <td>Nombe padre:<br/><input type="text" name="nom_padre" value="<%=est.getPadres().getVar_nombre_papa()%>" />&nbsp;&nbsp; </td>
                                                    <td>Apellido madre:<br/><input type="text" name="ape_padre" value="<%=est.getPadres().getVar_apellido_papa()%>" /> </td>
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
         <input type="hidden" name="id_estudiante" value="<%=est.getIdentificacion()%>" />
         <input type="submit" value="Excusar" style="<%=(est.isEstado()?"display:inline-block":"display:none")%>"/>
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
