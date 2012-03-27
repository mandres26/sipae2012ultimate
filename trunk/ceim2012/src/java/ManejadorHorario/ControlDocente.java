/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ManejadorHorario;

import Conceptos.Docente;
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
public class ControlDocente {

    static Connection con;
    static ManejadorBaseDatos mbd = ManejadorBaseDatos.getInstancia();

    public static void registrarDocente(Docente docente) throws SQLException, Exception {
        mbd.conectar();
        con = (Connection) mbd.getConexion();
        if (con == null) {
            throw new SQLException("no hay conexion");
        }
        PreparedStatement pst = null;//hacer nula la consulata.....
        try {
            pst = (PreparedStatement) con.prepareStatement("INSERT INTO docente values(?,?,?,?,?,?,?,?)");
            pst.setString(1, docente.getVar_id_docente());
            pst.setString(2, docente.getVar_codigo_docente());
            pst.setString(3, docente.getVar_nombre_docente());
            pst.setString(4, docente.getVar_apellido_docente());
            pst.setString(5, docente.getVar_direccion_docente());
            pst.setString(6, docente.getVar_sexo_docente());
            pst.setString(7, docente.getVar_usuario_docente());
            pst.setString(8, docente.getVar_pass_docente());
            pst.executeUpdate();
        } finally {
            if (pst != null) {
                pst.close();
            }
        }


    }

    public static Docente consultarDocente(String ref) throws Exception {
        mbd.conectar();
        con = (Connection) mbd.getConexion();
        ResultSet rs = null;
        PreparedStatement pst = null;
        Docente docente = null;

        try {
            pst = (PreparedStatement) con.prepareStatement("select * from docente where var_id_docente = ?");
            pst.setString(1, ref);

            rs = pst.executeQuery();
            
            while (rs.next()) {
                docente = Docente.load(rs);
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                pst.close();
            }
            return docente;
        }
    }

    public static boolean existeDocente(String ref) throws SQLException, Exception {
        mbd.conectar();
        con = (Connection) mbd.getConexion();
        if (ref == null) {
            throw new SQLException("No hay elemento clave de la clase Docente");
        }
        ResultSet rs = null;
        PreparedStatement pst = null;
        boolean clase = false;
        try {
            pst = (PreparedStatement) con.prepareStatement("select * from Docente where var_id_docente = ?");
            pst.setString(1, ref.trim());

            rs = pst.executeQuery();
            while (rs.next()) {

                clase = true;
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                pst.close();
            }
            return clase;
        }


    }

    public static boolean ActualizarDocente(Docente docente, String var_id_docente) throws SQLException, Exception {
        mbd.conectar();
        con = (Connection) mbd.getConexion();
        if (consultarDocente(var_id_docente) == null) {
            throw new SQLException("Docente no registrado(a)");
        }
        PreparedStatement pst = null;
        boolean res = false;
        try {
            pst = (PreparedStatement) con.prepareStatement("Update docente set var_id_docente = ?, var_codigo_docente  = ? , var_nombre_docente = ?,var_apellido_docente = ?,var_telefono_docente = ?,var_direccion_docente = ?,var_sexp_docente = ?,  where var_id_docente = ?, = ?");
            pst.setString(1, docente.getVar_id_docente());
            pst.setString(2, docente.getVar_codigo_docente());
            pst.setString(3, docente.getVar_nombre_docente());
            pst.setString(4, docente.getVar_apellido_docente());
            pst.setString(5, docente.getVar_direccion_docente());
            pst.setString(6, docente.getVar_sexo_docente());
            pst.setString(7, docente.getVar_usuario_docente());
            pst.setString(8, docente.getVar_pass_docente());
            pst.setString(9, var_id_docente.trim());

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

    public static boolean EliminarDocente(String var_id_docente) throws SQLException, Exception {
        mbd.conectar();
        con = (Connection) mbd.getConexion();
        if (consultarDocente(var_id_docente) == null) {
            throw new SQLException("No hay Docente para eliminar");
        }
        PreparedStatement pst = null;
        boolean res = false;
        try {
            pst = (PreparedStatement) con.prepareStatement("delete from Docente where var_id_docente = ?");
            pst.setString(1, var_id_docente.trim());
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
    
    public static List<Docente> listarDocente() throws SQLException, Exception {
        mbd.conectar();
        con = (Connection) mbd.getConexion();
        ResultSet rs = null;
        PreparedStatement pst = null;
        List<Docente> listaDocente = new LinkedList();
        try {
            pst = (PreparedStatement) con.prepareStatement("select * from Docente ");
            rs = pst.executeQuery();
            while (rs.next()) {
                listaDocente.add(Docente.load(rs));
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                pst.close();
            }
        }
        return listaDocente;
    }
    
    public static boolean existeDocente(String usuario, String pass) throws SQLException, Exception {
    mbd.conectar();
    con=mbd.getConexion();
      if (usuario == null) {
          throw new SQLException("El usuario esta vacio");
     }
         ResultSet rs = null;
         PreparedStatement pst = null;
         boolean exist = false;
     try {
         pst = con.prepareStatement("select * from Docente where user=? and pass=?");
         pst.setString(1, usuario.trim());
         pst.setString(2, pass);

         rs = pst.executeQuery();
         while(rs.next()) { 
              exist = true;
         }
    } finally {
         if (rs != null) {
            rs.close();
         }
         if (pst != null) {
           pst.close();
         }
          return exist;
    }
}
}
