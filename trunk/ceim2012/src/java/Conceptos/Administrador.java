/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Conceptos;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author dell
 */
public class Administrador {
   private String var_username;
   private String var_pass;


    public Administrador(String var_username, String var_pass) {
        this.var_username = var_username;
        this.var_pass = var_pass;
     
    }

   

 public  Administrador() {  }
 
  public static Administrador load(ResultSet rs) throws SQLException{
        Administrador admin=new Administrador();

      admin.setVar_username(rs.getString(1));
      admin.setVar_pass(rs.getString(2));
      


        return admin;
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
}
