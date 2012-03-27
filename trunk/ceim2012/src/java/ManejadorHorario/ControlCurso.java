/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ManejadorHorario;

import Conceptos.Curso;
import Utilidades.ManejadorBaseDatos;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

/**
 *
 * @author aprendiz
 */
public class ControlCurso {

    static Connection con;
    static ManejadorBaseDatos mbd = ManejadorBaseDatos.getInstancia();

    public static Curso consultarCurso(String ref) throws Exception {
        mbd.conectar();
        con = (Connection) mbd.getConexion();

        ResultSet rs = null;
        PreparedStatement pst = null;
        Curso curso = null;

        try {
            pst = (PreparedStatement) con.prepareStatement("select * from curso where var_codigo_curso = ?");
            pst.setString(1, ref);

            rs = pst.executeQuery();

            while (rs.next()) {
                curso = Curso.load(rs);
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                pst.close();
            }
            return curso;
        }
    }

    public static boolean existeCurso(String ref) throws SQLException, Exception {
        mbd.conectar();
        con = (Connection) mbd.getConexion();
        if (ref == null) {
            throw new SQLException("No hay elemento clave de la clase Curso");
        }
        ResultSet rs = null;
        PreparedStatement pst = null;
        boolean curso = false;
        try {
            pst = (PreparedStatement) con.prepareStatement("select * from Curso where var_codigo_curso = ?");

            pst.setString(1, ref.trim());

            rs = pst.executeQuery();
            while (rs.next()) {

                curso = true;
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                pst.close();
            }
            return curso;
        }


    }

    public static void registrarCurso(Curso curso) throws SQLException, Exception {
        mbd.conectar();
        con = (Connection) mbd.getConexion();
        if (con == null) {
            throw new SQLException("no hay conexion");
        }
        PreparedStatement pst = null;//hacer nula la consulata.....
        try {
            pst = (PreparedStatement) con.prepareStatement("Insert Into Curso values(?,?)");
            pst.setString(1, curso.getVar_codigo_curso());
            pst.setString(2, curso.getVar_nombre_curso());



            pst.executeUpdate();
        } finally {
            if (pst != null) {
                pst.close();
            }
        }


    }
    // aqui preguntar??

    public static boolean ActualizarCurso(Curso curso, String id) throws SQLException, Exception {
        mbd.conectar();
        con = (Connection) mbd.getConexion();
        if (consultarCurso(id) == null) {
            throw new SQLException("Curso no registrado");
        }
        PreparedStatement pst = null;
        boolean res = false;
        try {
            pst = (PreparedStatement) con.prepareStatement("Update Clase set var_codigo_curso = ?, var_nombre_curso = ?,  where var_codigo_curso = ?");
            pst.setString(1, curso.getVar_codigo_curso());
            pst.setString(2, curso.getVar_nombre_curso());
            pst.setString(3, id);

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

    public static boolean EliminarCurso(String id) throws SQLException, Exception {
        mbd.conectar();
        con = (Connection) mbd.getConexion();
        if (consultarCurso(id) == null) {
            throw new SQLException("No hay Curso para eliminar");
        }
        PreparedStatement pst = null;
        boolean res = false;
        try {
            pst = (PreparedStatement) con.prepareStatement("delete from Curso where var_codigo_curso = ?");
            pst.setString(1, id);
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

    public static List<Curso> listarCurso() throws SQLException, Exception {
        mbd.conectar();
        con = (Connection) mbd.getConexion();

        ResultSet rs = null;
        PreparedStatement pst = null;
        List<Curso> listaCurso = new LinkedList();

        try {
            pst = (PreparedStatement) con.prepareStatement("select * from Curso");
            rs = pst.executeQuery();

            while (rs.next()) {
                listaCurso.add(Curso.load(rs));
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                pst.close();
            }
        }

        return listaCurso;
    }
}
