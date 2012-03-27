/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package Conceptos;


import ManejadorMatriculas.ControlEstudiante;
import ManejadorSEvaluacion.ControlActividades;
import java.sql.ResultSet;
import java.sql.SQLException;


/**
 *
 * @author Usuario
 */
public class EstudianteActividades {
    private int codestact;
    private Estudiante estudiante;
    private Actividades actividades;
    private int desempeño;
    private String observacion;


    public EstudianteActividades(){}
    public EstudianteActividades(int codestact, Estudiante estudiante, Actividades actividades, int desempeño, String observacion) {
        this.codestact = codestact;
        this.estudiante = estudiante;
        this.actividades = actividades;
        this.desempeño = desempeño;
        this.observacion = observacion;
    }
   public static EstudianteActividades load(ResultSet rs)throws SQLException, Exception{
       EstudianteActividades estact=new EstudianteActividades();
       estact.setCodestact(rs.getInt(1));
       estact.setEstudiante(ControlEstudiante.consultarEstudiante(rs.getString(2)));
       estact.setActividades(ControlActividades.consultarActividades(rs.getString(3)));
       estact.setDesempeño(rs.getInt(4));
       estact.setObservacion(rs.getString(5));


       return estact;
   }
    /**
     * @return the codestact
     */
    public int getCodestact() {
        return codestact;
    }

    /**
     * @param codestact the codestact to set
     */
    public void setCodestact(int codestact) {
        this.codestact = codestact;
    }

    /**
     * @return the estudiante
     */
    public Estudiante getEstudiante() {
        return estudiante;
    }

    /**
     * @param estudiante the estudiante to set
     */
    public void setEstudiante(Estudiante estudiante) {
        this.estudiante = estudiante;
    }

    /**
     * @return the actividades
     */
    public Actividades getActividades() {
        return actividades;
    }

    /**
     * @param actividades the actividades to set
     */
    public void setActividades(Actividades actividades) {
        this.actividades = actividades;
    }

    /**
     * @return the desempeño
     */
    public int getDesempeño() {
        return desempeño;
    }

    /**
     * @param desempeño the desempeño to set
     */
    public void setDesempeño(int desempeño) {
        this.desempeño = desempeño;
    }

    /**
     * @return the observacion
     */
    public String getObservacion() {
        return observacion;
    }

    /**
     * @param observacion the observacion to set
     */
    public void setObservacion(String observacion) {
        this.observacion = observacion;
    }
}
