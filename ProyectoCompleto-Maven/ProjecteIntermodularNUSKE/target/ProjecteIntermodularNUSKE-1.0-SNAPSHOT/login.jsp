<%@page import="dto.Categoria"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.UsuarioDAO"%>
<%@page import="dto.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Usuario usuarioSesion = (session != null && session.getAttribute("usuario") != null) ? (Usuario) session.getAttribute("usuario") : null;
    usuarioSesion = (usuarioSesion != null) ? UsuarioDAO.tipoUsuario(usuarioSesion.getCodigo()) : null;
    
    ArrayList<Categoria> categorias = Categoria.getAll();
%>
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
            <%
            for(Categoria c : categorias){
            %>
          <li class="<%= c.toString().toLowerCase() %>">
              <a href="index.jsp?cat=<%= c.toString() %>#productos"><%= c.toString() %></a>
          </li>
          <%
              }
          %>

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