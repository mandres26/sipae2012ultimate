/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Conceptos;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author dell
 */
public class Acudiente {
    
    private String var_id_acudiente;
    private String var_nombre_acudiente;
    private String var_apellido_acudiente;
    private String var_telefono_acudiente;
    private String var_direccion_acudiente;
    private String var_sexo_acudiente;
    private String var_email_acudiente;
    private String var_usuario;
    private String var_contrasena;
    private Date var_fecha_nacimiento;

    public Acudiente() {
        this.var_id_acudiente = "";
        this.var_nombre_acudiente = "";
        this.var_apellido_acudiente = "";
        this.var_telefono_acudiente = "";
        this.var_direccion_acudiente = "";
        this.var_sexo_acudiente = "";
        this.var_email_acudiente = "";
        this.var_usuario = "";
        this.var_contrasena = "";
       
    }

    
     
    public static  Acudiente load(ResultSet rs) throws SQLException{
        Acudiente au=new Acudiente();
        au.setVar_id_acudiente(rs.getString(1));
        au.setVar_nombre_acudiente(rs.getString(2));
        au.setVar_apellido_acudiente(rs.getString(3));
        au.setVar_telefono_acudiente(rs.getString(4));
        au.setVar_direccion_acudiente(rs.getString(5));
        au.setVar_sexo_acudiente(rs.getString(6));
        au.setVar_email_acudiente(rs.getString(7));
        au.setVar_usuario(rs.getString(8));
        au.setVar_contrasena(rs.getString(9));
        au.setVar_fecha_nacimiento(rs.getDate(10));
        return au;
    }
    public Acudiente(String var_id_acudiente, String var_nombre_acudiente, String var_apellido_acudiente, String var_telefono_acudiente, String var_direccion_acudiente, String var_sexo_acudiente, String var_email_acudiente, String var_usuario, String var_contrasena,Date var_fecha_nacimiento) {
        this.var_id_acudiente = var_id_acudiente;
        this.var_nombre_acudiente = var_nombre_acudiente;
        this.var_apellido_acudiente = var_apellido_acudiente;
        this.var_telefono_acudiente = var_telefono_acudiente;
        this.var_direccion_acudiente = var_direccion_acudiente;
        this.var_sexo_acudiente = var_sexo_acudiente;
        this.var_email_acudiente = var_email_acudiente;
        this.var_usuario = var_usuario;
        this.var_contrasena = var_contrasena;
        this.var_fecha_nacimiento=var_fecha_nacimiento;
    }
    

    public String getVar_apellido_acudiente() {
        return var_apellido_acudiente;
    }

    public void setVar_apellido_acudiente(String var_apellido_acudiente) {
        this.var_apellido_acudiente = var_apellido_acudiente;
    }

    public String getVar_contrasena() {
        return var_contrasena;
    }

    public void setVar_contrasena(String var_contrasena) {
        this.var_contrasena = var_contrasena;
    }

    public String getVar_direccion_acudiente() {
        return var_direccion_acudiente;
    }

    public void setVar_direccion_acudiente(String var_direccion_acudiente) {
        this.var_direccion_acudiente = var_direccion_acudiente;
    }

    public String getVar_email_acudiente() {
        return var_email_acudiente;
    }

    public void setVar_email_acudiente(String var_email_acudiente) {
        this.var_email_acudiente = var_email_acudiente;
    }

 

    public String getVar_nombre_acudiente() {
        return var_nombre_acudiente;
    }

    public void setVar_nombre_acudiente(String var_nombre_acudiente) {
        this.var_nombre_acudiente = var_nombre_acudiente;
    }

    public String getVar_sexo_acudiente() {
        return var_sexo_acudiente;
    }

    public void setVar_sexo_acudiente(String var_sexo_acudiente) {
        this.var_sexo_acudiente = var_sexo_acudiente;
    }

    public String getVar_telefono_acudiente() {
        return var_telefono_acudiente;
    }

    public void setVar_telefono_acudiente(String var_telefono_acudiente) {
        this.var_telefono_acudiente = var_telefono_acudiente;
    }

    public String getVar_usuario() {
        return var_usuario;
    }

    public void setVar_usuario(String var_usuario) {
        this.var_usuario = var_usuario;
    }
    
    public String getVar_id_acudiente() {
        return var_id_acudiente;
    }

    public void setVar_id_acudiente(String var_id_acudiente) {
        this.var_id_acudiente = var_id_acudiente;
    }
    
    public Date getVar_fecha_nacimiento() {
        return var_fecha_nacimiento;
    }

    /**
     * @param var_fecha_nacimiento the var_fecha_nacimiento to set
     */
    public void setVar_fecha_nacimiento(Date var_fecha_nacimiento) {
        this.var_fecha_nacimiento = var_fecha_nacimiento;
    }
    
    
}
