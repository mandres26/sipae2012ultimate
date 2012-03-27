/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ManejadorSEvaluacion;


import Conceptos.Actividades;
import Utilidades.ManejadorBaseDatos;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;
/**
 *
 * @author a102
 */
public class ControlActividades {
static Connection con;
static ManejadorBaseDatos mbd=ManejadorBaseDatos.getInstancia();
public static Actividades consultarActividades(String codact) throws SQLException, Exception {
    mbd.conectar();
    con=mbd.getConexion();
     String codactc=codact +"";
      if (codactc==null) {
          throw new SQLException("No hay elemento clave de la clase Actividades");
     }
         ResultSet rs = null;
         PreparedStatement pst = null;
         Actividades actividad = null;
     try {
         pst = con.prepareStatement("select * from Actividades where var_codigo_actividad = ?");
         pst.setString(1,codact );

         rs = pst.executeQuery();
         while(rs.next()) {

             actividad =Actividades.load(rs);
         }
    } finally {
         if (rs != null) {
            rs.close();
         }
         if (pst != null) {
           pst.close();
         }
          return actividad;
    }
}
public static boolean existeActividades(int codact) throws SQLException, Exception {
    mbd.conectar();
    con=mbd.getConexion();
     String codactc=codact +"";
      if (codactc==null) {
          throw new SQLException("No hay elemento clave de la clase Actividades");
     }
         ResultSet rs = null;
         PreparedStatement pst = null;
         boolean actividad = false;
     try {
         pst = con.prepareStatement("select * from Actividades where codActividades = ?");
         pst.setInt(1, codact);

         rs = pst.executeQuery();
         while(rs.next()) {

             actividad = true;
         }
    } finally {
         if (rs != null) {
            rs.close();
         }
         if (pst != null) {
           pst.close();
         }
          return actividad;
    }
}

public static void registrarActividades(Actividades actividades) throws SQLException, Exception {
    mbd.conectar();
    con=mbd.getConexion();
     if (con == null ) {
          throw new SQLException("no hay conexion" );
     }
     PreparedStatement pst = null;//hacer nula la consulata.....
     try {
          pst = con.prepareStatement("Insert Into Actividades values(?,?,?,?,?,?,?,?)");
          pst.setString(1,actividades.getVar_codigo_actividad());
          pst.setString(2,actividades.getVar_asignatura().getVar_codigo_asignatura());
          //pst.setString(3,actividades.getVar_fecha_ejecucion_actividad());
          //pst.setBoolean(4,actividades.isEjecutada());
          //pst.setDouble(5,actividades.getPorcentaje());
          //pst.setInt(6,actividades.getPeriodo());
          //pst.setString(7,actividades.getTema());
          //pst.setString(8,actividades.getDescripcion());

          pst.executeUpdate();
    }finally {
        if (pst != null) {
             pst.close();
        }
   }
}
public static boolean ActualizarActividad (Actividades actividades, String codacti) throws SQLException, Exception {
    mbd.conectar();
    con=mbd.getConexion();
    if ( consultarActividades(codacti) == null) {
           throw new SQLException ("Actividades no registradas" );
       }
       PreparedStatement pst = null;
       boolean res = false;
       try {
         pst = con.prepareStatement("Update Actividades set  codActividades = ? , codAsignatura = ?,  fecha=?, ejecutada=?, porcentaje=?, periodo = ?, tema=?, descripcion=?, where codActividades = ?" ) ;
         /*/ pst.setInt(1,actividades.getCodactividad());
          pst.setInt(2,actividades.getAsignatura().getCodAsignatura());
          pst.setString(3,actividades.getFecha());
          pst.setBoolean(4,actividades.isEjecutada());
          pst.setDouble(5,actividades.getPorcentaje());
          pst.setInt(6,actividades.getPeriodo());
          pst.setString(7,actividades.getTema());
          pst.setString(8,actividades.getDescripcion());
          pst.setInt(9 , codacti);*/
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
public static boolean EliminarActividades(String codact) throws SQLException, Exception {
    mbd.conectar();
    con=mbd.getConexion();
    if (consultarActividades(codact) == null) {
        throw new SQLException("No hay Actividades para eliminar");
     }
     PreparedStatement pst = null;
     boolean res = false;
     try {
        pst = con.prepareStatement("delete from Actividades where codActividades = ?");
        pst.setString(1, codact);
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
public static List<Actividades> listarActividades() throws SQLException, Exception {
      mbd.conectar();
        con=mbd.getConexion();
        ResultSet rs = null;
     PreparedStatement pst = null;
     List<Actividades> listaactividades = new LinkedList();
     try {
        pst = con.prepareStatement("select * from Actividades ");
        rs = pst.executeQuery();
        while(rs.next()) {
           listaactividades.add(Actividades.load(rs));
        }
    } finally {
        if (rs != null) {
           rs.close();
       }
        if (pst != null) {
          pst.close();
       }
  }
    return listaactividades;
}

public static List<Double> notaDefActividad (int codEst) throws SQLException, Exception {
    double def=0.0;
    mbd.conectar();
    con=mbd.getConexion();
    PreparedStatement pst =null;
    ResultSet rs=null;
    List<Double> defs = new LinkedList();
   try {
     pst = con.prepareStatement("select definitiva from notadef where var_id_estudiante ='"+codEst+"'");
     rs = pst.executeQuery();
     while (rs.next()){
     def =rs.getDouble(1);
     defs.add(def);
     }
  } finally {
        if (rs != null) {
           rs.close();
       }
        if (pst != null) {
          pst.close();
       }
  }
     return defs;
}
}