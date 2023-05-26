/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import dao.ArticuloDAO;
import dao.CestaDAO;
import dao.DireccionDAO;
import dao.LineaArticuloDAO;
import dao.PedidoDAO;
import dao.UsuarioDAO;
import dto.Articulo;
import dto.Cesta;
import dto.Cliente;
import dto.Direccion;
import dto.EstadoPedido;
import dto.LineaArticulo;
import dto.Pedido;
import dto.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.time.LocalDateTime;
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
public class ConfirmarPedido extends HttpServlet {

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
            Usuario usuarioSesion = (session != null && session.getAttribute("usuario") != null) ? (Usuario) session.getAttribute("usuario") : null;
            usuarioSesion = (usuarioSesion != null) ? UsuarioDAO.tipoUsuario(usuarioSesion.getCodigo()) : null;

            if (usuarioSesion == null || !(usuarioSesion instanceof Cliente)) {
                out.println("<h2>No tienes permiso para acceder a esta sección</h2>");

            } else {

                PedidoDAO pDAO = new PedidoDAO();
                CestaDAO cDAO = new CestaDAO();
                Cesta carrito = cDAO.getByCliente(usuarioSesion.getCodigo());

                if (request.getParameter("direccion") != null) {
                    Direccion direccion = new DireccionDAO().getByCodigo(Integer.parseInt(request.getParameter("direccion")), usuarioSesion);

                    Pedido pedido = new Pedido(pDAO.siguienteCodigo(), EstadoPedido.PROCESANDO, LocalDateTime.now(), carrito, direccion, (Cliente) usuarioSesion, 0, false);

                    if (cDAO.revisarStock(carrito)) {
                        cDAO.descontarStock(carrito);
                        pDAO.anyadir(pedido);

                        Cesta nuevaCesta = new Cesta(cDAO.siguienteCodigo(), (Cliente) usuarioSesion);

                        cDAO.anyadir(nuevaCesta);

                        response.sendRedirect("pedidos.jsp");
                    } else{
                        request.setAttribute("errorStock", true);
                        request.getRequestDispatcher("carrito.jsp").include(request, response);
//                        out.println("<h2>No tenemos suficiente stock para confirmar el pedido. Disculpe las molestias.</h2>");
                    }

                } else {
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
            Logger.getLogger(ConfirmarPedido.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ConfirmarPedido.class.getName()).log(Level.SEVERE, null, ex);
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
