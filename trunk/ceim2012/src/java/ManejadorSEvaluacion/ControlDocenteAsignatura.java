/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ManejadorSEvaluacion;


import Conceptos.DocenteAsignatura;
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
public class ControlDocenteAsignatura {
static Connection con;
static ManejadorBaseDatos mbd=ManejadorBaseDatos.getInstancia();

public static DocenteAsignatura consultarDocenteAsignatura(String iddoc) throws SQLException, Exception {
    mbd.conectar();
    con=mbd.getConexion();
     
      if (iddoc==null) {
          throw new SQLException("No hay elemento clave de la clase DocenteAsignatura");
     }
         ResultSet rs = null;
         PreparedStatement pst = null;
        DocenteAsignatura docenteasignatura = null;
     try {
         pst = con.prepareStatement("select * from DocenteAsignatura docasig,Asignatura asig,Docente doc where docasig.var_codigo_asignatura=asig.var_codigo_asignatura and docasig.var_codigo_docente=doc.var_codigo_docente and doc.var_codigo_docente='" + iddoc+ "'");
         pst.setString(1, iddoc );

         rs = pst.executeQuery();
         while(rs.next()) {

             docenteasignatura =DocenteAsignatura.load(rs);
         }
    } finally {
         if (rs != null) {
            rs.close();
         }
         if (pst != null) {
           pst.close();
         }
          return  docenteasignatura;
    }
}
public static boolean existeDocenteAsignatura(int codocasig) throws SQLException, Exception {
    mbd.conectar();
    con=mbd.getConexion();
     String codocasig1=codocasig +"";
      if (codocasig1==null) {
          throw new SQLException("No hay elemento clave de la clase DocenteAsignatura");
     }
         ResultSet rs = null;
         PreparedStatement pst = null;
         boolean docasig = false;
     try {
         pst = con.prepareStatement("select * from DocenteAsignatura where var_coddoceasig = ?");
         pst.setInt(1, codocasig);

         rs = pst.executeQuery();
         while(rs.next()) {

             docasig = true;
         }
    } finally {
         if (rs != null) {
            rs.close();
         }
         if (pst != null) {
           pst.close();
         }
          return docasig;
    }
}

public static void registrarDocenteAsignatura(DocenteAsignatura docenteasignatura) throws SQLException, Exception {
    mbd.conectar();
    con=mbd.getConexion();
     if (con == null ) {
          throw new SQLException("no hay conexion" );
     }
     PreparedStatement pst = null;//hacer nula la consulata.....
     try {
          pst = con.prepareStatement("Insert Into DocenteAsignatura values(?,?,?)");
          pst.setInt(1,docenteasignatura.getCoddocasig());
          pst.setString(2,docenteasignatura.getDocente().getVar_id_docente());
          pst.setString(3,docenteasignatura.getAsignatura().getVar_codigo_asignatura());
          

          pst.executeUpdate();
    }finally {
        if (pst != null) {
             pst.close();
        }
   }
}
public static boolean ActualizarDocenteAsignatura (DocenteAsignatura docenteasignatura, String coddocasig) throws SQLException, Exception {
    mbd.conectar();
    con=mbd.getConexion();
    if ( consultarDocenteAsignatura(coddocasig) == null) {
           throw new SQLException ("DocenteAsignatura no registradas" );
       }
       PreparedStatement pst = null;
       boolean res = false;
       try {
         pst = con.prepareStatement("Update DocenteAsignatura set  coddocasig = ? , IdetDocente = ?,  CodAsignatura, where coddocasig = ?" ) ;
          pst.setInt(1,docenteasignatura.getCoddocasig());
           pst.setString(2,docenteasignatura.getDocente().getVar_id_docente());
          pst.setString(3,docenteasignatura.getAsignatura().getVar_codigo_asignatura());
         
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
public static boolean EliminarDocenteAsignatura(String coddocasig) throws SQLException, Exception {
    mbd.conectar();
    con=mbd.getConexion();
    if (consultarDocenteAsignatura(coddocasig) == null) {
        throw new SQLException("No hay DocenteAsignatura para eliminar");
     }
     PreparedStatement pst = null;
     boolean res = false;
     try {
        pst = con.prepareStatement("delete from DocenteAsignatura where var_coddocasig = ?");
        pst.setString(1, coddocasig);
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
public static List<DocenteAsignatura> listarDocenteAsignatura(String iddocente) throws SQLException, Exception {
      mbd.conectar();
        con=mbd.getConexion();
        ResultSet rs = null;
     PreparedStatement pst = null;
     List<DocenteAsignatura> listadocenteasignatura = new LinkedList();
     try {
        pst = con.prepareStatement("select * from DocenteAsignatura docasig,Asignatura asig,Docente doc where docasig.var_codigo_asignatura=asig.var_codigo_asignatura and docasig.var_codigo_docente=doc.var_codigo_docente and doc.var_codigo_docente='"+iddocente+"'");
        rs = pst.executeQuery();
        while(rs.next()) {
           listadocenteasignatura.add(DocenteAsignatura.load(rs));
        }
    } finally {
        if (rs != null) {
           rs.close();
       }
        if (pst != null) {
          pst.close();
       }
  }
    return listadocenteasignatura;
}



}
