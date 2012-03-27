/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Conceptos;

import ManejadorExcusa.ControladorExcusa;
import ManejadorHorario.ControlHorario;
import ManejadorMatriculas.ControlMatricula;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

/**
 *
 * @author M4ST3R
 */
public class Inasistencia {
    
    private Timestamp var_fecha;
    private Matricula matricula;
    private Horario   horario; 
    private Excusa excusa;
    private String var_idins;
    private String var_observaciones;
    private String var_descripcionins;

    public Inasistencia() {
    }

    public Inasistencia(Timestamp var_fecha, Matricula matricula, Horario horario, Excusa excusa, String var_idins, String var_observaciones, String var_descripcionins) {
        this.var_fecha = var_fecha;
        this.matricula = matricula;
        this.horario = horario;
        this.excusa = excusa;
        this.var_idins = var_idins;
        this.var_observaciones = var_observaciones;
        this.var_descripcionins = var_descripcionins;
    }

   
  
    
       public static Inasistencia load(ResultSet rs) throws SQLException, Exception{
        
        Inasistencia inasistencia=new Inasistencia();
        //agregamos los datos del estudiante..
         inasistencia.setVar_fecha(rs.getTimestamp(1));
         inasistencia.setMatricula(ControlMatricula.consultarMatricula(rs.getString(2)));
         inasistencia.setHorario(ControlHorario.consultarHorario(rs.getInt(3)));
         inasistencia.setExcusa(ControladorExcusa.consultarExcusaId(rs.getInt(4))); 
         inasistencia.setVar_observaciones(rs.getString(6));
         inasistencia.setVar_descripcionins(rs.getString(7));
            //devolvemos el estudiante.
        return inasistencia;
    }

    /**
     * @return the var_fecha
     */
    public Timestamp getVar_fecha() {
        return var_fecha;
    }

    /**
     * @param var_fecha the var_fecha to set
     */
    public void setVar_fecha(Timestamp var_fecha) {
        this.var_fecha = var_fecha;
    }

    /**
     * @return the var_idins
     */
    public String getVar_idins() {
        return var_idins;
    }

    /**
     * @param var_idins the var_idins to set
     */
    public void setVar_idins(String var_idins) {
        this.var_idins = var_idins;
    }

   
    /**
     * @return the excusa
     */
    public Excusa getExcusa() {
        return excusa;
    }

    /**
     * @param excusa the excusa to set
     */
    public void setExcusa(Excusa excusa) {
        this.excusa = excusa;
    }

    
    public String getVar_observaciones() {
        return var_observaciones;
    }

    /**
     * @param observaciones the observaciones to set
     */
    public void setVar_observaciones(String var_observaciones) {
        this.var_observaciones = var_observaciones;
    }

    /**
     * @return the descripcionexcusa
     */
    public String getVar_Descripcionins() {
        return var_descripcionins;
    }

    /**
     * @param descripcionexcusa the descripcionexcusa to set
     */
    public void setVar_descripcionins(String var_descripcionins) {
        this.var_descripcionins = var_descripcionins;
    }

    /**
     * @return the matricula
     */
    public Matricula getMatricula() {
        return matricula;
    }

    /**
     * @param matricula the matricula to set
     */
    public void setMatricula(Matricula matricula) {
        this.matricula = matricula;
    }

    /**
     * @return the horario
     */
    public Horario getHorario() {
        return horario;
    }

    /**
     * @param horario the horario to set
     */
    public void setHorario(Horario horario) {
        this.horario = horario;
    }

   
    }
