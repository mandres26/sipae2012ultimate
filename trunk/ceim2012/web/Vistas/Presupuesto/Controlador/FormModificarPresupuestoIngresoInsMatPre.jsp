<%@page import="java.sql.*,java.util.*,controlador.ManejadorInsMatPen,modelo.InsMatPen,modelo.PresupuestoIngreso"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String fecha=request.getParameter("fecha");
    int idimp = Integer.parseInt(request.getParameter("idimp"));
    int idpresupuesto = Integer.parseInt(request.getParameter("idpresupuesto"));
    
    out.println("<font style='font-size: 20px; color: green'> <strong> Fecha: "+fecha+" IDIMP: "+idimp+" idpres: "+idpresupuesto+"</strong> </font>");
    
%>