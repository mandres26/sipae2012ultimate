/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ManejadorSevalDocente;

import Conceptos.EvalDocente;
import Utilidades.ManejadorBaseDatos;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

/**
 *
 * @author USUARIO
 */
public class ControlEvaluacion {
static Connection con;
static ManejadorBaseDatos mbd=ManejadorBaseDatos.getInstancia();

public static EvalDocente consultarEvaluacion(String id) throws SQLException, Exception {
    mbd.conectar();
    con=mbd.getConexion();
      if (id == null) {
          throw new SQLException("No hay elemento clave de la clase Evaluacion");
     }
         ResultSet rs = null;
         PreparedStatement pst = null;
         EvalDocente evaluaciondoc = null;
     try {
         pst = con.prepareStatement("select * from Evaluaciodocente where var_id_evaluacion = ?");
         pst.setString(1, id.trim());

         rs = pst.executeQuery();
         while(rs.next()) {

             evaluaciondoc = EvalDocente.load(rs);
         }
    } finally {
         if (rs != null) {
            rs.close();
         }
         if (pst != null) {
           pst.close();
         }
          return evaluaciondoc;
    }
}
public static boolean existeEvaluacion(String id) throws SQLException, Exception {
    mbd.conectar();
    con=mbd.getConexion();
      if (id == null) {
          throw new SQLException("No hay elemento clave de la EvaluacionDocente");
     }
         ResultSet rs = null;
         PreparedStatement pst = null;
         boolean evaluaciondoc = false;
     try {
         pst = con.prepareStatement("select * from Evaluaciodocente where var_id_evaluacion = ?");
         pst.setString(1, id.trim());

         rs = pst.executeQuery();
         while(rs.next()) {

             evaluaciondoc = true;
         }
    } finally {
         if (rs != null) {
            rs.close();
         }
         if (pst != null) {
           pst.close();
         }
          return evaluaciondoc;
    }
}

public static void registrarEvaluaciondoc(EvalDocente evaluaciondoc) throws SQLException, Exception {
    mbd.conectar();
    con=mbd.getConexion();
     if (con == null ) {
          throw new SQLException("no hay conexion" );
     }
     PreparedStatement pst = null;//hacer nula la consulata.....
     try {
          pst = con.prepareStatement("Insert Into Evaluaciodocente values(?,?,?,?)");
          pst.setString(1,evaluaciondoc.getVar_idevaluacion());
          pst.setString(2,evaluaciondoc.getDocente().getVar_codigo_docente());
          pst.setInt(3,evaluaciondoc.getCriterio().getCodigo());
          pst.setDouble(4,evaluaciondoc.getVar_promedio());
          pst.setDouble(5,evaluaciondoc.getVar_ponderacion());
          pst.setDouble(6,evaluaciondoc.getVar_puntaje());
          pst.executeUpdate();
    }finally {
        if (pst != null) {
             pst.close();
        }
   }
}
public static boolean ActualizarEvaluaciondoc (EvalDocente evaluaciondoc, String id) throws SQLException, Exception {
    mbd.conectar();
    con=mbd.getConexion();
    if ( consultarEvaluacion(id) == null) {
           throw new SQLException ("Evaluacion no registrado" );
       }
       PreparedStatement pst = null;
       boolean res = false;
       try {
         pst = con.prepareStatement("Update Evaluaciodocente set var_id_evaluacion = ?, var_codigo_docente = ?, var_id_criterio =?, var_promedio = ?,var_ponderacion=?,var_puntaje=? where var_id_evaluacion = ?" ) ;
          pst.setString(1,evaluaciondoc.getVar_idevaluacion());
          pst.setString(2,evaluaciondoc.getDocente().getVar_codigo_docente());
          pst.setInt(3,evaluaciondoc.getCriterio().getCodigo());
          pst.setDouble(4,evaluaciondoc.getVar_promedio());
          pst.setDouble(5,evaluaciondoc.getVar_ponderacion());
          pst.setDouble(6,evaluaciondoc.getVar_puntaje());
         pst.setString(5 , id.trim());
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
public static boolean EliminarEvaluaciondoc(String id) throws SQLException, Exception {
    mbd.conectar();
    con=mbd.getConexion();
    if (consultarEvaluacion(id) == null) {
        throw new SQLException("No hay Evaluacion para eliminar");
     }
     PreparedStatement pst = null;
     boolean res = false;
     try {
        pst = con.prepareStatement("delete from Evaluaciodocente where var_id_evaluacion = ?");
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
    public static List<EvalDocente> listarEvaluaciondoc() throws SQLException, Exception {
      mbd.conectar();
        con=mbd.getConexion();
        ResultSet rs = null;
     PreparedStatement pst = null;
     List<EvalDocente> listaEvaluacion = new LinkedList();
     try {
        pst = con.prepareStatement("select * from Evaluaciodocente ");
        rs = pst.executeQuery();
        while(rs.next()) {
           listaEvaluacion.add(EvalDocente.load(rs));
        }
    } finally {
        if (rs != null) {
           rs.close();
       }
        if (pst != null) {
          pst.close();
       }
  }
    return listaEvaluacion;
}
    
public static int ultimaEvaluacion() throws SQLException, Exception {
     mbd.conectar();
     con=mbd.getConexion();
     ResultSet rs = null;
     PreparedStatement pst = null;
     int ultimo=0;
     try {
        pst = con.prepareStatement("select (max(var_id_evaluacion)+1) as ul from Evaluaciodocente ");
        rs = pst.executeQuery();
        while(rs.next()) {
           ultimo=rs.getInt("ul");
        }
    } finally {
        if (rs != null) {
           rs.close();
       }
        if (pst != null) {
          pst.close();
       }
  }
    return ultimo;
}

}