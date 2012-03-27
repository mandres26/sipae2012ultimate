/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ManejadorMatriculas;

import Conceptos.Matricula;
import Utilidades.ManejadorBaseDatos;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

/**
 *
 * @author Usuario
 */

public class ControlMatricula {

        static Connection con;
static ManejadorBaseDatos mbd=ManejadorBaseDatos.getInstancia();

public static Matricula consultarMatricula(String id) throws SQLException, Exception {
     mbd.conectar();
    con=mbd.getConexion();
      if (id == null) {
          throw new SQLException("No hay elemento clave de la clase Acudiente");
     }
         ResultSet rs = null;
         PreparedStatement pst = null;
         Matricula matricula = null;
     try {
         pst = con.prepareStatement("select * from Matricula where var_anio = ?");
         pst.setString(1, id.trim());

         rs = pst.executeQuery();
         while(rs.next()) {
            
             matricula= Matricula.load(rs);
         }
    } finally {
         if (rs != null) {
            rs.close();
         }
         if (pst != null) {
           pst.close();
         }
          return matricula;
    }
}
public static boolean existeMatricula(String id) throws SQLException, Exception {
    mbd.conectar();
    con=mbd.getConexion();
      if (id == null) {
          throw new SQLException("No hay elemento clave de la clase Acudiente");
     }
         ResultSet rs = null;
         PreparedStatement pst = null;
         boolean est = false;
     try {
         pst = con.prepareStatement("select * from Matricula where var_anio = ?");
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



public static void registrarM(Matricula matricula) throws SQLException, Exception {
    
   mbd.conectar();
        con = (Connection) mbd.getConexion();
        if (con == null) {
            throw new SQLException("no hay conexion");
        }
        PreparedStatement pst = null;//hacer nula la consulata......
     
     try {
         
          pst = con.prepareStatement("Insert Into Matricula values(?,?,?,?,?)");
          pst.setDate(1, matricula.getVar_anio());
          pst.setString(2,matricula.getCurso().getVar_codigo_curso());
          pst.setString(3,matricula.getVar_codigo_matricula());
          pst.setString(4,matricula.getEstudiante().getVar_codigo_estudiante());
          pst.setDate(5,matricula.getVar_fechamatricula());
       
          
          pst.executeUpdate();//actualizamos la tabla. estudiante
          
          
    }finally {
        if (pst != null) {
             pst.close();
        }
   }
}
public static boolean Actualizarmatricula (Matricula matricula, String id) throws SQLException, Exception {
    mbd.conectar();
    con=mbd.getConexion();
    if ( consultarMatricula(id) == null) {
           throw new SQLException ("Matricula no registrado" );
       }
       PreparedStatement pst = null;
       boolean res = false;
       try {//terminar aqui quitaridentificacion
         pst = con.prepareStatement("Update matricula set  var_anio = ?, var_id_curso=?, var_codigo_matricula=?, var_id_estudiante=?, var_fecha_matricula=?  where var_anio = "+id) ;
      
          pst.setDate(1, matricula.getVar_anio());
          pst.setString(2,matricula.getCurso().getVar_codigo_curso());
          pst.setString(3,matricula.getVar_codigo_matricula());
          pst.setString(4,matricula.getEstudiante().getVar_codigo_estudiante());
          pst.setDate(5,matricula.getVar_fechamatricula());
        
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
    if (consultarMatricula(id) == null) {
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
    public static List<Matricula> listarMatriculas(String idacudiente) throws SQLException, Exception {
      mbd.conectar();
        con=mbd.getConexion();
        ResultSet rs = null;
     PreparedStatement pst = null;
     List<Matricula> listarmatriculas = new LinkedList();
     try {
        pst = con.prepareStatement("select * from Estudiante ");
        rs = pst.executeQuery();
        while(rs.next()) {
           listarmatriculas.add(Matricula.load(rs));
        }
    } finally {
        if (rs != null) {
           rs.close();
       }
        if (pst != null) {
          pst.close();
       }
  }
    return listarmatriculas;
}
    public static boolean existeEstudiantemat(String usuario, String pass) throws SQLException, Exception {
    mbd.conectar();
    con=mbd.getConexion();
      if (usuario == null) {
          throw new SQLException("El usuario esta vacio");
     }
         ResultSet rs = null;
         PreparedStatement pst = null;
         boolean exist = false;
     try {
         pst = con.prepareStatement("select * from administrador where user=? and pass=?");
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
