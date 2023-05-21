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
    <link rel="stylesheet" href="css/reg-mascota/styles.css">
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
        <h2>Registro de mascota</h2>
        <form action="" method="post">
            <section class="general">
               
                <label for="animalNombre">Nombre</label>
                <input type="text" id="animalNombre" name="animalNombre" required><br><br>
  
                <label for="animalRaza">Raza</label>
                <input type="text" id="animalRaza" name="animalRaza" required><br><br>
  
                <label for="animalDescripcion">Descripción</label>
                <textarea id="animalDescripcion" name="animalDescripcion" rows="5" cols="30"></textarea><br><br>
  
                <label for="animalFoto">Foto</label>
                <input type="file" id="animalFoto" name="animalFoto"><br><br>
  
                <label for="animalCamada">Camada</label>
                <input type="text" id="animalCamada" name="animalCamada"><br><br>
  
                <label for="animalColor">Color:</label>
                    <select id="animalColor" name="animalColor">
                    <option value="blanco">Blanco</option>
                    <option value="negro">Negro</option>
                    <option value="marrón">Marrón</option>
                    <option value="gris">Gris</option>
                    <option value="naranja">Naranja</option>
                    <option value="amarillo">Amarillo</option>
                    <option value="rojo">Rojo</option>
                    <option value="azul">Azul</option>
                    <option value="verde">Verde</option>
                    <option value="rosa">Rosa</option>
                    <option value="morado">Morado</option>
                    </select><br><br>
                
            </section>
            <section class="separador"></section>
            <section class="especifico">
                <label for="animalEstado">Estado</label>
                <select id="animalEstado" name="animalEstado">
                  <option value="vulnerable">Vulnerable</option>
                  <option value="en casa">En casa</option>
                  <option value="perdida">Perdida</option>
                </select><br><br>
                
                <label for="animalRazonEstado">Razón del estado</label>
                <input type="text" id="animalRazonEstado" name="animalRazonEstado"><br><br>

                <label for="ultUbicacion">Última ubicación (importante si está perdida)</label>
                <input type="text" id="ultUbicacion" name="ultimaUbicacionPerdido"><br><br>
                
                <label for="animalOtrosDatos">Otros datos de interés</label>
                <textarea id="animalOtrosDatos" name="animalOtrosDatos" rows="5" cols="30"></textarea><br><br>
                
        
                    <input type="submit" value="Registrar mascota">
                    <input type="reset" value="Borrar">
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