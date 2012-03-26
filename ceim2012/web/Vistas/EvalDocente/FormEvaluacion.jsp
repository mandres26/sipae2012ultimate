<%-- 
    Document   : FormEvaluacion
    Created on : 3/09/2011, 05:27:23 PM
    Author     : Dario A
--%>

<%@page import="Manejadores.ControlPuntoEval"%>
<%@page import="Conceptos.PuntoEval"%>
<%@page import="Manejadores.ControlDocente"%>
<%@page import="Conceptos.Docente"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>EVALUACION DOCENTE</h1>
        <form action="RegistroEvaluacion.jsp" method="POST">
            
          <%
                List<Docente> d=ControlDocente.listarDocente();
                List<PuntoEval> p=ControlPuntoEval.listarPuntoEval();

           
                out.print("<table border='1'>");
                out.print("<thead><tr><th>Nombre Profesor</th><th>N°</th></tr></thead>");
                for(int i=0; i<d.size(); i++)
                {
                     out.print("<tbody>");
                     out.print("<tr><td>"+d.get(i).getNombre()+" "+d.get(i).getApellido()+"</td><td>"+((int)i+1)+"</td></tr>");
                     out.print("</tbody>");
                }
                out.print("</table>");
                
           out.print("<br/>");
          
           out.print("<table border='1'>");
           //ENCABEZADO DE LA TABLA
           out.print("<thead>");
           out.print("<tr>");
           out.print("<th>Puntos a Evaluar</th>");
           //NUM PROFESORES
           for(int i=0; i<d.size(); i++)
                out.print("<th>Prof. "+((int)i+1)+"</th>");
           out.print("</tr");
           out.print("/<thead>");
           //CUERPO DE LA TABLA
           out.print("<tbody>");
                      
           for(int i=0; i<p.size(); i++)
           {
               out.print("<tr><td width='300'>"+p.get(i).getPeval()+"</td>");

               for(int e=0; e<d.size(); e++)
               {
                             out.print("<td align='center'><select name='preg"+i+e+"'>"
                                        +"<option> </option>"
                                        +"<option>5</option>"
                                        +"<option>4</option>"
                                        +"<option>3</option>"
                                        +"<option>2</option>"
                                        +"<option>1</option>"
                                        +"<option>0</option>"
                                        + "</select></td>");
               }
           
           }
                           
           out.print("</tr");
           out.print("</tbody>");
           out.print("</table>");
           %>           
           
           <%String n=String.valueOf(d.size());%>
           <%String n2=String.valueOf(p.size());%>
           <%session.setAttribute("n",n);%>
           <%session.setAttribute("n2",n2);%>

           <table border="1"></table><br/>
           <input type="submit" value="enviar" />
           
        </form>
      <br/><a href="cerrarSesion.jsp">Regresar</a>
    </body>
</html>
