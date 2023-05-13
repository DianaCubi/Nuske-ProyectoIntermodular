<%@page import="dao.UsuarioDAO"%>
<%@page import="dto.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Usuario usuarioSesion = (session != null && session.getAttribute("usuario") != null) ? (Usuario) session.getAttribute("usuario") : null;
    

    usuarioSesion = (usuarioSesion != null) ? UsuarioDAO.tipoUsuario(usuarioSesion.getCodigo()) : null;
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
    <link rel="stylesheet" href="./css/admin/styles.css" />
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
      <section class="parte-superior">
        <h2>¡Bienvenido Administrador!</h2>
        <a href="./usuarios.jsp">Administrar usuarios</a>
        <a href="./pedidos.jsp">Administrar pedidos</a>
        <a href="./facturas.jsp">Administrar facturas</a>
      </section>
      <section class="main-inferior">
        <hr />
        <h4>NUESTROS PRODUCTOS</h4>
        <section class="productos" id="productos">
          <a href="./articulo.jsp">
            <article class="producto">
              <article class="imagen">
                <figure>
                  <img src="./img/ejemplo-pienso.png" alt="Foto del articulo" />
                </figure>
              </article>
              <article class="texto-producto">
                <p>Brekkies</p>
                <p>
                  Lorem ipsum, dolor sit amet consectetur adipisicing elit. Eum
                  adipisci facilis, aut repellat consectetur veritatis sint
                  libero deleniti quas quia? Pariatur asperiores culpa quis
                  veniam inventore dolor natus obcaecati ipsum.
                </p>
                <p>4,99€</p>
              </article>
            </article>
          </a>
          <a href="./articulo.jsp">
            <article class="producto">
              <article class="imagen">
                <figure>
                  <img src="./img/ejemplo-pienso.png" alt="Foto del articulo" />
                </figure>
              </article>
              <article class="texto-producto">
                <p>Brekkies</p>
                <p>
                  Lorem ipsum, dolor sit amet consectetur adipisicing elit. Eum
                  adipisci facilis, aut repellat consectetur veritatis sint
                  libero deleniti quas quia? Pariatur asperiores culpa quis
                  veniam inventore dolor natus obcaecati ipsum.
                </p>
                <p>4,99€</p>
              </article>
            </article>
          </a>

          <a href="./articulo.jsp">
            <article class="producto">
              <article class="imagen">
                <figure>
                  <img src="./img/ejemplo-pienso.png" alt="Foto del articulo" />
                </figure>
              </article>
              <article class="texto-producto">
                <p>Brekkies</p>
                <p>
                  Lorem ipsum, dolor sit amet consectetur adipisicing elit. Eum
                  adipisci facilis, aut repellat consectetur veritatis sint
                  libero deleniti quas quia? Pariatur asperiores culpa quis
                  veniam inventore dolor natus obcaecati ipsum.
                </p>
                <p>4,99€</p>
              </article>
            </article>
          </a>

          <a href="./articulo.jsp">
            <article class="producto">
              <article class="imagen">
                <figure>
                  <img src="./img/ejemplo-pienso.png" alt="Foto del articulo" />
                </figure>
              </article>
              <article class="texto-producto">
                <p>Brekkies</p>
                <p>
                  Lorem ipsum, dolor sit amet consectetur adipisicing elit. Eum
                  adipisci facilis, aut repellat consectetur veritatis sint
                  libero deleniti quas quia? Pariatur asperiores culpa quis
                  veniam inventore dolor natus obcaecati ipsum.
                </p>
                <p>4,99€</p>
              </article>
            </article>
          </a>

          <a href="./articulo.jsp">
            <article class="producto">
              <article class="imagen">
                <figure>
                  <img src="./img/ejemplo-pienso.png" alt="Foto del articulo" />
                </figure>
              </article>
              <article class="texto-producto">
                <p>Brekkies</p>
                <p>
                  Lorem ipsum, dolor sit amet consectetur adipisicing elit. Eum
                  adipisci facilis, aut repellat consectetur veritatis sint
                  libero deleniti quas quia? Pariatur asperiores culpa quis
                  veniam inventore dolor natus obcaecati ipsum.
                </p>
                <p>4,99€</p>
              </article>
            </article>
          </a>

          <a href="./articulo.jsp">
            <article class="producto">
              <article class="imagen">
                <figure>
                  <img src="./img/ejemplo-pienso.png" alt="Foto del articulo" />
                </figure>
              </article>
              <article class="texto-producto">
                <p>Brekkies</p>
                <p>
                  Lorem ipsum, dolor sit amet consectetur adipisicing elit. Eum
                  adipisci facilis, aut repellat consectetur veritatis sint
                  libero deleniti quas quia? Pariatur asperiores culpa quis
                  veniam inventore dolor natus obcaecati ipsum.
                </p>
                <p>4,99€</p>
              </article>
            </article>
          </a>
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
