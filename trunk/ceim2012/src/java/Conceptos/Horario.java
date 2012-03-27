/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Conceptos;


import ManejadorHorario.ControlAsignatura;
import ManejadorHorario.ControlCurso;
import ManejadorHorario.ControlDocente;
import java.sql.ResultSet;
import java.sql.Time;

/**
 *
 * @author AprendizSena
 */
public class Horario {
    private String  var_id_horario; 
    private String  var_dia_horario;
    private Time    var_hora_inicial_horario;
    private Time    var_hora_fin_horario;
    private Docente docente;
    private Asignatura asignatura;
    private Curso curso;
    
    public Horario(){}
    public Horario(String var_id_horario, String var_dia_horario, Time var_hora_inicial_horario, Time var_hora_fin_horario, Docente docente, Asignatura asignatura, Curso curso) {
        this.var_id_horario = var_id_horario;
        this.var_dia_horario = var_dia_horario;
        this.var_hora_inicial_horario = var_hora_inicial_horario;
        this.var_hora_fin_horario = var_hora_fin_horario;
        this.docente = docente;
        this.asignatura = asignatura;
        this.curso = curso;
    }
    
     public static Horario load(ResultSet rs) throws Exception{
        Horario hor = new Horario();
        
        hor.setVar_id_horario(rs.getString(1));
        hor.setVar_dia_horario(rs.getString(2));
        hor.setVar_hora_inicial_horario(rs.getTime(3));
        hor.setVar_hora_fin_horario(rs.getTime(4));
        hor.setDocente(ControlDocente.consultarDocente(rs.getString(5)));
        hor.setAsignatura(ControlAsignatura.consultarAsignatura(rs.getString(6)));
        hor.setCurso(ControlCurso.consultarCurso(rs.getString(7)));
        
        /*hor.setVar_curso_horario(ControlCurso.consultarCurso(rs.getInt(2)));
        hor.setVar_docente_horario(ControlDocente.consultarDocente(rs.getString(3)));
        hor.setVar_aula_horario(ControlAula.consultarAula(rs.getString(4)));
        hor.setVar_asignatura_horario(ControlAsignatura.consultarAsignatura(rs.getString(5)));
        */
        return hor;
     }

    /**
     * @return the var_id_horario
     */
    public String getVar_id_horario() {
        return var_id_horario;
    }

    /**
     * @param var_id_horario the var_id_horario to set
     */
    public void setVar_id_horario(String var_id_horario) {
        this.var_id_horario = var_id_horario;
    }

    /**
     * @return the var_dia_horario
     */
    public String getVar_dia_horario() {
        return var_dia_horario;
    }

    /**
     * @param var_dia_horario the var_dia_horario to set
     */
    public void setVar_dia_horario(String var_dia_horario) {
        this.var_dia_horario = var_dia_horario;
    }

    /**
     * @return the var_hora_inicial_horario
     */
    public Time getVar_hora_inicial_horario() {
        return var_hora_inicial_horario;
    }

    /**
     * @param var_hora_inicial_horario the var_hora_inicial_horario to set
     */
    public void setVar_hora_inicial_horario(Time var_hora_inicial_horario) {
        this.var_hora_inicial_horario = var_hora_inicial_horario;
    }

    /**
     * @return the var_hora_fin_horario
     */
    public Time getVar_hora_fin_horario() {
        return var_hora_fin_horario;
    }

    /**
     * @param var_hora_fin_horario the var_hora_fin_horario to set
     */
    public void setVar_hora_fin_horario(Time var_hora_fin_horario) {
        this.var_hora_fin_horario = var_hora_fin_horario;
    }

    /**
     * @return the docente
     */
    public Docente getDocente() {
        return docente;
    }

    /**
     * @param docente the docente to set
     */
    public void setDocente(Docente docente) {
        this.docente = docente;
    }

    /**
     * @return the asignatura
     */
    public Asignatura getAsignatura() {
        return asignatura;
    }

    /**
     * @param asignatura the asignatura to set
     */
    public void setAsignatura(Asignatura asignatura) {
        this.asignatura = asignatura;
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

   
}
