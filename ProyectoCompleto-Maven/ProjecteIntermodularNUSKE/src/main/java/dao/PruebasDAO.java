/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dto.*;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import oracle.net.aso.q;


/**
 *
 * @author ciclost
 */
public class PruebasDAO {
    public static void main(String[] args) {
        
        try {
//            *CLASE USUARIO*
            UsuarioDAO uDAO = new UsuarioDAO();
            //--GETBYCODIGO
            Usuario u = uDAO.getByCodigo(5);
            System.out.println(u);

            //--GETALL
//            ArrayList<Usuario> usuarios = uDAO.getAll();
//            for(Usuario uu : usuarios){
//                System.out.println(uu);
//            }

            //--EXISTE
//            Usuario u2 = uDAO.getByCodigo(3);
//            System.out.println(uDAO.existe(u2));

//            Usuario u3 = new Usuario(100, "Sergio", "Colmena", LocalDate.now(), "sdsds@gmail.com", 0, "tretrerrt", LocalDateTime.now(), null);
//            System.out.println(uDAO.existe(u3));
            

//            *CLASE SOCIO*
            SocioDAO sDAO = new SocioDAO();
            //--GETBYCODIGO
//            Socio s = sDAO.getByCodigo(4);
//            System.out.println(s);
            
            //--GETALL
//            ArrayList<Socio> socios = sDAO.getAll();
//            for(Socio ss : socios){
//                System.out.println(ss);
//            }
            
            //--EXISTE
//            Socio s2 = sDAO.getByCodigo(8);
//            System.out.println(sDAO.existe(s2));

//            Socio s3 = new Socio("ieriei", 6543, "fdfdfd@hotmail.com", 213232, "pepe", "pepe", LocalDate.now(), "pepe@hotmail.co", 323232, "hola1234", LocalDateTime.now(), null);
//            System.out.println(sDAO.existe(s3));


//            *CLASE RESPONSABLE*
            ResponsableDAO rDAO = new ResponsableDAO();
            //--GETBYCODIGO
//            Responsable r = rDAO.getByCodigo(6);
//            System.out.println(r);
            
            //--GETALL
//            ArrayList<Responsable> responsables = rDAO.getAll();
//            for(Responsable rr : responsables){
//                System.out.println(rr);
//            }
            
            //--EXISTE
//            Responsable r2 = rDAO.getByCodigo(10);
//            System.out.println(rDAO.existe(r2));

//            Responsable r3 = new Responsable("9876543T", 212, "pepe", "pepe", LocalDate.now(), "pepe@hotmail.co", 323232, "hola1234", LocalDateTime.now(), null);
//            System.out.println(rDAO.existe(r3));
            

//            *CLASE ADMINISTRADOR*
            AdministradorDAO aDAO = new AdministradorDAO();
            //--GETBYCODIGO
//            Administrador a = aDAO.getByCodigo(1);
//            System.out.println(a);
            
            //--GETALL
//            ArrayList<Administrador> administradores = aDAO.getAll();
//            for(Administrador aa : administradores){
//                System.out.println(aa);
//            }
            
            //--EXISTE
//            Administrador a2 = aDAO.getByCodigo(5);
//            System.out.println(aDAO.existe(a2));
//
//            Administrador a3 = new Administrador(333, "Javier", "Sanchez", LocalDate.now(), "javier@hotmail.com", 0, "ewretf", LocalDateTime.MIN, "ererere");
//            System.out.println(aDAO.existe(a3));
            

//            *CLASE CLIENTE*
            ClienteDAO cDAO = new ClienteDAO();
            //--GETBYCODIGO
//            Cliente c = cDAO.getByCodigo(3);
//            System.out.println(c);
            
            //--GETALL
//            ArrayList<Cliente> clientes = cDAO.getAll();
//            for(Cliente ccl : clientes){
//                System.out.println(ccl);
//            }
            
            //--EXISTE
//            Cliente c2 = cDAO.getByCodigo(10);
//            System.out.println(cDAO.existe(c2));

//            Cliente c3 = new Cliente("9876543T", 212, "pepe", "pepe", LocalDate.now(), "pepe@hotmail.co", 323232, "hola1234", LocalDateTime.now(), null);
//            System.out.println(cDAO.existe(c3));
            

//            *CLASE ARTICULO*
            ArticuloDAO artDAO = new ArticuloDAO();
            //--GETBYCODIGO
//            Articulo a = artDAO.getByCodigo("2");
//            System.out.println(a);
//            System.out.println(a.getSocioRecomendaciones());
//            System.out.println(a.getSocioVentas());
            
            //--GETALL
//            ArrayList<Articulo> articulos = artDAO.getAll();
//            for(Articulo art : articulos){
//                System.out.println(art);
//            }
            
            //--EXISTE
//            Articulo a2 = artDAO.getByCodigo("6");
//            System.out.println(artDAO.existe(a2));

//            Articulo a3 = new Articulo("43", "jhgfd", "jhgfd", "jhgfd", Categoria.GATOS, Subcategoria.HOGAR, TipoArticulo.TRANSPORTINES, 0, 0, 0, 0, 0, LocalDateTime.now(), new AdministradorDAO().getByCodigo(1) , null, null, null);
//            System.out.println(artDAO.existe(a3));
            
            
//            *CLASE COMENTARIO*
            ComentarioDAO comDAO = new ComentarioDAO();
            //--GETBYCODIGO
//            Comentario c = comDAO.getByCodigo(1, "1");
//            System.out.println(c);
            
            //--GETALL
//            ArrayList<Comentario> comentarios = comDAO.getAll();
//            for(Comentario cc : comentarios){
//                System.out.println(cc);
//            }
            
            //--EXISTE
//            Comentario c2 = comDAO.getByCodigo(2, "3");
//            System.out.println(comDAO.existe(c2));

//            Articulo art = new ArticuloDAO().getByCodigo("1");
//            Comentario c3 = new Comentario(42, art, "ffdfd", 0, CalidadPrecio.MALA, LocalDateTime.MIN, "dfdfd", "dfdfd", "dfdfd");
//            System.out.println(comDAO.existe(c3));
            

//            *CLASE DIRECCIÓN*
            DireccionDAO dDAO = new DireccionDAO();
            //--GETBYCODIGO
//            Cliente c4 = cDAO.getByCodigo(3);
//            Direccion d = dDAO.getByCodigo(1, c4);
//            System.out.println(d);
            
            //--GETALL
//            ArrayList<Direccion> direcciones = dDAO.getAll();
//            for(Direccion dd : direcciones){
//                System.out.println(dd);
//            }
            
            //--EXISTE
//            Usuario c5 = uDAO.getByCodigo(8);
//            Direccion d = dDAO.getByCodigo(8, c5);
//            System.out.println(dDAO.existe(d));
//            
//            Usuario u2 = new Usuario(342, "sdsd", "sdsd", LocalDate.MIN, "sdsd", 0, "sdsd", LocalDateTime.MIN, "sdsd");
//            Direccion d2 = new Direccion(312, u2, "sdsd", "sdsd", ListaProvincias.PALENCIA, 0, "sdsd");
//            System.out.println(dDAO.existe(d2));

            //--DIRECCION DE CIERTO USUARIO
//            Usuario u3 = uDAO.getByCodigo(3);
//            ArrayList<Direccion> direccionesUsuario = dDAO.getDireccionesDe(u3);
//            for(Direccion dds : direccionesUsuario){
//                System.out.println(dds);
//            }

            //AÑADIR Y ELIMINAR
//            Cliente c6 = cDAO.getByCodigo(3);
//            Direccion d3 = new Direccion(31, c6, "CHORIZO", "sdsd", ListaProvincias.CIUDAD_REAL, 04342, "sdsd");
//            dDAO.anyadir(d3);
//            dDAO.eliminar(d3);
            

//            *CLASE PROVEEDOR*
            ProveedorDAO pDAO = new ProveedorDAO();
            //--GETBYCODIGO
//            Proveedor p = pDAO.getByCodigo(1);
//            System.out.println(p);
            
            //--GETALL
//            ArrayList<Proveedor> proveedores = pDAO.getAll();
//            for(Proveedor pp : proveedores){
//                System.out.println(pp);
//            }
            
            //--EXISTE
//            Proveedor p2 = pDAO.getByCodigo(2);
//            System.out.println(pDAO.existe(p2));
//            Proveedor p3 = new Proveedor(4, "sfsfs", "sfsfs", "sfsfs", 0, "sfsfs", "sfsfs", null);
//            System.out.println(pDAO.existe(p3));
            
            
//            *CLASE LISTA*
            ListaDAO lDAO = new ListaDAO();
            //--GETBYCODIGO
//            Cliente cli = cDAO.getByCodigo(7);
//            Lista l = lDAO.getByCodigo("Favoritos de La Silvia", 7);
//            System.out.println(l);
            
            //--GETALL
//            ArrayList<Lista> listas = lDAO.getAll();
//            for(Lista ll : listas){
//                System.out.println(ll);
//            }
            
            //--EXISTE
//            Cliente cli = cDAO.getByCodigo(7);
//            Lista l = lDAO.getByCodigo("Favoritos de La Silvia", 7);
//            System.out.println(lDAO.existe(l));
//            Lista l2 = new Lista("Mis cosillas jejeje", cli, null);
//            System.out.println(lDAO.existe(l2));

            //--ANYADIR Y ELIMINAR
//            Cliente cli = cDAO.getByCodigo(7);
//            ArrayList<Articulo> articulos = artDAO.getAll();
//            Lista l4 = new Lista("Mis cosillas", cli, articulos);
//            lDAO.anyadir(l4);
//            lDAO.eliminar(l4);
            
            
//            *CLASE MASCOTA*
            MascotaDAO mDAO = new MascotaDAO();
            //--GETBYCODIGO
//            Mascota m = mDAO.getByCodigo(1);
//            System.out.println(m);
            
            //--GETALL
//            ArrayList<Mascota> mascotas = mDAO.getAll();
//            for(Mascota mm : mascotas){
//                System.out.println(mm);
//            }
            
            //--EXISTE
//            Mascota m2 = mDAO.getByCodigo(6);
//            System.out.println(mDAO.existe(m2));
//            Mascota m3 = new Mascota(13, "sdsds", "sdsds", "sdsds", "sdsds", null, "sdsds", null, null, EstadoMascota.EN_CASA, "sdsds", "sdsds", "sdsds");
//            System.out.println(mDAO.existe(m3));

            //AÑADIR Y ELIMINAR
//            Mascota m3 = new Mascota(13, "Edu", "Pastor Alemán", "sdsds", "sdsds", null, "sdsds", null, null, EstadoMascota.EN_CASA, null, "sdsds", "sdsds");
//            mDAO.anyadir(m3);
//            mDAO.eliminar(m3);
            

//            *CLASE LINEAARTICULO*
            LineaArticuloDAO laDAO = new LineaArticuloDAO();
            //--GETBYCODIGO
//            LineaArticulo la = laDAO.getByCodigo("3", 3);
//            System.out.println(la);
            
            //--GETALL
//            ArrayList<LineaArticulo> lineasArt = laDAO.getAll();
//            for(LineaArticulo lala : lineasArt){
//                System.out.println(lala);
//            }
            
            //--EXISTE
//            LineaArticulo l2 = laDAO.getByCodigo("2", 2);
//            System.out.println(laDAO.existe(l2));
            
//            Articulo art2 = artDAO.getByCodigo("4");
//            Cesta cesta = new CestaDAO().getByCodigo(1);
//            LineaArticulo l3 = new LineaArticulo(art2, cesta, 4);
//            System.out.println(laDAO.existe(l3));


            //--AÑADIR Y ELIMINAR
//            Articulo art3 = artDAO.getByCodigo("4");
//            Cesta cesta2 = new CestaDAO().getByCodigo(1);
//            LineaArticulo l4 = new LineaArticulo(art3, cesta2, 8);
//            laDAO.anyadir(l4);
//            laDAO.eliminar(l4);


//            *CLASE CESTA*
            CestaDAO cestaDAO = new CestaDAO();
            //--GETBYCODIGO
//            Cesta cesta = cestaDAO.getByCodigo(1);
//            System.out.println(cesta);
            
            //--GETALL
//            ArrayList<Cesta> cestas = cestaDAO.getAll();
//            for(Cesta cestac : cestas){
//                System.out.println(cestac);
//            }
            
            //--EXISTE
//            Cesta cesta2 = cestaDAO.getByCodigo(1);
//            System.out.println(cestaDAO.existe(cesta2));
//            
//            Cliente cl5 = cDAO.getByCodigo(3);
//            Cesta cesta3 = new Cesta(8, cl5);
//            System.out.println(cestaDAO.existe(cesta3));
            
            //--AÑADIR Y ELIMINAR (Para probar hay que eliminar una de las cestas de los clientes ya creadas ya que un cliente solo puede tener una cesta)
//            ArrayList<LineaArticulo> lineasArt = new ArrayList<>();
//            Articulo art6 = artDAO.getByCodigo("4");
//            Cliente cl6 = cDAO.getByCodigo(3);
//            Cesta cesta3 = new Cesta(8, cl6);
//            LineaArticulo la4 = new LineaArticulo(art6, cesta3, 100);
//            lineasArt.add(la4);
//            
//            cestaDAO.anyadir(cesta3, lineasArt);
//            cestaDAO.eliminar(cesta3,lineasArt);
            

//            *CLASE PEDIDO*
            PedidoDAO pedDAO = new PedidoDAO();
            //--GETBYCODIGO
//            Pedido ped = pedDAO.getByCodigo(2);
//            System.out.println(ped);
            
            //--GETALL
//            ArrayList<Pedido> pedidos = pedDAO.getAll();
//            for(Pedido pps : pedidos){
//                System.out.println(pps);
//            }
            
            //--EXISTE
//            Pedido ped2 = pedDAO.getByCodigo(4);
//            System.out.println(pedDAO.existe(ped2));
            
//            Cesta cestaAux = cestaDAO.getByCodigo(2);
//            Cliente clienteAux = cDAO.getByCodigo(3);
//            Direccion dirPago = dDAO.getByCodigo(3, clienteAux);
//            Pedido ped3 = new Pedido(7, EstadoPedido.PENDIENTE_DE_PAGO, LocalDateTime.now(), cestaAux, dirPago, clienteAux, 0);
//            System.out.println(pedDAO.existe(ped3));
            

            //--AÑADIR Y ELIMINAR (Primero añadir la cesta anterior para que este ejemplo funcione)
//            Cesta cestaAux = cestaDAO.getByCodigo(8);
//            Cliente clienteAux = cDAO.getByCodigo(3);
//            Direccion dirPago = dDAO.getByCodigo(1, clienteAux);
//            Pedido ped3 = new Pedido(7, EstadoPedido.PENDIENTE_DE_PAGO, LocalDateTime.now(), cestaAux, dirPago, clienteAux, 0);
//            
//            pedDAO.anyadir(ped3);
//            pedDAO.eliminar(ped3);
            

//            *CLASE FACTURA*
            FacturaDAO fDAO = new FacturaDAO();
//            //--GETBYCODIGO
//            Factura f = fDAO.getByCodigo(3);
//            System.out.println(f);
            
            //--GETALL
            ArrayList<Factura> facturas = fDAO.getAll();
//            for(Factura ff : facturas){
//                System.out.println(ff);
//            }
            
            //--EXISTE
//            Factura f2 = fDAO.getByCodigo(3);
//            System.out.println(fDAO.existe(f2));
//            
//            
//            Cliente clienteAux = cDAO.getByCodigo(3);
//            Direccion dirPago = dDAO.getByCodigo(1, clienteAux);
//            Pedido pedAux = pedDAO.getByCodigo(7);
//            Factura f3 = new Factura(4, pedAux, dirPago);
//            System.out.println(fDAO.existe(f3));

            //--AÑADIR Y ELIMINAR
            Cliente clienteAux = cDAO.getByCodigo(3);
            Direccion dirPago = dDAO.getByCodigo(1, clienteAux);
            Pedido pedAux = pedDAO.getByCodigo(7);
            Factura f3 = new Factura(4, LocalDateTime.now() ,pedAux, dirPago);
//            
//            fDAO.anyadir(f3);
//            fDAO.eliminar(f3);

        } catch (SQLException e) {
            System.out.println(e);
        }
    }
}