/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ManejadorSevalDocente;

import Conceptos.CriteriosEval;
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
public class ControlCriterios {
static Connection con;
static ManejadorBaseDatos mbd=ManejadorBaseDatos.getInstancia();

public static CriteriosEval consultarCriterioEval(String id) throws SQLException, Exception {
    mbd.conectar();
    con=mbd.getConexion();
      if (id == null) {
          throw new SQLException("No hay elemento clave de la clase CriteriosEval");
     }
         ResultSet rs = null;
         PreparedStatement pst = null;
         CriteriosEval peval = null;
     try {
         pst = con.prepareStatement("select * from criterioseval where var_id_criterio = ?");
         pst.setString(1, id.trim());

         rs = pst.executeQuery();
         while(rs.next()) {

             peval = CriteriosEval.load(rs);
         }
    } finally {
         if (rs != null) {
            rs.close();
         }
         if (pst != null) {
           pst.close();
         }
          return peval;
    }
}
public static boolean existeCriterioEval(String id) throws SQLException, Exception {
    mbd.conectar();
    con=mbd.getConexion();
      if (id == null) {
          throw new SQLException("No hay elemento clave de la clase CriteriosEval");
     }
         ResultSet rs = null;
         PreparedStatement pst = null;
         boolean peval = false;
     try {
         pst = con.prepareStatement("select * from criterioseval where var_id_criterio = ?");
         pst.setString(1, id.trim());

         rs = pst.executeQuery();
         while(rs.next()) {

             peval = true;
         }
    } finally {
         if (rs != null) {
            rs.close();
         }
         if (pst != null) {
           pst.close();
         }
          return peval;
    }
}

public static void registrarCriterioEval(CriteriosEval peval) throws SQLException, Exception {
    mbd.conectar();
    con=mbd.getConexion();
     if (con == null ) {
          throw new SQLException("no hay conexion" );
     }
     PreparedStatement pst = null;//hacer nula la consulata.....
     try {
          pst = con.prepareStatement("Insert Into criterioseval values(?,?)");
          pst.setInt(1,peval.getCodigo());
          pst.setString(2,peval.getPeval());
          
          pst.executeUpdate();
    }finally {
        if (pst != null) {
             pst.close();
        }
   }
}
public static boolean ActualizarCriterioEval (CriteriosEval peval, String id) throws SQLException, Exception {
    mbd.conectar();
    con=mbd.getConexion();
    if ( consultarCriterioEval(id) == null) {
           throw new SQLException ("CriterioEval no registrado" );
       }
       PreparedStatement pst = null;
       boolean res = false;
       try {
         pst = con.prepareStatement("Update criterioseval set var_id_criterio = ?, var_criterio = ? where var_id_criterio = ?" ) ;
         pst.setInt(1 , peval.getCodigo());
         pst.setString(2 , peval.getPeval());
         
         pst.setString(3 , id.trim());
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
public static boolean EliminarCriterioEval(String id) throws SQLException, Exception {
    mbd.conectar();
    con=mbd.getConexion();
    if (consultarCriterioEval(id) == null) {
        throw new SQLException("No hay CriteriosEval para eliminar");
     }
     PreparedStatement pst = null;
     boolean res = false;
     try {
        pst = con.prepareStatement("delete from criterioseval where var_id_criterio = ?");
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
    public static List<CriteriosEval> listarCriterioEval() throws SQLException, Exception {
      mbd.conectar();
        con=mbd.getConexion();
        ResultSet rs = null;
     PreparedStatement pst = null;
     List<CriteriosEval> listaCriterioEval = new LinkedList();
     try {
        pst = con.prepareStatement("select * from CriteriosEval ");
        rs = pst.executeQuery();
        while(rs.next()) {
           listaCriterioEval.add(CriteriosEval.load(rs));
        }
    } finally {
        if (rs != null) {
           rs.close();
       }
        if (pst != null) {
          pst.close();
       }
  }
    return listaCriterioEval;
}
    
    public static int ultimoCriterioEval() throws SQLException, Exception {
     mbd.conectar();
     con=mbd.getConexion();
     ResultSet rs = null;
     PreparedStatement pst = null;
     int ultimo=0;
     try {
        pst = con.prepareStatement("select (max(var_id_criterio)+1) as ul from criterioseval");
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
