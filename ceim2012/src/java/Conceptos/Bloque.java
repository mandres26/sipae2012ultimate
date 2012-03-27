/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Conceptos;

import ManejadorHorario.ControlAula;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author jose
 */
public class Bloque {
    private String var_codigo_bloque;
    private String var_nombre_bloque;
    private Aula aula;

    public Bloque(String var_codigo_bloque, String var_nombre_bloque, Aula aula) {
        this.var_codigo_bloque = var_codigo_bloque;
        this.var_nombre_bloque = var_nombre_bloque;
        this.aula = aula;
    }
        
    public Bloque (){}
    /**
     * @return the var_codigo_bloque
     */
    public static Bloque load(ResultSet rs) throws SQLException, Exception {
        Bloque bq = new Bloque();
        bq.setVar_codigo_bloque(rs.getString(1));
        bq.setVar_nombre_bloque(rs.getString(2));
        bq.setAula(ControlAula.consultarAula(rs.getString(3)));
        return bq;
    }
    public String getVar_codigo_bloque() {
        return var_codigo_bloque;
    }

    /**
     * @param var_codigo_bloque the var_codigo_bloque to set
     */
    public void setVar_codigo_bloque(String var_codigo_bloque) {
        this.var_codigo_bloque = var_codigo_bloque;
    }

    /**
     * @return the var_nombre_bloque
     */
    public String getVar_nombre_bloque() {
        return var_nombre_bloque;
    }

    /**
     * @param var_nombre_bloque the var_nombre_bloque to set
     */
    public void setVar_nombre_bloque(String var_nombre_bloque) {
        this.var_nombre_bloque = var_nombre_bloque;
    }

    /**
     * @return the aula
     */
    public Aula getAula() {
        return aula;
    }

    /**
     * @param aula the aula to set
     */
    public void setAula(Aula aula) {
        this.aula = aula;
    }
}
