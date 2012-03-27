/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Conceptos;

import ManejadorHorario.ControlCurso;
import ManejadorMatriculas.ControlEstudiante;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Usuario
 */
public class Matricula {
    private   Date var_anio;
    private   Curso curso;
    private   String var_codigo_matricula;
    private   Estudiante estudiante;
    private   Date var_fechamatricula;

    public Matricula() {
    }

    public Matricula(Date var_anio, Curso curso, String var_codigo_matricula, Estudiante estudiante, Date var_fechamatricula) {
        this.var_anio = var_anio;
        this.curso = curso;
        this.var_codigo_matricula = var_codigo_matricula;
        this.estudiante = estudiante;
        this.var_fechamatricula = var_fechamatricula;
    }
   
  
  
    
public static Matricula  load(ResultSet rs) throws SQLException, Exception{
       
        Matricula matricula=new Matricula();
        
        matricula.setVar_anio(rs.getDate(1));
        matricula.setCurso(ControlCurso.consultarCurso(rs.getString(2)));
        matricula.setVar_codigo_matricula(rs.getString(3));
        matricula.setEstudiante(ControlEstudiante.consultarEstudiante(rs.getString(4)));
        matricula.setVar_fechamatricula(rs.getDate(5));
        
        return matricula;
    }
    /**
     * @return the curso
     */
    public Curso getCurso() {
        return curso;
    }

    /**
     * @param curso the curso to set
     */
    public void setCurso(Curso curso) {
        this.curso = curso;
    }

    /**
     * @return the var_fechamatricula
     */
    public Date getVar_fechamatricula() {
        return var_fechamatricula;
    }

    /**
     * @param var_fechamatricula the var_fechamatricula to set
     */
    public void setVar_fechamatricula(Date var_fechamatricula) {
        this.var_fechamatricula = var_fechamatricula;
    }

    /**
     * @return the var_anio
     */
    public Date getVar_anio() {
        return var_anio;
    }

    /**
     * @param var_anio the var_anio to set
     */
    public void setVar_anio(Date var_anio) {
        this.var_anio = var_anio;
    }

    /**
     * @return the var_codigo_matricula
     */
    public String getVar_codigo_matricula() {
        return var_codigo_matricula;
    }

    /**
     * @param var_codigo_matricula the var_codigo_matricula to set
     */
    public void setVar_codigo_matricula(String var_codigo_matricula) {
        this.var_codigo_matricula = var_codigo_matricula;
    }

    /**
     * @return the estudiante
     */
    public Estudiante getEstudiante() {
        return estudiante;
    }

    /**
     * @param estudiante the estudiante to set
     */
    public void setEstudiante(Estudiante estudiante) {
        this.estudiante = estudiante;
    }

   
}
