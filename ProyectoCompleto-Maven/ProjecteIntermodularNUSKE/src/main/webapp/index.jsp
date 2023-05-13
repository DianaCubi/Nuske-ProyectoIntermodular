<%@page import="dto.Categoria"%>
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
    
    ArrayList<Categoria> categorias = Categoria.getAll();
    
    ArrayList<Articulo> articulos = null;
    
    if(request.getParameter("cat") != null){
        articulos = new ArticuloDAO().getByCategoria(request.getParameter("cat"));
    }
    else{
        articulos = new ArticuloDAO().getAll();
    }
    
%>
<html lang="es">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css"
    />
    <link rel="stylesheet" href="./css/index/styles.css" />
    <title>Nuskë</title>
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
            for(Categoria c : categorias){
            %>
          <li class="perro">
              <a href="index.jsp?cat=<%= c.toString() %>"><%= c.toString() %></a>
          </li>
          <%
              }
          %>

<!--          <li class="gato">
            <a href="index.jsp?id=<%= Categoria.GATOS %>">Gatos</a>
          </li>
          <li class="exotico">
            <a href="index.jsp?id=<%= Categoria.EXOTICOS %>">Exóticos</a>
          </li>-->
          <li class="buscador"><i class="bi bi-search"></i><input type="text" placeholder="Buscar..."/></li>
          <li class="inicio-sesion">
              
              <%
                  if(usuarioSesion!=null){
                  out.println("<a href=\"./perfil.jsp\"><i class=\"bi bi-person-fill\"></i>"+usuarioSesion.getNombre()+"</a>");
                  }
                  else{
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
      <section class="main-superior">
        <article class="bienvenida">
          <h2>¡Bienvenidos a nuestra tienda!</h2>
          <p>
            Esta es una tienda en proceso de creación para nuestro proyecto de
            desarrollo web. Siéntete libre de investigar todas las páginas. Si
            ves algún error, no nos lo digas, hazte el loco y sigue con tu vida.
            Nosotros haremos lo mismo.
          </p>
          <article class="botones">
            <a href="#productos" class="bot-comprar">Comprar ahora</a>
            <a href="#" class="bot-contactar">Contáctanos</a>
            <!--
              <input type="button" value="Comprar ahora" class="bot-comprar" />
              <input type="button" value="Contáctanos" class="bot-contactar" />
            -->
          </article>
        </article>
        <article class="main-imagen">
          <figure>
            <img src="./img/loro-main.png" alt="Foto de un perro" />
          </figure>
        </article>
      </section>
      <section class="main-inferior">
        <hr />
        <h4>NUESTROS PRODUCTOS</h4>
        
        <section class="productos" id="productos">
            <%
                for(Articulo a : articulos){
            %>
          <a href="./articulo.jsp?id=<%= a.getCodigo() %>">
          <article class="producto">
            <article class="imagen">
              <figure>
                <img src="./img/ejemplo-pienso.png" alt="Foto del articulo" />
              </figure>
            </article>
            <article class="texto-producto">
              <p><%= a.getNombre() %></p>
              <p>
                  <%= a.getDescripcion() %>
              </p>
              <p><%= a.getPvp() %> €</p>
            </article>
          </article>
            </a>
        <%
            }
        %>
        </section>
      </section>
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
        <li><a href="politica-privacidad.jsp">Política de privacidad</a></li>
      </ul>
      <ul>
        <li><a href="#">Condiciones generales</a></li>
        <li><a href="#">Términos y condiciones</a></li>
        <li><a href="#">Otros</a></li>
      </ul>
    </footer>
  </body>
</html>
