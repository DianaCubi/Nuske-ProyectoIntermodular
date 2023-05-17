<%@page import="dao.DireccionDAO"%>
<%@page import="dao.LineaArticuloDAO"%>
<%@page import="dto.LineaArticulo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.CestaDAO"%>
<%@page import="dto.Cesta"%>
<%@page import="dto.Direccion"%>
<%@page import="java.util.List"%>
<%@page import="dto.Cliente"%>
<%@page import="dao.UsuarioDAO"%>
<%@page import="dto.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    //RECOGEMOS USUARIO
    Usuario usuarioSesion = (session != null && session.getAttribute("usuario") != null) ? (Usuario) session.getAttribute("usuario") : null;
    usuarioSesion = (usuarioSesion != null) ? UsuarioDAO.tipoUsuario(usuarioSesion.getCodigo()) : null;

    //RECOGEMOS CARRITO DE USUARIO
    
    CestaDAO cdao = new CestaDAO();
    ArrayList<LineaArticulo> lineasCarrito = cdao.getLineas(cdao.getByCliente(usuarioSesion.getCodigo()).getCodigo());
    
//    Cesta carrito = null;
//    ArrayList<LineaArticulo> lineasCesta = null;
//    
//    if (usuarioSesion instanceof Cliente) {
//        carrito = new CestaDAO().getByCliente(usuarioSesion.getCodigo());
//        
//        if (carrito != null) {
//            lineasCesta = new CestaDAO().getLineas(carrito.getCodigo());
//            
//            System.out.println("CARRITOOOO");
//            for(LineaArticulo la : lineasCesta){
//                System.out.println(la);
//            }
//        }
//        
//    }
%>
<html lang="es">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="css/carrito/styles.css" />
        <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css"
            />
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
                            <i class="bi bi-search"></i
                            ><input type="text" placeholder="Buscar..." />
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
                            <a href="carrito.jsp"
                               ><i class="bi bi-cart-fill"></i
                                ></a>
                        </li>
                    </ul>
                </section>
            </section>
        </header>
        <main>
            <%
                if (usuarioSesion instanceof Cliente) {
            %>
            <form method="post" action="ActualizarCarrito" id="actualizarcarrito">
                <h2>CARRITO</h2>
                <!--
                <article class="titulos">
                  <p>Código</p>
                  <p>Foto</p>
                  <p>Nombre</p>
                  <p>Precio/unidad</p>
                  <p>Unidades</p>
                  <p>Eliminar</p>
                </article>
                -->
                <%
                    if (lineasCarrito != null && lineasCarrito.size()!=0) {
                        for (LineaArticulo l : lineasCarrito) {
                %>
                <article>
                    <p>Nº <%= l.getArticulo().getCodigo()%></p>
                    <img src="./img/articulos/<%= l.getArticulo().getFoto()%>" alt="Pienso" />
                    <p><%= l.getArticulo().getNombre()%></p>
                    <p><%= l.getArticulo().getPvp()%>€ (unidad)</p>
                    <input
                        type="number"
                        min="0"
                        value="<%= l.getUnidades()%>"
                        name="codigo-producto"
                        onchange="this.form.submit()"
                        />
                    <p><%= l.calcularSubtotalLinea()%>€</p>
                    <a href="#"><i class="bi bi-trash"></i></a>
                </article>
                <%
                    }
                %>
                <label for="direccion">Elige la dirección del pedido:</label>
                <select name="direccion" id="direccion" onchange="this.form.submit()">
                    <%
                        List<Direccion> direcciones = new DireccionDAO().getDireccionesDe(usuarioSesion);
                        for (Direccion d : direcciones) {
                    %>    
                    <option value="<%= d.getNum()%>"><%= d.getDireccion()%></option>
                    <%
                        }
                    %>
                </select>
                    <p class="precio-total">Total del carrito (IVA incluido): <%= new CestaDAO().calcularTotal(cdao.getByCliente(usuarioSesion.getCodigo()))%>€</p>
                <button onclick="confirmarPedido()">Confirmar pedido</button>
            </form>
            <%
                    }
                } else {
                    out.println("<p style=\"height:60vh;text-align:center;font-size:27px;\">No tienes acceso a esta página. Regístrate como cliente para acceder a ella.</p>");
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
    <!--
    <script>
      function confirmarPedido(){
          if(confirm("¿Desea confirmar el pedido?")){
              window.location.replace("ConfirmarPedido");
          }
      }
      </script>
    --></html>
