<%-- 
    Document   : MatricularEstudiante
    Created on : 20/03/2012, 02:31:42 AM
    Author     : Usuario
--%>

<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.sql.SQLException"%>
<%@page import="ManejadorMatriculas.ControlEstudiante"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
    </head>
    <body>
        <%
         String[] map=request.getParameterValues("matricula");
                 if(map!=null){
                     for(int i=0;i<map.length;i++){
                    try {
                        ControlEstudiante.matricularEstudante(map[i]);
                        request.getSession().setAttribute("info", "La matricula ha sido un exito");
                        response.sendRedirect("administradorVIsta.jsp");
                    } catch (SQLException ex) {
                        Logger.getLogger(Class.class.getName()).log(Level.SEVERE, null, ex);
                    } catch (Exception ex) {
                        Logger.getLogger(Class.class.getName()).log(Level.SEVERE, null, ex);
                    }
                         
                     }
                    
                 }
         %>
    </body>
</html>
