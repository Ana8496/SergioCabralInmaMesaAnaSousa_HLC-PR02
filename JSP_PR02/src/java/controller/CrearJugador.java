/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hashmap.Jugador;
import hashmap.JugadorHashmap;
import java.util.GregorianCalendar;


/**
 *
 * @author z3rh10
 */
@WebServlet(name = "CrearJugador", urlPatterns = {"/CrearJugador"})
public class CrearJugador extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        
        try (PrintWriter out = response.getWriter()) {
         
 
            String nombre = request.getParameter("nombre");
            String fecha = request.getParameter("fechaNac");
            
            GregorianCalendar fechaNac = new GregorianCalendar(getAnio(fecha), getMes(fecha), getDia(fecha));
            
            int intentos = Integer.parseInt(request.getParameter("intentos"));
            
            Jugador j = new Jugador(nombre, fechaNac, intentos);
            JugadorHashmap jh = new JugadorHashmap();
            jh.devolverTipoHash();
            
            out.print(nombre);
            out.print(request.getParameter("fechaNac"));
            out.print(Integer.parseInt(request.getParameter("intentos")));
            
            
            
            
//            j.setNombre(nombre);
//            //fecha viene con formato yyyy-MM-dd
//            j.setFechaNac(fechaNac);
//            j.setIntentos(intentos);
//            
             jh.add(nombre, j);
            
            response.sendRedirect("ranking.jsp");

//            response.sendRedirect("ranking.jsp");
            
//              response.sendRedirect(request.getContextPath()+ "/ranking.jsp");
        }
        
    }
    
    private int getDia(String fecha) {
        String[] partes = fecha.split("-");
        return Integer.parseInt(partes[2]);
    }
    
    private int getMes(String fecha) {
        String[] partes = fecha.split("-");
        return Integer.parseInt(partes[1]);
    }
    
    private int getAnio(String fecha) {
        String[] partes = fecha.split("-");
        return Integer.parseInt(partes[0]);
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
