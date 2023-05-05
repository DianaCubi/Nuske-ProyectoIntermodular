<%@page import="dto.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Usuario usuarioSesion = (session != null && session.getAttribute("usuario") != null) ? (Usuario) session.getAttribute("usuario") : null;
%>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/perfil/styles.css">
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
            <%
                if (usuarioSesion != null) {
            %>

            <section class="der-foto">
                <figure>
                    <img src="./img/profile-example.jpg" alt="Nombre de usuario">
                </figure>
                <p><a href="#">Editar perfil</a></p>
                <p><a href="registro-mascota.jsp">Registrar mascota</a></p>
            </section>
            <section class="centro-inf">
                <p>
                    <span>Nombre</span>
                    <span>Lola</span>
                </p>
                <p>
                    <span>Apellidos</span>
                    <span>Carrión</span>
                </p>
                <p>
                    <span>Email</span>
                    <span>lola@gmail.com</span>
                </p>
                <p>
                    <span>Contraseña</span>
                    <span>contraseña1234</span>
                </p>
                <p>
                    <span>Fecha de nacimiento</span>
                    <span>12/06/1994</span>
                </p>
                <p>
                    <span>Teléfono</span>
                    <span>648512563</span>
                </p>
                <p>
                    <span>DNI</span>
                    <span>45871235D</span>
                </p>
                <p>
                    <span>Correo de empresa</span>
                    <span>veterinariaSL@gmail.com</span>
                </p>
                <p>
                    <span>Nombre de empresa</span>
                    <span>Veterinarias S.L.</span>
                </p>
                <p>
                    <span>Teléfono de empresa</span>
                    <span>641245325</span> 
                </p>
            </section>
            <section class="izq-botones">
                <a href="./listas.jsp">Listas</a>
                <a href="./pedidos.jsp">Pedidos</a>
                <a href="./facturas.jsp">Facturas</a>
                <a href="#">Mascotas</a>
                <a href="LogOut" id="logOut">Cerrar sesión</a>
            </section>
            <%
            } else {
            %>
            <section class="s-sinLogin" style="height:55vh;display:flex;align-items:center;">
                <p class="p-sinLogin">Sabía que ibas a intentar esto, José Ramón</p>
            </section>

            <%
                }
            %>
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