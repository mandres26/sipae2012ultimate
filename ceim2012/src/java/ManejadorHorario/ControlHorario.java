/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ManejadorHorario;

import Conceptos.Horario;
import Utilidades.ManejadorBaseDatos;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.util.LinkedList;
import java.util.List;

/**
 *
 * @author Moncho
 */
public class ControlHorario {

    static Connection con;
    static ManejadorBaseDatos mbd = ManejadorBaseDatos.getInstancia();

    public static Horario consultarHorario(int ref) throws SQLException, Exception {
        mbd.conectar();
        con = (Connection) mbd.getConexion();

        ResultSet rs = null;
        PreparedStatement pst = null;
        Horario horario = null;

        try {
            pst = (PreparedStatement) con.prepareStatement("select * from Horario where var_id_horario = ?");
            pst.setInt(1, ref);

            rs = pst.executeQuery();

            while (rs.next()) {
                horario = Horario.load(rs);
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                pst.close();
            }
            return horario;
        }
    }

    public static boolean existeHorario(String ref) throws SQLException, Exception {
        mbd.conectar();
        con = (Connection) mbd.getConexion();
        if (ref == null) {
            throw new SQLException("No hay elemento clave de la clase Horario");
        }
        ResultSet rs = null;
        PreparedStatement pst = null;
        boolean horario = false;
        try {
            pst = (PreparedStatement) con.prepareStatement("select * from Horario where var_id_horario = ?");
            pst.setString(1, ref.trim());

            rs = pst.executeQuery();
            while (rs.next()) {

                horario = true;
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                pst.close();
            }
            return horario;
        }


    }

    public static void registrarHorario(Horario horario) throws SQLException, Exception {
        mbd.conectar();
        con = (Connection) mbd.getConexion();

        if (con == null) {
            throw new SQLException("no hay conexion");
        }

        PreparedStatement pst = null;//hacer nula la consulta.....

        try {
            pst = (PreparedStatement) con.prepareStatement("INSERT INTO horario(var_id_curso, var_id_Docente, var_id_Aula, var_id_Asignatura, var_dia_horario, var_hora_inicial, var_hora_final) VALUES(?,?,?,?,?,?,?)");
           // pst.setInt(1, horario..getVar_codigo_curso());
            //pst.setInt(2, horario.getVar_docente_horario().getVar_id_docente());
            //pst.setString(3, horario.getVar_aula_horario().getVar_codigo_aula());
            //pst.setString(4, horario.getVar_asignatura_horario().getVar_codigo_asignatura());
            pst.setString(5, horario.getVar_dia_horario());
            pst.setTime(6, new Time(horario.getVar_hora_inicial_horario().getTime()));
            pst.setTime(7, new Time(horario.getVar_hora_fin_horario().getTime()));

            pst.executeUpdate();
        } finally {
            if (pst != null) {
                pst.close();
            }
        }


    }

