package Utilidades;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */



import Conceptos.Acudiente;
import ManejadorMatriculas.ControlMatricula;
import ManejadoreaOtros.ControladorAdministrador;
import ManejadorMatriculas.ControladorAcudiente;
import ManejadorHorario.ControlDocente;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 *
 * @author dell
 */
public class InicioSesion extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
           
            String usuario=request.getParameter("usuario");
            String pass=request.getParameter("pass");
             String tipo=request.getParameter("tipo");
             if(tipo.equalsIgnoreCase("1")){
                 Acudiente a=ControladorAcudiente.isUsurioPass(usuario, pass);
                 if(a!=null){
                     request.getSession().setAttribute("usuario", usuario);
                     request.getSession().setAttribute("pass", pass);
                     request.getSession().setAttribute("tipo", tipo);
                     response.sendRedirect("Vistas/Matricula/acudiente.jsp");
                 }else{
                  usuarioNoEncontrado(request,response); 
                 }
             }else if(tipo.equalsIgnoreCase("3")){
              
                 if(ControladorAdministrador.existeAdministrador(usuario, pass)){
                     request.getSession().setAttribute("usuario", usuario);
                     request.getSession().setAttribute("pass", pass);
                     request.getSession().setAttribute("tipo", tipo);
                     response.sendRedirect("../../GestionAdministrador.jsp");
                 }else{
                 usuarioNoEncontrado(request,response);
                 }
                 
                 }else if(tipo.equalsIgnoreCase("2")){
                     
                     if(ControlMatricula.existeEstudiantemat(usuario, pass)){
                        
                     
                     request.getSession().setAttribute("usuario", usuario);
                     request.getSession().setAttribute("pass", pass);
                     request.getSession().setAttribute("tipo", tipo);
                     response.sendRedirect("docenteVista.jsp");
                     }else{
                   usuarioNoEncontrado(request,response); 
                 }
                  }else if(tipo.equalsIgnoreCase("4")){
                     
                     if(ControlDocente.existeDocente(usuario, pass)){
                        
                     
                     request.getSession().setAttribute("usuario", usuario);
                     request.getSession().setAttribute("pass", pass);
                     request.getSession().setAttribute("tipo", tipo);
                     response.sendRedirect("docenteVista.jsp");
                     }else{
                   usuarioNoEncontrado(request,response); 
                 }
                  }
             
        } catch (Exception ex) {
            Logger.getLogger(InicioSesion.class.getName()).log(Level.SEVERE, null, ex);
        }finally {            
            out.close();
        }
    }
    
    private void usuarioNoEncontrado(HttpServletRequest request, HttpServletResponse response){
        try {
           
           request.getSession().setAttribute("info", "usuario o contraseña incorrectos");
           
                        response.sendRedirect("../../index.jsp");
        } catch (IOException ex) {
            Logger.getLogger(InicioSesion.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
