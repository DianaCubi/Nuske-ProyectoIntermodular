<%@page import="dto.Categoria"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="dto.Cliente"%>
<%@page import="dao.UsuarioDAO"%>
<%@page import="dto.Responsable"%>
<%@page import="dto.Socio"%>
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
        <link rel="stylesheet" href="css/sobre-nosotros/styles.css">
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
            <h1>Sobre nosotros</h1>
            <section class="resumen">
                <p>Con el slogan "No están sol@s. Tienen alma. La vemos en sus ojos.", nace Nuske, una tienda con el objetivo claro de convertir a las mascotas en parte integrante de la sociedad, donde no sean vistas como "especies inferiores", sino como una parte importante de nuestras vidas.</p>
                <p>Muy lejos de establecer nuestra finalidad como "visión fuente" que genere posibles conflictos entre "animalistas" y "detractores", decidimos llevar a cabo este proyecto con la idea de que pueda llegar a ser un punto de inflexión entre ambos "bandos" y lograr así un entendimiento profundo, coherente y pacífico.</p>
                <p>"No están sol@s. Tienen alma. La vemos en sus ojos." es la frase que, todos los que nos hacemos llamar "amigos de los animales", gritaríamos ante las injusticias y horrorosas imágenes que han querido "normalizar". "Si el amor tuviera un sonido sería un ronroneo."</p>
            </section>
            <h1 class="tit-admin">Administradores</h1>
            <section class="administradores">
                <article>
                    <img src="./img/perfiles/administrador1.jpg" alt="Foto de usuario">
                    <h3>Diana Soriano Cubí</h3>
                    <p><i>NullPointerException as a lifestyle</i></p>
                </article>
                <article>
                    <img src="./img/perfiles/administrador2.jpg" alt="Foto de usuario">
                    <h3>Pedro Sánchez Flores</h3>
                    <p><i>Be yourself, pero sin joder.</i></p>
                </article>
            </section>
            <section class="frases">
                <p><i>“Para comprar a un animal necesitas dinero. Para adoptar a un animal necesitas
                    corazón.”</i></p>
                <p><i>“Si recoges a un perro hambriento y lo haces próspero, no te morderá. Esa es la
                    principal diferencia entre un perro y un hombre.”</i> – Mark Twain </p>
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