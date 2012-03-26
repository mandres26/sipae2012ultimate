<%-- 
    Document   : Reporte
    Created on : 22/11/2011, 08:55:24 AM
    Author     : Usuario
--%>
<%@ page import="net.sf.jasperreports.engine.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="net.sf.jasperreports.view.JasperViewer"%>
<%@page import="java.util.Map"%>
<%@page import="java.sql.Connection"%>
<%@page import="Manejadores.ManejadorBaseDatos"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.DriverManager"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reporte</title>
    </head>
    <body>
      <%
      int codestudiante=Integer.parseInt(request.getParameter("listest"));
      int numtipo=Integer.parseInt(request.getParameter("seltipo"));
   
      
    Connection con;
    ManejadorBaseDatos mbd=ManejadorBaseDatos.getInstancia();
    mbd.conectar();
    con=mbd.getConexion();
    //Connection conn= basedatos.conectar();
    try
    {
    Class.forName("com.mysql.jdbc.Driver"); //se carga el driver
    con = DriverManager.getConnection("jdbc:mysql://localhost/mydb","root","admin");
    out.print("conexion CTM! xD");
    }
    catch (Exception ex)
    {
        ex.printStackTrace();
    }
    if(numtipo==1){
     File reportFile = new File(application.getRealPath("Reportes//certificadoEstudiocorregido.jasper"));
     
    Map parameters = new HashMap();
    parameters.put("codEstudiante", codestudiante);
    byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath (),parameters,con);
    response.setContentType("application/pdf");
    response.setContentLength(bytes.length);
    ServletOutputStream ouputStream = response.getOutputStream();
    ouputStream.write(bytes,0,bytes.length);
    ouputStream.flush();
    ouputStream.close();
    //bytes = new byte[1024];
    
     
     }else{
     if(numtipo==2){
     File reportFile = new File(application.getRealPath("Reportes//pazysalvo.jasper"));

    Map parameters = new HashMap();
    parameters.put("codEstudiante", codestudiante);
    byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath (),parameters,con);
    response.setContentType("application/pdf");
    response.setContentLength(bytes.length);
    ServletOutputStream ouputStream = response.getOutputStream();
    ouputStream.write(bytes,0,bytes.length);
    ouputStream.flush();
    ouputStream.close();
    //bytes = new byte[1024];
    }else{
    File reportFile = new File(application.getRealPath("Reportes//certificadoCurso.jasper"));
     
    Map parameters = new HashMap();
    parameters.put("codEstudiante", codestudiante);
    byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath (),parameters,con);
    response.setContentType("application/pdf");
    response.setContentLength(bytes.length);
    ServletOutputStream ouputStream = response.getOutputStream();
    ouputStream.write(bytes,0,bytes.length);
    ouputStream.flush();
    ouputStream.close();
     }
     }


   
%>

    </body>
</html>
