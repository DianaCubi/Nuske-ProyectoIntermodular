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
    <link rel="stylesheet" href="css/reg-responsable-cliente/styles.css">
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
        <h2>Registro de responsable/cliente</h2>
        <form action="" method="post">
            <section class="general">
                <h3>Información general</h3>
               
                <label for="nombre">Nombre persona de contacto</label><br>
                <input type="text" id="nombre" name="nombre" required><br>
                
                <label for="apellidos">Apellidos</label><br>
                <input type="text" id="apellidos" name="apellidos" required><br>
    
                <label for="fecha-nacimiento">Fecha de nacimiento</label><br>
                <input type="date" id="fecha-nacimiento" name="fecha-nacimiento" required><br>
              
                <label for="email">Email</label><br>
                <input type="email" id="email" name="email" required><br>
              
                <label for="telefono">Teléfono</label><br>
                <input type="tel" id="telefono" name="telefono" required><br>
              
                <label for="foto-perfil">Foto de perfil</label><br>
                <input type="file" id="foto-perfil" name="foto-perfil"><br>
              
                <label for="contrasena">Contraseña</label><br>
                <input type="password" id="contrasena" name="contrasena" required><br>
              
                <label for="rep-contrasena">Repetir contraseña</label><br>
                <input type="password" id="rep-contrasena" name="rep-contrasena" required><br>
                
            </section>
            <section class="separador"></section>
            <section class="especifico">
                <h3>Información específica</h3>
                <label for="tipoUsuario">Soy</label><br>
                <select id="tipoUsuario" name="tipoUsuario" required><br>
                  <option value="">Seleccione un usuario</option>
                  <option value="Responsable">Responsable</option>
                  <option value="Cliente">Cliente</option>
                </select>
                
                <label for="provincia">Provincia</label><br>
                <select id="provincia" name="provincia" required><br>
                  <option value="">Seleccione una provincia</option>
                  <option value="A Coruña">A Coruña</option>
                  <option value="Álava">Álava</option>
                  <option value="Albacete">Albacete</option>
                  <option value="Alicante">Alicante</option>
                  <option value="Almería">Almería</option>
                  <option value="Asturias">Asturias</option>
                  <option value="Ávila">Ávila</option>
                  <option value="Badajoz">Badajoz</option>
                  <option value="Barcelona">Barcelona</option>
                  <option value="Burgos">Burgos</option>
                  <option value="Cáceres">Cáceres</option>
                  <option value="Cádiz">Cádiz</option>
                  <option value="Cantabria">Cantabria</option>
                  <option value="Castellón">Castellón</option>
                  <option value="Ceuta">Ceuta</option>
                  <option value="Ciudad Real">Ciudad Real</option>
                  <option value="Córdoba">Córdoba</option>
                  <option value="Cuenca">Cuenca</option>
                  <option value="Girona">Girona</option>
                  <option value="Granada">Granada</option>
                  <option value="Guadalajara">Guadalajara</option>
                  <option value="Guipúzcoa">Guipúzcoa</option>
                  <option value="Huelva">Huelva</option>
                  <option value="Huesca">Huesca</option>
                  <option value="Illes Balears">Illes Balears</option>
                  <option value="Jaén">Jaén</option>
                  <option value="La Rioja">La Rioja</option>
                  <option value="Las Palmas">Las Palmas</option>
                  <option value="León">León</option>
                  <option value="Lleida">Lleida</option>
                  <option value="Lugo">Lugo</option>
                  <option value="Madrid">Madrid</option>
                  <option value="Málaga">Málaga</option>
                  <option value="Melilla">Melilla</option>
                  <option value="Murcia">Murcia</option>
                  <option value="Navarra">Navarra</option>
                  <option value="Ourense">Ourense</option>
                  <option value="Palencia">Palencia</option>
                  <option value="Pontevedra">Pontevedra</option>
                  <option value="Salamanca">Salamanca</option>
                  <option value="Santa Cruz de Tenerife">Santa Cruz de Tenerife</option>
                  <option value="Segovia">Segovia</option>
                  <option value="Sevilla">Sevilla</option>
                  <option value="Soria">Soria</option>
                  <option value="Tarragona">Tarragona</option>
                  <option value="Teruel">Teruel</option>
                  <option value="Toledo">Toledo</option>
                  <option value="Valencia">Valencia</option>
                  <option value="Valladolid">Valladolid</option>
                  <option value="Vizcaya">Vizcaya</option>
                  <option value="Zamora">Zamora</option>
                  <option value="Zaragoza">Zaragoza</option>
                </select>

                <label for="tipoDireccion">Tipo de dirección</label><br>
                <input type="text" id="tipoDireccion" name="tipoDireccion" required><br>
                              
                <label for="codigoPostal">Código postal</label><br>
                <input type="text" id="codigoPostal" name="codigoPostal" required><br>

                <label for="poblacion">Población</label><br>
                <input type="text" id="poblacion" name="poblacion" required><br>

                <label for="direccion">Calle, número, planta y puerta</label><br>
                <input type="text" id="direccion" name="direccion" required><br>
              
                <input type="submit" value="Registrarse">
                <input type="reset" value="Borrar">
            </section>
        </form>

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