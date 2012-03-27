/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Conceptos;
import ManejadorHorario.ControlDocente;
import ManejadorSevalDocente.ControlCriterios;
import java.sql.ResultSet;
import java.sql.SQLException;
/**
 *
 * @author Dario A
 */
public class EvalDocente 
{
    private String var_idevaluacion;
    private Docente docente;
    private CriteriosEval Criterio;
    private double  var_promedio;
    private double var_ponderacion;
    private double  var_puntaje;

    public EvalDocente() {
    }

    public EvalDocente(String var_idevaluacion, Docente docente, CriteriosEval Criterio, double  var_promedio,double var_ponderacion, double var_puntaje) {
        this.var_idevaluacion = var_idevaluacion;
        this.docente = docente;
        this.Criterio = Criterio;
        this.var_promedio = var_promedio;
        this.var_ponderacion = var_ponderacion;
        this.var_puntaje = var_puntaje;
    }
  
    

    public static EvalDocente load(ResultSet rs) throws SQLException, Exception
    {
        EvalDocente eval =new EvalDocente();
        eval.setVar_idevaluacion(rs.getString(1));
        eval.setDocente(ControlDocente.consultarDocente(rs.getString(2)));
        eval.setCriterio(ControlCriterios.consultarCriterioEval(rs.getString(3)));
        eval.setVar_promedio(rs.getDouble(4));
        eval.setVar_ponderacion(rs.getDouble(5));
        eval.setVar_puntaje(rs.getDouble(6));
     
        return eval;
    }

    /**
     * @return the var_idevaluacion
     */
    public String getVar_idevaluacion() {
        return var_idevaluacion;
    }

    /**
     * @param var_idevaluacion the var_idevaluacion to set
     */
    public void setVar_idevaluacion(String var_idevaluacion) {
        this.var_idevaluacion = var_idevaluacion;
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

    /**
     * @return the Criterio
     */
    public CriteriosEval getCriterio() {
        return Criterio;
    }

    /**
     * @param Criterio the Criterio to set
     */
    public void setCriterio(CriteriosEval Criterio) {
        this.Criterio = Criterio;
    }

    /**
     * @return the var_promedio
     */
    public double  getVar_promedio() {
        return var_promedio;
    }

    /**
     * @param var_promedio the var_promedio to set
     */
    public void setVar_promedio(double var_promedio) {
        this.var_promedio = var_promedio;
    }

    /**
     * @return the var_ponderacion
     */
    public double getVar_ponderacion() {
        return var_ponderacion;
    }

    /**
     * @param var_ponderacion the var_ponderacion to set
     */
    public void setVar_ponderacion(double var_ponderacion) {
        this.var_ponderacion = var_ponderacion;
    }

    /**
     * @return the var_puntaje
     */
    public double getVar_puntaje() {
        return var_puntaje;
    }

    /**
     * @param var_puntaje the var_puntaje to set
     */
    public void setVar_puntaje(double var_puntaje) {
        this.var_puntaje = var_puntaje;
    }



}
