/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dto.Articulo;
import dto.Categoria;
import dto.Cesta;
import dto.Cliente;
import dto.LineaArticulo;
import dto.Subcategoria;
import dto.TipoArticulo;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.LinkedHashSet;

/**
 *
 * @author ciclost
 */
public class CestaDAO extends TablaDAO<Cesta> {
    
    public CestaDAO() {
        this.tabla = "NUSKE_CESTA";
    }

    @Override
    public int actualizar(Cesta c) throws SQLException {
        // NO SE UTILIZA EN NUESTRO PROYECTO
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int anyadir(Cesta c) throws SQLException {
        String sentenciaSQL = "INSERT INTO " + tabla + " VALUES(?,?)";
        PreparedStatement prepared = getPrepared(sentenciaSQL);
        prepared.setInt(1, c.getCodigo());
        prepared.setInt(2, c.getCreadorCesta().getCodigo());
        int resultado = prepared.executeUpdate();
        
        return resultado;
    }
    
    public int anyadir(Cesta c, ArrayList<LineaArticulo> lineas) throws SQLException{
        String sentenciaSQL = "INSERT INTO " + tabla + " VALUES(?,?)";
        PreparedStatement prepared = getPrepared(sentenciaSQL);
        prepared.setInt(1, c.getCodigo());
        prepared.setInt(2, c.getCreadorCesta().getCodigo());
        int resultado = prepared.executeUpdate();
        setLineas(lineas);
        
        return resultado;
    }
    
    private void setLineas(ArrayList<LineaArticulo> lineas) throws SQLException{
        for (LineaArticulo l : lineas) {
//            String sentenciaSQL = "INSERT INTO NUSKE_ARTICULO_EN_CESTA VALUES(?, ?, ?)";
//            PreparedStatement prepared = getPrepared(sentenciaSQL);
//            
//            prepared.setString(1, l.getArticulo().getCodigo());
//            prepared.setInt(2, l.getCesta().getCodigo());
//            prepared.setInt(3, l.getUnidades());
//            prepared.setDouble(4, l.getArticulo().getPvp());
//            
//            prepared.executeUpdate();

            LineaArticuloDAO linea = new LineaArticuloDAO();
            linea.anyadir(l);
        }
    }

    @Override
    public Cesta eliminar(Cesta c) throws SQLException {
// PARA ELIMINAR UNA CESTA SE NECESITA TANTO LA CESTA COMO LOS ARTICULOS DE LA MISMA
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    public Cesta eliminar(Cesta c, ArrayList<LineaArticulo> lineas) throws SQLException {
        if (c == null) {
            return null;
        } else {
            eliminarArticulos(lineas);
            return eliminar(c.getCodigo()) != null ? c : null;
        }
    }
    
    private void eliminarArticulos(ArrayList<LineaArticulo> lineas) throws SQLException {
        for (LineaArticulo l : lineas) {
            LineaArticuloDAO linea = new LineaArticuloDAO();
            linea.eliminar(l);
        }
    }

    @Override
    public boolean existe(Cesta c) throws SQLException {
        return existe(c.getCodigo());
    }

    @Override
    public ArrayList<Cesta> getAll() throws SQLException {
        ArrayList<Cesta> lista = new ArrayList<>();
        String sentenciaSQL = "SELECT * FROM " + tabla + " ORDER BY codigo";
        PreparedStatement prepared = getPrepared(sentenciaSQL);
        ResultSet resultSet = prepared.executeQuery();
        while (resultSet.next()) {
            int codigo = resultSet.getInt("codigo");
            Cliente cliente = new ClienteDAO().getByCodigo(resultSet.getInt("cod_cliente"));
            lista.add(new Cesta(codigo, cliente));
        }
        
        return lista;
    }

    @Override
    public Cesta getByCodigo(int codigo) throws SQLException {
        String sentenciaSQL = "SELECT * FROM " + tabla + " WHERE codigo=?";
        PreparedStatement prepared = getPrepared(sentenciaSQL);
        prepared.setInt(1, codigo);
        ResultSet resultSet = prepared.executeQuery();
        while (resultSet.next()) {
            Cliente cliente = new ClienteDAO().getByCodigo(resultSet.getInt("cod_cliente"));
            return new Cesta(codigo, cliente);
        }

        return null;
    }
    
    public Cesta getByCliente(int codCliente) throws SQLException {
        String sentenciaSQL = "SELECT * FROM " + tabla + " WHERE COD_CLIENTE=? AND codigo>=ALL(SELECT codigo FROM NUSKE_CESTA WHERE COD_CLIENTE=?)";
        PreparedStatement prepared = getPrepared(sentenciaSQL);
        prepared.setInt(1, codCliente);
        prepared.setInt(2, codCliente);
        ResultSet resultSet = prepared.executeQuery();
        while (resultSet.next()) {
            int codigo = resultSet.getInt("codigo");
            Cliente cliente = new ClienteDAO().getByCodigo(resultSet.getInt("cod_cliente"));
            return new Cesta(codigo, cliente);
        }

        return null;
    }
    
    public ArrayList<LineaArticulo> getLineas(int codigo) throws SQLException{
        LineaArticuloDAO lineaArticuloDAO = new LineaArticuloDAO();
        ArrayList<LineaArticulo> lineaArticulos = new ArrayList<>();
        String sentenciaSQL = "SELECT * FROM NUSKE_ARTICULO_EN_CESTA WHERE CODIGO_CESTA = ?";
        PreparedStatement prepared = getPrepared(sentenciaSQL);
        prepared.setInt(1, codigo);
        ResultSet resultSet = prepared.executeQuery();
        
        while (resultSet.next()) {
            Articulo art = new ArticuloDAO().getByCodigo(resultSet.getString("CODIGO_ART"));
            Cesta cesta = new CestaDAO().getByCodigo(resultSet.getInt("CODIGO_CESTA"));
            
            LineaArticulo lineaArticulo = new LineaArticulo(art, cesta, resultSet.getInt("NUMERO_UNIDADES"));
//            LineaArticulo lineaArticulo = lineaArticuloDAO.getByCodigo(resultSet.getInt("CODIGO_CESTA"));
            lineaArticulos.add(lineaArticulo);
        }
        return lineaArticulos;
    }
    
    public double calcularTotal(Cesta c) throws SQLException{
        ArrayList<LineaArticulo> lineaArticulos = getLineas(c.getCodigo());
        double total=0;
        for(LineaArticulo l : lineaArticulos){
            total+=l.calcularSubtotalLinea();
        }
        return total;
    }
    
    public boolean revisarStock(Cesta c) throws SQLException{
        ArrayList<LineaArticulo> lineas = getLineas(c.getCodigo());
        for (LineaArticulo l : lineas){
            if(l.getArticulo().getStockActual()-l.getUnidades()<l.getArticulo().getStockMinimo()) return false;
        }
        return true;
    }
    
    public void descontarStock(Cesta c) throws SQLException{
        ArticuloDAO aDAO = new ArticuloDAO();
        ArrayList<LineaArticulo> lineas = getLineas(c.getCodigo());
        for (LineaArticulo l : lineas){
            try {
                Articulo a = l.getArticulo();
                int nuevoStock = l.getArticulo().getStockActual()-l.getUnidades();
                Articulo nuevoProducto = new Articulo(a.getCodigo(), a.getFoto(), a.getNombre(), a.getDescripcion(), a.getCategoria(), a.getSubcategoria(), a.getTipoArticulo(), nuevoStock, a.getStockMinimo(), a.getUnidades(), a.getIva(), a.getPvp(), a.getFechaCreacion(), a.getCreador(), a.getProveedor(), a.getSocioRecomendaciones(), a.getSocioVentas());
                aDAO.actualizar(nuevoProducto);
            } catch (SQLException e) {
                System.out.println("Error SQL");
            }
            
        }
    }
}