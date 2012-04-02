/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ManejadorSEvaluacion;

import Conceptos.Logro;
import Utilidades.ManejadorBaseDatos;
import java.sql.SQLException;
import java.util.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;
/**
 *
 * @author josedavo
 */
public class ControladorLogro {
    
    static Connection con;
static ManejadorBaseDatos mbd=ManejadorBaseDatos.getInstancia();
    public static List<Logro> listarlogro(int codAsig) throws SQLException, Exception {
      mbd.conectar();
        con=mbd.getConexion();
        ResultSet rs = null;
     PreparedStatement pst = null;
     List<Logro> listalogros = new LinkedList();
     try {
        pst = con.prepareStatement("select logros.* from Asignatura a ,Actividades act,Logros_Actividad la,Logros logros where act.codAsignatura=a.codAsignatura and act.idActividades=la.codActividad and la.codLogros=logros.codLogro and a.codAsignatura = '"+codAsig+"'");


        rs = pst.executeQuery();
        while(rs.next()) {
           listalogros.add(Logro.load(rs));
        }
    } finally {
        if (rs != null) {
           rs.close();
       }
        if (pst != null) {
          pst.close();
       }
  }
    return listalogros;
}
public static List<Logro> listarlogros() throws SQLException, Exception {
      mbd.conectar();
        con=mbd.getConexion();
        ResultSet rs = null;
     PreparedStatement pst = null;
     List<Logro> listalogro = new LinkedList();
     try {
        pst = con.prepareStatement("select * from Logro ");
        rs = pst.executeQuery();
        while(rs.next()) {
           listalogro.add(Logro.load(rs));
        }
    } finally {
        if (rs != null) {
           rs.close();
       }
        if (pst != null) {
          pst.close();
       }
  }
    return listalogro;
    }

  public static Logro ConsultarLogro(String codigologro) throws SQLException, Exception {
     mbd.conectar();
    con=mbd.getConexion();
      
      if (codigologro == null) {
          throw new SQLException("No hay elemento clave de la clase Logro");
     }
         ResultSet rs = null;
         PreparedStatement pst = null;
         Logro logro = null;
     try {
         pst = con.prepareStatement("select * from Logro where var_codigo_logro = ?");
        
         pst.setString(1, codigologro.trim());
         rs = pst.executeQuery();
         while(rs.next()) {
             logro = Logro.load(rs);
         }
    } finally {
         if (rs != null) {
            rs.close();
         }
         if (pst != null) {
           pst.close();
         }
          return logro;
    }
}
}
