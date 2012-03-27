/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Conceptos;
import ManejadoreaOtros.ControlTipoEmpleado;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author DarioA
 */
public class Empleado  {
    private String var_cedula;
    private String var_nombre;
    private String var_apellido;
    private String var_sexo;
    private String var_estadoCivil;
    private String var_direccion;
    private String var_telefono;
    private TipoEmpleado tipoempleado;

 
    public Empleado(){}

    public Empleado(String var_cedula, String var_nombre, String var_apellido, String var_sexo, String var_estadoCivil, String var_direccion, String var_telefono, TipoEmpleado tipoempleado) {
        this.var_cedula = var_cedula;
        this.var_nombre = var_nombre;
        this.var_apellido = var_apellido;
        this.var_sexo = var_sexo;
        this.var_estadoCivil = var_estadoCivil;
        this.var_direccion = var_direccion;
        this.var_telefono = var_telefono;
        this.tipoempleado = tipoempleado;
    }
    
   
    public static Empleado load(ResultSet rs) throws SQLException, Exception{
        Empleado empleado=new Empleado();
        
        empleado.setVar_cedula(rs.getString(1));
        empleado.setVar_nombre(rs.getString(2));
        empleado.setVar_apellido(rs.getString(3));
        empleado.setVar_sexo(rs.getString(4));
        empleado.setVar_estadoCivil(rs.getString(5));
        empleado.setVar_direccion(rs.getString(6));
        empleado.setVar_telefono(rs.getString(7));
        empleado.setTipoempleado(ControlTipoEmpleado.consultartipoEmpleado(rs.getString(8)));
        
       return empleado;
  }

    /**
     * @return the var_cedula
     */
    public String getVar_cedula() {
        return var_cedula;
    }

    /**
     * @param var_cedula the var_cedula to set
     */
    public void setVar_cedula(String var_cedula) {
        this.var_cedula = var_cedula;
    }

    /**
     * @return the var_nombre
     */
    public String getVar_nombre() {
        return var_nombre;
    }

    /**
     * @param var_nombre the var_nombre to set
     */
    public void setVar_nombre(String var_nombre) {
        this.var_nombre = var_nombre;
    }

    /**
     * @return the var_apellido
     */
    public String getVar_apellido() {
        return var_apellido;
    }

    /**
     * @param var_apellido the var_apellido to set
     */
    public void setVar_apellido(String var_apellido) {
        this.var_apellido = var_apellido;
    }

    /**
     * @return the var_sexo
     */
    public String getVar_sexo() {
        return var_sexo;
    }

    /**
     * @param var_sexo the var_sexo to set
     */
    public void setVar_sexo(String var_sexo) {
        this.var_sexo = var_sexo;
    }

    /**
     * @return the var_estadoCivil
     */
    public String getVar_estadoCivil() {
        return var_estadoCivil;
    }

    /**
     * @param var_estadoCivil the var_estadoCivil to set
     */
    public void setVar_estadoCivil(String var_estadoCivil) {
        this.var_estadoCivil = var_estadoCivil;
    }

    /**
     * @return the var_direccion
     */
    public String getVar_direccion() {
        return var_direccion;
    }

    /**
     * @param var_direccion the var_direccion to set
     */
    public void setVar_direccion(String var_direccion) {
        this.var_direccion = var_direccion;
    }

    /**
     * @return the var_telefono
     */
    public String getVar_telefono() {
        return var_telefono;
    }

    /**
     * @param var_telefono the var_telefono to set
     */
    public void setVar_telefono(String var_telefono) {
        this.var_telefono = var_telefono;
    }

    /**
     * @return the tipoempleado
     */
    public TipoEmpleado getTipoempleado() {
        return tipoempleado;
    }

    /**
     * @param tipoempleado the tipoempleado to set
     */
    public void setTipoempleado(TipoEmpleado tipoempleado) {
        this.tipoempleado = tipoempleado;
    }
  
    
}
