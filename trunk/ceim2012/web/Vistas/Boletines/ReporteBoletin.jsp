<%-- 
    Document   : ReporteBoletin
    Created on : 12/11/2011, 04:58:02 PM
    Author     : Usuario
--%>
pack
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
/*importamos las librerías de JasperReports*/

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
      int periodo=Integer.parseInt(request.getParameter("listper"));
   
    /*Parametros para realizar la conexión*/
    Connection con;
    ManejadorBaseDatos mbd=ManejadorBaseDatos.getInstancia();
    mbd.conectar();
    con=mbd.getConexion();
    
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
    /*Establecemos la ruta del reporte*/
     File reportFile = new File(application.getRealPath("Reportes//boletinReport.jasper"));
    
     /*  enviamos parámetros porque nuestro reporte se necesita en del método runReportToPdf*/
 
    Map parameters = new HashMap();
    parameters.put("codEstudiante", codestudiante);
   
    /*Enviamos la ruta del reporte, los parámetros y la conexión(objeto Connection)*/ 

    byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath (),parameters,con);
   
   /*Indicamos que la respuesta va a ser en formato PDF*/
    response.setContentType("application/pdf");
    response.setContentLength(bytes.length);
    ServletOutputStream ouputStream = response.getOutputStream();
    /*Limpiamos y cerramos flujos de salida*/
    ouputStream.write(bytes,0,bytes.length);
    ouputStream.flush();
    ouputStream.close();
    //bytes = new byte[1024];
    
     
     
%>
    </body>
</html>
