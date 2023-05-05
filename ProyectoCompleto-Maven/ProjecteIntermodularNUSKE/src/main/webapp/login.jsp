<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/login/styles.css">
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
            <li class="buscador"><i class="bi bi-search"></i><input type="text" placeholder="Buscar..."/></li>
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
        <section class="inicio-sesion">
            <h3>Inicio de sesión</h3>
        <hr>
        <form action="LogIn" method="post">
            <label for="usuario">Usuario</label>
            <br>
            <input type="text" id="usuario" name="usuario" placeholder="Nombre o correo" required>
            <br>
            <label for="contrasena">Contraseña</label>
            <br>
            <input type="password" id="contrasena" name="contrasena" placeholder="Contraseña" required><br><br>
            <input type="submit" value="Iniciar sesión">
            <%
                if (request.getAttribute("error") != null && (boolean) request.getAttribute("error")) {
                    out.println("<p>(*) Nombre de correo o contraseña inválidos. Vuelve a intentarlo</p>");
                }
            %>
        </form>
        </section>
        <section class="separador"></section>
        <section class="registro">
            <h3>¡Regístrate!</h3>
            <hr>
            <ul>
                <li><a href="registro-socio.jsp">Registrar una empresa</a></li>
                <li><a href="registro-responsable-cliente.jsp">Registrarme como responsable o cliente</a></li>
            </ul>
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