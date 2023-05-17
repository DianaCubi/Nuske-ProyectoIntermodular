/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import dao.ArticuloDAO;
import dao.CestaDAO;
import dao.LineaArticuloDAO;
import dao.UsuarioDAO;
import dto.Articulo;
import dto.Cesta;
import dto.Cliente;
import dto.LineaArticulo;
import dto.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author dncub
 */
public class AnyadirAlCarrito extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        try (PrintWriter out = response.getWriter()) {
            //RECOGEMOS EL USUARIO LOGGEADO Y COMPROBAMOS QUE SEA CLIENTE
            Usuario usuarioSesion = (session != null && session.getAttribute("usuario") != null) ? (Usuario) session.getAttribute("usuario") : null;
            usuarioSesion = (usuarioSesion != null) ? UsuarioDAO.tipoUsuario(usuarioSesion.getCodigo()) : null;
            if(usuarioSesion==null || !(usuarioSesion instanceof Cliente)){
                out.println("<h2>No tienes permiso para acceder a esta sección</h2>");
            } else{
                //RECOGEMOS Y VALIDAMOS LOS DATOS DEL FORMULARIO
                String idProducto = request.getParameter("id");
                String strCantidad = request.getParameter("cantidad");
                
                System.out.println("ID PRODUCTO: " + idProducto);
                System.out.println("CANTIDAD: " + strCantidad);
                
//                NO VA -> && strCantidad.chars().allMatch(Character::isDigit) -- PREGUNTAR A JOSÉ RAMÓN
                if (idProducto != null && strCantidad != null) {
                    Articulo art = new ArticuloDAO().getByCodigo(idProducto);
                    
                    int cantidad = Integer.parseInt(strCantidad);
                    
                    CestaDAO cDAO = new CestaDAO();
                    Cesta cestaUsuario = cDAO.getByCliente(usuarioSesion.getCodigo());
                    
                    //COMPROBAMOS SI EL USUARIO YA TIENE UNA CESTA CREADA, SI NO, LA CREAMOS
                    if(cestaUsuario==null){
                        cestaUsuario = new Cesta(cDAO.siguienteCodigo(), (Cliente)usuarioSesion);
                        cDAO.anyadir(cestaUsuario);
                    }
                    
                    //RECOGEMOS LOS ARTICULOS QUE HAYA EN LA CESTA
                    ArrayList<LineaArticulo> lineas = cDAO.getLineas(cestaUsuario.getCodigo());
                    //CREAMOS LA NUEVA LINEA CON EL ARTICULO
                    LineaArticulo linea = new LineaArticulo(art, cestaUsuario, cantidad);
                    LineaArticuloDAO lDAO = new LineaArticuloDAO();
                    
                    //AÑADIMOS LA LÍNEA DEL ARTÍCULO SI NO EXISTÍA ANTES
                    if(!lineas.contains(linea)){
                        lineas.add(linea);
                        lDAO.anyadir(linea);
                    }
                    
                    
                    
                    System.out.println("LISTAAAAAAAAA");
                    for(LineaArticulo la : lineas){
                            System.out.println(la.getArticulo().getCodigo() + " " + la.getUnidades());
                    }
                    
                    response.sendRedirect("carrito.jsp");
                }else{
                    out.println("<h2>Datos incorrectos. Revisa el formulario</h2>");
                }
            }
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(AnyadirAlCarrito.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(AnyadirAlCarrito.class.getName()).log(Level.SEVERE, null, ex);
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
