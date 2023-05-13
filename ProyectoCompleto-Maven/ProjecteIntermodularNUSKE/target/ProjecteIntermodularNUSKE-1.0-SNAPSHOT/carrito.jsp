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
                  if(usuarioSesion!=null){
                  out.println("<a href=\"./perfil.jsp\"><i class=\"bi bi-person-fill\"></i>"+usuarioSesion.getNombre()+"</a>");
                  }
                  else{
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
      <form method="post" action="ActualizarCarrito" id="actualizarform">
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
        <article>
          <p>Nº 1</p>
          <img src="./img/ejemplo-pienso.png" alt="Pienso" />
          <p>Nombre pienso</p>
          <p>14'78€ (unidad)</p>
          <input
            type="number"
            min="0"
            value="1"
            name="codigo-producto"
            onchange="this.form.submit()"
          />
          <p>27'78€</p>
          <a href="#"><i class="bi bi-trash"></i></a>
        </article>
        <article>
          <p>Nº 12</p>
          <img src="./img/loro-main.png" alt="Pienso" />
          <p>Nombre pienso</p>
          <p>14'78€ (unidad)</p>
          <input
            type="number"
            min="0"
            value="1"
            name="codigo-producto"
            onchange="this.form.submit()"
          />
          <p>27'78€</p>
          <a href="#"><i class="bi bi-trash"></i></a>
        </article>
        <article>
          <p>Nº 32</p>
          <img src="./img/profile-example.jpg" alt="Pienso" />
          <p>Nombre pienso</p>
          <p>14'78€ (unidad)</p>
          <input
            type="number"
            min="0"
            value="1"
            name="codigo-producto"
            onchange="this.form.submit()"
          />
          <p>27'78€</p>
          <a href="#"><i class="bi bi-trash"></i></a>
          
        </article>

        <label for="direccion">Elige la dirección del pedido:</label>
        <select name="direccion" id="direccion">
          <option value="#">Calle ambrosio 23</option>
          <option value="#">Calle Jose Maria Soler 8</option>
        </select>

        <p class="precio-total">Total del carrito (IVA incluido): 44€</p>
        <button onclick="confirmarPedido()">Confirmar pedido</button>
      </form>
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