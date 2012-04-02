/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ManejadorHorario;

import Conceptos.Aula;
import Conceptos.Bloque;
import Utilidades.ManejadorBaseDatos;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Usuario
 */
public class ControlBloque {
    static Connection con;
    static ManejadorBaseDatos mbd = ManejadorBaseDatos.getInstancia();

    public static Bloque consultarBloque(String ref) throws SQLException, Exception {
        mbd.conectar();
        con = (Connection) mbd.getConexion();
        if (ref == null) {
            throw new SQLException("No hay elemento clave de la clase Bloque");
        }
        ResultSet rs = null;
        PreparedStatement pst = null;
        Bloque bloque = null;

        try {
            pst = (PreparedStatement) con.prepareStatement("select * from Bloque where var_codigo_bloque = ?");
            pst.setString(1, ref.trim());

            rs = pst.executeQuery();
            while (rs.next()) {
                bloque = Bloque.load(rs);
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                pst.close();
            }

            return bloque;
        }
    }
 
}
