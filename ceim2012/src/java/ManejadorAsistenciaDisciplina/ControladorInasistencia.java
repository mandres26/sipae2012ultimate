package ManejadorAsistenciaDisciplina;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author docente
 */

import Conceptos.Inasistencia;
import Utilidades.ManejadorBaseDatos;
import java.sql.*;
import java.util.LinkedList;
import java.util.List;

public class ControladorInasistencia {
   static Connection con;
   static ManejadorBaseDatos mbd = ManejadorBaseDatos.getInstancia();


    
    public void addAsistencia (Inasistencia inasistencia) throws SQLException, Exception{
          mbd.conectar();
        con = mbd.getConexion();
        if (con == null) {
            throw new SQLException("no hay conexion");
        }
        PreparedStatement pst = null;//hacer nula la consulata.....
        ResultSet rs = null;
              
        try{
                
                //1 Se prepara la sentencia
                pst = con.prepareStatement("INSERT INTO inasistencias (var_fecha,var_cod_excusa,var_observaciones ,var_cod_curso,var_cod_estudiante ,var_cod_docente,var_cod_asignatura) VALUES (?,?,?,?,?,?,?)");
 
                //  2 Se cargan los valores                                                             
                
                pst.setTimestamp(1,inasistencia.getVar_fecha());
                pst.setString(2,inasistencia.getHorario().getVar_id_horario());
                pst.setInt(3,inasistencia.getExcusa().getIdExcusa());
                pst.setString(4,inasistencia.getVar_observaciones());
                pst.setString(5,inasistencia.getVar_Descripcionins());
                
//                 3 Se ejecuta la sentencia
                pst.executeUpdate();
         
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
    
    public void actualizarAsistencia (Inasistencia inasistencia) throws SQLException, Exception{
        
        mbd.conectar();
        con = mbd.getConexion();
        if (con == null) {
            throw new SQLException("no hay conexion");
        }
        PreparedStatement pst = null;//hacer nula la consulata.....
        ResultSet rs = null;
        
        try{
                
                //1 Se prepara la sentencia
                pst = con.prepareStatement("UPDATE inasistencias SET var_cod_excusa = ?,var_observaciones = ? WHERE inasistencias.var_cod_inasistencia = ?");
 

                pst.setTimestamp(1,inasistencia.getVar_fecha());
                pst.setString(2,inasistencia.getHorario().getVar_id_horario());
                pst.setInt(3,inasistencia.getExcusa().getIdExcusa());
                pst.setString(4,inasistencia.getVar_observaciones());
                pst.setString(5,inasistencia.getVar_Descripcionins());
                
                // 2 Se ejecuta la sentencia
                pst.executeUpdate();
        }catch (SQLException ex) {
            throw new SQLException("Resultado Negativo de la Base de Datos " + ex.getMessage());
            
        }finally{

            if(pst!=null)
                pst.close();
        }
        
    }
       
    public List<Inasistencia> listarAsistencia () throws SQLException, Exception{
        
        mbd.conectar();
        con=mbd.getConexion();
        ResultSet rs = null;
     PreparedStatement pst = null;
     List<Inasistencia> listarinasistencia = new LinkedList();
     try {
        pst = con.prepareStatement("select * from Inasistencia ");
        rs = pst.executeQuery();
        while(rs.next()) {
           listarinasistencia.add(Inasistencia.load(rs));
        }
    } finally {
        if (rs != null) {
           rs.close();
       }
        if (pst != null) {
          pst.close();
       }
  }
    return listarinasistencia;
    }
    
    public Inasistencia verificarExistencia (String codigo_estudiante,String docente,String curso/*,String asignatura*/) throws SQLException{
        PreparedStatement pstm = null;
        ResultSet rs= null;
        String sql = "";
        Inasistencia in = null;
        try{
                sql = "SELECT var_cod_inasistencia,var_observaciones FROM inasistencias,asignatura,docente,curso where inasistencias.var_cod_curso = curso.var_codigo_curso"
                    + " and inasistencias.var_cod_asignatura = asignatura.var_codigo_asignatura and inasistencias.var_cod_docente = docente.var_codigo_docente"
                    + " and var_fecha like concat (substr(now(),1,10),'%') and concat(var_apellido_docente,' ',var_nombre_docente) = ?"
                    + " and concat(var_nombre_curso,' ',var_seccion) = ? and var_cod_estudiante = ?"; /*and var_nombre_asignatura = ?";*/
           
                pstm = con.prepareStatement(sql);
                pstm.setString(1, docente);
                pstm.setString(2, curso);
                pstm.setString(3, codigo_estudiante);
              //  pstm.setString(4, asignatura);
                
                
                rs = pstm.executeQuery();
                
                while(rs.next()){
                    in = new Inasistencia();
                    in.setVar_idins(rs.getString(1));
                    in.setVar_observaciones(rs.getString(2));
                }
                
            }finally{
                
                if (rs != null) {
                    rs.close();
                }
                if (pstm != null) {
                    pstm.close();
                }
            }
            return in;
        
    }
    public List<String> listaDocentes () throws SQLException{
        
        PreparedStatement pstm = null;
        ResultSet rs= null;
        List<String> lista = new LinkedList<String>();
        String sql = "";
        
        try{
                sql = "SELECT var_apellido_docente,var_nombre_docente from docente order by var_apellido_docente";
           
                pstm = con.prepareStatement(sql);
                rs = pstm.executeQuery();
                
                while(rs.next()){
                    String docente = rs.getString(1)+" "+rs.getString(2);
                    

                    lista.add(docente);
                }
                
            }finally{
                
                if (rs != null) {
                    rs.close();
                }
                if (pstm != null) {
                    pstm.close();
                }
            }
        return lista;
    }
      public List<String> listaAsiganturas () throws SQLException{
        
        PreparedStatement pstm = null;
        ResultSet rs= null;
        List<String> lista = new LinkedList<String>();
        String sql = "";
        
        try{
                sql = "SELECT var_nombre_asignatura from asignatura order by var_nombre_asignatura";
           
                pstm = con.prepareStatement(sql);
                rs = pstm.executeQuery();
                
                while(rs.next()){
                    String asignatura = rs.getString(1);
                    

                    lista.add(asignatura);
                }
                
            }finally{
                
                if (rs != null) {
                    rs.close();
                }
                if (pstm != null) {
                    pstm.close();
                }
            }
        return lista;
    }
   
}
