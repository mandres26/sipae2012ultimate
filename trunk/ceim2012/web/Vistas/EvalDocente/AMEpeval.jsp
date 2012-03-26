<%-- 
    Document   : AMEpeval
    Created on : 17/09/2011, 11:16:03 PM
    Author     : Dario A
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="Manejadores.ControlPuntoEval"%>
<%@page import="Conceptos.PuntoEval"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        String id=request.getParameter("cod");
        PuntoEval pe=new PuntoEval();
        int codigo=0;
        String actualizar;
        if (request.getParameter("mod")!=null)
        {
            actualizar=request.getParameter("mod");
            pe.setCodigo(Integer.parseInt(id));
            pe.setPeval(actualizar);
            ControlPuntoEval.ActualizarPuntoEval(pe, id);
        }
        if (request.getParameter("eli")!=null)
            ControlPuntoEval.EliminarPuntoEval(id);
        if (request.getParameter("agr")!=null)
        {
            pe.setCodigo(codigo+ControlPuntoEval.ultimoPuntoEval());
            pe.setPeval(request.getParameter("agregarp"));
            out.print(request.getParameter("agregarp"));
            ControlPuntoEval.registrarPuntoEval(pe);
        }
        
            
        %>
        
        <jsp:forward page="AdminCriterios.jsp" />

        
    </body>
</html>
