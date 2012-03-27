/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ManejadoreaOtros;



import Conceptos.Estudiante;
import ManejadorMatriculas.ControlEstudiante;
import java.sql.SQLException;
import java.util.List;


/**
 *
 * @author dell
 */
public class TablaEstudiantes {
    static int i=2;
    //este es el listado de los estudiante del docente....
    public static String getListadoEstudianteAcudiente(String id) throws SQLException, Exception{
        String salida="<table><thead><tr bgcolor=\"#279DC3\"><th width=\"600px\">Codigo</th><th width=\"600px\">Identificacion</th><th width=\"400px\">Nombre</th><th width=\"600px\">Apellido</th>"+
                "<th width=\"600px\">sexo</th><th width=\"600px\">Direccion</th><th width=\"400px\">Curso</th><th width=\"600px\">Nro Hermanos</th><th width=\"600px\">Fecha de Inscripcion</th><th width=\"600px\">Estado de matricula</th><th width=\"600px\">Estado de Inscripcion</th><th width=\"600px\">Madre</th><th width=\"600px\">Padre</th></tr></thead><tbody>";
         List<Estudiante> listaInscritos=ControlEstudiante.listarEstudiante(id);
         boolean color=true;
         for(int ii=0; ii<listaInscritos.size(); ii++){
            
             Estudiante e=listaInscritos.get(ii);
             String color2=(color)?"white":"#fff";
             salida+="<tr bgcolor=\""+color2+"\">";
             salida+="<td>"+(e.getVar_codigo_estudiante())+"</td>";
             salida+="<td>"+e.getVar_identificacion_estudiante()+"</td>";
             salida+="<td>"+e.getVar_nombres_estudiante()+"</td>";
             salida+="<td>"+e.getVar_apellidos_estudiante()+"</td>";
             salida+="<td>"+(e.getVar_sexo_estudiante())+"</td>";
             salida+="<td >"+e.getVar_direccion_estudiante()+"</td>";
             salida+="<td >"+"no Asignado"+"</td>";
             salida+="<td>"+String.valueOf(e.getVar_numero_hermanos_estudiante()) +"</td>";
             salida+="<td>"+e.getVar_fecha_nacimiento().toString()+"</td>";
             salida+="<td >"+(e.getVar_estado()?"Matriculado":"No se ha matriculado")+"</td>";
             salida+="<td>"+e.getVar_nombre_madre_estudiante()+"</td>";
             salida+="<td>"+e.getVar_nombre_padre_estudiante()+"</td>";
             salida+="</tr>";
             color=!color;
            }   
          salida+="</tbody></table>"; 
        
        return salida;
    }
    
    public static String getListadoEstudianteByInscripcion() throws SQLException, Exception{
        
        String salida="<table><thead><tr bgcolor=\"#279DC3\"><th width=\"400px\">Codigo</th><th width=\"400px\">Identificacion</th><th width=\"400px\">Nombre</th><th width=\"400px\">Apellido</th>"+
                "<th width=\"400px\">sexo</th><th width=\"400px\">Direccion</th><th width=\"400px\">Curso</th><th width=\"400px\">Inscribir</th></tr></thead><tbody>";
         List<Estudiante> listaInscritos=ControlEstudiante.listarEstudiantesSinInscribir();
         boolean color=true;
         for(int ii=0; ii<listaInscritos.size(); ii++){
            
             Estudiante e=listaInscritos.get(ii);
             String color2=(color)?"white":"#8a91f8";
             salida+="<tr bgcolor=\""+color2+"\">";
             salida+="<td>"+e.getVar_identificacion_estudiante()+"</td>";
             salida+="<td>"+e.getVar_nombres_estudiante()+"</td>";
             salida+="<td>"+e.getVar_apellidos_estudiante()+"</td>";
             salida+="<td>"+(e.getVar_sexo_estudiante())+"</td>";
             salida+="<td >"+e.getVar_direccion_estudiante()+"</td>";
             salida+="<td><input type=\"checkbox\" name=\"inscripcion\" value=\""+e.getVar_identificacion_estudiante()+"\" /></td>";
             salida+="</tr>";
             color=!color;
            }   
          salida+="</tbody></table>"; 
        
        return salida;
    }
    
    public static String getListadoEstudianteByMatricula() throws SQLException, Exception{
        
        String salida="<table><thead><tr bgcolor=\"#279DC3\"><th width=\"400px\">Codigo</th><th width=\"400px\">Identificacion</th><th width=\"400px\">Nombre</th><th width=\"400px\">Apellido</th>"+
                "<th width=\"400px\">sexo</th><th width=\"400px\">Direccion</th><th width=\"400px\">Curso</th><th width=\"400px\">Matricular</th></tr></thead><tbody>";
         List<Estudiante> listaInscritos=ControlEstudiante.listarEstudiantesSinMatricular();
         boolean color=true;
         for(int ii=0; ii<listaInscritos.size(); ii++){
            
             Estudiante e=listaInscritos.get(ii);
             String color2=(color)?"white":"#8a91f8";
             salida+="<tr bgcolor=\""+color2+"\">";
              salida+="<td>"+e.getVar_identificacion_estudiante()+"</td>";
             salida+="<td>"+e.getVar_nombres_estudiante()+"</td>";
             salida+="<td>"+e.getVar_apellidos_estudiante()+"</td>";
             salida+="<td>"+(e.getVar_sexo_estudiante())+"</td>";
             salida+="<td >"+e.getVar_direccion_estudiante()+"</td>";
             salida+="<td><input type=\"checkbox\" name=\"matricula\" value=\""+e.getVar_identificacion_estudiante()+"\" /></td>";
             salida+="</tr>";
             color=!color;
            }   
          salida+="</tbody></table>"; 
        
        return salida;
    }
    
   
    
}
