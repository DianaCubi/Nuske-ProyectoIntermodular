<%@page import="dto.Administrador"%>
<%@page import="dto.Categoria"%>
<%@page import="dto.Cliente"%>
<%@page import="dao.ComentarioDAO"%>
<%@page import="dto.Comentario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ArticuloDAO"%>
<%@page import="dto.Articulo"%>
<%@page import="dao.UsuarioDAO"%>
<%@page import="dto.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Usuario usuarioSesion = (session != null && session.getAttribute("usuario") != null) ? (Usuario) session.getAttribute("usuario") : null;
    usuarioSesion = (usuarioSesion != null) ? UsuarioDAO.tipoUsuario(usuarioSesion.getCodigo()) : null;

    Articulo a = null;
    ArrayList<Comentario> comentarios = null;
    if (request != null && request.getParameter("id") != null) {
        String codigo = request.getParameter("id");
        a = new ArticuloDAO().getByCodigo(codigo);
        if (a != null) {
            comentarios = new ComentarioDAO().getAll(a.getCodigo());
        }
    }

    ArrayList<Categoria> categorias = Categoria.getAll();

%>
<html lang="es">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/articulo/styles.css">
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
                        <%                for (Categoria c : categorias) {
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
                if (a == null) {
                    out.println("<p style=\"height:60vh;text-align:center;font-size:24px;\">Error. Producto no encontrado</p>");
                } else {
            %>
            <section class="parte-superior">
                <section class="imagen-producto">
                    <figure>
                        <img src="./img/articulos/<%= a.getFoto()%>" alt="Producto">
                    </figure>
                </section>
                <section>
                    <section class="info-producto">
                        <h2><%= a.getNombre()%></h2>
                        <article>
                            <p class="precio"><%= a.getPvp()%> €</p>
                            <div class="valoraciones">
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star"></i>
                                <p>(102 valoraciones)</p>
                            </div>
                        </article>
                        <p class="descripcion">
                            <%= a.getDescripcion()%>
                        </p>
                        <%
                            if (usuarioSesion != null && usuarioSesion instanceof Administrador) {

                        %>
                        <p class="stock-actual">
                            Stock actual: <%= a.getStockActual()%>
                        </p>

                        <p class="stock-minimo">
                            Stock mínimo: <%= a.getStockMinimo()%>
                        </p>

                        <a href="#" class="editar-prod">Editar producto</a>
                        <%
                            } else {

                        %>
                        <p class="stock-actual">
                            Stock disponible: <%= a.getStockActual() - a.getStockMinimo() %>
                        </p>
                        
                        <%
                            }
                        %>
                        <%
                            if (usuarioSesion != null && usuarioSesion instanceof Cliente) {
                        %>
                        <form action="AnyadirAlCarrito" method="post" name="anyadirCarrito">
                            <input type="hidden" name="id" value="<%= a.getCodigo()%>">
                            <label for="cantidad">Selecciona cantidad</label><br>
                            <input type="number" id="cantidad" name="cantidad" value="1" min="1" required /><br>
                            <a href="">Información sobre el envío</a>

                            <div class="botones">
                                <input type="submit" id="cesta" name="cesta" value="Añadir a la cesta" />
                                <!--<button class="any-lista">Añadir a la lista</button>-->
                            </div>
                        </form>
                        <%
                            }
                        %>
                    </section>
                </section>
            </section>
            <hr>
            <section class="parte-inferior">
                <h3>¡Escribe tu opinión a través de los comentarios!</h3>
                <article class="escribir-coment">
                    <form>
                        <label for="pseudonimo">Pseudónimo:</label>
                        <input type="text" id="pseudonimo" name="pseudonimo" maxlength="25"><br><br>

                        <label for="comentario">Comentario:</label><br>
                        <textarea id="comentario" name="comentario"></textarea><br><br>

                        <article class="misma-linea">
                            <article>
                                <label for="valoracion">Valoración [1-5]:</label>
                                <input type="number" id="valoracion" name="valoracion" min="1" max="5" value="5"><br><br>
                            </article>
                            <article>
                                <label for="calidad_precio">Calidad-precio:</label>
                                <select id="calidad-precio" name="calidad-precio">
                                    <option value="EXCELENTE">Excelente</option>
                                    <option value="MUY_BUENA">Muy buena</option>
                                    <option value="BUENA">Buena</option>
                                    <option value="ACEPTABLE">Aceptable</option>
                                    <option value="NORMAL">Normal</option>
                                    <option value="MALA">Mala</option>
                                    <option value="MUY_MALA">Muy mala</option>
                                </select><br><br>
                            </article>
                        </article>
                        <article class="misma-linea">
                            <article>
                                <label for="ventajas">Ventajas:</label><br>
                                <textarea id="ventajas" name="ventajas"></textarea><br><br>
                            </article>
                            <article>
                                <label for="desventajas">Desventajas:</label><br>
                                <textarea id="desventajas" name="desventajas"></textarea><br><br>
                            </article>
                        </article>
                        <input type="submit" value="Enviar">
                    </form>
                </article>

                <article class="seccion-com">
                    <h3>Comentarios</h3>
                    <section class="comentarios">

                        <%
                            if (comentarios != null && comentarios.size() != 0) {
                                for (Comentario c : comentarios) {
                        %>
                        <article class="comentario">
                            <p class="usuario"><%= c.getPseudonimoUsuario()%></p>
                            <p><span>Calidad: </span><%= c.getCalidadPrecio()%> [<%= c.getValoracion()%>]</p>
                            <p><%= c.getDescripcion()%></p>
                            <p><span>Ventajas: </span><%= c.getVentajas()%></p>
                            <p><span>Inconvenientes: </span><%= c.getInconvenientes()%></p>
                        </article>
                        <%
                            }
                        } else {
                            out.println("<p>Este artículo no tiene comentarios aún :( </p>");
                        %>
                    </section>
                </article>
            </section>
            <%
                    }
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
                <li><a href="politica-privacidad.jsp">Política de privacidad</a></li>
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