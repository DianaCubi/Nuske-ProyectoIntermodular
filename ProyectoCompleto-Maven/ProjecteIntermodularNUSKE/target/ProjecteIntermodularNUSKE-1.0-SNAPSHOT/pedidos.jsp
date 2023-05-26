<%@page import="java.util.List"%>
<%@page import="dao.DireccionDAO"%>
<%@page import="dto.Direccion"%>
<%@page import="dao.CestaDAO"%>
<%@page import="dto.Categoria"%>
<%@page import="dto.Socio"%>
<%@page import="dto.Responsable"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="dto.Cliente"%>
<%@page import="dao.PedidoDAO"%>
<%@page import="dto.Administrador"%>
<%@page import="dto.Pedido"%>
<%@page import="dao.ArticuloDAO"%>
<%@page import="dto.Articulo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.UsuarioDAO"%>
<%@page import="dto.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Usuario usuarioSesion = (session != null && session.getAttribute("usuario") != null) ? (Usuario) session.getAttribute("usuario") : null;
    usuarioSesion = (usuarioSesion != null) ? UsuarioDAO.tipoUsuario(usuarioSesion.getCodigo()) : null;

    PedidoDAO pDAO = new PedidoDAO();
    ArrayList<Pedido> pedidos = null;
    if (usuarioSesion instanceof Administrador) {
        pedidos = pDAO.getAll();
    } else if (usuarioSesion instanceof Cliente) {
        pedidos = pDAO.getByUsuario(usuarioSesion.getCodigo());
    }

    ArrayList<Categoria> categorias = Categoria.getAll();
%>
<html lang="es">

    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="css/pedidos/styles.css" />
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
                        <%
                            for (Categoria c : categorias) {
                        %>
                        <li class="<%= c.toString().toLowerCase()%>">
                            <a href="index.jsp?cat=<%= c.toString()%>#productos"><%= c.toString()%></a>
                        </li>
                        <%
                            }
                        %>

                        <li class="buscador"><i class="bi bi-search"></i><input type="text" placeholder="Buscar..."/></li>
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
            <%
                if (usuarioSesion == null || usuarioSesion instanceof Responsable || usuarioSesion instanceof Socio) {
                    out.println("<p style=\"height:60vh;text-align:center;font-size:27px;\">No tienes acceso a esta página. Regístrate como cliente para acceder a ella.</p>");
                } else {
            %>
            <h2>PEDIDOS</h2>

            <%
                if (pedidos != null && pedidos.size() != 0) {
                    for (Pedido p : pedidos) {
            %>
            <article>
                <%
                    if (usuarioSesion instanceof Administrador) {
                %>

                <p><%= p.getCliente().getEmail()%></p>

                <%
                    }
                %>

                <p class="codigo-ped">Pedido nº <%= p.getCodigo()%></p>
                <p class="fecha-ped"><%= p.getFechaPedido().format(DateTimeFormatter.ofPattern("dd/MM/yyyy"))%></p>
                <p class="estado-ped"><%= p.getEstadoPedido()%></p>
                <p class="direccion-ped"><%= p.getDireccionPedido().getDireccion()%></p>
                <p class="total-ped"><%= new CestaDAO().calcularTotal(p.getCesta())%>€</p>

                <%
                    if (!p.isFacturado()) {
                %>
                <form class="fact" name="<%= p.getCodigo()%>" method="post" action="Facturar">
                    <input name="id" type="hidden" value="<%= p.getCodigo()%>" />
                    <select name="direccion">
                        <%
                            List<Direccion> direcciones = new DireccionDAO().getDireccionesDe(p.getCliente());
                            for (Direccion d : direcciones) {
                        %>    
                        <option value="<%= d.getNum()%>"><%= d.getDireccion()%></option>
                        <%
                            }
                        %>
                    </select>
                    <input type="submit" value="Facturar" />
                </form>
                <%
                    } else {
                        out.println("<p class=\"facturado fact\">Facturado</p>");
                    }
                %>

            </article>
            <%
                    }
                }
                if (pedidos != null && pedidos.size() == 0) {
                    out.println("<p style=\"text-align:center;\">¡Todavía no hay ningún pedido que mostrar!</p>");
                }
            %>
            <%
                }
            %>
        </main>
        <footer>
            <ul>
        <li><a href="contacto.jsp">Contacta con nosotros</a></li>
        <li><a href="sobre-nosotros.jsp">Sobre nosotros</a></li>
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
                <li class="redes-sociales"><a href="https://www.instagram.com/nuskecentromascotas22/"><i class="bi bi-instagram"></i></a>
            <a href="https://www.facebook.com/people/NUSK%C3%8B/100087463124674/"><i class="bi bi-facebook"></i></a>
        </li>
            </ul>
        </footer>
    </body>

</html>