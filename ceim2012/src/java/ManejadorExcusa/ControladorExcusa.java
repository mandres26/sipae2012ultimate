package ManejadorExcusa;

/**
 *
 * @author Luis
 */
import Conceptos.Docente;
import Conceptos.Estudiante;
import Conceptos.Excusa;
import Utilidades.ManejadorBaseDatos;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;
import java.sql.Date;
import java.util.LinkedList;
import java.util.List;

public class ControladorExcusa {

    static Connection con;
    static ManejadorBaseDatos mbd = ManejadorBaseDatos.getInstancia();

    public static void registrarExcusa(Excusa excusa) throws SQLException, Exception {
        mbd.conectar();
        con = mbd.getConexion();
        if (con == null) {
            throw new SQLException("no hay conexion");
        }
        PreparedStatement pst = null;//hacer nula la consulata.....
        ResultSet rs = null;
        try {
            pst = con.prepareStatement("INSERT INTO excusa values(?,?,?,?,?,?)");
            pst.setInt(1, excusa.getIdExcusa());
            pst.setString(2, excusa.getFechaExcusa());
            pst.setString(3, excusa.getFechaInicio());
            pst.setString(4, excusa.getFechaFinal());
            pst.setString(5, excusa.getMotivo());
            pst.setInt(6, excusa.getEstado());
            pst.executeUpdate();//actualizamos la tabla. estudiante
            
        } catch (SQLException ex) {
            throw new SQLException("Resultado Negativo de la Base de Datos " + ex.getMessage());
        } finally {
            if (pst != null) {
                pst.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
    }
    
    public static void aceptarExcusa(Excusa excusa) throws SQLException, Exception {
        mbd.conectar();
        con = mbd.getConexion();
        if (con == null) {
            throw new SQLException("no hay conexion");
        }
        PreparedStatement pst = null;//hacer nula la consulata.....
        ResultSet rs = null;
        try {
            pst = con.prepareStatement("UPDATE excusa SET estado =1 WHERE idexcusa = ?;");
            pst.setInt(1, excusa.getIdExcusa());
            pst.executeUpdate();//actualizamos la tabla. estudiante
            
        } catch (SQLException ex) {
            throw new SQLException("Resultado Negativo de la Base de Datos " + ex.getMessage());
        } finally {
            if (pst != null) {
                pst.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
    }
    
    public static void rechazarExcusa(Excusa excusa) throws SQLException, Exception {
        mbd.conectar();
        con = mbd.getConexion();
        if (con == null) {
            throw new SQLException("no hay conexion");
        }
        PreparedStatement pst = null;//hacer nula la consulata.....
        ResultSet rs = null;
        try {
            pst = con.prepareStatement("UPDATE excusa SET estado =2 WHERE idexcusa = ?;");
            pst.setInt(1, excusa.getIdExcusa());
            pst.executeUpdate();//actualizamos la tabla. estudiante
            
        } catch (SQLException ex) {
            throw new SQLException("Resultado Negativo de la Base de Datos " + ex.getMessage());
        } finally {
            if (pst != null) {
                pst.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
    }
    
    public static void registrarExcusaEstudiante(Excusa excusa,Estudiante estudiante) throws SQLException, Exception {
        mbd.conectar();
        con = mbd.getConexion();
        if (con == null) {
            throw new SQLException("no hay conexion");
        }
        PreparedStatement pst = null;//hacer nula la consulata.....
        ResultSet rs = null;
        try {
            pst = con.prepareStatement("INSERT INTO excusa_estudiante values(?,?,?)");
            pst.setInt(1, excusa.getIdExcusa());
            pst.setString(2, estudiante.getVar_codigo_estudiante());
            pst.setString(3, estudiante.getVar_identificacion_estudiante());
            pst.executeUpdate();//actualizamos la tabla. estudiante
            
        } catch (SQLException ex) {
            throw new SQLException("Resultado Negativo de la Base de Datos " + ex.getMessage());
        } finally {
            if (pst != null) {
                pst.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
    }
    
    public static void registrarExcusaDocente(Excusa excusa,Docente docente) throws SQLException, Exception {
        mbd.conectar();
        con = mbd.getConexion();
        if (con == null) {
            throw new SQLException("no hay conexion");
        }
        PreparedStatement pst = null;//hacer nula la consulata.....
        ResultSet rs = null;
        try {
            pst = con.prepareStatement("INSERT INTO excusa_docente values(?,?,?)");
            pst.setInt(1, excusa.getIdExcusa());
            pst.setString(2, docente.getVar_codigo_docente());
            pst.setString(3, docente.getVar_id_docente());
            pst.executeUpdate();//actualizamos la tabla. estudiante
            
        } catch (SQLException ex) {
            throw new SQLException("Resultado Negativo de la Base de Datos " + ex.getMessage());
        } finally {
            if (pst != null) {
                pst.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
    }
    
    public static int consultarIdExcusa() throws SQLException, Exception {
        mbd.conectar();
        con = mbd.getConexion();
        try {
            String sentencia = "SELECT COUNT(*) FROM excusa;";
            PreparedStatement pstmt = con.prepareStatement(sentencia);
            ResultSet filasBD = pstmt.executeQuery();
            int numrow = -1;
            while (filasBD.next()) {
                numrow = filasBD.getInt("COUNT(*)");
            }
            if (numrow == -1) {
                numrow = 0;
            }
            if (pstmt != null) {
                pstmt.close();
            }
            if (filasBD != null) {
                filasBD.close();
            }
            return numrow;
        } catch (Exception ex) {
            throw new SQLException("Resultado Negativo de la Base de Datos " + ex.getMessage());
        }
    }
    
    public static LinkedList<Integer> listaIdExcusas(Estudiante estudiante) throws SQLException, Exception {
        mbd.conectar();
        con = mbd.getConexion();
        try {
            LinkedList<Integer> listaExcusas = new LinkedList<Integer>();
            String sentencia = "SELECT excusa_idexcusa FROM excusa_estudiante WHERE estudiante_var_codigo_estudiante = ?;";
            PreparedStatement pstmt = con.prepareStatement(sentencia);
            pstmt.setString(1, estudiante.getVar_codigo_estudiante());
            ResultSet filasBD = pstmt.executeQuery();
            while (filasBD.next()) {
                listaExcusas.add(filasBD.getInt(1));
            }
            if (pstmt != null) {
                pstmt.close();
            }
            if (filasBD != null) {
                filasBD.close();
            }
            return listaExcusas;
        } catch (Exception ex) {
            throw new SQLException("Resultado Negativo de la Base de Datos " + ex.getMessage());
        }
    }
    
    public static LinkedList<Integer> listaIdExcusasDocente(Docente docente) throws SQLException, Exception {
        mbd.conectar();
        con = mbd.getConexion();
        try {
            LinkedList<Integer> listaExcusas = new LinkedList<Integer>();
            String sentencia = "SELECT excusa_idexcusa FROM excusa_docente WHERE docente_var_codigo_docente = ?;";
            PreparedStatement pstmt = con.prepareStatement(sentencia);
            pstmt.setString(1, docente.getVar_codigo_docente());
            ResultSet filasBD = pstmt.executeQuery();
            while (filasBD.next()) {
                listaExcusas.add(filasBD.getInt(1));
            }
            if (pstmt != null) {
                pstmt.close();
            }
            if (filasBD != null) {
                filasBD.close();
            }
            return listaExcusas;
        } catch (Exception ex) {
            throw new SQLException("Resultado Negativo de la Base de Datos " + ex.getMessage());
        }
    }
    
    public static Excusa consultarExcusaId(int idexcusa) throws SQLException, Exception {
        mbd.conectar();
        con = mbd.getConexion();
        try {
            String sentencia = "SELECT * FROM excusa WHERE idexcusa = ? ORDER BY fecha_inicio_excusa ASC;";
            PreparedStatement pstmt = con.prepareStatement(sentencia);
            pstmt.setInt(1, idexcusa);
            ResultSet filasBD = pstmt.executeQuery();
             Excusa excusa = null;
            while (filasBD.next()) {
                excusa = Excusa.load(filasBD);
            }
            if (pstmt != null) {
                pstmt.close();
            }
            if (filasBD != null) {
                filasBD.close();
            }
            return excusa;
        } catch (SQLException ex) {
            throw new SQLException("Error al Listar Presupuesto: " + ex.getMessage());
        }
    }
}
