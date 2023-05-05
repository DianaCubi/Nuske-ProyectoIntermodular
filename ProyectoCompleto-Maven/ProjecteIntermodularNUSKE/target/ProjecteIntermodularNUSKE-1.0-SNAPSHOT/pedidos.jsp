<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
            <a href="login.jsp"><i class="bi bi-person-fill">Usuario</i></a>
          </li>
          <li class="cesta">
            <a href="carrito.jsp"><i class="bi bi-cart-fill"></i></a>
          </li>
        </ul>
      </section>
    </section>
  </header>
  <main>
      <h2>PEDIDOS</h2>
      
      <article>
        <p>usuario@gmail.com</p>
        <p>Pedido nº 43</p>
        <p>23/06/2022</p>
        <p>En preparación</p>
        <p>Base imponible</p>
        <p>Base con IVA</p>

        <form name="facturar-<%= pedido.getCodigo() %>" method="post" action="Facturar">
          <input name="id" type="hidden" value="<%= pedido.getCodigo() %>" />
          <select name="direccion">
            <option value="#">Calle ambrosio 23</option>
            <option value="#">Calle Jose Maria Soler 8</option>
          </select>
          <input type="submit" value="Facturar" />
        </form>
      </article>

      <article>
        <p>usuario@gmail.com</p>
        <p>Pedido nº 43</p>
        <p>23/06/2022</p>
        <p>Cancelado</p>
        <p>Base imponible</p>
        <p>Base con IVA</p>
        
        <form name="facturar-<%= pedido.getCodigo() %>" method="post" action="Facturar">
          <input name="id" type="hidden" value="<%= pedido.getCodigo() %>" />
          <select name="direccion">
            <option value="#">Calle ambrosio 23</option>
            <option value="#">Calle Jose Maria Soler 8</option>
          </select>
          <input type="submit" value="Facturar" />
        </form>
      </article>

      <article>
        <p>usuario@gmail.com</p>
        <p>Pedido nº 43</p>
        <p>23/06/2022</p>
        <p>Entregado</p>
        <p>Base imponible</p>
        <p>Base con IVA</p>

        <p class="dir-fact">Calle ambrosio 23</p>
        <p class="facturado">Facturado</p>
      </article>
      
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