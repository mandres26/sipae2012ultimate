/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Conceptos;

import ManejadorMatriculas.ControladorAcudiente;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;
//import java.util.Date;

/**
 *
 * @author DADC
 */
public class Estudiante {
    
    private String var_codigo_estudiante;
    private String var_identificacion_estudiante;
    private String var_nombres_estudiante;
    private String var_apellidos_estudiante;
    private String var_nombre_madre_estudiante;
    private String var_nombre_padre_estudiante;
    private String var_direccion_estudiante;
    private String var_sexo_estudiante;
    private int    var_numero_hermanos_estudiante;
    private Date var_fecha_nacimiento;
     private Acudiente acudiente;
    private boolean  var_estado;
    private String var_foto;
    

    public Estudiante() {
        super();
    }

    public Estudiante(String var_codigo_estudiante, String var_identificacion_estudiante, String var_nombres_estudiante, String var_apellidos_estudiante, String var_nombre_madre_estudiante, String var_nombre_padre_estudiante, String var_direccion_estudiante, String var_sexo_estudiante, int var_numero_hermanos_estudiante,Date var_fecha_nacimiento, Acudiente acudiente,boolean  var_estado,String var_foto) {
      
        this.var_codigo_estudiante = var_codigo_estudiante;
        this.var_identificacion_estudiante = var_identificacion_estudiante;
        this.var_nombres_estudiante = var_nombres_estudiante;
        this.var_apellidos_estudiante = var_apellidos_estudiante;
        this.var_nombre_madre_estudiante = var_nombre_madre_estudiante;
        this.var_nombre_padre_estudiante = var_nombre_padre_estudiante;
        this.var_direccion_estudiante = var_direccion_estudiante;
        this.var_sexo_estudiante = var_sexo_estudiante;
        this.var_numero_hermanos_estudiante = var_numero_hermanos_estudiante;
        this.var_fecha_nacimiento=var_fecha_nacimiento;
        this.acudiente = acudiente;
        this.var_estado=var_estado;
        this.var_foto=var_foto;
    }

   
            
       
         
    public static Estudiante  load(ResultSet rs) throws SQLException, Exception{
       
        Estudiante est=new Estudiante();
        
        est.setVar_codigo_estudiante(rs.getString(1));
        est.setVar_identificacion_estudiante(rs.getString(2));
        est.setVar_nombres_estudiante(rs.getString(3));
        est.setVar_apellidos_estudiante(rs.getString(4));
        est.setVar_nombre_madre_estudiante(rs.getString(5));
        est.setVar_nombre_padre_estudiante(rs.getString(6));
        est.setVar_direccion_estudiante(rs.getString(7));
        est.setVar_sexo_estudiante(rs.getString(8));
        est.setVar_numero_hermanos_estudiante(rs.getInt(9));
        est.setVar_fecha_nacimiento(rs.getDate(10));
        est.setAcudiente(ControladorAcudiente.consultarAcudiente(rs.getString(11)));
        est.setVar_estado(rs.getBoolean(12));
        est.setVar_foto(rs.getString(13));
       
        return est;
    }

    /**
     * @return the var_codigo_estudiante
     */
    public String getVar_codigo_estudiante() {
        return var_codigo_estudiante;
    }

    /**
     * @param var_codigo_estudiante the var_codigo_estudiante to set
     */
    public void setVar_codigo_estudiante(String var_codigo_estudiante) {
        this.var_codigo_estudiante = var_codigo_estudiante;
    }

    /**
     * @return the var_identificacion_estudiante
     */
    public String getVar_identificacion_estudiante() {
        return var_identificacion_estudiante;
    }

    /**
     * @param var_identificacion_estudiante the var_identificacion_estudiante to set
     */
    public void setVar_identificacion_estudiante(String var_identificacion_estudiante) {
        this.var_identificacion_estudiante = var_identificacion_estudiante;
    }

    /**
     * @return the var_nombre_estudiante
     */
    public String getVar_nombres_estudiante() {
        return var_nombres_estudiante;
    }

