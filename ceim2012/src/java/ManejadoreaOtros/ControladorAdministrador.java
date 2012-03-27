/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ManejadoreaOtros;


import Utilidades.ManejadorBaseDatos;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;



/**
 *
 * @author sigi
 */
public class ControladorAdministrador {
       static Connection con;
static ManejadorBaseDatos mbd=ManejadorBaseDatos.getInstancia();
public static boolean existeAdministrador(String usuario, String pass) throws SQLException, Exception {
    mbd.conectar();
    con=mbd.getConexion();
      if (usuario == null) {
          throw new SQLException("El usuario esta vacio");
     }
         ResultSet rs = null;
         PreparedStatement pst = null;
         boolean exist = false;
     try {
         pst = con.prepareStatement("select * from Administrador where var_usuario=? and var_pass=?");
         pst.setString(1, usuario.trim());
         pst.setString(2, pass);

         rs = pst.executeQuery();
         while(rs.next()) { 
              exist = true;
         }
    } finally {
         if (rs != null) {
            rs.close();
         }
         if (pst != null) {
           pst.close();
         }
          return exist;
    }
}
}
