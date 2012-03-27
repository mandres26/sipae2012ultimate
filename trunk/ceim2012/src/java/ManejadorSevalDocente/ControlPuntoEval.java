/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ManejadorSevalDocente;

import Conceptos.PuntoEval;
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
public class ControlPuntoEval {
static Connection con;
static ManejadorBaseDatos mbd=ManejadorBaseDatos.getInstancia();

public static PuntoEval consultarPuntoEval(String id) throws SQLException, Exception {
    mbd.conectar();
    con=mbd.getConexion();
      if (id == null) {
          throw new SQLException("No hay elemento clave de la clase PuntoEval");
     }
         ResultSet rs = null;
         PreparedStatement pst = null;
         PuntoEval peval = null;
     try {
         pst = con.prepareStatement("select * from PuntoEval where codigo = ?");
         pst.setString(1, id.trim());

         rs = pst.executeQuery();
         while(rs.next()) {

             peval = PuntoEval.load(rs);
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
public static boolean existePuntoEval(String id) throws SQLException, Exception {
    mbd.conectar();
    con=mbd.getConexion();
      if (id == null) {
          throw new SQLException("No hay elemento clave de la clase PuntoEval");
     }
         ResultSet rs = null;
         PreparedStatement pst = null;
         boolean peval = false;
     try {
         pst = con.prepareStatement("select * from PuntoEval where codigo = ?");
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

public static void registrarPuntoEval(PuntoEval peval) throws SQLException, Exception {
    mbd.conectar();
    con=mbd.getConexion();
     if (con == null ) {
          throw new SQLException("no hay conexion" );
     }
     PreparedStatement pst = null;//hacer nula la consulata.....
     try {
          pst = con.prepareStatement("Insert Into PuntoEval values(?,?)");
          pst.setInt(1,peval.getCodigo());
          pst.setString(2,peval.getPeval());
          
          pst.executeUpdate();
    }finally {
        if (pst != null) {
             pst.close();
        }
   }
}
public static boolean ActualizarPuntoEval (PuntoEval peval, String id) throws SQLException, Exception {
    mbd.conectar();
    con=mbd.getConexion();
    if ( consultarPuntoEval(id) == null) {
           throw new SQLException ("PuntoEval no registrado" );
       }
       PreparedStatement pst = null;
       boolean res = false;
       try {
         pst = con.prepareStatement("Update PuntoEval set codigo = ?, peval = ? where codigo = ?" ) ;
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
public static boolean EliminarPuntoEval(String id) throws SQLException, Exception {
    mbd.conectar();
    con=mbd.getConexion();
    if (consultarPuntoEval(id) == null) {
        throw new SQLException("No hay PuntoEval para eliminar");
     }
     PreparedStatement pst = null;
     boolean res = false;
     try {
        pst = con.prepareStatement("delete from PuntoEval where codigo = ?");
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
    public static List<PuntoEval> listarPuntoEval() throws SQLException, Exception {
      mbd.conectar();
        con=mbd.getConexion();
        ResultSet rs = null;
     PreparedStatement pst = null;
     List<PuntoEval> listaPuntoEval = new LinkedList();
     try {
        pst = con.prepareStatement("select * from PuntoEval ");
        rs = pst.executeQuery();
        while(rs.next()) {
           listaPuntoEval.add(PuntoEval.load(rs));
        }
    } finally {
        if (rs != null) {
           rs.close();
       }
        if (pst != null) {
          pst.close();
       }
  }
    return listaPuntoEval;
}
    
    public static int ultimoPuntoEval() throws SQLException, Exception {
     mbd.conectar();
     con=mbd.getConexion();
     ResultSet rs = null;
     PreparedStatement pst = null;
     int ultimo=0;
     try {
        pst = con.prepareStatement("select (max(codigo)+1) as ul from Puntoeval ");
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