    /**
     * @param var_nombre_estudiante the var_nombre_estudiante to set
     */
    public void setVar_nombres_estudiantes(String var_nombres_estudiante) {
        this.setVar_nombres_estudiante(var_nombres_estudiante);
    }

   
    /**
     * @return the var_nombre_madre_estudiante
     */
    public String getVar_nombre_madre_estudiante() {
        return var_nombre_madre_estudiante;
    }

    /**
     * @param var_nombre_madre_estudiante the var_nombre_madre_estudiante to set
     */
    public void setVar_nombre_madre_estudiante(String var_nombre_madre_estudiante) {
        this.var_nombre_madre_estudiante = var_nombre_madre_estudiante;
    }

    /**
     * @return the var_nombre_padre_estudiante
     */
    public String getVar_nombre_padre_estudiante() {
        return var_nombre_padre_estudiante;
    }

    /**
     * @param var_nombre_padre_estudiante the var_nombre_padre_estudiante to set
     */
    public void setVar_nombre_padre_estudiante(String var_nombre_padre_estudiante) {
        this.var_nombre_padre_estudiante = var_nombre_padre_estudiante;
    }

    public String getVar_direccion_estudiante() {
        return var_direccion_estudiante;
    }

    /**
     * @param var_direccion_estudiante the var_direccion_estudiante to set
     */
    public void setVar_direccion_estudiante(String var_direccion_estudiante) {
        this.var_direccion_estudiante = var_direccion_estudiante;
    }

   
    public String getVar_apellidos_estudiante() {
        return var_apellidos_estudiante;
    }

    /**
     * @param var_apellido_estudiante the var_apellido_estudiante to set
     */
    public void setVar_apellidos_estudiante(String var_apellidos_estudiante) {
        this.var_apellidos_estudiante = var_apellidos_estudiante;
    }

    /**
     * @return the var_numero_hermanos_estudiante
     */
    public int getVar_numero_hermanos_estudiante() {
        return var_numero_hermanos_estudiante;
    }

    /**
     * @param var_numero_hermanos_estudiante the var_numero_hermanos_estudiante to set
     */
    public void setVar_numero_hermanos_estudiante(int var_numero_hermanos_estudiante) {
        this.var_numero_hermanos_estudiante = var_numero_hermanos_estudiante;
    }

    /**
     * @param var_nombres_estudiante the var_nombres_estudiante to set
     */
    public void setVar_nombres_estudiante(String var_nombres_estudiante) {
        this.var_nombres_estudiante = var_nombres_estudiante;
    }

    /**
     * @return the var_sexo_estudiante
     */
    public String getVar_sexo_estudiante() {
        return var_sexo_estudiante;
    }

    /**
     * @param var_sexo_estudiante the var_sexo_estudiante to set
     */
    public void setVar_sexo_estudiante(String var_sexo_estudiante) {
        this.var_sexo_estudiante = var_sexo_estudiante;
    }

    /**
     * @return the acudiente
     */
    public Acudiente getAcudiente() {
        return acudiente;
    }

    /**
     * @param acudiente the acudiente to set
     */
    public void setAcudiente(Acudiente acudiente) {
        this.acudiente = acudiente;
    }

    /**
     * @return the var_fecha_nacimiento
     */
    public Date getVar_fecha_nacimiento() {
        return var_fecha_nacimiento;
    }

    /**
     * @param var_fecha_nacimiento the var_fecha_nacimiento to set
     */
    public void setVar_fecha_nacimiento(Date var_fecha_nacimiento) {
        this.var_fecha_nacimiento = var_fecha_nacimiento;
    }

    /**
     * @return the var_estado
     */
    public Boolean getVar_estado() {
        return var_estado;
    }

    /**
     * @param var_estado the var_estado to set
     */
    public void setVar_estado(Boolean var_estado) {
        this.var_estado = var_estado;
    }

    /**
     * @return the var_foto
     */
    public String getVar_foto() {
        return var_foto;
    }

    /**
     * @param var_foto the var_foto to set
     */
    public void setVar_foto(String var_foto) {
        this.var_foto = var_foto;
    }
  
    
}
