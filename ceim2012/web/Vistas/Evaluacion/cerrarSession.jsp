<%-- 
    Document   : cerra
    Created on : 27-oct-2011, 10:20:16
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%   
           request.getSession().invalidate();
       %>
       
           //<jsp:forward page="index.jsp"></jsp:forward>
          
    </body>
</html>
