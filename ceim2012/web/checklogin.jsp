

<%@page import="Conceptos.Administrador"%>
<%@page import="ManejadoreaOtros.ControladorAdministrador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page session="true" %>

<%
String username = request.getParameter("usuario");
String pass=request.getParameter("clave");
Administrador admin=ControladorAdministrador.consultarAdmin(username);
String usuario=admin.getVar_username();
String clave = admin.getVar_pass();
if (request.getParameter("usuario") != null)
username = request.getParameter("usuario");

if (request.getParameter("clave") != null)
pass = request.getParameter("clave");

if (username.equals(usuario) &&
pass.equals(clave)) {
HttpSession sesionOk = request.getSession();
sesionOk.setAttribute("username",usuario);

%>
<%
response.sendRedirect("GestionAdministrador.jsp");
%>
<%
} else {
%>
<%
response.sendRedirect("Administrador.jsp");
%>
<jsp:forward page="Administrador.jsp" >
 <jsp:param  name="error" value="Usuario y/o Contraseña son Incorrectos.Vuelva Intentarlo"/>
</jsp:forward>
<%
}
%>



