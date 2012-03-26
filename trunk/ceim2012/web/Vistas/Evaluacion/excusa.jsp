<%-- 
    Document   : excusa
    Created on : 2/11/2011, 09:42:52 AM
    Author     : idadyou
--%>

<%@page import="java.util.Date"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.controladores.ControladorAcudiente"%>
<%@page import="com.controladores.ControlEstudainte"%>
<%@page import="com.modelo.Estudiante"%>
<%@page import="com.modelo.Acudiente"%>
<%@page import="com.res.SessionUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript">
           <!--
     var calendarWindow = null;
var calendarColors = new Array();
calendarColors['bgColor'] = '#BDC5D0';
calendarColors['borderColor'] = '#333366';
calendarColors['headerBgColor'] = '#143464';
calendarColors['headerColor'] = '#FFFFFF';
calendarColors['dateBgColor'] = '#8493A8';
calendarColors['dateColor'] = '#004080';
calendarColors['dateHoverBgColor'] = '#FFFFFF';
calendarColors['dateHoverColor'] = '#8493A8';
var calendarMonths = new Array('January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December');
var calendarWeekdays = new Array('S',  'L', 'M', 'M', 'J', 'V', 'S', 'D');
var calendarUseToday = true;
var calendarFormat = 'd/m/y';
var calendarStartMonday = true;
var calendarScreenX = 100; // either 'auto' or numeric
var calendarScreenY = 100; // either 'auto' or numeric

// }}}
// {{{ getCalendar()

function getCalendar(in_dateField, diacamp) 
{
    if (calendarWindow && !calendarWindow.closed) {
        alert('Calendar window already open.  Attempting focus...');
        try {
            calendarWindow.focus();
        }
        catch(e) {}
        
        return false;
    }

    var cal_width = 415;
    var cal_height = 310;

    // IE needs less space to make this thing
    if ((document.all) && (navigator.userAgent.indexOf("Konqueror") == -1)) {
        cal_width = 410;
    }

    calendarTarget = in_dateField;
    calaendarDia= diacamp;
    calendarWindow = window.open('calendar.html', 'dateSelectorPopup','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=0,dependent=no,width='+cal_width+',height='+cal_height + (calendarScreenX != 'auto' ? ',screenX=' + calendarScreenX : '') + (calendarScreenY != 'auto' ? ',screenY=' + calendarScreenY : ''));

    return false;
}

// }}}
// {{{ killCalendar()

function killCalendar() 
{
    if (calendarWindow && !calendarWindow.closed) {
        calendarWindow.close();
    }
}

-->
</script>  
        <Link href="style.css" rel="stylesheet" type="text/css"/>
        <%
            Acudiente acudiente=null;
            String EstadoDeDiv="display: block";
            String correoAcudiente="";
            Estudiante e=new Estudiante();
            final String NOMBRE_USUARIO_SESSIO="usuario";//declaramos una constante, es la qeu lleva el nombre del objeto que tiene la session.
            SessionUsuario sessionUsuario=(SessionUsuario)session.getAttribute(NOMBRE_USUARIO_SESSIO);//aqui cargamos la session
            if(sessionUsuario==null){//aqui comparamos si hay una session
                // <jsp:forward page="index.jsp"></jsp:forward>
        %>
          <jsp:forward page="index.jsp"></jsp:forward><!---con esto llamas a la pagina de inicio-->
        <%
             }else{
                String excusa=request.getParameter("excusar");
                 acudiente=ControladorAcudiente.consultarCliente(sessionUsuario.getIdUsuario());
           
                if(excusa!=null){
                    Calendar c=Calendar.getInstance();
           c.set(2011, 0, 3);
            Date d=new Date(c.getTimeInMillis());
            d.toString().substring(0, 3);
           EstadoDeDiv="display:none";
           
                        out.print("Estudiante excusado exitosamente");
                        out.print("<br/><a href=\"inscripcion.jsp\">"+acudiente.getVar_nombre_acudiente().toUpperCase()+" "+acudiente.getVar_apellido_acudiente().toUpperCase()+"</a>(<a href=\"cerrarSession.jsp\">Salir</a>)");
                        
                }else{
                
                
            out.print("Identificado como: "+acudiente.getVar_nombre_acudiente().toUpperCase()+" "+acudiente.getVar_apellido_acudiente().toUpperCase()+" <a href=\"cerrarSession.jsp\">Cerrar sesion</a>");
          correoAcudiente=acudiente.getVar_email_acudiente().toString(); 
          e=ControlEstudainte.consultarCliente(request.getParameter("id_estudiante"));
              
          } 
             }                                                       
        %> 
       
  
  

        <title>Integral Moderno Excusas <%//aqui se coloca acudiente%></title>
    </head>
    <body>
        <form  name="formfecha" action="excusa.jsp">
       
            <div id="content2" style="<%=EstadoDeDiv%>">
            <table>
                
                <tbody>
                    <tr>
                <input type="hidden" name="id_estudiante" value="<%=e.getCodigo()%>" />
                        <td>Identificacion:<% out.print(e.getCodigo());%></td>
                        <td><% //se optiene la identificacion del estudinte%></td>
                    </tr>
                    <tr>
                        <td>nombre:<% out.print(e.getNombre());%></td>
                        <td><% //se optiene la nombre del estudinte%></td>
                    </tr>
                    <tr>
                        <td>Fecha:</td>
                        <td>
                           
         
      <input type="text" name="fecha" /><a href="#" onclick="return getCalendar(document.formfecha.fecha, document.formfecha.campoDia);"><img src="calendar.png" border="0" /></a>
      
                           
                            
                        </td>
                    </tr>
                    <tr>
                        <td>Motivo de escusa:</td>
                       
                    </tr>
                    <tr>
                        
                        <td colspan="2"><textarea name="motivo" rows="4" cols="20">
                            </textarea></td>
                    </tr>
                    
                </tbody>
            </table> 
                    <input type="hidden" name="excusar" value="ok" />     
              <input type="submit" value="Excusar" />
        </div>
           </form>    
                  
        
       
    </body>
</html>
