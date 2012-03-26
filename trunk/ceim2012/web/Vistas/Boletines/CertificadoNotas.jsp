<%-- 
    Document   : CertificadoNotas
    Created on : 22/11/2011, 08:22:48 AM
    Author     : Usuario
--%>
<%@page import="Manejadores.ControlActividades"%>
<%@page import="Manejadores.ControladorLogro"%>
<%@page import="Gestion.Logros"%>
<%@page import="java.util.Date"%>
<%@page import="Gestion.Curso"%>
<%@page import="Manejadores.ControlCurso"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="Gestion.Asignatura"%>
<%@page import="Manejadores.ControlAsignatura"%>
<%@page import="personas.Estudiante"%>
<%@page import="Manejadores.ControlEstudiante"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <link rel="stylesheet" href="css/style_prin.css" type="text/css" />
         <link rel="shortcut icon" href="Imagenes/icono.png.png">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" href="css/style_paginterna.css">
         </head>
    <body>
  <div id="inicio">
      <%
int codest=Integer.parseInt(request.getParameter("listest"));
String tipo=request.getParameter("seltipo");
//int anoest=Integer.parseInt(request.getParameter("anoest"));
Estudiante estudiante=ControlEstudiante.consultarEstudiante(codest);
String nomest=estudiante.getNombres();
int codest2=estudiante.getCodigo();
String fecha =""+ new Date();
int codcurso=Integer.parseInt(request.getParameter("curso"));//cambiar a string y capturar la informacion de boletin estudiante..sesion no se
Curso cur=ControlCurso.consultarCurso(codcurso);
String nomcur=cur.getNombre();
%>

<input id="button" type="submit" value="Imprimir" name="botimp" />
<a href="" target="_blank"><input id="button"type="submit" value="Exportar como PDF" name="limfor" /></a>
<br><br>ESTUDIANTE:<input type="text" name="nomest" value="<%=nomest%>" disabled="disabled"/>&nbsp;&nbsp;&nbsp;CODIGO:<input type="text" name="codest" value="<%=codest2%>" disabled="disabled"/>
&nbsp;&nbsp;&nbsp;FECHA:<input type="text" name="codest" value="<%=fecha%>" disabled="disabled"/>&nbsp;&nbsp;&nbsp;CURSO:<input type="text" name="nomest" value="<%=nomcur%>" disabled="disabled"/><br>
 <br>
 <br>


<table border="1" width="630" height="400">
    <thead>

        <tr>
            <th>ASIGNATURA</th>
            <th>H/S</th>
            <th>INS</th>
            <th>Valoracion</th>
            <th>DESEMPEÑO</th>
        </tr>
    </thead>
    <tbody>
        <%
 List <Asignatura> asignaturas = ControlAsignatura.listarAsignatura(codcurso);
 Iterator it=asignaturas.iterator();
 
 List <Double> defs = ControlActividades.notaDefActividad(codest);
  Iterator itrdef = defs.iterator();
  
         while(it.hasNext()){
         Asignatura asignat =(Asignatura)it.next();


%>
        <tr bgcolor="#65d4ed">
            <td><%=asignat.getNombre()%></td>
            <td><%=asignat.getIntHorario()%></td>
            <td>2</td>
            <td>
            <%
            Double def = 0.0;
                 if (itrdef.hasNext()!=false)
                 def = (Double) itrdef.next();
             %>
            <%=def %>
            </td>
            <%
            String des="";
           if(def==0 && def>59){
                des="bhb";
            
            %>
            <td><%=des%></td>
            <%}
            %>
        </tr>

       <%
          }
       %>
    </tbody>
</table>
 <br>
  </div>
    </body>
</html>