    public static boolean actualizarHorario(Horario horario, int id) throws SQLException, Exception {
        mbd.conectar();
        con = (Connection) mbd.getConexion();
        if (consultarHorario(id) == null) {
            throw new SQLException("Horario no registrado");
        }
        PreparedStatement pst = null;
        boolean res = false;

        try {
            pst = (PreparedStatement) con.prepareStatement("UPDATE horario SET var_id_curso = ?, var_id_Docente = ?, var_id_Aula = ?, var_id_Asignatura = ?, var_dia_horario = ?, var_hora_inicial = ?, var_hora_final = ? WHERE var_id_horario = ?");

            //pst.setInt(1, horario.getVar_curso_horario().getVar_codigo_curso());
           // pst.setInt(2, horario.getVar_docente_horario().getVar_id_docente());
           // pst.setString(3, horario.getVar_aula_horario().getVar_codigo_aula());
            //pst.setString(4, horario.getVar_asignatura_horario().getVar_codigo_asignatura());
            pst.setString(5, horario.getVar_dia_horario());
            pst.setTime(6, new Time(horario.getVar_hora_inicial_horario().getTime()));
            pst.setTime(7, new Time(horario.getVar_hora_fin_horario().getTime()));
            pst.setInt(8, id);

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

    public static boolean eliminarHorario(int id) throws SQLException, Exception {
        mbd.conectar();
        con = (Connection) mbd.getConexion();
        if (consultarHorario(id) == null) {
            throw new SQLException("No hay Horario para eliminar");
        }
        PreparedStatement pst = null;
        boolean res = false;
        try {
            pst = (PreparedStatement) con.prepareStatement("delete from Horario where var_id_horario = ?");
            pst.setInt(1, id);
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

    public static List<Horario> listarHorario() throws SQLException, Exception {
        mbd.conectar();
        con = (Connection) mbd.getConexion();
        ResultSet rs = null;
        PreparedStatement pst = null;
        List<Horario> listaHorario = new LinkedList();
        try {
            pst = (PreparedStatement) con.prepareStatement("select * from Horario ");
            rs = pst.executeQuery();

            while (rs.next()) {
                listaHorario.add(Horario.load(rs));
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                pst.close();
            }
        }
        return listaHorario;
    }

    public static List<Horario> buscarHorario(int var_codigo_curso, String var_codigo_aula, int var_id_docente) throws SQLException, Exception {
        mbd.conectar();
        con = (Connection) mbd.getConexion();

        ResultSet rs = null;
        PreparedStatement pst = null;

        StringBuilder sqlBuilder = new StringBuilder("Select * from Horario h");

        if (var_codigo_curso != 0) {
            sqlBuilder.append(" where h.var_id_curso = ?");
        }

        if (!var_codigo_aula.equals("0")) {
            if (sqlBuilder.toString().contains("where")) {
                sqlBuilder.append(" and h.var_id_Aula = ?");
            } else {
                sqlBuilder.append(" where h.var_id_Aula = ?");
            }
        }

        if (var_id_docente != 0) {
            if (sqlBuilder.toString().contains("where")) {
                sqlBuilder.append(" and h.var_id_Docente = ?");
            } else {
                sqlBuilder.append(" where h.var_id_Docente = ?");
            }
        }
        
        sqlBuilder.append(" ORDER BY h.var_hora_inicial");

        List<Horario> listaHorario = new LinkedList();

        try {
            pst = (PreparedStatement) con.prepareStatement(sqlBuilder.toString());

            if (var_codigo_curso != 0) {
                pst.setInt(1, var_codigo_curso);

                if (!var_codigo_aula.equals("0")) {
                    pst.setString(2, var_codigo_aula);

                    if (var_id_docente != 0) {
                        pst.setInt(3, var_id_docente);
                    }
                } else if (var_id_docente != 0) {
                    pst.setInt(2, var_id_docente);
                }
            } else if (!var_codigo_aula.equals("0")) {
                pst.setString(1, var_codigo_aula);

                if (var_id_docente != 0) {
                    pst.setInt(2, var_id_docente);
                }
            } else if (var_id_docente != 0) {
                pst.setInt(1, var_id_docente);
            }

            rs = pst.executeQuery();

            while (rs.next()) {
                listaHorario.add(Horario.load(rs));
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                pst.close();
            }
        }
        return listaHorario;
    }

    public static Horario getDocenteDisponible(int var_id_docente, String diaHorario, Time horaInicial, Time horaFinal) throws Exception {
        mbd.conectar();
        con = (Connection) mbd.getConexion();
        ResultSet rs = null;
        PreparedStatement pst = null;
        Horario horario = null;

        try {
            pst = (PreparedStatement) con.prepareStatement("SELECT * FROM horario h WHERE h.var_id_Docente = ? AND h.var_dia_horario = ? AND (? BETWEEN h.var_hora_inicial AND h.var_hora_final OR ? BETWEEN h.var_hora_inicial AND h.var_hora_final)");
            pst.setInt(1, var_id_docente);
            pst.setString(2, diaHorario.toUpperCase());
            pst.setTime(3, horaInicial);
            pst.setTime(4, horaFinal);

            rs = pst.executeQuery();

            while (rs.next()) {
                horario = Horario.load(rs);
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                pst.close();
            }
        }

        return horario;
    }

    public static Horario getAulaDisponible(String var_codigo_aula, String diaHorario, Time horaInicial, Time horaFinal) throws Exception {
        mbd.conectar();
        con = (Connection) mbd.getConexion();
        ResultSet rs = null;
        PreparedStatement pst = null;
        Horario horario = null;

        try {
            pst = (PreparedStatement) con.prepareStatement("SELECT * FROM horario h WHERE h.var_id_aula = ? AND h.var_dia_horario = ? AND (? BETWEEN h.var_hora_inicial AND h.var_hora_final OR ? BETWEEN h.var_hora_inicial AND h.var_hora_final)");
            pst.setString(1, var_codigo_aula);
            pst.setString(2, diaHorario.toUpperCase());
            pst.setTime(3, horaInicial);
            pst.setTime(4, horaFinal);

            rs = pst.executeQuery();

            while (rs.next()) {
                horario = Horario.load(rs);
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                pst.close();
            }
        }

        return horario;
    }

    public static Horario getDocenteDisponibleModificar(int var_id_docente, String diaHorario, Time horaInicial, Time horaFinal, int var_id_horario) throws Exception {
        mbd.conectar();
        con = (Connection) mbd.getConexion();
        ResultSet rs = null;
        PreparedStatement pst = null;
        Horario horario = null;

        try {
            pst = (PreparedStatement) con.prepareStatement("SELECT * FROM horario h WHERE h.var_id_Docente = ? AND h.var_dia_horario = ? AND (? BETWEEN h.var_hora_inicial AND h.var_hora_final OR ? BETWEEN h.var_hora_inicial AND h.var_hora_final) AND h.var_id_horario <> ?");
            pst.setInt(1, var_id_docente);
            pst.setString(2, diaHorario.toUpperCase());
            pst.setTime(3, horaInicial);
            pst.setTime(4, horaFinal);
            pst.setInt(5, var_id_horario);

            rs = pst.executeQuery();

            while (rs.next()) {
                horario = Horario.load(rs);
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                pst.close();
            }
        }

        return horario;
    }

    public static Horario getAulaDisponibleModificar(String var_codigo_aula, String diaHorario, Time horaInicial, Time horaFinal, int var_id_horario) throws Exception {
        mbd.conectar();
        con = (Connection) mbd.getConexion();
        ResultSet rs = null;
        PreparedStatement pst = null;
        Horario horario = null;

        try {
            pst = (PreparedStatement) con.prepareStatement("SELECT * FROM horario h WHERE h.var_id_aula = ? AND h.var_dia_horario = ? AND (? BETWEEN h.var_hora_inicial AND h.var_hora_final OR ? BETWEEN h.var_hora_inicial AND h.var_hora_final) AND h.var_id_horario <> ?");
            pst.setString(1, var_codigo_aula);
            pst.setString(2, diaHorario.toUpperCase());
            pst.setTime(3, horaInicial);
            pst.setTime(4, horaFinal);
            pst.setInt(5, var_id_horario);

            rs = pst.executeQuery();

            while (rs.next()) {
                horario = Horario.load(rs);
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                pst.close();
            }
        }

        return horario;
    }
}
