/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import dao.DireccionDAO;
import dao.FacturaDAO;
import dao.PedidoDAO;
import dao.UsuarioDAO;
import dto.Administrador;
import dto.Cliente;
import dto.Direccion;
import dto.EstadoPedido;
import dto.Factura;
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
public class Facturar extends HttpServlet {

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
        String strId = request.getParameter("id");
        PedidoDAO pedidoDAO = new PedidoDAO();
        FacturaDAO facturaDAO = new FacturaDAO();
        
        boolean allDigits = true;
        for (char c : strId.toCharArray()) {
            if (!Character.isDigit(c)) {
                allDigits = false;
                break;
            }
        }

        try (PrintWriter out = response.getWriter()) {
            //RECOGEMOS EL USUARIO LOGGEADO Y COMPROBAMOS QUE SEA CLIENTE
            Usuario usuarioSesion = (session != null && session.getAttribute("usuario") != null) ? (Usuario) session.getAttribute("usuario") : null;
            usuarioSesion = (usuarioSesion != null) ? UsuarioDAO.tipoUsuario(usuarioSesion.getCodigo()) : null;
            if (usuarioSesion == null || !(usuarioSesion instanceof Cliente || usuarioSesion instanceof Administrador)) {
                out.println("<h2>No tienes permiso para acceder a esta sección</h2>");
            } else if (!allDigits) {
                out.println("<h2>Código incorrecto.</h2>");
            } else{
                Pedido pedidoAFacturar = pedidoDAO.getByCodigo(Integer.parseInt(strId));
                // Si el código es numérico pero no existe en la base de datos, o bien no pertenece al usuario conectado (excepto si es admin) mostraremos error.
                if (pedidoAFacturar == null || (!pedidoAFacturar.perteneceAUsuario(usuarioSesion) && !(usuarioSesion instanceof Administrador))) {
                    out.println("<h2>Pedido no encontrado.</h2>");
                } else {
                    String strDir = request.getParameter("direccion");
                    Direccion dirEnvio = new DireccionDAO().getByCodigo(Integer.parseInt(strDir));
                    
//                    System.out.println(dirEnvio.perteneceA(usuarioSesion));
                    if (dirEnvio == null || (!dirEnvio.perteneceA(usuarioSesion) && !(usuarioSesion instanceof Administrador))) {
                        out.println("<h2>Dirección no encontrada</h2>");
                    } else {
                        // Si la factura pertenece al usuario en sesión (o es admin) entonces creamos una nueva factura con los datos del formulario y actualizamos el pedido (facturado = true)
                        Pedido pedidoFacturado = new Pedido(pedidoAFacturar.getCodigo(), EstadoPedido.COMPLETADO, pedidoAFacturar.getFechaPedido(), pedidoAFacturar.getCesta(), pedidoAFacturar.getDireccionPedido(), pedidoAFacturar.getCliente(), 0, true);
                        Factura factura = new Factura(facturaDAO.siguienteCodigoFactura(), LocalDateTime.now(), pedidoFacturado, dirEnvio);
                        facturaDAO.anyadir(factura);
                        pedidoDAO.actualizar(pedidoFacturado);
                        response.sendRedirect("facturas.jsp");
                    }

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
            Logger.getLogger(Facturar.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Facturar.class.getName()).log(Level.SEVERE, null, ex);
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
