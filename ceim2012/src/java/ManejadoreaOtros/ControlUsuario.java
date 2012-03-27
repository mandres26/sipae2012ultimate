/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ManejadoreaOtros;
import Conceptos.Usuario;
import Utilidades.ManejadorBaseDatos;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLException;

/**
 *
 * @author josedavo
 */
public class ControlUsuario {
static Connection con;
static ManejadorBaseDatos mbd=ManejadorBaseDatos.getInstancia();

public static void registrarUsuario(Usuario user) throws SQLException, Exception {
    mbd.conectar();
    con=mbd.getConexion();
     if (con == null ) {
          throw new SQLException("no hay conexion" );
     }
     PreparedStatement pst = null;//hacer nula la consulata.....
     try {
          pst = con.prepareStatement("Insert Into Administrador  values(?,?)");
                   
          pst.setString(1,user.getVar_username());
          pst.setString(2,user.getVar_pass());
         
       
          pst.executeUpdate();
    }finally {
        if (pst != null) {
             pst.close();
        }
   }
}
public static Usuario consultarUsuario(String user,String pass) throws SQLException, Exception {
    mbd.conectar();
    con=mbd.getConexion();
   
      if (user==null ) {
          throw new SQLException("No hay elemento clave de la clase Usuarios");
     }
         ResultSet rs = null;
         PreparedStatement pst = null;
         Usuario usuario = null;
     try {
         pst = con.prepareStatement("select * from Usuarios  where var_user = ? and var_pass=?");
         pst.setString(1, user);
          pst.setString(2, pass);
         rs = pst.executeQuery();
         while(rs.next()) {

             usuario = Usuario.load(rs);
         }
    } finally {
         if (rs != null) {
            rs.close();
         }
         if (pst != null) {
           pst.close();
         }
          return usuario;
    }
}


public static boolean existeusuario(String user,String pass) throws SQLException, Exception {
    mbd.conectar();
    con=mbd.getConexion();
     
      if (user==null) {

          throw new SQLException("No hay elemento clave de la clase Curso");
     }
         ResultSet rs = null;
         PreparedStatement pst = null;
         boolean userad = false;
     try {
         pst = con.prepareStatement("select * from Usuarios  where var_user = ? and var_pass=?");
         pst.setString(1, user);
        pst.setString(1, pass);
         rs = pst.executeQuery();
         while(rs.next()) {

             userad = true;
         }
    } finally {
         if (rs != null) {
            rs.close();
         }
         if (pst != null) {
           pst.close();
         }
          return userad;
    }
}
}