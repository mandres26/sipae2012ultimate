/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Conceptos;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author idadyou
 */
public class Logro {
    private String var_codigo_logro;
    private String var_nombre_logro;
    private String var_tipoLogro;

    public Logro(String var_codigo_logro, String var_nombre_logro, String var_tipoLogro) {
        this.var_codigo_logro = var_codigo_logro;
        this.var_nombre_logro = var_nombre_logro;
        this.var_tipoLogro = var_tipoLogro;
    }

    public Logro() {
    }
    
    
  
    public static Logro load(ResultSet rs) throws SQLException{
        
        Logro logro=new Logro();
        //agregamos los datos del estudiante..
         logro.setVar_codigo_logro(rs.getString(1));
         logro.setVar_nombre_logro(rs.getString(2));
         logro.setVar_tipoLogro((rs.getString(3)));
             
            //devolvemos el estudiante.
        return logro;
    }
    
    
   
    public String getTipoLogro() {
        return var_tipoLogro;
    }

   
    public String getVar_codigo_logro() {
        return var_codigo_logro;
    }

    public void setVar_codigo_logro(String var_codigo_logro) {
        this.var_codigo_logro = var_codigo_logro;
    }

    public String getVar_nombre_logro() {
        return var_nombre_logro;
    }

    public void setVar_nombre_logro(String var_nombre_logro) {
        this.var_nombre_logro = var_nombre_logro;
    }

    public void setVar_tipoLogro(String var_tipoLogro) {
        this.var_tipoLogro = var_tipoLogro;
    }
}
