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
    
    
    
}
