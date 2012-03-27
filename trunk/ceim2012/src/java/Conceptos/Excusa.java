package Conceptos;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Digital 1
 */
public class Excusa {
    private int idExcusa;
    private String fechaExcusa;
    private String fechaInicio;
    private String fechaFinal;
    private String motivo;
    private int estado;
    
    public Excusa() {
        this.idExcusa = 0;
        this.fechaExcusa = "";
        this.fechaInicio = "";
        this.fechaFinal = "";
        this.motivo = "";
        this.estado = 0;
    }

    public Excusa(int idExcusa, String fechaExcusa, String fechaInicio, String fechaFinal, String motivo) {
        this.idExcusa = idExcusa;
        this.fechaExcusa = fechaExcusa;
        this.fechaInicio = fechaInicio;
        this.fechaFinal = fechaFinal;
        this.motivo = motivo;
        this.estado = 0;
    }

    public Excusa(String fechaExcusa, String fechaInicio, String fechaFinal, String motivo) {
        this.idExcusa = 0;
        this.fechaExcusa = fechaExcusa;
        this.fechaInicio = fechaInicio;
        this.fechaFinal = fechaFinal;
        this.motivo = motivo;
        this.estado = 0;
    }
    
    public static Excusa load(ResultSet rs) throws SQLException{
        
        Excusa excusa = new Excusa();
        //agregamos los datos del estudiante..
        excusa.setIdExcusa(rs.getInt(1));
         excusa.setFechaExcusa(rs.getString(2));
          excusa.setFechaInicio(rs.getString(3));
           excusa.setFechaFinal(rs.getString(4));
            excusa.setMotivo(rs.getString(5));
             excusa.setEstado(rs.getInt(6));
            //devolvemos el estudiante.
        return excusa;
    }
    
    public String getFechaExcusa() {
        return fechaExcusa;
    }

    public void setFechaExcusa(String fechaExcusa) {
        this.fechaExcusa = fechaExcusa;
    }

    public String getFechaFinal() {
        return fechaFinal;
    }

    public void setFechaFinal(String fechaFinal) {
        this.fechaFinal = fechaFinal;
    }

    public String getFechaInicio() {
        return fechaInicio;
    }

    public void setFechaInicio(String fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    public int getIdExcusa() {
        return idExcusa;
    }

    public void setIdExcusa(int idExcusa) {
        this.idExcusa = idExcusa;
    }

    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }
    
}