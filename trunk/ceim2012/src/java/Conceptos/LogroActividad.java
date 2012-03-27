/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Conceptos;

import ManejadorSEvaluacion.ControlActividades;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author wamp
 */
public class LogroActividad {
    
    private Logro var_codigo_logro;
    private Actividades var_codigo_actividad;
    private String var_consecutivo;

    /**
     * @return the var_codigo_logro
     */
    public Logro getVar_codigo_logro() {
        return var_codigo_logro;
    }

    public LogroActividad() {
    }

    public LogroActividad(Logro var_codigo_logro, Actividades var_codigo_actividad, String var_consecutivo) {
        this.var_codigo_logro = var_codigo_logro;
        this.var_codigo_actividad = var_codigo_actividad;
        this.var_consecutivo = var_consecutivo;
    }
    public static LogroActividad load(ResultSet rs) throws SQLException, Exception{
        
        LogroActividad logroactividad=new LogroActividad();
        //agregamos los datos del estudiante..
         logroactividad.getVar_codigo_logro().setVar_codigo_logro(rs.getString(1));
         logroactividad.setVar_codigo_actividad(ControlActividades.consultarActividades(rs.getString(2)));
         logroactividad.setVar_consecutivo((rs.getString(3)));
             
            //devolvemos el estudiante.
        return logroactividad;
    }

    /**
     * @param var_codigo_logro the var_codigo_logro to set
     */
    public void setVar_codigo_logro(Logro var_codigo_logro) {
        this.var_codigo_logro = var_codigo_logro;
    }

    /**
     * @return the var_codigo_actividad
     */
    public Actividades getVar_codigo_actividad() {
        return var_codigo_actividad;
    }

    /**
     * @param var_codigo_actividad the var_codigo_actividad to set
     */
    public void setVar_codigo_actividad(Actividades var_codigo_actividad) {
        this.var_codigo_actividad = var_codigo_actividad;
    }

    /**
     * @return the var_consecutivo
     */
    public String getVar_consecutivo() {
        return var_consecutivo;
    }

    /**
     * @param var_consecutivo the var_consecutivo to set
     */
    public void setVar_consecutivo(String var_consecutivo) {
        this.var_consecutivo = var_consecutivo;
    }

   
    
}

