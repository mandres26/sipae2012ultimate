/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ManejadorHorario;

import Conceptos.Aula;
import Utilidades.ManejadorBaseDatos;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

/**
 *
 * @author AprendizSena
 */
public class ControlAula {

    static Connection con;
    static ManejadorBaseDatos mbd = ManejadorBaseDatos.getInstancia();

    public static Aula consultarAula(String ref) throws SQLException, Exception {
        mbd.conectar();
        con = (Connection) mbd.getConexion();
        if (ref == null) {
            throw new SQLException("No hay elemento clave de la clase Aulas");
        }
        ResultSet rs = null;
        PreparedStatement pst = null;
        Aula aula = null;

        try {
            pst = (PreparedStatement) con.prepareStatement("select * from aula where var_codigo_aula = ?");
            pst.setString(1, ref.trim());

            rs = pst.executeQuery();
            while (rs.next()) {
                aula = Aula.load(rs);
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                pst.close();
            }

            return aula;
        }
    }

    public static boolean existeAula(String ref) throws SQLException, Exception {
        mbd.conectar();
        con = (Connection) mbd.getConexion();
        if (ref == null) {
            throw new SQLException("No hay elemento clave de la clase Aulas");
        }
        ResultSet rs = null;
        PreparedStatement pst = null;
        boolean aulas = false;
        try {
            pst = (PreparedStatement) con.prepareStatement("select * from Aulas where id = ?");
            pst.setString(1, ref.trim());

            rs = pst.executeQuery();
            while (rs.next()) {

                aulas = true;
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                pst.close();
            }
            return aulas;
        }


    }

    public static void registrarAula(Aula aula) throws SQLException, Exception {
        mbd.conectar();
        con = (Connection) mbd.getConexion();
        if (con == null) {
            throw new SQLException("no hay conexion");
        }
        PreparedStatement pst = null;//hacer nula la consulata.....
        try {
            pst = (PreparedStatement) con.prepareStatement("Insert Into Aulas values(?,?)");
            pst.setString(1, aula.getVar_codigo_aula());
            pst.setInt(2, aula.getVar_capacidad_aula());



            pst.executeUpdate();
        } finally {
            if (pst != null) {
                pst.close();
            }
        }


    }

    public static boolean ActualizarAula(Aula aula, String id) throws SQLException, Exception {
        mbd.conectar();
        con = (Connection) mbd.getConexion();
        if (consultarAula(id) == null) {
            throw new SQLException("Aulas no registrada");
        }
        PreparedStatement pst = null;
        boolean res = false;
        try {
            //pst = (PreparedStatement) con.prepareStatement("Update Clase set var_codigo_aula = ?, var_nombre_curso = ?,  where Var_codigo_aula = ?");
            pst.setString(1, aula.getVar_codigo_aula());
            pst.setInt(2, aula.getVar_capacidad_aula());


            pst.setString(3, id.trim());
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

    public static boolean EliminarAula(String id) throws SQLException, Exception {
        mbd.conectar();
        con = (Connection) mbd.getConexion();
        if (consultarAula(id) == null) {
            throw new SQLException("No hay Aulas para eliminar");
        }
        PreparedStatement pst = null;
        boolean res = false;
        try {
            pst = (PreparedStatement) con.prepareStatement("delete from Aulas where var_codigo_aula = ?");
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

    public static List<Aula> listarAulas() throws SQLException, Exception {
        mbd.conectar();
        con = (Connection) mbd.getConexion();
        ResultSet rs = null;
        PreparedStatement pst = null;
        List<Aula> listaAulas = new LinkedList();
        try {
            pst = (PreparedStatement) con.prepareStatement("select * from Aula ");
            rs = pst.executeQuery();
            while (rs.next()) {
                listaAulas.add(Aula.load(rs));
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                pst.close();
            }
        }
        return listaAulas;
    }
}
