<%-- 
    Document   : subirArchivo
    Created on : 24-oct-2011, 16:27:45
    Author     : dell
--%>
<%@ page import="java.util.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.*" %>
<%@ page import="java.io.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
	   	/*FileItemFactory es una interfaz para crear FileItem*/
        FileItemFactory file_factory = new DiskFileItemFactory();
		
		/*ServletFileUpload esta clase convierte los input file a FileItem*/
        ServletFileUpload servlet_up = new ServletFileUpload(file_factory);
		/*sacando los FileItem del ServletFileUpload en una lista */
        List items = servlet_up.parseRequest(request);
		
        for(int i=0;i<items.size();i++){
			/*FileItem representa un archivo en memoria que puede ser pasado al disco duro*/
            FileItem item = (FileItem) items.get(0);
			/*item.isFormField() false=input file; true=text field*/
            if (! item.isFormField()){
				/*cual sera la ruta al archivo en el servidor*/
				File archivo_server = new File("fotos/"+item.getName());
				/*y lo escribimos en el servido*/
				item.write(archivo_server);
                out.print("Nombre --> " + item.getName() );
                out.print("<br> Tipo --> " + item.getContentType());
                out.print("<br> tamaño --> " + (item.getSize()/1240)+ "KB");
				out.print("<br>");
            }
        }
%>
    </body>
</html>
