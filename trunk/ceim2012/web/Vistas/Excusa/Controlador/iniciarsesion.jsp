<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.SQLException,com.modelo.Docente,com.modelo.Acudiente,com.controlador.ControladorDocente,com.controlador.ControladorAcudiente" session="true"%>
<%
    String user = request.getParameter("user").trim();
    String pass = request.getParameter("pass").trim();

    if (!user.isEmpty() && !pass.isEmpty()) {
        try {
            Acudiente acudiente = ControladorAcudiente.isUsurioPass(user, pass);
            Docente docente = ControladorDocente.isUsurioPass(user, pass);
            if (acudiente != null) {
                out.print("<script type='text/javascript'>$('#content').load('Acudiente/menuacudiente.jsp');</script>");
                session.setAttribute("usuario", acudiente);
            } else if (docente != null) {
                out.print("<script type='text/javascript'>$('#content').load('Docente/menudocente.jsp');</script>");
                session.setAttribute("usuario", docente);
            } else {
                out.print("<script type='text/javascript'>alert('Usuario no existe.');$('#user').val('');$('#pass').val('');</script>");
            }
        } catch (SQLException ex) {
            out.println("<font style='font-size: 20px; color: red'> <strong>ERROR... INICIAR SESION " + ex.getMessage() + "</strong> </font>");
            out.print("<center><a href='index.jsp'>Ir inicio</a></center>");
        }
    } else {
        out.print("<script type='text/javascript'>alert('Faltan Datos.');</script>");
    }

%>