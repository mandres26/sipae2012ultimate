<%-- 
    Document   : listado
    Created on : 22-oct-2011, 13:48:50
    Author     : dell
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="com.controladores.ControlEstudainte"%>
<%@page import="com.modelo.*"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div id="lista">
         <table >
           <thead>
               <tr>
                   <th>Identificacion</th>
                   <th>Nombre</th>
                   <th>Apellido</th>
                   <th>Madre</th>
                   <th>Padre</th>
                   <th>Direccion</th>
                   <th>Nro de Hermanos</th>
                   <th>Fecha Inscripcion</th>
                   <th>Estado de matricula</th>
                  
               </tr>
           </thead>
            <tbody>
       <%
       
         List<Estudiante> listaInscritos=ControlEstudainte.listarCliente(request.getParameter("id"));
         boolean color=true;
         for(int i=0; i<listaInscritos.size(); i++){
            
             Estudiante e=listaInscritos.get(i);
             
       %>
               <tr bgcolor="<%=(color)?"#65d4ed":"white"%>">
                   <td><%=e.getIdentificacion()%></td>
                   <td><%=e.getNombre() %></td>
                   <td><%=e.getApellido() %></td>
                   <td><%=e.getNombre_madre() %></td>
                   <td><%=e.getNombre_padre() %></td>
                   <td><%=e.getBarrio()+" "+e.getResto_direccion()%></td>
                   <td><%=e.getNumero_hermanos() %></td>
                   <td><%=e.getFecha().toString()%></td>
                   <td><%=e.isEstado()?"Matriculado":"No se ha matriculado" %></td>
               </tr> 
       <%
       color=!color;
  }       
%>
 </tbody>
       </table></div>
    </body>
</html>
