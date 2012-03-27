/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package Conceptos;

import ManejadorHorario.ControlDocente;
import ManejadorHorario.ControlHorario;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;

/**
 *
 * @author root
 */
public class Indisciplina {

    private int var_codigo;
    private String var_nombreCaso;
    private String var_descripcion;
    private Horario horario;
    private String var_estado;
    private Timestamp var_fecha;

    public Indisciplina() {
    }

    public Indisciplina(int var_codigo, String var_nombreCaso, String var_descripcion, Horario horario, String var_estado, Timestamp var_fecha) {
        this.var_codigo = var_codigo;
        this.var_nombreCaso = var_nombreCaso;
        this.var_descripcion = var_descripcion;
        this.horario = horario;
        this.var_estado = var_estado;
        this.var_fecha = var_fecha;
    }
    
     public static Indisciplina load(ResultSet rs) throws SQLException, Exception{
        
        Indisciplina indisciplina=new Indisciplina();
        //agregamos los datos del estudiante..
         indisciplina.setVar_codigo(rs.getInt(1));
         indisciplina.setVar_nombreCaso(rs.getString(2));
         indisciplina.setVar_descripcion(rs.getString(3));
         indisciplina.setHorario(ControlHorario.consultarHorario(rs.getInt(4))); 
         indisciplina.setVar_estado(rs.getString(5));
         indisciplina.setVar_fecha(rs.getTimestamp(6));
            //devolvemos el estudiante.
        return indisciplina;
    }

    /**
     * @return the var_codigo
     */
    public int getVar_codigo() {
        return var_codigo;
    }

    /**
     * @param var_codigo the var_codigo to set
     */
    public void setVar_codigo(int var_codigo) {
        this.var_codigo = var_codigo;
    }

    /**
     * @return the var_nombreCaso
     */
    public String getVar_nombreCaso() {
        return var_nombreCaso;
    }

    /**
     * @param var_nombreCaso the var_nombreCaso to set
     */
    public void setVar_nombreCaso(String var_nombreCaso) {
        this.var_nombreCaso = var_nombreCaso;
    }

    /**
     * @return the var_descripcion
     */
    public String getVar_descripcion() {
        return var_descripcion;
    }

    /**
     * @param var_descripcion the var_descripcion to set
     */
    public void setVar_descripcion(String var_descripcion) {
        this.var_descripcion = var_descripcion;
    }

    public Horario getHorario() {
        return horario;
    }

    public void setHorario(Horario horario) {
        this.horario = horario;
    }

    /**
     * @return the var_estado
     */
    public String getVar_estado() {
        return var_estado;
    }

    /**
     * @param var_estado the var_estado to set
     */
    public void setVar_estado(String var_estado) {
        this.var_estado = var_estado;
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

 

    

   
    



}
