/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import dao.CestaDAO;
import dao.FacturaDAO;
import dao.LineaArticuloDAO;
import dao.UsuarioDAO;
import dto.Administrador;
import dto.Factura;
import dto.LineaArticulo;
import dto.Pedido;
import dto.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
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
 * @author ciclost
 */
public class ExportarXML extends HttpServlet {

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
        boolean errorFactura = false;
        HttpSession session = request.getSession(false);
        Usuario usuarioSesion = (session != null && session.getAttribute("usuario") != null) ? (Usuario) session.getAttribute("usuario") : null;
        usuarioSesion = (usuarioSesion != null) ? UsuarioDAO.tipoUsuario(usuarioSesion.getCodigo()) : null;
        try ( PrintWriter out = response.getWriter()) {

            // Recogemos el codigo de factura que se solicita exportar
            if (request.getParameter("id") != null) {
                int codigo = Integer.valueOf(request.getParameter("id"));
                Factura factura = new FacturaDAO().getByCodigo(codigo);
                // Si la factura existe en la BD y además está asociada al mismo usuario que hay en la sesión entonces exportamos (excepto si es admin)
                if (usuarioSesion != null && factura != null && (factura.getPedido().perteneceAUsuario(usuarioSesion) || usuarioSesion instanceof Administrador)) {
                    response.setContentType("text/plain;charset=UTF-8");
                    out.println("<?xml version=\"1.0\" encoding=\"utf-8\"?>");
                    out.println("<factura codigo_factura=\"" + factura.getNumeroFactura() + "\">");

                    out.println("\t<fecha>");
                    out.println("\t\t<dia>" + factura.getFechaFactura().getDayOfMonth() + "</dia>");
                    out.println("\t\t<mes>" + factura.getFechaFactura().getMonthValue() + "</mes>");
                    out.println("\t\t<anyo>" + factura.getFechaFactura().getYear() + "</anyo>");
                    out.println("\t\t<hora>" + factura.getFechaFactura().getHour() + "</hora>");
                    out.println("\t\t<minuto>" + factura.getFechaFactura().getMinute() + "</minuto>");
                    out.println("\t\t<segundo>" + factura.getFechaFactura().getSecond() + "</segundo>");
                    out.println("\t</fecha>");

                    out.println("\t<direccion_facturacion>");
                    out.println("\t\t<direccion>" + factura.getFacturacion().getDireccion() + "</direccion>");
//                out.println("\t\t<poblacion>" + factura.getDireccion().getPoblacion() + "</poblacion>");
//                out.println("\t\t<provincia>" + factura.getDireccion().getProvincia() + "</provincia>");
                    out.println("\t</direccion_facturacion>");

                    Pedido ped = factura.getPedido();
                    out.println("\t<pedido_asociado codigo_pedido=\"" + ped.getCodigo() + "\">");
                    out.println("\t\t<cliente>" + ped.getCliente().getNombre() + " " + ped.getCliente().getApellidos() + "</cliente>");
                    out.println("\t\t<estado_pedido>" + ped.getEstadoPedido().toString() + "</estado_pedido>");
                    out.println("\t\t<direccion_envio>");
                    out.println("\t\t\t<direccion>" + ped.getDireccionPedido().getDireccion() + "</direccion>");
                    out.println("\t\t\t<poblacion>" + ped.getDireccionPedido().getPoblacion() + "</poblacion>");
                    out.println("\t\t\t<provincia>" + ped.getDireccionPedido().getProvincia() + "</provincia>");
                    out.println("\t\t\t<c_postal>" + ped.getDireccionPedido().getCp() + "</c_postal>");
                    out.println("\t\t</direccion_envio>");
                    out.println("\t\t<lineas>");

                    ArrayList<LineaArticulo> lineas = new LineaArticuloDAO().getAllByCesta(ped.getCesta().getCodigo());
                    for (LineaArticulo linea : lineas) {
                        out.println("\t\t\t<producto codigo_producto=\"" + linea.getArticulo().getCodigo() + "\">");
                        out.println("\t\t\t\t<nombre>" + linea.getArticulo().getNombre() + "</nombre>");
                        out.println("\t\t\t\t<precio_unitario>" + redondear(linea.getArticulo().getPvp()) + "</precio_unitario>");
                        out.println("\t\t\t\t<iva>" + linea.getArticulo().getIva() + "</iva>");
                        out.println("\t\t\t\t<cantidad_productos>" + linea.getUnidades() + "</cantidad_productos>");
                        out.println("\t\t\t\t<total_linea_con_iva>" + redondear(linea.calcularSubtotalLinea()) + "</total_linea_con_iva>");
                        out.println("\t\t\t</producto>");
                    }

                    out.println("\t\t</lineas>");
                    out.println("\t</pedido_asociado>");

                    out.println("\t<total>" + redondear(new CestaDAO().calcularTotal(factura.getPedido().getCesta())) + "</total>");
                    out.println("</factura>");
                    response.setHeader("Content-Disposition", "attachment; filename=\"Nuske-factura-" + factura.getNumeroFactura() + ".xml\"");
                } else {
                    errorFactura = true;
                }
            } else {
                errorFactura = true;
            }
            if (errorFactura) {
                out.println("<p>Error. No tienes acceso a esta factura. </p><p><a href=\"javascript: history.go(-1)\">Volver atrás</a></p>");
            }
        } catch (SQLException e) {
            out.println("<h1>ERROR SQL</h1>");
        }
    }

    private static double redondear(double valor) {
        return Math.round(valor * 100) / 100.0;
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
            Logger.getLogger(ExportarXML.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ExportarXML.class.getName()).log(Level.SEVERE, null, ex);
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
