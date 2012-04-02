/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ManejadorSEvaluacion;

import Conceptos.LogroActividad;
import Utilidades.ManejadorBaseDatos;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author wamp
 */
public class ControladorLogroActividad {
        static Connection con;
        static ManejadorBaseDatos mbd=ManejadorBaseDatos.getInstancia();

        
  public static LogroActividad ConsultarLogroActividad(String codigologroactividad) throws SQLException, Exception {
     mbd.conectar();
    con=mbd.getConexion();
      
      if (codigologroactividad == null) {
          throw new SQLException("No hay elemento clave de la clase ConsultarLogroActivivdad");
     }
         ResultSet rs = null;
         PreparedStatement pst = null;
         LogroActividad logroactividad = null;
     try {
         pst = con.prepareStatement("select * from LogroActividad where codigologroactividad = ?");
        
         pst.setString(1, codigologroactividad.trim());
         rs = pst.executeQuery();
         while(rs.next()) {
             logroactividad = LogroActividad.load(rs);
         }
    } finally {
         if (rs != null) {
            rs.close();
         }
         if (pst != null) {
           pst.close();
         }
          return logroactividad;
    }
}
    
  public static void registrarLogroAct(LogroActividad logroact) throws SQLException, Exception {
    mbd.conectar();
    con=mbd.getConexion();
     if (con == null ) {
          throw new SQLException("no hay conexion" );
     }
     PreparedStatement pst = null;//hacer nula la consulata.....
     try {
          pst = con.prepareStatement("Insert Into LogroActividad values(?,?,?)");
          pst.setString(1,logroact.getVar_codigo_logro().getVar_codigo_logro());
          pst.setString(2,logroact.getVar_codigo_actividad().getVar_codigo_actividad());
          pst.setString(3,logroact.getVar_consecutivo());
          

          pst.executeUpdate();
    }finally {
        if (pst != null) {
             pst.close();
        }
   }
}  
    
}
