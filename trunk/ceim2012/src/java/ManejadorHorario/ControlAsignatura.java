/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ManejadorHorario;

import Conceptos.Asignatura;

/**
 *
 * @author AprendizSena
 */
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
public class ControlAsignatura {

    static Connection con;
    static ManejadorBaseDatos mbd = ManejadorBaseDatos.getInstancia();

    public static void registrarAsignatura(Asignatura asignatura) throws SQLException, Exception {
        mbd.conectar();
        con = (Connection) mbd.getConexion();
        if (con == null) {
            throw new SQLException("no hay conexion");
        }
        PreparedStatement pst = null;//hacer nula la consulata.....
        try {
            pst = (PreparedStatement) con.prepareStatement("Insert Into Asignatura values(?,?,?)");
            pst.setString(1, asignatura.getVar_codigo_asignatura());
            pst.setString(2, asignatura.getVar_nombre_asignatura());
            pst.setInt(3,asignatura.getVar_intensidad_horaria());
            pst.executeUpdate();
        } finally {
            if (pst != null) {
                pst.close();
            }
        }


    }
    
    public static Asignatura consultarAsignatura(String ref) throws SQLException, Exception {
        mbd.conectar();
        con = (Connection) mbd.getConexion();

        ResultSet rs = null;
        PreparedStatement pst = null;
        Asignatura asignatura = null;
        try {
            pst = (PreparedStatement) con.prepareStatement("select * from asignatura where var_codigo_asignatura = ?");
            pst.setString(1, ref.trim());

            rs = pst.executeQuery();
            while (rs.next()) {

                asignatura = Asignatura.load(rs);
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                pst.close();
            }
            return asignatura;
        }
    }

    public static boolean existeAsignatura(String ref) throws SQLException, Exception {
        mbd.conectar();
        con = (Connection) mbd.getConexion();
        if (ref == null) {
            throw new SQLException("No hay elemento clave de la clase Asignatura");
        }
        ResultSet rs = null;
        PreparedStatement pst = null;
        boolean asignatura = false;
        try {
            pst = (PreparedStatement) con.prepareStatement("select * from Asignatura where id = ?");
            pst.setString(1, ref.trim());

            rs = pst.executeQuery();
            while (rs.next()) {

                asignatura = true;
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                pst.close();
            }
            return asignatura;
        }


    }

    public static boolean ActualizarAsigtura(Asignatura asignatura, String id) throws SQLException, Exception {
        mbd.conectar();
        con = (Connection) mbd.getConexion();
        if (consultarAsignatura(id) == null) {
            throw new SQLException("Asignatura no registrada");
        }
        PreparedStatement pst = null;
        boolean res = false;
        try {
            pst = (PreparedStatement) con.prepareStatement("Update Clase set codigo = ?, nombre = ?,id =?,  where codigo = ?");
            pst.setString(1, asignatura.getVar_codigo_asignatura());
            pst.setString(2, asignatura.getVar_nombre_asignatura());



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

    public static boolean EliminarAsignatura(String id) throws SQLException, Exception {
        mbd.conectar();
        con = (Connection) mbd.getConexion();
        if (consultarAsignatura(id) == null) {
            throw new SQLException("No hay Asignatura para eliminar");
        }
        PreparedStatement pst = null;
        boolean res = false;
        try {
            pst = (PreparedStatement) con.prepareStatement("delete from Asignatura where id = ?");
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
  
    public static List<Asignatura> listarAsignatura() throws SQLException, Exception {
        mbd.conectar();
        con = (Connection) mbd.getConexion();
        ResultSet rs = null;
        PreparedStatement pst = null;
        List<Asignatura> listaAsignatura = new LinkedList();
        try {
            pst = (PreparedStatement) con.prepareStatement("select * from Asignatura ");
            rs = pst.executeQuery();
            while (rs.next()) {
                listaAsignatura.add(Asignatura.load(rs));
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                pst.close();
            }
        }
        return listaAsignatura;
    }
}
