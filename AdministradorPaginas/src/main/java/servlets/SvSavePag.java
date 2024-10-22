/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileWriter;

/**
 *
 * @author jorge
 */
@WebServlet(name = "SvSavePag", urlPatterns = {"/guardarpagina"})
public class SvSavePag extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
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
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        // Configurar las cabeceras CORS
        response.setHeader("Access-Control-Allow-Origin", "*");  // O puedes especificar un origen específico en lugar de '*'
        response.setHeader("Access-Control-Allow-Methods", "POST, GET, OPTIONS");
        response.setHeader("Access-Control-Allow-Headers", "Content-Type");
        
        
        String codigoPagina = request.getParameter("codigoPagina");
        String nombrePagina = request.getParameter("nombrePagina");
        String ruta = "/home/jorge/Compi_1/ProyectoFinal_Compi1_2S24/Paginas_generadas/";
        ruta += nombrePagina + ".html";
        
        System.out.println("Codigo a guardar\n" + codigoPagina);
        System.out.println("Nombre: " + nombrePagina);
        System.out.println("Ruta: " + ruta);
        
        FileWriter escritor = null; 
        try {
            // Creamos un objeto File para representar el archivo
            File archivo = new File(ruta);

            // Si el archivo ya existe, lo eliminamos
            if (archivo.exists()) {
                archivo.delete();
            }

                escritor = new FileWriter(archivo);
                escritor.write(codigoPagina);
            

            System.out.println("El archivo se ha guardado correctamente en: " + ruta);
        } catch (IOException e) {
            System.out.println("Error al guardar el archivo: " + e.getMessage());
            if(escritor != null){
                escritor.close();
            }
        }
        
        
        
    }

    
    
    
    
    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
