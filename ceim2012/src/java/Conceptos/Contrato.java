/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Conceptos;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Moncho
 */
public class Contrato {
    
    private int var_codigo_contrato;
    private String var_tipo_contrato;

    public static Contrato load(ResultSet rs) throws SQLException{
      Contrato cont= new Contrato();
      cont.setVar_codigo_contrato(rs.getInt(1));
      cont.setVar_tipo_contrato(rs.getString(2));
     
      return cont;
      
      
    }
    
    
    
    /**
     * @return the var_codigo_contrato
     */
    public int getVar_codigo_contrato() {
        return var_codigo_contrato;
    }

    /**
     * @param var_codigo_contrato the var_codigo_contrato to set
     */
    public void setVar_codigo_contrato(int var_codigo_contrato) {
        this.var_codigo_contrato = var_codigo_contrato;
    }

    /**
     * @return the var_tipo_contrato
     */
    public String getVar_tipo_contrato() {
        return var_tipo_contrato;
    }

    /**
     * @param var_tipo_contrato the var_tipo_contrato to set
     */
    public void setVar_tipo_contrato(String var_tipo_contrato) {
        this.var_tipo_contrato = var_tipo_contrato;
    }

    /**
     * @return the codigo
     */
   
    
    
}
