/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Conceptos;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Usuario
 */
public class TipoEmpleado {
    String var_codigo_tipoempleado;
    String var_nomtipoempleado;
    
    
    public TipoEmpleado() {
    }

    public TipoEmpleado(String var_codigo_tipoempleado, String var_nomtipoempleado) {
        this.var_codigo_tipoempleado = var_codigo_tipoempleado;
        this.var_nomtipoempleado = var_nomtipoempleado;
    }
       public static TipoEmpleado load(ResultSet rs) throws SQLException {
       TipoEmpleado tipoempleado = new TipoEmpleado();
        tipoempleado.setVar_codigo_tipoempleado(rs.getString(1));
        tipoempleado.setVar_nomtipoempleado(rs.getString(2));
        return tipoempleado;
    }

    public String getVar_codigo_tipoempleado() {
        return var_codigo_tipoempleado;
    }

    public void setVar_codigo_tipoempleado(String var_codigo_tipoempleado) {
        this.var_codigo_tipoempleado = var_codigo_tipoempleado;
    }

    public String getVar_nomtipoempleado() {
        return var_nomtipoempleado;
    }

    public void setVar_nomtipoempleado(String var_nomtipoempleado) {
        this.var_nomtipoempleado = var_nomtipoempleado;
    }

   
    
}
