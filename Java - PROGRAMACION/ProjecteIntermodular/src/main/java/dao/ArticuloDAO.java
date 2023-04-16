/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dto.Administrador;
import dto.Articulo;
import dto.Categoria;
import dto.Proveedor;
import dto.Socio;
import dto.Subcategoria;
import dto.TipoArticulo;
import dto.Usuario;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashSet;

/**
 *
 * @author ciclost
 */
public class ArticuloDAO extends TablaDAO<Articulo>{
    
    public ArticuloDAO() {
        this.tabla = "NUSKE_ARTICULO";
    }

    @Override
    public int actualizar(Articulo a) throws SQLException {
        // NO SE UTILIZA EN NUESTRO PROYECTO
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int anyadir(Articulo a) throws SQLException {
        // NO SE UTILIZA EN NUESTRO PROYECTO
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Articulo eliminar(Articulo a) throws SQLException {
        // NO SE UTILIZA EN NUESTRO PROYECTO
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean existe(Articulo a) throws SQLException {
        return getByCodigo(a.getCodigo()) != null;
    }

    @Override
    public ArrayList<Articulo> getAll() throws SQLException {
        ArrayList<Articulo> lista = new ArrayList<>();
        String sentenciaSQL = "SELECT * FROM " + tabla + " ORDER BY codigo";
        PreparedStatement prepared = getPrepared(sentenciaSQL);
        ResultSet resultSet = prepared.executeQuery();

        while (resultSet.next()) {
            String codigo = resultSet.getString("codigo");
            String foto = resultSet.getString("foto");
            String nombre = resultSet.getString("nombre");
            String descripcion = resultSet.getString("descripcion");
            int stockActual = resultSet.getInt("stock_actual");
            int stockMinimo = resultSet.getInt("stock_minimo");
            int unidades = resultSet.getInt("unidades");
            int iva = resultSet.getInt("iva");
            int pvp = resultSet.getInt("pvp");
            LocalDateTime fechaCreacion = resultSet.getTimestamp("fecha_creacion").toLocalDateTime();
            Administrador administrador = new AdministradorDAO().getByCodigo(resultSet.getInt("cod_admin"));
            TipoArticulo tipo = TipoArticulo.valueOf(resultSet.getString("tipo").toUpperCase());
            Categoria categoria = Categoria.valueOf(resultSet.getString("categoria").toUpperCase());
            Subcategoria subcategoria = Subcategoria.valueOf(resultSet.getString("subcategoria").toUpperCase());

            ArrayList<Proveedor> provedoores = getProveedores(codigo);
            HashMap<Socio, String> socioRecomendaciones = getSocioRecom(codigo);
            HashMap<Socio, Double> socioVentas = getSocioVentas(codigo);         

            lista.add(new Articulo(codigo, foto, nombre, descripcion, categoria, subcategoria, tipo, stockActual, stockMinimo, unidades, iva, pvp, fechaCreacion, administrador, provedoores, socioRecomendaciones, socioVentas));
        }

        return lista;
    }

    @Override
    public Articulo getByCodigo(int codigo) throws SQLException {
        //NO LO UTILIZAMOS YA QUE NUESTRO CODIGO DE ARTICULO ES STRING Y NO INT 
        return null;
    }
    
    public Articulo getByCodigo(String codigo) throws SQLException {
        String sentenciaSQL = "SELECT * FROM " + tabla + " WHERE codigo=?";
        PreparedStatement prepared = getPrepared(sentenciaSQL);
        prepared.setString(1, codigo);
        ResultSet resultSet = prepared.executeQuery();
        while (resultSet.next()) {
            String foto = resultSet.getString("foto");
            String nombre = resultSet.getString("nombre");
            String descripcion = resultSet.getString("descripcion");
            int stockActual = resultSet.getInt("stock_actual");
            int stockMinimo = resultSet.getInt("stock_minimo");
            int unidades = resultSet.getInt("unidades");
            int iva = resultSet.getInt("iva");
            int pvp = resultSet.getInt("pvp");
            LocalDateTime fechaCreacion = resultSet.getTimestamp("fecha_creacion").toLocalDateTime();
            Administrador administrador = new AdministradorDAO().getByCodigo(resultSet.getInt("cod_admin"));
            TipoArticulo tipo = TipoArticulo.valueOf(resultSet.getString("tipo").toUpperCase());
            Categoria categoria = Categoria.valueOf(resultSet.getString("categoria").toUpperCase());
            Subcategoria subcategoria = Subcategoria.valueOf(resultSet.getString("subcategoria").toUpperCase());

            ArrayList<Proveedor> provedoores = getProveedores(codigo);
            HashMap<Socio, String> socioRecomendaciones = getSocioRecom(codigo);
            HashMap<Socio, Double> socioVentas = getSocioVentas(codigo);         
            
            return new Articulo(codigo, foto, nombre, descripcion, categoria, subcategoria, tipo, stockActual, stockMinimo, unidades, iva, pvp, fechaCreacion, administrador, provedoores, socioRecomendaciones, socioVentas);
        }
        return null;
    }
    
    public ArrayList<Proveedor> getProveedores(String codigoArt) throws SQLException {
        ProveedorDAO proveedorDAO = new ProveedorDAO();
        ArrayList<Proveedor> proveedores = new ArrayList<>();
        String sentenciaSQL = "SELECT * FROM NUSKE_PROVEEDOR_SUM_ART WHERE cod_articulo LIKE ?";
        PreparedStatement prepared = getPrepared(sentenciaSQL);
        prepared.setString(1, codigoArt);
        ResultSet resultSet = prepared.executeQuery();
        
        while (resultSet.next()) {
            Proveedor proveedor = proveedorDAO.getByCodigo(resultSet.getInt("cod_proveedor"));
            proveedores.add(proveedor);
        }
        return proveedores;
    }
    
    public HashMap<Socio, String> getSocioRecom(String codigoArt) throws SQLException {
        SocioDAO socioDAO = new SocioDAO();
        HashMap<Socio, String> socioRecomendaciones = new HashMap<>();
        String sentenciaSQL = "SELECT * FROM NUSKE_RECOMENDACION_SOCIOS WHERE codigo_art LIKE ?";
        PreparedStatement prepared = getPrepared(sentenciaSQL);
        prepared.setString(1, codigoArt);
        ResultSet resultSet = prepared.executeQuery();
        
        while (resultSet.next()) {
            Socio socio = socioDAO.getByCodigo(resultSet.getInt("cod_socio"));
            String recomendacion = resultSet.getString("descripcion");
            
            socioRecomendaciones.put(socio, recomendacion);
        }
        return socioRecomendaciones;
    }
    
    public HashMap<Socio, Double> getSocioVentas(String codigoArt) throws SQLException {
        SocioDAO socioDAO = new SocioDAO();
        HashMap<Socio, Double> socioRecomendaciones = new HashMap<>();
        String sentenciaSQL = "SELECT * FROM NUSKE_VENTAS_SOCIOS WHERE codigo_art LIKE ?";
        PreparedStatement prepared = getPrepared(sentenciaSQL);
        prepared.setString(1, codigoArt);
        ResultSet resultSet = prepared.executeQuery();
        
        while (resultSet.next()) {
            Socio socio = socioDAO.getByCodigo(resultSet.getInt("cod_socio"));
            double comision = resultSet.getDouble("comision");
            
            socioRecomendaciones.put(socio, comision);
        }
        return socioRecomendaciones;
    }
    
}
