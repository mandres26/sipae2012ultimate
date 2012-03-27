/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Conceptos;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author AprendizSena
 */
public class Aula {

    private String var_codigo_aula;
    private int var_capacidad_aula;

    public Aula() {
    }

    public Aula(String var_codigo_aula) {
        this.var_codigo_aula = var_codigo_aula;
    }

    public static Aula load(ResultSet rs) throws SQLException {
        Aula au = new Aula();
        au.setVar_codigo_aula(rs.getString(1));
        au.setVar_capacidad_aula(rs.getInt(2));

        return au;
    }

    public String getVar_codigo_aula() {
        return var_codigo_aula;
    }

    public void setVar_codigo_aula(String var_codigo_aula) {
        this.var_codigo_aula = var_codigo_aula;
    }

    public int getVar_capacidad_aula() {
        return var_capacidad_aula;
    }

    public void setVar_capacidad_aula(int var_capacidad_aula) {
        this.var_capacidad_aula = var_capacidad_aula;
    }
}
