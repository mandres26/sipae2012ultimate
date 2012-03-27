/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ManejadoreaOtros;

import Conceptos.TipoEmpleado;
import Utilidades.ManejadorBaseDatos;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author dell
 */
public class ControlTipoEmpleado {
    static Connection con;
static ManejadorBaseDatos mbd=ManejadorBaseDatos.getInstancia();

public static TipoEmpleado consultartipoEmpleado(String codempl) throws SQLException, Exception {
    mbd.conectar();
    con=mbd.getConexion();
     String codemp=codempl +"";
      if (codemp==null) {
          throw new SQLException("No hay elemento clave de la clase TipoEmpleado");
     }
         ResultSet rs = null;
         PreparedStatement pst = null;
        TipoEmpleado tipoempleado = null;
     try {
         pst = con.prepareStatement("select * from TipoEmpleado where var_codigo_tipoempleado = ?");
         pst.setString(1, codempl );

         rs = pst.executeQuery();
         while(rs.next()) {

             tipoempleado =TipoEmpleado.load(rs);
         }
    } finally {
         if (rs != null) {
            rs.close();
         }
         if (pst != null) {
           pst.close();
         }
          return  tipoempleado;
    }
}
}
