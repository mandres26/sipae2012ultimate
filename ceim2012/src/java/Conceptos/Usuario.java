/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package Conceptos;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author josedavo
 */
public class Usuario {
 private String var_username;
 private String var_pass;
 private String var_tipousuario;

    public Usuario(String var_username, String var_pass,String var_tipousuario) {
        this.var_username = var_username;
        this.var_pass = var_pass;
        this.var_tipousuario=var_tipousuario;
    }

   

 public  Usuario() {  }
 
  public static Usuario load(ResultSet rs) throws SQLException{
        Usuario usuario=new Usuario();

      usuario.setVar_username(rs.getString(1));
      usuario.setVar_pass(rs.getString(2));
      usuario.setVar_tipousuario(rs.getString(3));


        return usuario;
    }

    /**
     * @return the var_username
     */
    public String getVar_username() {
        return var_username;
    }

    /**
     * @param var_username the var_username to set
     */
    public void setVar_username(String var_username) {
        this.var_username = var_username;
    }

    /**
     * @return the var_pass
     */
    public String getVar_pass() {
        return var_pass;
    }

    /**
     * @param var_pass the var_pass to set
     */
    public void setVar_pass(String var_pass) {
        this.var_pass = var_pass;
    }

    /**
     * @return the var_tipousuario
     */
    public String getVar_tipousuario() {
        return var_tipousuario;
    }

    /**
     * @param var_tipousuario the var_tipousuario to set
     */
    public void setVar_tipousuario(String var_tipousuario) {
        this.var_tipousuario = var_tipousuario;
    }


   

}
