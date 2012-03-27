/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ManejadorMatriculas;

/**
 *
 * @author peter
 */

import Conceptos.Estudiante;
import Utilidades.ManejadorBaseDatos;

import Utilidades.MensajeriaEmail;
import Utilidades.TIPOS_MENSAJE;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;
import  java.sql.Date; 
import java.util.LinkedList;
import java.util.List;


public class ControlEstudiante {
    static Connection con;
static ManejadorBaseDatos mbd=ManejadorBaseDatos.getInstancia();
    

public static Estudiante consultarEstudiante(String id) throws SQLException, Exception {
    mbd.conectar();
    con=mbd.getConexion();
      if (id == null) {
          throw new SQLException("No hay elemento clave de la clase Estudiante");
     }
         ResultSet rs = null;
         PreparedStatement pst = null;
         Estudiante est = null;
     try {
         pst = con.prepareStatement("select * from estudiante where var_identificacion_estudiante = ? ");
         pst.setString(1, id.trim());

         rs = pst.executeQuery();
         while(rs.next()) {
             est = Estudiante.load(rs);
             
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
public static void inscribirEstudante(String id) throws SQLException, Exception{
   mbd.conectar();
    con=mbd.getConexion();
      if (id == null) {
          throw new SQLException("No hay elemento clave de la clase Estudiante");
     }
         ResultSet rs = null;
         PreparedStatement pst = null;
         Estudiante estudiante=consultarEstudiante(id);
         
     try {
         
         //pst = con.prepareStatement("insert into matricula values(?, ?, ?, ?, ?)");
         //pst.setString(1, id.trim());

         
         
         pst = con.prepareStatement("update estudiante set inscripcion=1 where var_identificacion_estudiante=?");
         pst.setString(1, id.trim());

         pst.executeUpdate();
         
    } finally {
         if (rs != null) {
            rs.close();
         }
         if (pst != null) {
           pst.close();
         }
          
    }
    
}
public static void matricularEstudante(String id) throws SQLException, Exception{
   mbd.conectar();
    con=mbd.getConexion();
      if (id == null) {
          throw new SQLException("No hay elemento clave de la clase Cliente");
     }
         ResultSet rs = null;
         PreparedStatement pst = null;
         
     try {
         pst = con.prepareStatement("update estudiante set var_estado=1 where var_identificacion_estudiante=?");
         pst.setString(1, id.trim());

         pst.executeUpdate();
         
    } finally {
         if (rs != null) {
            rs.close();
         }
         if (pst != null) {
           pst.close();
         }
          
    }
    
}

public static boolean existeEstudiante(String id) throws SQLException, Exception {
    mbd.conectar();
    con=mbd.getConexion();
      if (id == null) {
          throw new SQLException("No hay elemento clave de la clase Estudiante");
     }
         ResultSet rs = null;
         PreparedStatement pst = null;
         boolean est = false;
     try {
         pst = con.prepareStatement("select * from estudiante where var_identificacion_estudiante = ?");
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



public static void registrarEstudiante(Estudiante est, String correoAcudiente) throws SQLException, Exception {
    
    mbd.conectar();
    con=mbd.getConexion();
     
    Date d=new Date(Calendar.getInstance().getTimeInMillis());
     if (con == null ) {
          throw new SQLException("no hay conexion" );
     }
     PreparedStatement pst = null;//hacer nula la consulata.....
     
     try {
         
          pst = con.prepareStatement("Insert Into estudiante values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
          pst.setString(1,est.getVar_codigo_estudiante());
          pst.setString(2,est.getVar_identificacion_estudiante());
          pst.setString(3,est.getVar_nombres_estudiante());
          pst.setString(4,est.getVar_apellidos_estudiante());
           pst.setString(5,est.getVar_nombre_madre_estudiante());
          pst.setString(6,est.getVar_nombre_padre_estudiante());
          pst.setString(7,est.getVar_direccion_estudiante());
          pst.setString(8,est.getVar_sexo_estudiante());
           pst.setInt(9, est.getVar_numero_hermanos_estudiante());
           pst.setDate(10,est.getVar_fecha_nacimiento());
          pst.setString(11,est.getAcudiente().getVar_id_acudiente());
          pst.setBoolean(12,est.getVar_estado());
          pst.setString(13,est.getVar_foto());
          
          
          pst.executeUpdate();//actualizamos la tabla. estudiante
           
             
         String[] parametro={est.getVar_identificacion_estudiante()};//mando los para me tros neserios
        
          MensajeriaEmail.enviarMensaje(correoAcudiente, parametro, TIPOS_MENSAJE.INSCRIPCION);
          
    }finally {
        if (pst != null) {
             pst.close();
        }
   }
}
public static boolean ActualizarEstudiante (Estudiante est, String id) throws SQLException, Exception {
    mbd.conectar();
    con=mbd.getConexion();
    if ( consultarEstudiante(id) == null) {
           throw new SQLException ("Estudiante no registrado" );
       }
       PreparedStatement pst = null;
       boolean res = false;
       try {//terminar aqui quitaridentificacion
         pst = con.prepareStatement("Update estudiante as est, padres as pad "+//modificamos las tablas estudiante y padres
                 " set  var_nombre_estudiante = ?, var_apellido_estudiante=?, var_barrio_estudiante=?, var_direccion_estudiante=?,"+// del 1-4
                 " var_numero_hermanos_estudiante=?, var_nombre_acudiente_estudiante=?, var_id_acudiente_estudiante=?, "+//del 5-8
                 " var_id_padre=?, var_nombre_mama=?, var_nombre_papa=?, var_apellido_mama=?, var_apellido_papa=?"+//9-13
                 "  where  est.var_identificacion_estudiante=pad.var_id_estudiante and var_identificacion_estudiante = "+id) ;
          
            pst.setString(1,est.getVar_codigo_estudiante());
          pst.setString(2,est.getVar_identificacion_estudiante());
          pst.setString(3,est.getVar_nombres_estudiante());
          pst.setString(4,est.getVar_apellidos_estudiante());
           pst.setString(5,est.getVar_nombre_madre_estudiante());
          pst.setString(6,est.getVar_nombre_padre_estudiante());
          pst.setString(7,est.getVar_direccion_estudiante());
          pst.setString(8,est.getVar_sexo_estudiante());
           pst.setInt(9, est.getVar_numero_hermanos_estudiante());
           pst.setDate(10,est.getVar_fecha_nacimiento());
          pst.setString(11,est.getAcudiente().getVar_id_acudiente());
          pst.setBoolean(12,est.getVar_estado());
          pst.setString(13,est.getVar_foto());      
         
       
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
public static boolean EliminarEstudiante(String id) throws SQLException, Exception {
    mbd.conectar();
    con=mbd.getConexion();
    if (consultarEstudiante(id) == null) {
        throw new SQLException("No hay Estudiante para eliminar");
     }
     PreparedStatement pst = null;
     boolean res = false;
     try {
        pst = con.prepareStatement("delete from Estudiante where identificacion = ?");
        pst.setString(1, id.trim());
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
    public static List<Estudiante> listarEstudiante(String id) throws SQLException, Exception {
      mbd.conectar();
        con=mbd.getConexion();
        ResultSet rs = null;
     PreparedStatement pst = null;
     List<Estudiante> listaestudiante = new LinkedList();
     try {
         //esto es para que solamente muestre, el listado de los alumnos que el acudiente a inscrito..
        pst = con.prepareStatement("select * from Estudiante est,Acudiente acud where  est.var_id_acudiente_estudiante=acud.var_id_acudiente and var_id_acudiente=?");
      pst.setString(1, id);
        rs = pst.executeQuery();
       
        while(rs.next()) {
         listaestudiante.add(Estudiante.load(rs));
           
        }
    } finally {
        if (rs != null) {
           rs.close();
       }
        if (pst != null) {
          pst.close();
       }
  }
    return listaestudiante;
}
    
     public static List<Estudiante> listarEstudiantesSinInscribir() throws SQLException, Exception {
      mbd.conectar();
        con=mbd.getConexion();
        ResultSet rs = null;
     PreparedStatement pst = null;
     List<Estudiante> listaestudiante = new LinkedList();
     try {
         //esto es para que solamente muestre, el listado de los alumnos que el acudiente a inscrito..
        pst = con.prepareStatement("select * from estudiante where  inscripcion!=1");
     
        rs = pst.executeQuery();
       
        while(rs.next()) {
            
         listaestudiante.add(Estudiante.load(rs));
           
        }
    } finally {
        if (rs != null) {
           rs.close();
       }
        if (pst != null) {
          pst.close();
       }
  }
    return listaestudiante;
}
     
     public static List<Estudiante> listarEstudiantesSinMatricular() throws SQLException, Exception {
      mbd.conectar();
        con=mbd.getConexion();
        ResultSet rs = null;
     PreparedStatement pst = null;
     List<Estudiante> listaestudiante = new LinkedList();
     try {
         //esto es para que solamente muestre, el listado de los alumnos que el acudiente a inscrito..
        pst = con.prepareStatement("select * from estudiante where var_estado=0 and inscripcion=1");
     
        rs = pst.executeQuery();
       
        while(rs.next()) {
            
         listaestudiante.add(Estudiante.load(rs));
           
        }
    } finally {
        if (rs != null) {
           rs.close();
       }
        if (pst != null) {
          pst.close();
       }
  }
    return listaestudiante;
}

}


