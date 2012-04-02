package Conceptos;

import ManejadorHorario.ControlBloque;
import java.sql.ResultSet;
import java.sql.SQLException;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author josedavo
 */
public class Curso {
    
    private String var_codigo_curso;
    private String var_nombre_curso;
    private Bloque bloque;

    public Curso(String var_codigo_curso, String var_nombre_curso, Bloque bloque) {
        this.var_codigo_curso = var_codigo_curso;
        this.var_nombre_curso = var_nombre_curso;
        this.bloque = bloque;
    }
   
   
    public Curso(){}
    
     public static Curso load(ResultSet rs) throws SQLException, Exception{
        Curso curso=new Curso();
        curso.setVar_codigo_curso(rs.getString(1));
        curso.setVar_nombre_curso(rs.getString(2));
        curso.setBloque(ControlBloque.consultarBloque(rs.getString(3)));
         
         
       return curso;
  }
    /**
     * @return the var_codigo_curso
     */
    public String getVar_codigo_curso() {
        return var_codigo_curso;
    }

    /**
     * @param var_codigo_curso the var_codigo_curso to set
     */
    public void setVar_codigo_curso(String var_codigo_curso) {
        this.var_codigo_curso = var_codigo_curso;
    }

    /**
     * @return the var_nombre_curso
     */
    public String getVar_nombre_curso() {
        return var_nombre_curso;
    }

    /**
     * @param var_nombre_curso the var_nombre_curso to set
     */
    public void setVar_nombre_curso(String var_nombre_curso) {
        this.var_nombre_curso = var_nombre_curso;
    }

    /**
     * @return the bloque
     */
    public Bloque getBloque() {
        return bloque;
    }

    /**
     * @param bloque the bloque to set
     */
    public void setBloque(Bloque bloque) {
        this.bloque = bloque;
    }
    
    }


