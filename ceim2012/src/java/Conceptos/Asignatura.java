/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Conceptos;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author sigi
 */
public class Asignatura {
    private String var_codigo_asignatura;
    private String var_nombre_asignatura;
    private int    var_intensidad_horaria;

    
    public static Asignatura load(ResultSet rs) throws SQLException {
        Asignatura asignatura=new Asignatura();
        asignatura.setVar_codigo_asignatura(rs.getString(1));
        asignatura.setVar_nombre_asignatura(rs.getString(2));
        asignatura.setVar_intensidad_horaria(rs.getInt(3));
       return asignatura;
        
    }

    public Asignatura() {
    }
    
    
    public Asignatura(String var_codigo_asignatura, String var_combre_asignatura, int var_intensidad_horaria) {
        this.var_codigo_asignatura = var_codigo_asignatura;
        this.var_nombre_asignatura = var_combre_asignatura;
        this.var_intensidad_horaria= var_intensidad_horaria;
    }

    public String getVar_codigo_asignatura() {
        return var_codigo_asignatura;
    }

    public void setVar_codigo_asignatura(String var_codigo_asignatura) {
        this.var_codigo_asignatura = var_codigo_asignatura;
    }

    public String getVar_nombre_asignatura() {
        return var_nombre_asignatura;
    }

    public void setVar_nombre_asignatura(String var_combre_asignatura) {
        this.var_nombre_asignatura = var_combre_asignatura;
    }

    /**
     * @return the var_intensidad_horaria
     */
    public int getVar_intensidad_horaria() {
        return var_intensidad_horaria;
    }

    /**
     * @param var_intensidad_horaria the var_intensidad_horaria to set
     */
    public void setVar_intensidad_horaria(int var_intensidad_horaria) {
        this.var_intensidad_horaria = var_intensidad_horaria;
    }
    
}
