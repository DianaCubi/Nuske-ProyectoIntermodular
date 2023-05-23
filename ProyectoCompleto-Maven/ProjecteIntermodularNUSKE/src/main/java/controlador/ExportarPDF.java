/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chapter;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import dao.CestaDAO;
import dao.FacturaDAO;
import dao.LineaArticuloDAO;
import dao.UsuarioDAO;
import dto.Administrador;
import dto.Factura;
import dto.LineaArticulo;
import dto.Pedido;
import dto.Usuario;
import java.awt.Font;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.NumberFormat;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Locale;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ciclost
 */
public class ExportarPDF extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final com.itextpdf.text.Font chapterFont = FontFactory.getFont(FontFactory.HELVETICA, 26, com.itextpdf.text.Font.BOLDITALIC);
    private static final com.itextpdf.text.Font paragraphFont = FontFactory.getFont(FontFactory.HELVETICA, 12, com.itextpdf.text.Font.NORMAL);

    private static final com.itextpdf.text.Font categoryFont = new com.itextpdf.text.Font(com.itextpdf.text.Font.FontFamily.TIMES_ROMAN, 18, com.itextpdf.text.Font.BOLD);
    private static final com.itextpdf.text.Font subcategoryFont = new com.itextpdf.text.Font(com.itextpdf.text.Font.FontFamily.TIMES_ROMAN, 16, com.itextpdf.text.Font.BOLD);
    private static final com.itextpdf.text.Font blueFont = new com.itextpdf.text.Font(com.itextpdf.text.Font.FontFamily.TIMES_ROMAN, 12, com.itextpdf.text.Font.NORMAL, BaseColor.RED);
    private static final com.itextpdf.text.Font smallBold = new com.itextpdf.text.Font(com.itextpdf.text.Font.FontFamily.TIMES_ROMAN, 12, com.itextpdf.text.Font.BOLD);
    private static final com.itextpdf.text.Font totalBold = new com.itextpdf.text.Font(com.itextpdf.text.Font.FontFamily.TIMES_ROMAN, 14, com.itextpdf.text.Font.BOLD);

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setHeader("Content-disposition", "filename=factura.pdf");
        HttpSession session = request.getSession(false);
        Usuario usuarioSesion = (session != null && session.getAttribute("usuario") != null) ? (Usuario) session.getAttribute("usuario") : null;
        usuarioSesion = (usuarioSesion != null) ? UsuarioDAO.tipoUsuario(usuarioSesion.getCodigo()) : null;
        try ( ServletOutputStream out = response.getOutputStream()) {
            // Recogemos el codigo de factura que se solicita exportar
            if (request.getParameter("id") != null) {
                int codigo = Integer.valueOf(request.getParameter("id"));
                Factura factura = new FacturaDAO().getByCodigo(codigo);
                // Si la factura existe en la BD y además está asociada al mismo usuario que hay en la sesión entonces exportamos (excepto si es admin)
                if (usuarioSesion != null && factura != null && (factura.getPedido().perteneceAUsuario(usuarioSesion) || usuarioSesion instanceof Administrador)) {
                    response.setHeader("Content-disposition", "filename=Nuske-factura" + factura.getNumeroFactura() + ".pdf");
                    createPDF(out, factura);
                }
            }
        } catch (SQLException ex) {
            System.out.println("Error SQL");
        }
    }

    public static String moneda(double valor) {
        NumberFormat currency = NumberFormat.getCurrencyInstance(Locale.ITALY);
        return currency.format(valor) + " ";
    }

    public void createPDF(OutputStream os, Factura factura) throws SQLException {
        try {

            Document document = new Document();
            PdfWriter.getInstance(document, os);
            document.open();
            document.addTitle("Factura " + factura.getNumeroFactura());
            document.addAuthor("Jose R. Mas");

            // Primera página 
            Chunk chunk = new Chunk("Factura nº " + factura.getNumeroFactura(), chapterFont);
            chunk.setBackground(BaseColor.LIGHT_GRAY);
            // Let's create de first Chapter (Creemos el primer capítulo)
            Chapter chapter = new Chapter(new Paragraph(chunk), 1);
            chapter.setNumberDepth(0);

            Usuario cliente = factura.getPedido().getCliente();
            chapter.add(new Paragraph(" ", subcategoryFont));
            chapter.add(new Paragraph("Datos del cliente:", subcategoryFont));
            chapter.add(new Paragraph("Nº cliente: " + cliente.getCodigo(), paragraphFont));
            chapter.add(new Paragraph("Nombre: " + cliente.getNombre() + " " + cliente.getApellidos(), paragraphFont));
            chapter.add(new Paragraph("E-mail: " + cliente.getEmail(), paragraphFont));
            chapter.add(new Paragraph("Teléfono: " + cliente.getTelefono(), paragraphFont));
            chapter.add(new Paragraph("Datos de la factura:", subcategoryFont));
            chapter.add(new Paragraph("Fecha: " + factura.getFechaFactura().format(DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss")), paragraphFont));
            chapter.add(new Paragraph("Dirección de facturación: " + factura.getFacturacion().getDireccion() + " - " + factura.getFacturacion().getPoblacion() + " (" + factura.getFacturacion().getProvincia() + ") ", paragraphFont));
            chapter.add(new Paragraph("Dirección de envío: " + factura.getPedido().getDireccionPedido().getDireccion() + " - " + factura.getPedido().getDireccionPedido().getPoblacion() + " (" + factura.getPedido().getDireccionPedido().getProvincia() + ") ", paragraphFont));
            chapter.add(new Paragraph("Descuento : " + factura.getPedido().getDescuento() + "€", paragraphFont));

            chapter.add(new Paragraph("Líneas del pedido:", subcategoryFont));
            chapter.add(new Paragraph(" ", subcategoryFont));

            Pedido ped = factura.getPedido();
            ArrayList<LineaArticulo> lineas = new LineaArticuloDAO().getAllByCesta(ped.getCesta().getCodigo());
            
            Integer numColumns = 6;
            Integer numRows = lineas.size() + 1;
            // Creamos la tabla.
            PdfPTable table = new PdfPTable(numColumns);
            // Ahora llenamos la tabla del PDF
            PdfPCell columnHeader;
            // rellenamos las filas de la tabla               

            columnHeader = new PdfPCell(new Phrase("CÓDIGO", smallBold));
            columnHeader.setHorizontalAlignment(Element.ALIGN_CENTER);
            table.addCell(columnHeader);
            columnHeader = new PdfPCell(new Phrase(" NOMBRE ", smallBold));
            columnHeader.setHorizontalAlignment(Element.ALIGN_CENTER);
            table.addCell(columnHeader);
            columnHeader = new PdfPCell(new Phrase(" PRECIO ", smallBold));
            columnHeader.setHorizontalAlignment(Element.ALIGN_CENTER);
            table.addCell(columnHeader);
            columnHeader = new PdfPCell(new Phrase("I.V.A.", smallBold));
            columnHeader.setHorizontalAlignment(Element.ALIGN_CENTER);
            table.addCell(columnHeader);
            columnHeader = new PdfPCell(new Phrase("CANTIDAD", smallBold));
            columnHeader.setHorizontalAlignment(Element.ALIGN_CENTER);
            table.addCell(columnHeader);
            columnHeader = new PdfPCell(new Phrase(" IMPORTE ", smallBold));
            columnHeader.setHorizontalAlignment(Element.ALIGN_CENTER);
            table.addCell(columnHeader);

            table.setHeaderRows(1);

            // rellenamos las filas de la tabla.                
            for (LineaArticulo linea : lineas) {
                PdfPCell cell = new PdfPCell(Paragraph.getInstance(linea.getArticulo().getCodigo() + " "));
                cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
                cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                table.addCell(cell);
                cell = new PdfPCell(Paragraph.getInstance(linea.getArticulo().getNombre()));
                cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
                cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                table.addCell(cell);
                cell = new PdfPCell(Paragraph.getInstance(moneda(linea.getArticulo().getPvp())));
                cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
                cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
                table.addCell(cell);
                cell = new PdfPCell(Paragraph.getInstance(linea.getArticulo().getIva() + "% "));
                cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
                cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
                table.addCell(cell);
                cell = new PdfPCell(Paragraph.getInstance(linea.getUnidades()+ " "));
                cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
                cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
                table.addCell(cell);
                cell = new PdfPCell(Paragraph.getInstance(moneda((linea.calcularSubtotalLinea()))));
                cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
                cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
                table.addCell(cell);

            }

            table.setWidthPercentage(100);

            chapter.add(table);
            chapter.add(new Paragraph(" ", chapterFont));
            Paragraph paragraf = new Paragraph("TOTAL FACTURA: " + moneda(new CestaDAO().calcularTotal(factura.getPedido().getCesta())), totalBold);
            paragraf.setAlignment(Element.ALIGN_RIGHT);
            chapter.add(paragraf);

            document.add(chapter);
            document.close();
            System.out.println("Your PDF file has been generated!(¡Se ha generado tu hoja PDF!");

        } catch (DocumentException ex) {
            Logger.getLogger(ExportarPDF.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ExportarPDF.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ExportarPDF.class.getName()).log(Level.SEVERE, null, ex);
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
