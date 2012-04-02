/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ManejadoreaOtros;


import Conceptos.Administrador;
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
         pst.setString(1, usuario);
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
public static Administrador consultarAdmin(String user) throws SQLException, Exception {
    mbd.conectar();
    con=mbd.getConexion();
   
      if (user==null ) {
          throw new SQLException("No hay elemento clave de la clase Administrador");
     }
         ResultSet rs = null;
         PreparedStatement pst = null;
         Administrador admin = null;
     try {
         pst = con.prepareStatement("select * from administrador  where var_usuario = ? ");
         pst.setString(1, user);
          
         rs = pst.executeQuery();
         while(rs.next()) {

             admin = admin.load(rs);
         }
    } finally {
         if (rs != null) {
            rs.close();
         }
         if (pst != null) {
           pst.close();
         }
          return admin;
    }
}
}
