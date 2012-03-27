/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ManejadorAsistenciaDisciplina;

import Conceptos.Indisciplina;
import Utilidades.ManejadorBaseDatos;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author root
 */
public class controlIndisciplina {
    static Connection con;
    static ManejadorBaseDatos mbd = ManejadorBaseDatos.getInstancia();

    public static void registrarCaso(Indisciplina caso) throws SQLException, Exception {
        mbd.conectar();
        con = mbd.getConexion();

        if (con == null) {
            throw new SQLException("no hay conexion");
        }

        PreparedStatement pst = null;
        try {
            pst = con.prepareStatement("Insert into casosindisciplina values(?,?,?,?,?,?,?)");
            pst.setInt(1, caso.getVar_codigo());
            pst.setString(2, caso.getVar_nombreCaso());
            pst.setString(3, caso.getVar_descripcion());
            pst.setString(4,caso.getHorario().getDocente().getVar_codigo_docente());
            pst.setString(5, caso.getVar_estado());
            pst.setTimestamp(6, caso.getVar_fecha());

            pst.executeUpdate();
        } finally {
            if (pst != null) {
                pst.close();
            }
        }
    }

}
