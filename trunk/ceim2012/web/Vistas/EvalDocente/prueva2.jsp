<%-- 
    Document   : prueva2
    Created on : 1/09/2011, 07:52:33 PM
    Author     : Dario A
--%>


<%@page import="Manejadores.ControlDocente"%>
<%@page import="Conceptos.Docente"%>
<%@page import="java.util.List"%>
<%@page import="java.io.PrintWriter"%>
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
            
            <%--TABLA DINAMICA DE PROFESORES--%>
             <% 
                List<Docente> d=ControlDocente.listarDocente();
                out.print("<table border='1'>");
                out.print("<thead><tr><th>Nombre Profesor</th><th>N°</th></tr></thead>");
                for(int i=0; i<d.size(); i++)
                {
                     out.print("<tbody>");
                     out.print("<tr><td>"+d.get(i).getNombre()+" "+d.get(i).getApellido()+"</td><td>"+((int)i+1)+"</td></tr>");
                     out.print("</tbody>");
                }
                out.print("</table>");
                
            %>
            <br/><br/>
           
            Elije calificacion de 1 - 5<br/>
            
            <%--TABLA DINAMICA DE EVALUACION PROFESORES--%>
            <%
                out.print("<table border='1'>");
                out.print("<thead>");
                out.print("<tr>");
                out.print("<th>Preguntas</th>");
                for(int i=0; i<d.size(); i++)
                {
                     out.print("<th>"+((int)i+1)+"</th>");
                    
                 }
                out.print("</tr");
                out.print("/<thead>");
                out.print("<tbody>");
                out.print("<thead>");
                out.print("<tr>");
                out.print("<td>1.Puntualidad</td>");
                for(int i=0; i<d.size(); i++)
                {
                     out.print("<th><select name='txxt1'>"
                                +"<option>0</option>"
                                +"<option>1</option>"
                                +"<option>2</option>"
                                +"<option>3</option>"
                                +"<option>4</option>"
                                +"<option>5</option>"
                                + "</select></th>");
                }
                out.print("<tr>");
                out.print("<td>2.Dominio de la disciplina que enseña:</td>");
                for(int i=0; i<d.size(); i++)
                {
                     out.print("<th><select name='txxt2'>"
                                +"<option>0</option>"
                                +"<option>1</option>"
                                +"<option>2</option>"
                                +"<option>3</option>"
                                +"<option>4</option>"
                                +"<option>5</option>"
                                + "</select></th>");
                }
                out.print("</tr");
                out.print("/<thead>");
                out.print("<tbody>");
           %>
           
           <br/>
           <%out.print("*****************************************************************************");%>
           <br/>
           <ol type="1">
                 <li>Puntualidad:
                     <% 
                        out.print("<select name='nombre'>");
                        for (int i=0; i<=5; i++)
                        {out.print("<option>"+i+"</option>");}
                        out.print("</select>");    
                      %><br/>
                 <li>Dominio de la disciplina que enseña:
                      <% 
                        out.print("<select name='nombre'>");
                        for (int i=0; i<=5; i++)
                        {out.print("<option>"+i+"</option>");}
                        out.print("</select>");    
                      %><br/>
                 <li>Habilidad para presentar el contenido<br/>
                    de la clase en forma clara, lógica e imaginativa.<select name="txxt3">
                        <option>0</option>
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                        <option>4</option>
                        <option>5</option>
                    </select><br/>
                <li>Habilidad para desarrollar métodos y estrategias<br/>
                   adecuados para buen desorrollo de la clase<select name="txt4">
                       <option>0</option>
                       <option>1</option>
                       <option>2</option>
                       <option>3</option>
                       <option>4</option>
                       <option>5</option>
                   </select><br/><br/>
           </ol> 
            
           <input type="submit" value="enviar" /><br/><br/>
           
        </form>
                  
                      
        <a href="cerrarSesion.jsp">Cerrar Sesion</a>
        
    </body>
</html>
