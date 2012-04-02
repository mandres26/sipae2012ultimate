/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package Conceptos;

import ManejadorHorario.ControlAsignatura;
import ManejadorHorario.ControlDocente;
import java.sql.ResultSet;
import java.sql.SQLException;



/**
 *
 * @author Usuario
 */
public class DocenteAsignatura {
 private int coddocasig;
 private Docente docente;
 private Asignatura asignatura;

 public DocenteAsignatura(){}

 public  DocenteAsignatura(int coddocasig,Docente docente, Asignatura asignatura) {
        this.coddocasig=coddocasig;
        this.docente = docente;
        this.asignatura = asignatura;
    }

 public static DocenteAsignatura load(ResultSet rs) throws SQLException, Exception{
   DocenteAsignatura doceasig=new DocenteAsignatura();
   doceasig.setCoddocasig(rs.getInt(1));
   doceasig.setDocente(ControlDocente.consultarDocente(rs.getString(2)));
   doceasig.setAsignatura(ControlAsignatura.consultarAsignatura(rs.getString(3)));

     return doceasig;
 }

  
      /**
     * @return the asignatura
     */
    public Asignatura getAsignatura() {
        return asignatura;
    }

    /**
     * @param asignatura the asignatura to set
     */
    public void setAsignatura(Asignatura asignatura) {
        this.asignatura = asignatura;
    }

    /**
     * @return the coddocasig
     */
    public int getCoddocasig() {
        return coddocasig;
    }

    /**
     * @param coddocasig the coddocasig to set
     */
    public void setCoddocasig(int coddocasig) {
        this.coddocasig = coddocasig;
    }

    /**
     * @return the docente
     */
    public Docente getDocente() {
        return docente;
    }

    /**
     * @param docente the docente to set
     */
    public void setDocente(Docente docente) {
        this.docente = docente;
    }
}
