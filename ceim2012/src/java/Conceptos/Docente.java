/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Conceptos;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author DADC
 */
public class Docente  {

    private String var_id_docente;
    private String var_codigo_docente;
    private String var_nombre_docente;
    private String var_apellido_docente;
    private String var_direccion_docente;
    private String var_sexo_docente;
    private String var_usuario_docente;
    private String var_pass_docente;

    public Docente() {
    }

    public Docente(String var_id_docente) {
        this.var_id_docente = var_id_docente;
    }
    public static Docente load(ResultSet rs) throws SQLException {
        Docente doc = new Docente();
        doc.setVar_id_docente(rs.getString(2));
        doc.setVar_codigo_docente(rs.getString(1));
        doc.setVar_nombre_docente(rs.getString(3));
        doc.setVar_apellido_docente(rs.getString(4));
        doc.setVar_direccion_docente(rs.getString(5));
        doc.setVar_sexo_docente(rs.getString(6));
        doc.setVar_usuario_docente(rs.getString(7));
        doc.setVar_pass_docente(rs.getString(8));


        return doc;

    }

    public String getVar_id_docente() {
        return var_id_docente;
    }

    public void setVar_id_docente(String var_id_docente) {
        this.var_id_docente = var_id_docente;
    }

    public String getVar_codigo_docente() {
        return var_codigo_docente;
    }

    public void setVar_codigo_docente(String var_codigo_docente) {
        this.var_codigo_docente = var_codigo_docente;
    }

    /**
     * @return the var_nombre_docente
     */
    public String getVar_nombre_docente() {
        return var_nombre_docente;
    }

    /**
     * @param var_nombre_docente the var_nombre_docente to set
     */
    public void setVar_nombre_docente(String var_nombre_docente) {
        this.var_nombre_docente = var_nombre_docente;
    }

    /**
     * @return the var_apellido_docente
     */
    public String getVar_apellido_docente() {
        return var_apellido_docente;
    }

    /**
     * @param var_apellido_docente the var_apellido_docente to set
     */
    public void setVar_apellido_docente(String var_apellido_docente) {
        this.var_apellido_docente = var_apellido_docente;
    }

    /**
     * @return the var_direccion_docente
     */
    public String getVar_direccion_docente() {
        return var_direccion_docente;
    }

    /**
     * @param var_direccion_docente the var_direccion_docente to set
     */
    public void setVar_direccion_docente(String var_direccion_docente) {
        this.var_direccion_docente = var_direccion_docente;
    }

    /**
     * @return the var_sexo_docente
     */
    public String getVar_sexo_docente() {
        return var_sexo_docente;
    }

    /**
     * @param var_sexo_docente the var_sexo_docente to set
     */
    public void setVar_sexo_docente(String var_sexo_docente) {
        this.var_sexo_docente = var_sexo_docente;
    }

    /**
     * @return the var_usuario_docente
     */
    public String getVar_usuario_docente() {
        return var_usuario_docente;
    }

    /**
     * @param var_usuario_docente the var_usuario_docente to set
     */
    public void setVar_usuario_docente(String var_usuario_docente) {
        this.var_usuario_docente = var_usuario_docente;
    }

    /**
     * @return the var_pass_docente
     */
    public String getVar_pass_docente() {
        return var_pass_docente;
    }

    /**
     * @param var_pass_docente the var_pass_docente to set
     */
    public void setVar_pass_docente(String var_pass_docente) {
        this.var_pass_docente = var_pass_docente;
    }

   
}
