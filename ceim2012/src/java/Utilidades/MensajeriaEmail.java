/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Utilidades;

/**
 *
 * @author idadyou
 */
import java.io.File;
import java.sql.Date;
import java.util.Calendar;
import java.util.Properties;
import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;



public class MensajeriaEmail {
    
    
    
      public static void enviarMensaje(String correo, String[] parametros, TIPOS_MENSAJE tipo){
       try
        {   
            
            Date d=new Date(Calendar.getInstance().getTimeInMillis());
             String cabecera="", dirArchivo="", nuevoNombre="";
            switch(tipo){
                case MATRICULA:  MotorPdf.generarPDF("VOLANTE DE MATRICULA", parametros[0]);  
                 dirArchivo="d:/volantePagoEstudiante.pdf";
                 cabecera="VOLANTE DE PAGO DE MATRICULA";
                 nuevoNombre="Volante de pago.pdf";
                break;
                case INSCRIPCION: 
                    
                    MotorPdf.generarPDF("VOLANTE DE INSCRIPCION", parametros[0]);  
                    
                 dirArchivo="d:/volantePagoEstudiante.pdf";
                 cabecera="VOLANTE DE PAGO DE INSCRIPCION";
                 nuevoNombre="Volante de pago.pdf";
                 
                break;   
                case EXCUSA:  MotorPdf.generarPDFExcusa(parametros[0], parametros[1], parametros[2]); 
                dirArchivo="d:/excusaEstudiante.pdf";
                nuevoNombre="Excusa de estudiante.pdf";
                cabecera="EXCUSA "+d.toString();
                break;  //0 acudiente- 1 estudiante  -2 motivo excusa
                    
            }
            
            
            
            // Propiedades de la conexión
            Properties props = new Properties();
            props.put("mail.smtp.host", "smtp.gmail.com");
           // props.setProperty("mail.smtp.host", "smtp.gmail.com");
            props.setProperty("mail.smtp.starttls.enable", "true");
            props.setProperty("mail.smtp.port", "587");
            props.setProperty("mail.smtp.user", "integralmoderno@gmail.com");
            props.setProperty("mail.smtp.auth", "true");
            // Preparamos la sesion
            Session session = Session.getDefaultInstance(props, null);
            // Construimos el mensaje
            MimeMessage message = new MimeMessage(session);
            //Acudiente acudiente=ControladorAcudiente.consultarCliente(id);
            //JOptionPane.showMessageDialog(null,acudiente.getVar_email_acudiente().toString()+ ""+id);
            BodyPart adjunto = new MimeBodyPart();//adjuntado
             adjunto.setDataHandler(
                new DataHandler(new FileDataSource(dirArchivo)));
                 adjunto.setFileName(nuevoNombre);
            
            // Una MultiParte para agrupar texto e imagen.
            MimeMultipart multiParte = new MimeMultipart();
            multiParte.addBodyPart(adjunto);
            
            message.addRecipient(
                Message.RecipientType.TO,
                new InternetAddress(correo));//correo a quien se le va a enviar..
            message.setSubject(cabecera);//nombre
            message.setContent(multiParte);
            //message.setFileName("Volante de pago.pdf");
          
            // Lo enviamos.
           
            Transport t = session.getTransport("smtp");
            t.connect("integralmoderno@gmail.com", "123456789integralmoderno");
            t.sendMessage(message, message.getAllRecipients());
            // Cierre.
            t.close();
            File fichero = new File(dirArchivo);
          fichero.delete();
          
        }
        catch (Exception e)
        {
           
        }
    
    }
      
      
     
}
