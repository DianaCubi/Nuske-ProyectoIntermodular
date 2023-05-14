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
    <main>
      <section class="parte-superior">
        <h2>¡Bienvenid@ <%= usuarioSesion.getNombre() %>!</h2>
        <a href="./usuarios.jsp">Administrar usuarios</a>
        <a href="./pedidos.jsp">Administrar pedidos</a>
        <a href="./facturas.jsp">Administrar facturas</a>
        <a href="./registro-articulo.jsp">Añadir articulo</a>
      </section>
    </main>
  </body>
</html>
