<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="dao.CestaDAO"%>
<%@page import="dto.Responsable"%>
<%@page import="dto.Socio"%>
<%@page import="dto.Socio"%>
<%@page import="dto.Cliente"%>
<%@page import="dto.Administrador"%>
<%@page import="dto.Factura"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.FacturaDAO"%>
<%@page import="dao.UsuarioDAO"%>
<%@page import="dto.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Usuario usuarioSesion = (session != null && session.getAttribute("usuario") != null) ? (Usuario) session.getAttribute("usuario") : null;
    usuarioSesion = (usuarioSesion != null) ? UsuarioDAO.tipoUsuario(usuarioSesion.getCodigo()) : null;

    FacturaDAO fDAO = new FacturaDAO();
    ArrayList<Factura> facturas = null;

    if (usuarioSesion instanceof Administrador) {
        facturas = fDAO.getAll();
    } else if (usuarioSesion instanceof Cliente) {
        facturas = fDAO.getByUsuario(usuarioSesion.getCodigo());
    }
%>
<html lang="es">

    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="css/facturas/styles.css" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css" />
        <title>Nuskë - Login</title>
    </head>

    <body>
        <header>
            <section class="header-wrapper">
                <section class="titulo">
                    <a href="./index.jsp">
                        <h3>NUSKË</h3>
                    </a>
                </section>
                <section class="navegacion">
                    <ul>
                        <li class="perro">
                            <a href="#">Perros</a>
                            <ul class="subcategoria">
                                <li><a href="#">Hogar</a></li>
                                <li><a href="#">Entretenimiento</a></li>
                                <li><a href="#">Alimentación</a></li>
                                <li><a href="#">Salud e higiene</a></li>
                            </ul>
                        </li>
                        <li class="gato">
                            <a href="#">Gatos</a>
                            <ul class="subcategoria">
                                <li><a href="#">Hogar</a></li>
                                <li><a href="#">Entretenimiento</a></li>
                                <li><a href="#">Alimentación</a></li>
                                <li><a href="#">Salud e higiene</a></li>
                            </ul>
                        </li>
                        <li class="exotico">
                            <a href="#">Exóticos</a>
                            <ul class="subcategoria">
                                <li><a href="#">Hogar</a></li>
                                <li><a href="#">Entretenimiento</a></li>
                                <li><a href="#">Alimentación</a></li>
                                <li><a href="#">Salud e higiene</a></li>
                            </ul>
                        </li>
                        <li class="buscador">
                            <i class="bi bi-search"></i><input type="text" placeholder="Buscar..." />
                        </li>
                        <li class="inicio-sesion">
                            <%
                                if (usuarioSesion != null) {
                                    out.println("<a href=\"./perfil.jsp\"><i class=\"bi bi-person-fill\"></i>" + usuarioSesion.getNombre() + "</a>");
                                } else {
                                    out.println("<a href=\"./login.jsp\"><i class=\"bi bi-person-fill\"></i></a>");
                                }
                            %>

                        </li>
                        <li class="cesta">
                            <a href="carrito.jsp"><i class="bi bi-cart-fill"></i></a>
                        </li>
                    </ul>
                </section>
            </section>
        </header>
        <main>
            <h2>FACTURAS</h2>

            <%
                if (usuarioSesion == null || usuarioSesion instanceof Responsable || usuarioSesion instanceof Socio) {
                    out.println("<p style=\"height:60vh;text-align:center;font-size:27px;\">No tienes acceso a esta página. Regístrate como cliente para acceder a ella.</p>");
                } else {
                    for (Factura fac : facturas) {
            %>
            <article>
                <%
                    if (usuarioSesion instanceof Administrador) {
                        out.println("<p>" + fac.getPedido().getCliente().getEmail() + "</p>");
                    }
                %>

                <p>Factura nº <%= fac.getNumeroFactura() %></p>
                <p>Pedido nº <%= fac.getPedido().getCodigo() %></p>
                <p><%= fac.getFacturacion().getDireccion() %></p>
                <p><%= fac.getFechaFactura().format(DateTimeFormatter.ofPattern("dd/MM/yyyy")) %></p>
                <p><%= new CestaDAO().calcularTotal(fac.getPedido().getCesta())  %>€</p>
                <a href="#"><i class="bi bi-filetype-xml"></i></a>
                <a href="#"><i class="bi bi-filetype-pdf"></i></a>
            </article>
            <%
                    
}}
            %>
        </main>
        <footer>
            <ul>
                <li><a href="#">Contacta con nosotros</a></li>
                <li><a href="#">Sobre nosotros</a></li>
                <li><a href="#">Preguntas frecuentes</a></li>
            </ul>
            <ul>
                <li><a href="#">Aviso legal</a></li>
                <li><a href="#">Preguntas frecuentes</a></li>
                <li><a href="#">Política de privacidad</a></li>
            </ul>
            <ul>
                <li><a href="#">Condiciones generales</a></li>
                <li><a href="#">Términos y condiciones</a></li>
                <li><a href="#">Otros</a></li>
            </ul>
        </footer>
    </body>

</html>