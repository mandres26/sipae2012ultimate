/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Conceptos;

import ManejadorHorario.ControlAsignatura;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author sigi
 */
public class Actividades {

    private String var_codigo_actividad;
    private String var_nombre_actividad;    
    private String var_porcentaje_actividad;
    private String var_periodo_actividad;
    private Date var_fecha_creacion_actividad;
    private Date var_fecha_ejecucion_actividad;   
    private Asignatura asignatura;
    private boolean var_estado;
    private String var_tema;
    private String var_descripcion;
    
    public Actividades(String var_codigo_actividad, String var_nombre_actividad, String var_porcentaje_actividad, String var_periodo_actividad, Date var_fecha_creacion_actividad, Date var_fecha_ejecucion_actividad, Asignatura var_id_asignatura, boolean var_estado, String var_tema, String var_descripcion) {
        this.var_codigo_actividad = var_codigo_actividad;
        this.var_nombre_actividad = var_nombre_actividad;
        this.var_porcentaje_actividad = var_porcentaje_actividad;
        this.var_periodo_actividad = var_periodo_actividad;
        this.var_fecha_creacion_actividad = var_fecha_creacion_actividad;
        this.var_fecha_ejecucion_actividad = var_fecha_ejecucion_actividad;
        this.asignatura = var_id_asignatura;
        this.var_estado = var_estado;
        this.var_tema= var_tema;
        this.var_descripcion=var_descripcion;
    }
   
  
    public static Actividades load(ResultSet rs) throws SQLException, Exception{
        
        Actividades acti=new Actividades();
        //agregamos los datos del estudiante..
         acti.setVar_codigo_actividad(rs.getString(1));
         acti.setVar_nombre_actividad(rs.getString(2));
         acti.setVar_periodo_actividad(rs.getString(3));
         acti.setVar_porcentaje_actividad(rs.getString(4));
         acti.setVar_fecha_creacion_actividad(rs.getDate(5));
         acti.setVar_fecha_ejecucion_actividad(rs.getDate(6));
         acti.setVar_asignatura(ControlAsignatura.consultarAsignatura(rs.getString(7)));
         acti.setVar_estado(rs.getBoolean(8));
         acti.setVar_tema(rs.getString(9));
         acti.setVar_descripcion(rs.getString(10));
         
         //acti.setVar_asignatura(rs.getString(7));
             
        return acti;
    }



    public Actividades() {
        
    }

    
    public Date getVar_fecha_creacion_actividad() {
        return var_fecha_creacion_actividad;
    }

    public void setVar_fecha_creacion_actividad(Date var_fecha_creacion_actividad) {
        this.var_fecha_creacion_actividad = var_fecha_creacion_actividad;
    }

    public Date getVar_fecha_ejecucion_actividad() {
        return var_fecha_ejecucion_actividad;
    }

    public void setVar_fecha_ejecucion_actividad(Date var_fecha_ejecucion_actividad) {
        this.var_fecha_ejecucion_actividad = var_fecha_ejecucion_actividad;
    }

   
    public String getVar_codigo_actividad() {
        return var_codigo_actividad;
    }

    public void setVar_codigo_actividad(String var_codigo_actividad) {
        this.var_codigo_actividad = var_codigo_actividad;
    }

    

    public Asignatura getVar_asignatura() {
        return this.asignatura;
    }

    public void setVar_asignatura(Asignatura var_id_asignatura) {
        this.asignatura = var_id_asignatura;
    }

    public String getVar_nombre_actividad() {
        return var_nombre_actividad;
    }

    public void setVar_nombre_actividad(String var_nombre_actividad) {
        this.var_nombre_actividad = var_nombre_actividad;
    }

    public String getVar_periodo_actividad() {
        return var_periodo_actividad;
    }

    public void setVar_periodo_actividad(String var_periodo_actividad) {
        this.var_periodo_actividad = var_periodo_actividad;
    }

    public String getVar_porcentaje_actividad() {
        return var_porcentaje_actividad;
    }

    public void setVar_porcentaje_actividad(String var_porcentaje_actividad) {
        this.var_porcentaje_actividad = var_porcentaje_actividad;
    }

    /**
     * @return the estado
     */
   
    public boolean isVar_estado() {
        return var_estado;
    }

    /**
     * @param var_estado the var_estado to set
     */
    public void setVar_estado(boolean var_estado) {
        this.var_estado = var_estado;
    }

    /**
     * @return the var_tema
     */
    public String getVar_tema() {
        return var_tema;
    }

    /**
     * @param var_tema the var_tema to set
     */
    public void setVar_tema(String var_tema) {
        this.var_tema = var_tema;
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


}
