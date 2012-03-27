/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Conceptos;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Dario A
 */
public class PuntoEval 
{
    private int codigo;
    private String peval;
    
    public static PuntoEval load(ResultSet rs) throws SQLException
    {
        PuntoEval p=new PuntoEval();
        p.setCodigo(rs.getInt(1));
        p.setPeval(rs.getString(2));
        return p;
    }

    /**
     * @return the peval
     */
    public String getPeval() {
        return peval;
    }

    /**
     * @param peval the peval to set
     */
    public void setPeval(String peval) {
        this.peval = peval;
    }

    /**
     * @return the codigo
     */
    public int getCodigo() {
        return codigo;
    }

    /**
     * @param codigo the codigo to set
     */
    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }
    
}
