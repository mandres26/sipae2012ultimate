/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ManejadoreaOtros;

import Conceptos.Empleado;
import Utilidades.ManejadorBaseDatos;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;


/**
 *
 * @author Dario A
 */

public class ControlEmpleado {
    
     static Connection con;
    static ManejadorBaseDatos mbd = ManejadorBaseDatos.getInstancia();

    public static void registrarEmpleado(Empleado empleado) throws SQLException, Exception {
        mbd.conectar();
        con = (Connection) mbd.getConexion();
        if (con == null) {
            throw new SQLException("no hay conexion");
        }
        PreparedStatement pst = null;//hacer nula la consulata.....
        try {
            pst = (PreparedStatement) con.prepareStatement("Insert Into Empleado values(?,?,?,?,?,?,?)");
            pst.setString(1, empleado.getVar_cedula());
            pst.setString(2, empleado.getVar_nombre());
            pst.setString(3,empleado.getVar_apellido());
            pst.setString(4,empleado.getVar_sexo());
            pst.setString(5,empleado.getVar_estadoCivil());
            pst.setString(6,empleado.getVar_direccion());
            pst.setString(7,empleado.getTipoempleado().getVar_codigo_tipoempleado());
            pst.executeUpdate();
        } finally {
            if (pst != null) {
                pst.close();
            }
        }


    }
    
    public static Empleado consultarEmpleado(String emp) throws SQLException, Exception {
        mbd.conectar();
        con = (Connection) mbd.getConexion();

        ResultSet rs = null;
        PreparedStatement pst = null;
        Empleado empleado = null;
        try {
            pst = (PreparedStatement) con.prepareStatement("select * from Empleado where var_cedula = ?");
            pst.setString(1, emp.trim());

            rs = pst.executeQuery();
            while (rs.next()) {

                empleado = Empleado.load(rs);
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                pst.close();
            }
            return empleado;
        }
    }

    public static boolean existeEmpleado(String ref) throws SQLException, Exception {
        mbd.conectar();
        con = (Connection) mbd.getConexion();
        if (ref == null) {
            throw new SQLException("No hay elemento clave de la clase Empleado");
        }
        ResultSet rs = null;
        PreparedStatement pst = null;
        boolean empleado = false;
        try {
            pst = (PreparedStatement) con.prepareStatement("select * from Empleado where var_cedula = ?");
            pst.setString(1, ref.trim());

            rs = pst.executeQuery();
            while (rs.next()) {

                empleado = true;
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                pst.close();
            }
            return empleado;
        }


    }

    public static boolean ActualizarEmpleado(Empleado empleado, String id) throws SQLException, Exception {
        mbd.conectar();
        con = (Connection) mbd.getConexion();
        if (consultarEmpleado(id) == null) {
            throw new SQLException("Empleado no registrado");
        }
        PreparedStatement pst = null;
        boolean res = false;
        try {
            pst = (PreparedStatement) con.prepareStatement("Update Empleado set var_cedula = ?, var_nombre = ?, var_apellido =?,var_sexo=?,var_estadocivil=?,var_direccion=?,var_telefono=?,var_codempleado=?  where var_cedula= ?");
            pst.setString(1, empleado.getVar_cedula());
            pst.setString(2, empleado.getVar_nombre());
            pst.setString(3,empleado.getVar_apellido());
            pst.setString(4,empleado.getVar_sexo());
            pst.setString(5,empleado.getVar_estadoCivil());
            pst.setString(6,empleado.getVar_direccion());
            pst.setString(7,empleado.getTipoempleado().getVar_codigo_tipoempleado());

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

    public static boolean EliminarEmpleado(String id) throws SQLException, Exception {
        mbd.conectar();
        con = (Connection) mbd.getConexion();
        if (consultarEmpleado(id) == null) {
            throw new SQLException("No hay Empleado para eliminar");
        }
        PreparedStatement pst = null;
        boolean res = false;
        try {
            pst = (PreparedStatement) con.prepareStatement("delete from Empleado where var_cedula = ?");
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
  
    public static List<Empleado> listarEmpleado() throws SQLException, Exception {
        mbd.conectar();
        con = (Connection) mbd.getConexion();
        ResultSet rs = null;
        PreparedStatement pst = null;
        List<Empleado> listaempleado = new LinkedList();
        try {
            pst = (PreparedStatement) con.prepareStatement("select * from Empleado ");
            rs = pst.executeQuery();
            while (rs.next()) {
                listaempleado.add(Empleado.load(rs));
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                pst.close();
            }
        }
        return listaempleado;
    }
}
