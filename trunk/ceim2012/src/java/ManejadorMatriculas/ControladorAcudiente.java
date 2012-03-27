/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ManejadorMatriculas;

/**
 *
 * @author dell
 */

import Conceptos.Acudiente;
import Conceptos.Estudiante;
import Utilidades.ManejadorBaseDatos;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;
import  java.sql.Date; 
import java.util.LinkedList;
import java.util.List;


public class ControladorAcudiente {
    static Connection con;
static ManejadorBaseDatos mbd=ManejadorBaseDatos.getInstancia();

public static Acudiente consultarAcudiente(String id) throws SQLException, Exception {
     mbd.conectar();
    con=mbd.getConexion();
      if (id == null) {
          throw new SQLException("No hay elemento clave de la clase Acudiente");
     }
         ResultSet rs = null;
         PreparedStatement pst = null;
         Acudiente est = null;
     try {
         pst = con.prepareStatement("select * from Acudiente where var_id_acudiente = ?");
         pst.setString(1, id.trim());

         rs = pst.executeQuery();
         while(rs.next()) {
            
             est = Acudiente.load(rs);
         }
    } finally {
         if (rs != null) {
            rs.close();
         }
         if (pst != null) {
           pst.close();
         }
          return est;
    }
}
public static boolean existeAcudiente(String id) throws SQLException, Exception {
    mbd.conectar();
    con=mbd.getConexion();
      if (id == null) {
          throw new SQLException("No hay elemento clave de la clase Acudiente");
     }
         ResultSet rs = null;
         PreparedStatement pst = null;
         boolean est = false;
     try {
         pst = con.prepareStatement("select * from acudiente where var_id_acudiente = ?");
         pst.setString(1, id.trim());

         rs = pst.executeQuery();
         while(rs.next()) {
            
             est = true;
         }
    } finally {
         if (rs != null) {
            rs.close();
         }
         if (pst != null) {
           pst.close();
         }
          return est;
    }
}

public static Acudiente  isUsurioPass(String usuario, String contrasena) throws Exception{
     mbd.conectar();
    con=mbd.getConexion();
      if (usuario == null) {
          throw new SQLException("No hay elemento clave de la clase Acudiente");
     }
         ResultSet rs = null;
         PreparedStatement pst = null;
         Acudiente acud = null;
     try {
         pst = con.prepareStatement("select * from Acudiente where var_usuario = ? and var_contrasena=?");
         pst.setString(1, usuario.trim());
         pst.setString(2, contrasena.trim());

         rs = pst.executeQuery();
         while(rs.next()) {
            
            acud=Acudiente.load(rs);
         }
    } finally {
         if (rs != null) {
            rs.close();
         }
         if (pst != null) {
           pst.close();
         }
          return acud;
    }
    
}

public static void registrarAcudiente(Acudiente acud) throws SQLException, Exception {
    
    mbd.conectar();
    con=mbd.getConexion();
    
    Date d=new Date(Calendar.getInstance().getTimeInMillis());
     if (con == null ) {
          throw new SQLException("no hay conexion" );
     }
     PreparedStatement pst = null;//hacer nula la consulata.....
     
     try {
         
          pst = con.prepareStatement("Insert Into acudiente values(?,?,?,?,?,?,?,?,?,?)");
          pst.setString(1, acud.getVar_id_acudiente());
          pst.setString(2,acud.getVar_nombre_acudiente());
          pst.setString(3,acud.getVar_apellido_acudiente());
          pst.setString(4,acud.getVar_telefono_acudiente());
          pst.setString(5,acud.getVar_direccion_acudiente());
          pst.setString(6,acud.getVar_sexo_acudiente());
          pst.setString(7,acud.getVar_email_acudiente());
          pst.setString(8,acud.getVar_usuario());
          pst.setString(9,acud.getVar_contrasena());
          pst.setDate(10,acud.getVar_fecha_nacimiento());
          
          pst.executeUpdate();//actualizamos la tabla. estudiante
          
          
    }finally {
        if (pst != null) {
             pst.close();
        }
   }
}
public static boolean ActualizarAcudiente (Acudiente acudi, String id) throws SQLException, Exception {
    mbd.conectar();
    con=mbd.getConexion();
    if ( consultarAcudiente(id) == null) {
           throw new SQLException ("Acudiente no registrado" );
       }
       PreparedStatement pst = null;
       boolean res = false;
       try {//terminar aqui quitaridentificacion
         pst = con.prepareStatement("Update estudiante set  var_nombre_acudiente = ?, var_apellido_acudiente=?, var_telefono_acudiente=?, var_direccion_acudiente=?, var_sexo_acudiente=?, var_email_acudiente=?, usuario=?, contrasena=?  where var_id_acudiente = "+id) ;
      
          pst.setString(1,acudi.getVar_nombre_acudiente());
          pst.setString(2,acudi.getVar_apellido_acudiente());
          pst.setString(3,acudi.getVar_telefono_acudiente());
          pst.setString(4,acudi.getVar_direccion_acudiente());
          pst.setString(5,acudi.getVar_sexo_acudiente());
          pst.setString(6,acudi.getVar_email_acudiente());
          pst.setString(7,acudi.getVar_usuario());
          pst.setString(8,acudi.getVar_contrasena());
        
         int r = pst.executeUpdate();
       if (r != 0) {
          res = true;
       }
       } finally {
          if (pst != null) {
            pst.close();
          }
       }
         return res;
 }
public static boolean EliminarAcudiente(String id) throws SQLException, Exception {
    mbd.conectar();
    con=mbd.getConexion();
    if (consultarAcudiente(id) == null) {
        throw new SQLException("No hay Acudiente para eliminar");
     }
     PreparedStatement pst = null;
     boolean res = false;
     try {
        pst = con.prepareStatement("delete from acudiente where var_id_acudiente = ?");
        pst.setString(1, id);
        int r = pst.executeUpdate();
        if (r != 0) {
           res = true;
        }
     } finally {
        if (pst != null) {
           pst.close();
        }
     }
     return res;
}
  //metodo para listar asociados
    public static List<Estudiante> listarEstudianteAcudiente(String idacudiente) throws SQLException, Exception {
      mbd.conectar();
        con=mbd.getConexion();
        ResultSet rs = null;
     PreparedStatement pst = null;
     List<Estudiante> listarEstudianteAcudiente = new LinkedList();
     try {
        pst = con.prepareStatement("select * from Estudiante ");
        rs = pst.executeQuery();
        while(rs.next()) {
           listarEstudianteAcudiente.add(Estudiante.load(rs));
        }
    } finally {
        if (rs != null) {
           rs.close();
       }
        if (pst != null) {
          pst.close();
       }
  }
    return listarEstudianteAcudiente;
}

}
