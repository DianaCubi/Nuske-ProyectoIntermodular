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
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="css/reg-articulo/styles.css" />
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
      <h2>Registro de Artículo</h2>
      <form action="" method="post">
        <section class="parte-izq">
          <label for="foto">Foto:</label>
          <input type="file" id="foto" name="foto" /><br /><br />

          <label for="nombre">Nombre:</label>
          <input type="text" id="nombre" name="nombre" /><br /><br />

          <label for="descripcion">Descripción:</label>
          <textarea id="descripcion" name="descripcion"></textarea><br /><br />

          <label for="iva">IVA:</label>
          <input type="number" id="iva" name="iva" min="0"/><br /><br />

          <label for="pvp">PVP:</label>
          <input type="number" id="pvp" name="pvp" min="0" step="0.1"/><br /><br />
        </section>

        <section class="separador"></section>

        <section class="parte-der">
          <label for="tipo">Tipo:</label>
          <select id="tipo" name="tipo">
            <option value="Camas">Camas</option>
            <option value="Correas">Correas</option>
            <option value="Transportines">Transportines</option>
            <option value="Comederos">Comederos</option>
            <option value="Pelotas">Pelotas</option>
            <option value="Mordedores">Mordedores</option>
            <option value="Peluches">Peluches</option>
            <option value="Juguetes Interactivos">Juguetes Interactivos</option>
            <option value="Champú">Champú</option>
            <option value="Bolsas de calle">Bolsas de calle</option>
            <option value="Antiparásitos">Antiparásitos</option>
            <option value="Empapadores">Empapadores</option>
            <option value="Piensos">Piensos</option>
            <option value="Snacks">Snacks</option>
            <option value="Comidas húmedas">Comidas húmedas</option>
            <option value="Otros">Otros</option></select
          ><br /><br />

          <label for="categoria">Categoría:</label>
          <select id="categoria" name="categoria">
            <option value="Perros">Perros</option>
            <option value="Gatos">Gatos</option>
            <option value="Animales exoticos">Animales exóticos</option>
            </select>
            <br /><br />

          <label for="subcategoria">Subcategoría:</label>
          <select id="subcategoria" name="subcategoria">
            <option value="Hogar">Hogar</option>
            <option value="Entretenimiento">Entretenimiento</option>
            <option value="Salud e higiene">Salud e higiene</option>
            <option value="Alimentacion">Alimentación</option>
            </select
          ><br /><br />

          <input type="submit" value="Registrar" />
          <input type="reset" value="Borrar" />
        </section>
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
</html>
