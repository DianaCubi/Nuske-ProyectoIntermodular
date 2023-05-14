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
            <%
                if (usuarioSesion == null || usuarioSesion instanceof Responsable || usuarioSesion instanceof Socio) {
                    out.println("<p style=\"height:60vh;text-align:center;font-size:27px;\">No tienes acceso a esta página. Regístrate como cliente para acceder a ella.</p>");
                } else {
            %>
            <h2>PEDIDOS</h2>

            <%
                if (pedidos != null) {
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

                <p>Pedido nº <%= p.getCodigo()%></p>
                <p><%= p.getFechaPedido().format(DateTimeFormatter.ofPattern("dd/MM/yyyy"))%></p>
                <p><%= p.getEstadoPedido() %></p>
                <p>Base imponible</p>
                <p>Base con IVA</p>

                <%
                if(!p.isFacturado()){
                %>
                <form name="facturar-codigoPedido" method="post" action="Facturar">
                    <input name="id" type="hidden" value="codigoPedido" />
                    <select name="direccion">
                        <option value="#">Calle ambrosio 23</option>
                        <option value="#">Calle Jose Maria Soler 8</option>
                    </select>
                    <input type="submit" value="Facturar" />
                </form>
                <%
                    }else{
                     out.println("<p class=\"facturado\">Facturado</p>");
                }
                %>
                
            </article>
            <%
                    }
                } else {
                    out.print("<h2 style=\"height:60vh\";>¡No tienes ningún pedido aún!</h2>");
                }
            %>
            <%
                }
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