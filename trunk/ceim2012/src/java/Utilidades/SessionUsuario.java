/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Utilidades;

import java.io.Serializable;

/**
 *
 * @author dell
 */
public class SessionUsuario implements Serializable {

    public String getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(String idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public SessionUsuario(String usuario, String password, String idUsuario) {
        this.usuario = usuario;
        this.password = password;
        this.idUsuario = idUsuario;
    }
    private String usuario;
    private String password;
    private String idUsuario;
    
}
