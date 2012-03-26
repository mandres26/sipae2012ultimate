<%-- 
    Document   : prueva
    Created on : 3/09/2011, 10:56:19 AM
    Author     : Dario A
--%>

<%@page import="Manejadores.ControlAdmin"%>
<%@page import="Conceptos.Administrador"%>
<%@page import="Conceptos.Docente"%>
<%@page import="java.util.List"%>
<%@page import="Manejadores.ControlDocente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        
            <% 
                out.print("<select name='nombre'>");
                for (int i=0; i<=5; i++)
                   {out.print("<option>"+i+"</option>");}
                out.print("</select>");    
            %>
            
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
            <%--TABLA DINAMICA DE PROFESORES--%>
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
                
                
                out.print("<br/>");
                out.print("<br/>");
           %>
      
           <%
               
            
            int cont=0;
            int p=1;
            int n=3;
            String calificaciones[][]=new String [4][n];
            for(int i=0; i<4; i++)
            {    for(int e=0; e<n; e++)
                 {
                    calificaciones[i][e]="preg"+p+cont;
                    cont=cont+1;
                 }
                 cont=0;
                 p=p+1;
            }                            
            
                for(int i=0; i<4; i++)
                {    out.print("<br/>");
                    for(int e=0; e<n; e++)
                        out.print(calificaciones[i][e]);
                }
            
            out.print("<br/>");
            out.print("<br/>");
            String clave="1245";
            out.print(ControlAdmin.consultarAdministrador("0010").getId());
            
           %>

                  
    </body>
</html>
