<%-- 
    Document   : RegistroEvaluacion
    Created on : 1/09/2011, 07:57:57 PM
    Author     : Dario A
--%>

<%@page import="Manejadores.ControlEvaluacion"%>
<%@page import="Manejadores.ControlDocente"%>
<%@page import="Conceptos.Docente"%>
<%@page import="Conceptos.Docente"%>
<%@page import="java.util.List"%>
<%@page import="Conceptos.Evaluacion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1></h1>
        
        <%
            String t=session.getAttribute("n").toString();
            String t2=session.getAttribute("n2").toString();

            int x=0;
            int y=0;
            int n=Integer.parseInt(t);
            int m=Integer.parseInt(t2);

            String calificaciones[][]=new String [m][n];
            for(int i=0; i<m; i++)
            {    for(int e=0; e<n; e++)
                 {
                    calificaciones[i][e]=request.getParameter("preg"+x+y);
                    y=y+1;
                 }
                 y=0;
                 x=x+1;
            }                            
            
               for(int i=0; i<m; i++)
                {    out.print("<br/>");
                    for(int e=0; e<n; e++)
                        out.print(calificaciones[i][e]);
                }
            
           
            out.print("<br/>");out.print("<br/>");
            List<Docente> d=ControlDocente.listarDocente();
            Evaluacion eval=new Evaluacion();
            String c="";
            int codigo=0;
            for(int i=0; i<n; i++)
            {    
                for(int e=0; e<m; e++)
                {    
                    c=c+calificaciones[e][i]+"-";
                    //out.print(m);
                }
                 eval.setCod(codigo+ControlEvaluacion.ultimaEvaluacion());
                 eval.setNombD(d.get(i));
                 eval.setApellD(d.get(i));
                 eval.setRpts(c);
                 ControlEvaluacion.registrarEvaluacion(eval);
                 c="";
            }

                             
                     
            
            
            
            
        %>

        
    </body>
</html>
