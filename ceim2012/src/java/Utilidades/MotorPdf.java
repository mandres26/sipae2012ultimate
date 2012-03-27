/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Utilidades;

/**
 *
 * @author dell
 */

import Conceptos.Acudiente;
import Conceptos.Estudiante;
import Conceptos.Matricula;
import ManejadorMatriculas.ControlMatricula;
import ManejadorMatriculas.ControladorAcudiente;
import java.io.*;
import com.lowagie.text.pdf.*;
import com.lowagie.text.*;
import java.awt.Color;
import java.util.Calendar;
import java.sql.Date;

public class MotorPdf
   {
        
        public static void generarPDFExcusa(String id_acudiente, String id_estudiante, String motivo_excusa) throws DocumentException, Exception{
             Matricula mat=ControlMatricula.consultarMatricula(id_estudiante);
             Acudiente a=ControladorAcudiente.consultarAcudiente(id_acudiente);
            
             Document document=new Document();
              
               PdfWriter.getInstance(document,new FileOutputStream("d:/excusaEstudiante.pdf"));
               document.open();  
               //-- Tabla del pdf
                Date d=new Date(Calendar.getInstance().getTimeInMillis());
                PdfPTable table=new PdfPTable(4);
                PdfPCell cell = new PdfPCell (new Paragraph ("EXCUSA "+d.toString()));
                cell.setBorder(0);
                cell.setColspan (2);
                cell.setHorizontalAlignment (Element.ALIGN_CENTER);
                cell.setBackgroundColor(new Color(0,255,255));
                cell.setPadding (10.0f);
                table.addCell (cell);
                
                //acudiente
                cell =getNewFila("Acudiente", 4, false);
                cell.setBackgroundColor(new Color(0,255,255));
                cell.setHorizontalAlignment (Element.ALIGN_CENTER);
                table.addCell (cell);
                table.addCell (getNewFila("Identificacion:", 2, false));
                 table.addCell (getNewFila(String.valueOf(a.getVar_id_acudiente()), 2, false));
                 table.addCell (getNewFila("Nombre:", 2, false));
                 table.addCell (getNewFila(a.getVar_nombre_acudiente(), 2, false));
                 //estudiante
                  cell =getNewFila("Estudiante", 4, false);
                cell.setBackgroundColor(new Color(0,255,255));
                cell.setHorizontalAlignment (Element.ALIGN_CENTER);
                table.addCell (cell);
                table.addCell (getNewFila("Identificacion:", 2, false));
                 table.addCell (getNewFila(mat.getEstudiante().getVar_identificacion_estudiante(), 2, false));
                  table.addCell (getNewFila("Nombre:", 2, false));
                   table.addCell (getNewFila(mat.getEstudiante().getVar_nombres_estudiante(), 2, false));
                   //padres
                  cell =getNewFila("Padres", 4, false);
                cell.setBackgroundColor(new Color(0,255,255));
                cell.setHorizontalAlignment (Element.ALIGN_CENTER);
                table.addCell (cell);
                table.addCell (getNewFila("Identificacion:", 2, false));
                 table.addCell (getNewFila(String.valueOf(a.getVar_id_acudiente()), 2, false));
                  table.addCell (getNewFila("madre:", 2, false));
                   table.addCell (getNewFila(mat.getEstudiante().getVar_nombre_madre_estudiante(), 2, false));
                   table.addCell (getNewFila("padre:", 2, false));
                   table.addCell (getNewFila(mat.getEstudiante().getVar_nombre_padre_estudiante(), 2, false));
                   
                     //escusa
                   cell =getNewFila("Motivo de Excusa", 4, false);
                cell.setBackgroundColor(new Color(0,255,255));
                cell.setHorizontalAlignment (Element.ALIGN_CENTER);
                table.addCell (cell);
                     table.addCell (getNewFila(motivo_excusa, 4, true));
                
                document.add(table);
                document.add(new Paragraph("                                               <Colegio Integral Moderno>"));
               //--fin de tabla ´df
               document.close();
            
        }
     
     
        //inscripcion .. de estudiante..
        public static void generarPDF(String titulo, String id)throws Exception{
            
               Matricula mat=ControlMatricula.consultarMatricula(id);
               Document document=new Document();
              
               PdfWriter.getInstance(document,new FileOutputStream("d:/volantePagoEstudiante.pdf"));
               document.open();  
               //-- Tabla del pdf
               
               PdfPTable table=new PdfPTable(2);
                PdfPCell cell = new PdfPCell (new Paragraph (titulo));
                cell.setBorder(0);
                cell.setColspan (2);
                cell.setHorizontalAlignment (Element.ALIGN_CENTER);
                cell.setBackgroundColor(new Color(0,255,255));
                cell.setPadding (10.0f);
                table.addCell (cell);
                
                table.addCell (getNewFila("Codigo:", 1, false));
                 table.addCell (getNewFila(mat.getEstudiante().getVar_codigo_estudiante(), 1, false));
                  table.addCell (getNewFila("Nombre:", 1, false));
                   table.addCell (getNewFila(mat.getEstudiante().getVar_nombres_estudiante(), 1, false));
                    table.addCell (getNewFila("Valor de Matricula 1'000.000 ps", 2, false));              
                
                document.add(table);
                document.add(new Paragraph("                                               <Colegio Integral Moderno>"));
               //--fin de tabla ´df
               document.close();
          }
      private static PdfPCell getNewFila(String nombre, int colspan, boolean border){
            PdfPCell cell = new PdfPCell (new Paragraph (nombre));
            if(!border)    
            cell.setBorder(0);
                cell.setPadding (10.0f);
                cell.setColspan (colspan);
                return cell;
        }
}
